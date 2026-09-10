Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFCFC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2uZ3FH7Kr3CMYPXfL9erMI6GjhS6u+abaIjzYWI8cI=; b=2ry164L5tHUpsFtCoMpnBPHdoQ
	dpHq3NW5AcI/GMSEXB5tAli8bhoPS3RIWc+6Fb16QiXwCr3XDG7aLSc8iyBixp902pFqV1SsErUZn
	R25hAp7h8u2Ltdk/FuONhtVcSpkQVYTYF1rFx+FwFdziell4BC1xbWsw+rYJ253ilegAu+3hi2yDa
	Y2IAq3xYMyckilHLkvZNo/eyEf+iRPj0ZHB8in+YHoRdr5rvHitjBD87Q1j6Hf5H1WZU5I3cEnuHy
	KCAE+7xwz0IiQ4BaB3qNAGNTurjnKDlo5w+kbNsdE9OkVAs14cVANvacMGH1AB3ZrxOfBc6mp+VxR
	myAGKu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewB-0000000EUEW-2zY3;
	Thu, 10 Sep 2026 13:35:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ew7-0000000EUA0-0ezF;
	Thu, 10 Sep 2026 13:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047328;
	bh=pJmqpcEGREq4W7//BMoI1cMXR4zhI0TzTl2ERbFmqW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Of2wE9URLUbLE7WxDya6/0tMSUK+vjkN6nu9Sck24CDFZHxAio4OpNe+msxrfwTC/
	 WlzNuXWpbbVoVoKjGuJbmqNfxMf+2HJK3XMjiXo8lXhlrVgON+9cMUAiMj2Av5AVhX
	 TAwIc6ImNYEmqy4oqT/6O4OsNl0CE/cuKrxVQ1JYTd2oNx7xmfOQdvUIn0yAd48w6+
	 MzLJkd5pkwnDcLJ65G4ajc91tpcuPhCSH6917CelSV+EcttUYH1C62Pip07RlqI+gL
	 Sl1dPBPAp9ThKdmNDKc9XJR+bYwBDvk9iRYOIkXRb7lb+G4KvFL0mtAa4lEXKvwoFt
	 DZID8AUED8zzA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D882C17E0D43;
	Thu, 10 Sep 2026 15:35:26 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:43 -0400
Subject: [PATCH v2 1/8] ARM: dts: rockchip: Rename rk3066a HDMI audio card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-1-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 David Summers <beagleboard@davidjohnsummers.uk>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063531_353735_763CB5DB 
X-CRM114-Status: GOOD (  12.08  )
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


