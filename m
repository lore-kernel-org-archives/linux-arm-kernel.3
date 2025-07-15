Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626D9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 02:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T1uWu96jH2h6exzepkemgvOkhPKpEhNlOujPBqTbvK0=; b=IvwkQo0jMMpFlzdWMponTxH/bg
	6aKD/kxxyTBu2aykovpEVkt0CU8V+sQyXSzgqROYpOsaUEjO1nEpcsyhSxkOnrgsObwaDbUaM3ozw
	CCax7O5j685kdMGO818Yk5YXL9Iw0rR62MDK4ZX/EtJF/KM6ph6gV+yKf3JgCm1gfus7FPO3uOjH8
	NUYrUCoCst9SW8wpiHDPnxRsDTg8ny3Yiw+Q0Ap9Ssk/igArx1M3/yB8gIkRmmF8WS7MHYXvvyVVH
	19XqApaGi56owGDzSQ3nJdLTJY3Lm/Gr3f7jZpXIDAjVYXTNL5fEdDgAVAiEMWTZswXGLZr8WdPxE
	KKlELu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVEY-00000003mZz-2TFG;
	Tue, 15 Jul 2025 02:17:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVC8-00000003mQt-0EwL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 02:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD1876147A;
	Tue, 15 Jul 2025 02:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4FCC4CEF0;
	Tue, 15 Jul 2025 02:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752545696;
	bh=iqGlb4swUIpn7QE7sxqTWrlmDq6f3DwCkbVbQG6xmis=;
	h=From:To:Cc:Subject:Date:From;
	b=oso/sqhmkEoTMBGJdMePDLaU4yc4Bmtz82ySRaVip0xr0eSrwFDAhotmvprLgDWFO
	 nQ9xyxEAi2CHjAGrrcJY/VT9JmGNeethYRdTbAVo5toraCr3lM8fNsT9nu11OVtW8y
	 mcEBuK6njP/O+uqvUwqexr78g5VZpmW/dGIeRJL52IeiAF+n9aIuR/zMjU20bo5WEw
	 Mw/TUPa3xcYGp7nE8MiOokALh85ZeLwH60MNaTakViSk/U8B5jJhIslBlRCF3mzrGY
	 LmJ0RcLoysiBNeLin198/HVFfce16R4S0DHR3hqBUF98GYBb61Tr/8Rd9sXhsDxwr4
	 aDQ3aVAsNxnqA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Wronek <david@mainlining.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.17
Date: Mon, 14 Jul 2025 21:14:53 -0500
Message-ID: <20250715021454.14516-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
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


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.17

for you to fetch changes up to 9f35ab0e53ccbea57bb9cbad8065e0406d516195:

  soc: qcom: mdt_loader: Fix error return values in mdt_header_valid() (2025-06-25 14:31:31 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.17

Perform input validation in the MDT loader, as this was not properly
done in the non-remoteproc cases.

Fix endian issues in the QMI encoder/decoder.

Support reading DDR statistic using the Qualcomm stats driver.

Add support for reading TME firmware details to the socinfo driver.

Document the Kryo 470 CPU, and add SM7150 to the DCC to DeviceTree
bindings.

----------------------------------------------------------------
Alexander Wilhelm (2):
      soc: qcom: QMI encoding/decoding for big endian
      soc: qcom: fix endianness for QMI header

Bjorn Andersson (3):
      soc: qcom: mdt_loader: Ensure we don't read past the ELF header
      soc: qcom: mdt_loader: Rename mdt_phdr_valid()
      soc: qcom: mdt_loader: Actually use the e_phoff

Dan Carpenter (1):
      soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()

Danila Tikhonov (3):
      dt-bindings: soc: qcom,dcc: Add the SM7150 compatible
      dt-bindings: sram: qcom,imem: Add the SM7150 compatible
      dt-bindings: arm: cpus: Add Kryo 470 CPUs

David Wronek (1):
      dt-bindings: soc: qcom: aoss-qmp: Add the SM7150 compatible

Kathiravan Thirumoorthy (1):
      soc: qcom: socinfo: Add support to retrieve TME build details

Konrad Dybcio (1):
      dt-bindings: sram: qcom,imem: Add a number of missing compatibles

Lijuan Gao (1):
      dt-bindings: soc: qcom: add qcom,qcs615-imem compatible

Maulik Shah (2):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,dcc.yaml     |   1 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |  15 +++
 drivers/soc/qcom/mdt_loader.c                      |  63 ++++++++--
 drivers/soc/qcom/qcom_stats.c                      | 133 +++++++++++++++++++++
 drivers/soc/qcom/qmi_encdec.c                      |  52 ++++++--
 drivers/soc/qcom/qmi_interface.c                   |   6 +-
 drivers/soc/qcom/socinfo.c                         |   2 +
 include/linux/soc/qcom/qmi.h                       |   6 +-
 10 files changed, 253 insertions(+), 27 deletions(-)

