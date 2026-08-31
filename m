Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E849FC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT2RZQUr60vbmO6AyGkACnvFNC6PHvmgqZfBZ2wJHeQ=; b=QJLIicIYHdONAlUG+LwjZHfiX7
	P81IxaG54M1aqSDiTbya3vcyCjyGcPW/fR+wGaxwtEjy1ehT+9rGAvUCp7VLzsX3B3mFAaTOnPtfP
	G7AFqB8uMGU098w71EyI4oQGedZebl971z8fd/lmw/b8M8+aJ2YnZiPITYhzthygCaHB1lknu5Rc8
	INdiZLgKXNg1Btq2seAkcAGHzVXkjpAAbfNsxNf1EdTrwMEFAfUcud4psxvhyCv829JYHFMGEfYUG
	Zm0H71va76IQnR+lMgdW5hCtziHn5p/zfBaBfNI5wIKjT2+uTuTo+O/kG5GOK26tLLX1e2IWMHUJr
	CY5dJcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12t3-00000009cFI-2xby;
	Mon, 31 Aug 2026 14:21:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12sv-00000009c0a-1pvl;
	Mon, 31 Aug 2026 14:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186069;
	bh=BoOMfIFPIGwvljgrOki6vDKw076yvIl6ObzO4+ZHHUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rxk9dH0kjGkwIRNigXnY1FhwnO2wSMzwnu+c8949x882pZohScVohFGOmoxPa43vV
	 ncrWDtadRtrp8eptHHCY1QknEqHi8IdtZimaS/Twm5qsNtuXzAhEuttxkN3HBgzs3+
	 KWxRR6EO/GcWjBaQRYUwkwD19nce3NoF+ylHgt8G2vdKGk3zmabzHh9UDseHdIDO0i
	 olDHNwdU4h2wJCjY4AeHjGpeIDzBau1G2WVWWn7l23kLmhyt2UU14oUFEAf/b4xjvQ
	 0FZ0GUWukPH4vrFK0PFZJo/9zPfK8b75wABx16QHxFenzj14LoV8TLFtAuWVGLI97w
	 6AN1CdnS3/5pA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 577DF17E0785;
	Mon, 31 Aug 2026 16:21:07 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:51 -0400
Subject: [PATCH 4/7] arm64: dts: rockchip: Rename rk3399 HDMI audio card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-4-5b155ae05293@collabora.com>
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
X-CRM114-CacheID: sfid-20260831_072117_634748_10968480 
X-CRM114-Status: GOOD (  11.61  )
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

Rename the card from "hdmi-sound" to "RK3399 HDMI" so it identifies
the SoC in user-visible ALSA fields and matches the naming scheme
used across the rest of the Rockchip family.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 49c68fe65de6..c46e58d4af0d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2008,7 +2008,7 @@ hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "hdmi-sound";
+		simple-audio-card,name = "RK3399 HDMI";
 		status = "disabled";
 
 		simple-audio-card,cpu {

-- 
2.55.0


