Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF4FD3B996
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wF3GnrTWwt9u8gVRh0B7rm3VkNAnKwt/+N/TCp3T70Y=; b=QGRBVF45qyfFeYxA0mVPwXo2+b
	G7Odu/pfP8UBCHA97VZtzQcLv2HW/bm6uptQzG2HFt4Bkh4bRAxcVtYorP2v52rcXfraqG/wnNDZP
	v2DV96701BrEyhD20GgSVeDldN92PsS9CjveIt8ckEcbhXkYD5BApv6xUqw65Bunv6KylENi956Q+
	9SFHDijQwseyK+2QIsGkPqmzFYVi5V2KbAOIP3qr2q1+NcB+rZ6YgoYrnSeWPf0pLJeQLOYF0GWer
	EEod6nXPFIMSiFTrD4nc5hUpcA8LqeanXXAM2pBbagnYSQXD5ziBXvZW1swqM94Rztgq9P1dxAbnT
	W92P2T2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4xr-0000000EoBU-3uoJ;
	Tue, 09 Dec 2025 21:09:43 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4xp-0000000EoAr-1wIZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 21:09:42 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 76255240104
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Dec 2025 22:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1765314574; bh=wF3GnrTWwt9u8gVRh0B7rm3VkNAnKwt/+N/TCp3T70Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=nLAGgxKcyHvnB9mHvreS3qIB2z1t90PDhDLN+8MsuzW/f6SAkzHVY8rvyCsnrTIhw
	 WutmSLtL3REy8Q6BRz1d8yAU7tTmwbQ49TAUrzcNduGpscV5sbYkad5IB66PE35FwI
	 AAft9vSCtEvxI9KoYo0QEkBsHTeRRCqYpzrrBrs/9YaibyAyFMOg7ZD/lK5SAE+6WB
	 SvSbufZgS2sJRTXouXKlyTs5+rbSNzTtg+GD9uvsAPZaRzDNmU7t6I8EQpjfAr2YY/
	 Khp88uoXdLKNmEHw9c6S3hqcuZf/gE/onUKVpq96L6XTGiuzilo6ozlk62ZufO20ey
	 pgpX+MBBVMZ/A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dQs191mWfz9rxK;
	Tue,  9 Dec 2025 22:09:33 +0100 (CET)
From: Adrian Kossmann <adrian.kossmann@posteo.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Adrian Kossmann <adrian.kossmann@posteo.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add compatible for Ethernet PHY
Date: Tue, 09 Dec 2025 21:09:33 +0000
Message-ID: <20251209210658.458506-2-adrian.kossmann@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_130941_654963_2333B3C4 
X-CRM114-Status: GOOD (  10.13  )
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

Without the compatible string the Ethernet PHY is not bound to the
correct driver. This causes link instability under load, with throughput
eventually dropping to zero.
Add the explicit PHY ID compatible to ensure the proper driver is selected.

Signed-off-by: Adrian Kossmann <adrian.kossmann@posteo.de>
---
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
index a4bdd87d0729..4da5ff6f2572 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
@@ -163,6 +163,7 @@ mdio {
 		#size-cells = <0>;
 
 		rtl8211: ethernet-phy@1 {
+			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			pinctrl-0 = <&eth_phy_int_pin>, <&eth_phy_reset_pin>;
 			pinctrl-names = "default";
-- 
2.52.0


