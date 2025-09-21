Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E83CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 02:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YDQVC3LyjWaDIJGtiqWIx3KU5alFG8NoVCD++PCYdtM=; b=tl/Ngo6M8LqKfYi0bQ3Q1v9kjV
	+tNCt9NMvxWcjWzZcgCawS2HcojkNaw4hI6J5QSAer6yYRAKz0/XjSGId4bgDVUUuobQyUDb4U/rn
	ENm8+6oqeEE91hWEIjYtagc5QiFSQqAndp/P7QPsRito80F8WA/Wgvar0M0pXpNKWqHmxemyaIKnS
	uto2Syj/SSFuyeblvpdhu88QhMmFlFlF7cT+Y1gieEJog5AyQcGdXCZbiQSFQ/JZzb+eBmVIBHjef
	hKqJ0Ud068qm4JKU0sF1XGt8y4Rp7VNSxPJ/xu04VsRzTmS6OoNUALq2FST3LwzOi34IIHfl9loyC
	oKVuUxWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v09PK-00000006HHj-48HD;
	Sun, 21 Sep 2025 02:02:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v09PJ-00000006HHS-2CeV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 02:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38211600AC;
	Sun, 21 Sep 2025 02:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331D6C4CEEB;
	Sun, 21 Sep 2025 02:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758420146;
	bh=Dfj37Sftvqia1c23oR0KQMdwAxSQc1SLZbmSxYfQvmA=;
	h=From:To:Cc:Subject:Date:From;
	b=aGzHDFr7rErCH6cQma6Tt7rVt9RCdESjDxLkeeX/+dYalAuyZyjM1ScWJkPUGiAbx
	 QvEgeRJy7syQ8w6OFzAp/Tdljn96Qp86kq5WSRICioUlAbZgRNrTZIKY5nhmMmON+C
	 Lr1V29qMSYNz88KJ8j9wn7e9hDskVFZt7Z0nWZXPMs8bRuY3kuNy0Qocrd0GTiIKdt
	 zwa/IzdzSWqtCKIZUBG/8kC8r4wJk4iSVEmP555KpCEo24crRoRrxUp8L0xYGQZEuB
	 V8pO3wPsJjTzhHiCO81J3xU1SmPqC7r0bStEMU9VwNQyO9xCJAEFwZLlFNbppVxXT1
	 NbcwZTPg+8BXw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm device driver updates for v6.18
Date: Sat, 20 Sep 2025 21:02:24 -0500
Message-ID: <20250921020225.595403-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


The following changes since commit 3cc9a8cadaf66e1a53e5fee48f8bcdb0a3fd5075:

  firmware: qcom: tzmem: disable sc7180 platform (2025-09-11 16:38:33 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.18-2

for you to fetch changes up to 3f1707306b79cafc5a11350befd5a4081b807760:

  serial: qcom-geni: Load UART qup Firmware from linux side (2025-09-17 13:51:08 -0500)

----------------------------------------------------------------
More Qualcomm device driver updates for v6.18

Introduce support for loading firmware into the QUP serial engines from
Linux, which allows deferring selection of which protocol (uart, i2c,
spi, etc) a given SE should have until the OS loads.

Also introduce the "object invoke" interface in the SCM driver, to
provide interface to the Qualcomm TEE driver.

----------------------------------------------------------------
Amirreza Zarrabi (2):
      firmware: qcom: tzmem: export shm_bridge create/delete
      firmware: qcom: scm: add support for object invocation

Bjorn Andersson (1):
      Merge branch '20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com' into drivers-for-6.18

Viken Dadhaniya (6):
      dt-bindings: qcom: se-common: Add QUP Peripheral-specific properties for I2C, SPI, and SERIAL bus
      soc: qcom: geni-se: Cleanup register defines and update copyright
      soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
      i2c: qcom-geni: Load i2c qup Firmware from linux side
      spi: geni-qcom: Load spi qup Firmware from linux side
      serial: qcom-geni: Load UART qup Firmware from linux side

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           |   1 +
 .../bindings/serial/qcom,serial-geni-qcom.yaml     |   1 +
 .../bindings/soc/qcom/qcom,se-common-props.yaml    |  26 ++
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |   1 +
 drivers/firmware/qcom/qcom_scm.c                   | 119 +++++
 drivers/firmware/qcom/qcom_scm.h                   |   7 +
 drivers/firmware/qcom/qcom_tzmem.c                 |  63 ++-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   8 +-
 drivers/soc/qcom/qcom-geni-se.c                    | 506 ++++++++++++++++++++-
 drivers/spi/spi-geni-qcom.c                        |   6 +
 drivers/tty/serial/qcom_geni_serial.c              |   8 +-
 include/linux/firmware/qcom/qcom_scm.h             |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h           |  15 +
 include/linux/soc/qcom/geni-se.h                   |   4 +
 14 files changed, 739 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml

