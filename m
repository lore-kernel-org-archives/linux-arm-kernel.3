Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74DFD5301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+TcBD9Ao2J1nDt8GBIFgePf0A/Kr9NhjYVtZK09AUE=; b=WsF8oU2iiiPK76OcXLvihSugh7
	MUAHK3pS9l9MMM078Q1pCmZH6fx9vPT4OH4bOcIH0Rv1yd5Ro7PajrI1/9kP+zoirojb1wooLQeNO
	VnRuPwc4LSUb26aPjqAAhajCsXnoQZwY03G2ysv8uP1u6BQbwqmgsDzMEoNPY5xH0eoLoctIKcl/f
	ByP2MbD6MHoQ1CexgQH2NPn0UyR9b8xfZc4RinJ3jUymhoyLfG55V342uFqBEGAkR8XPD+4tAG+YL
	eSHTj5o+sU5GyzSdDPe3abZmO5Hf+nzialpT3GvVC0RsRSEoCD3C9Igb4B4TUs6L0sSjQAQWZbmzb
	57rOiqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs9L-00000007rmx-3g1Y;
	Fri, 27 Feb 2026 07:20:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs9I-00000007rmO-3Rmp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29ACA40D71;
	Fri, 27 Feb 2026 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A373C116C6;
	Fri, 27 Feb 2026 07:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772176830;
	bh=5LqXlDaWAq/8TXIbV3fX9rXHaDbI2PpJbWwGZMlzwgo=;
	h=From:To:Cc:Subject:Date:From;
	b=lvZmSE6tZPcbwCNO9WASZPlQL6JlNsetEr8mr8bhA49BTuArozEnb5Gw3TDsNLIBT
	 FfF3RNroSlpnPD/Gbso4NEhtFacR0EZx1GvEQCm0T00OUFebCaF7knjKu8P2lC29Ps
	 wRI18VYb+AvshyaTXJmnWG22nNi7hLcUyWATIKXD3ciYbCSQkkLJh6/TeLOafqBflw
	 GQp/xVGQkLhmjmvlOybOY2Uwfd4/gn6mZnltDKR/jj3KG/XMSGP13pLb9AtlNsMHTN
	 MDMDZWffexJSr4HWbEz98ZxioRyW2J5xmo0OoGx5QbriBlKAMvowECSLVA+rnU/SFo
	 xPRwOJUVWW6Gg==
From: Shawn Guo <shawnguo@kernel.org>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
Date: Fri, 27 Feb 2026 15:19:58 +0800
Message-ID: <20260227071958.1350024-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_232032_882407_37027280 
X-CRM114-Status: GOOD (  10.83  )
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

The PCIe reset GPIO on Poplar is actually active low.  The active high
worked before because kernel driver didn't respect the setting from DT.
This is changed since commit 1d26a55fbeb9 ("PCI: histb: Switch to using
gpiod API"), and thus PCIe on Poplar got brken since then.

Fix the problem by correcting the polarity.

Fixes: 32fa01761bd9 ("arm64: dts: hi3798cv200: enable PCIe support for poplar board")
Cc: stable@vger.kernel.org
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
index 7d370dac4c85..579d55daa7d0 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
@@ -179,7 +179,7 @@ &ohci {
 };
 
 &pcie {
-	reset-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio4 4 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
-- 
2.47.3


