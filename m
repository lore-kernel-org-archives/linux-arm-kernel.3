Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24266C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gml3h5MI9b4rNsddmMLdsuhGQasz4CwUFzbh0gRM9Xs=; b=g1bJLFKLN61psdXa6FcIdSoJCr
	+G3D0wIQYh0cwBG9Yg71Wky9BF4mmvTtlopSzJN+wtCdYydB/kGHJjEjuzI91+lFlK+mv2I1TjW2D
	gc4Pg8050gf5YaEIsY+2ZG4BHA+wiz19DEMqoLOcXGc1rIcIJmPlyw72/9oKyVqvX7c7aZHX7kQgu
	eq6Wqq2rSKYUy/uytWgm+jwL+qc4NBeCtACaMLjgklAepbLgzvs1w6ar6zHrxX5+t1BaDOZwk78hx
	ORMknh7oSKlBw/rWEMqakfI8J5c7xxF0c3qUipf/P4KdXIBJeD98Y5/TxV0awlNwc1dNV2P4EsEq2
	Iy96urJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHcf-00000003zMd-1k38;
	Mon, 17 Mar 2025 21:03:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHay-00000003yzF-2uRh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 21:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 615D4A48D06;
	Mon, 17 Mar 2025 20:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21405C4CEE3;
	Mon, 17 Mar 2025 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742245319;
	bh=zG2hpe1DsFIm3tM39WuYACGLDuIt+zLz8Q5ndylkIiU=;
	h=From:To:Cc:Subject:Date:From;
	b=vB0uk86By9PGAa8OADRimQRl8EEWP7ka9vW+7+jF6qQv9BKUxAJFZtY0vzHdKwfeP
	 uZ2Jw5b/Q6Edx/PBSOGC4BJETJcMzBho761WkgxkLoUD3lmk9fII/lqNIReS33aog2
	 hpQwE83SeAeZ17z1aKUPtG70CtnRC4AaNsl2/tFWiATPLAo1m0XMZwKlKxkFMJE8nK
	 Fbbw3PPTyZO286yKKjg8gPBh7XSoD66UR4uu3zUzoVP/831WzFfs229RDY+HZsJ36A
	 wHh3Ozeb5Tu48YuGGkQqJ4AHKMjiBQzOQCdzjNGPSfq8Bj7R1BNeZlgkqVOJ+ipIew
	 ah6yZMYsrPUAg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.15
Date: Mon, 17 Mar 2025 16:01:57 -0500
Message-ID: <20250317210158.2025380-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_140200_795967_6CAE11A4 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.15

for you to fetch changes up to 2e14c17a2e3d697bef6b5bf49b253d6e52f3d186:

  soc: qcom: Do not expose internal servreg_location_entry_ei array (2025-02-14 11:37:30 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.15

Improve the client interface for the Qualcomm ICE driver to avoid
leaking references, including fixing the client drivers to call the new
function.

Adopt str_on_off() helper in AOSS driver and mark non-global servreg QMI
element info array in the PDR driver static.

----------------------------------------------------------------
Jishnu Prakash (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: Document SM8750 compatible

Krzysztof Kozlowski (2):
      soc: qcom: Use str_enable_disable-like helpers
      soc: qcom: Do not expose internal servreg_location_entry_ei array

Tudor Ambarus (4):
      soc: qcom: ice: introduce devm_of_qcom_ice_get
      mmc: sdhci-msm: fix dev reference leaked through of_qcom_ice_get
      scsi: ufs: qcom: fix dev reference leaked through of_qcom_ice_get
      soc: qcom: ice: make of_qcom_ice_get() static

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  1 +
 drivers/mmc/host/sdhci-msm.c                       |  2 +-
 drivers/soc/qcom/ice.c                             | 51 +++++++++++++++++++++-
 drivers/soc/qcom/pdr_internal.h                    |  1 -
 drivers/soc/qcom/qcom_aoss.c                       |  3 +-
 drivers/soc/qcom/qcom_pdr_msg.c                    |  3 +-
 drivers/ufs/host/ufs-qcom.c                        |  2 +-
 include/soc/qcom/ice.h                             |  3 +-
 8 files changed, 57 insertions(+), 9 deletions(-)

