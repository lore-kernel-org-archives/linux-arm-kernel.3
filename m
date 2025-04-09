Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98850C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L45+ICB39rILiQvvG8IODqUa4EonAhQsmqzSvglwcQQ=; b=341gS9qeIVzmrXCRT0a7rw2Evx
	CgJGbv6xf9O/IDsWfWBBfz6SHiIc8vc7nlTv1PbKUUf8eVIt/VIOaYhSCn5E3kG7g5L6MwyPSLAvX
	ZVvMLs+CxrXIls8WaGefiFTVBGsZ7Gb0y/h8fsH8RDBEgdxgOuAXfw7H06kuIDJutnvcBF8gK2XU8
	dKA2AqaU8TnwA79g8rUGSZ9H94dRSmNo7dUdYP+bU8AZnA6c1tvLes+Zd7Q/CaepApdShUj8c7vQs
	sV2rumSwaeGPlzFk8ErI6mPWXx4UTZP2cRPNmdsl1TwP4RWkRyXgQGB5j1SqMWwtnD7m34vDqLeud
	S5uY631w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dCz-00000008cCT-2f1N;
	Wed, 09 Apr 2025 21:43:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cNY-00000008Uz8-3tiZ;
	Wed, 09 Apr 2025 20:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84531A42FD1;
	Wed,  9 Apr 2025 20:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98447C4CEE2;
	Wed,  9 Apr 2025 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231835;
	bh=ha/sFYVwv67xLp5xqyVpRwtjWeRe2Tkg8+E+AQktWgw=;
	h=From:To:Cc:Subject:Date:From;
	b=lXQeaM+fET/Oa1+E0vAsStRyBGOIXYZ9LJ5C7aN7XKUDpEiLGUtPFqqTaHO5S1emi
	 IF1BNRKURiaKbsmJzfR5Z3U+OpvVAm+hvoMhSM+MFokdWxzXUHLmMrOq+ITnrpgnqw
	 BnywndcvfGI5u+fdcpD7MoGFP4p5VmIgBr8afgZ70llzXgdtWjV11p2Oc1uYEvlt9V
	 8bU1OYwpBOmMTsKgeXKQYGxuPcdQjwn7SQZLs5hTMuerJ7Fv6n2zZYtC/XjwmNowI6
	 KW9blpbRg862v9jqPKkVh9ybM0QZoKZFcCK8F6mr071Pz6BbJNosuZ3TcQChPnlCIS
	 VaizwMgU+HcLg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,bt-sco
Date: Wed,  9 Apr 2025 15:50:00 -0500
Message-ID: <20250409205001.1522009-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_135037_032383_0D71FDD3 
X-CRM114-Status: UNSURE (   9.16  )
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

Add missing "#sound-dai-cells" which is required by the linux,bt-sco
binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/mediatek/mt2701-evb.dts      | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
index 4c76366aa938..e97dc37f716c 100644
--- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
@@ -50,6 +50,7 @@ sound:sound {
 
 	bt_sco_codec:bt_sco_codec {
 		compatible = "linux,bt-sco";
+		#sound-dai-cells = <0>;
 	};
 
 	backlight_lcd: backlight_lcd {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index e1495f1900a7..9f53344fa83e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -105,6 +105,7 @@ sound: mt8183-sound {
 
 	btsco: bt-sco {
 		compatible = "linux,bt-sco";
+		#sound-dai-cells = <0>;
 	};
 
 	wifi_pwrseq: wifi-pwrseq {
-- 
2.47.2


