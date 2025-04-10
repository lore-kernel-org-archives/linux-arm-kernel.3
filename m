Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A133CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raoUr8kouvU4cg0ySYDsdbJzGJScWBibH5QqrmnlZ/8=; b=j6QY2xpfe6BUEHSvrSEcAUBp7g
	lF6hCy+J7dgttXHkcZmvZulcK63S8fX4sHkyYpuvn1ucYHqUSks2FVkwhaXC7jtR/tYPdIxttGlsr
	jXbX4naoHdBqfCsi7xde/rcUGmo9/44gbaRjedVgXXtXOk38oRDLZ+w7u2ktjbyD6y0iTPREy8zA8
	9ekNRmi6jR3XcITXHf+aubgpdA1jFdSN3lC/eu1izxB4USV1hFydF7FAhwC5taQZAHXF3pTZ5Httz
	oAWvtMSza606r1c4dWeIlHve6KJwKRITtJEaeXXqIaHzJrSrOO/8LQjyOMvfE5Zzavy9a8OSFkA+a
	y+hGlX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2v5j-0000000BGQV-2LMA;
	Thu, 10 Apr 2025 16:49:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u85-0000000B4y1-2iXr;
	Thu, 10 Apr 2025 15:47:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25C2E44EA3;
	Thu, 10 Apr 2025 15:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E14C4CEEA;
	Thu, 10 Apr 2025 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300068;
	bh=MJ4WoqvhgC/aZjAy/ZTQhYcG1cI4RNuRYa6MzsWqQtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hKfnqZneC+abzLvYTV6plSnmp6les52XSC3Xz9C7Rcp6J4l9nCVNuTwwlTUqDwC2q
	 +72ANtmUuZvc/VC9/xocD3jWreOuzykzBrMs4XMQ+5mfaCArgkpCjWOGupDZjoz5Ow
	 8UosB8hJqyiNrk+9DA7VvUzhvQIATUk+C0zQVQFDi+LPw+XTwEqa/nzR/JLtX1szDN
	 PBgCNHvQouW1ck4kouSglDLfZtlrrW/w97heJkhLLQgWU5bkcf8/K4TkAhklO7XJAd
	 vNyAf87yOvTzcn67GZHe95oSdT4xtwNHwsePQSTvc2Glij/FQIgwfTDE2C7PXQwh/o
	 +h/3lbYv+BgBQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:23 -0500
Subject: [PATCH v2 02/17] arm64: dts: broadcom: bcm2712: Use "l2-cache" for
 L2 cache node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250410-dt-cpu-schema-v2-2-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084749_728676_CCC25C7D 
X-CRM114-Status: UNSURE (   9.18  )
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

There's no need include the CPU number in the L2 cache node names as
the names are local to the CPU nodes. The documented node name is
also just "l2-cache".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 9e610a89a337..ad0cac8e4444 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -64,7 +64,7 @@ cpu0: cpu@0 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l0>;
 
-			l2_cache_l0: l2-cache-l0 {
+			l2_cache_l0: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;
@@ -88,7 +88,7 @@ cpu1: cpu@1 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l1>;
 
-			l2_cache_l1: l2-cache-l1 {
+			l2_cache_l1: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;
@@ -112,7 +112,7 @@ cpu2: cpu@2 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l2>;
 
-			l2_cache_l2: l2-cache-l2 {
+			l2_cache_l2: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;
@@ -136,7 +136,7 @@ cpu3: cpu@3 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l3>;
 
-			l2_cache_l3: l2-cache-l3 {
+			l2_cache_l3: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;

-- 
2.47.2


