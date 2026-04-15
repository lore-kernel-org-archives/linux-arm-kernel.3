Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29C6FA0C42
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 07:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUPP1HQhc8WF/U4VzPKm08a5Kk0RF/8mP/TGIwJgcsM=; b=UxZXDiU8ZCfX9usn/Sph9Qk4Xz
	ATEhgj/4kiLk57nONlO4CO3zzNUDvAeVUUKOXqudcqBUiLACxkgeSd/xTfABWlzaz2cJnPxSNgNFg
	MM7OYw29Uk42xu/1/zFojaKd5w128GDrvad3T+4YzqoQl+gkgZbqS0geCHaeKEc8/duvwLdoimfMp
	/tD6KkX9FVTD0bvdDPM43dSnqbURwKTMBeldGSx2XQYZR6ybJVvZUenyomDw2uDealv3uNPfkrdRQ
	odd6S3wKdoNHVSzyfrHqqaOG6SVG9tu8rfHMS1glKJCS/Se7YAsOMlxFjQwGP/b89k03TLe6VtgoD
	8q9GiXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuba-00000000ieX-1IbP;
	Wed, 15 Apr 2026 07:24:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubZ-00000000idt-3qG2;
	Wed, 15 Apr 2026 07:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KUPP1HQhc8WF/U4VzPKm08a5Kk0RF/8mP/TGIwJgcsM=; b=EWYNpl51XGfBQWolSSlKlN1ktP
	Ky36ZHWwiHy1KvTn9alI2jhdn/6ixW5i2JkSRLaHUP2eO/+nXUn6VY5k5S/YQQur3Sj7dzP8FobN2
	Fy2Xvg46v5QqLYnh+I//KqtHqyBQWOVmPPsyJMIeUCp1twx9l5q3EmHHNRJbFI8BXayrUdoffOBD6
	Wxh6NUbis9DYfGQ8z7bqmEZzJGvleVUPd1MtsmWsNEwu3mkfI7JPPSuCqEkbiMoRE9pzn/MFwblaa
	SwXWj0SBMbleCYwYUmG5sGEKOriyu4JgX6Q4/ThwgW2/6y9/WQOYkm69R0F+jQQFTYDnFYM3YbUen
	DI4IMwNw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubT-000000020GH-2Ik9;
	Wed, 15 Apr 2026 07:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776237837;
	bh=LlXq/U/YSTcXP/hcTIR6RtPx9lTAqG8OjX6Oh88UwRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dkZfUA+rrV0vvJchW2Ug/pjKYtdUur1ExfZ6l8HTkPzrd1Mdds6FzURhN1kZw0hAw
	 ERI5bmXCVq180PIJ0f1U38hxNADUC3knfP4ayjomqBQFoLqfQj4PFkeymvSDUaxD6C
	 eJkFtCOTR7MKfnlYBOCA90kacP8smrcrEs6Iol2s2tJMYp9Fvav8bufHhr4H1OwMKj
	 j01UJf4ht9zszoLpgohmaN3XLHaSIvoyUIb210vD02MXQZvKdjvDwk3yfo3q49MYUR
	 /gTyxvC92AAz+8CZaoiv5PX80sD6ppJByT1HchdXOmKJEIvVOymlRjjfSBkwb2O0Km
	 6XP37ihSvJmVw==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC9F417E1428;
	Wed, 15 Apr 2026 09:23:56 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v14 4/5] arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
Date: Wed, 15 Apr 2026 09:23:40 +0200
Message-ID: <20260415072349.44237-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
References: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_082404_545867_54626D76 
X-CRM114-Status: UNSURE (   9.39  )
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

Add the device tree node for the Verisilicon IOMMU present
in the RK3588 SoC.
This IOMMU handles address translation for the VPU hardware blocks.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7fe9593d8c19..7fde18feeaf8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1428,6 +1428,17 @@ av1d: video-codec@fdc70000 {
 		clock-names = "aclk", "hclk";
 		power-domains = <&power RK3588_PD_AV1>;
 		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
+		iommus = <&av1d_mmu>;
+	};
+
+	av1d_mmu: iommu@fdca0000 {
+		compatible = "rockchip,rk3588-av1-iommu", "verisilicon,iommu-1.2";
+		reg = <0x0 0xfdca0000 0x0 0x600>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
+		clock-names = "core", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_AV1>;
 	};
 
 	vop: vop@fdd90000 {
-- 
2.43.0


