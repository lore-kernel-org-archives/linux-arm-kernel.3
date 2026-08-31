Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2859BC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2uZ3FH7Kr3CMYPXfL9erMI6GjhS6u+abaIjzYWI8cI=; b=MZN+TJ2UoWGzvNrRt46ziGE/84
	r90zhArzuDtcVgoWkhW2WOY5ucZgHFxyDrHJseNiNj0dD2pxIKJdnY8TtR9Dr/hOXCGUDakLP5zrw
	TurJWCTFdR6Im1V7k0iLXblANRh8MVwoUir2NDXgAKc1hn9jJdOYBctvqbFK5ZkSQuSgYqb+uf9NC
	8wjPYNkjR4JRAmjFBREuy0Q21gIoUmeeAPUB9eEirEGdPseyLYZiwkplMEDCaIsSbELYLhqskceat
	n53gmnrmbfmNEQXt1YR9txJdES1tJ4jha90HikCEh1glKqqGNVSYhPXrIn5gdm13FIm64/xDSXTP+
	vRLRMhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12sq-00000009byB-3eTu;
	Mon, 31 Aug 2026 14:21:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12sm-00000009bvW-2ZPx;
	Mon, 31 Aug 2026 14:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186062;
	bh=pJmqpcEGREq4W7//BMoI1cMXR4zhI0TzTl2ERbFmqW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IiUx9EKIpoJF3CvOYfevFqGSwiKVJYCOFG+yz9eHgCL5lQ/aGNDAL0yBfJ9uWCRlV
	 3cLJIZMVIG5FHceCz89xDqgbqcnagwKILjaPdeZHIRmEyTUjkBnmZX3LjQRc71PAdK
	 +ZL6OFfkWpu9HK8PMggmQFgKMC5tUXXSSBw8wP+2Ki+rEABl1rER+OsZ3S8Z4lfWK4
	 EcpIgYb6B+7Lbq7yJHMdpBXrb02ZsS1JnzN9zrA96pzO2o3N1vGw1Rsln1nMV3CgMx
	 dEiwNvq89CZ29yT7/bCgNxxca6etZblDAcTM53rvuKKsBawyAFOFwWQ15g1EL30vNR
	 vkFJnq3sQML+w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE2F417E0180;
	Mon, 31 Aug 2026 16:21:00 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:48 -0400
Subject: [PATCH 1/7] arm64: dts: rockchip: Rename rk3066a HDMI audio card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-1-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_072108_814891_691B6BBF 
X-CRM114-Status: GOOD (  11.90  )
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

Rename the card from "HDMI" to "RK3066a HDMI" so it identifies the
SoC in user-visible ALSA fields (shortname / longname / driver) and
no longer collides with the identical "HDMI" string used by rk3288,
rk3328, rk356x and rk3576.

Fixes: 041f240e4df6c ("ARM: dts: rockchip: add hdmi-sound node to rk3066a")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm/boot/dts/rockchip/rk3066a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3066a.dtsi b/arch/arm/boot/dts/rockchip/rk3066a.dtsi
index 3f6d49459734..12a3cbdfb481 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3066a.dtsi
@@ -55,7 +55,7 @@ display-subsystem {
 
 	hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3066a HDMI";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
 		status = "disabled";

-- 
2.55.0


