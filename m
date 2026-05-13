Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF7CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aQBbG5BBr12ydhLfhSkL/E4J0Fku1F2nvWGO6lgZKA=; b=JGEszxlYKc4zWoWwq5Qh8trNoN
	ICyUkee3SRZq+ppqSpPFeRjAEzvVriTz46U6APlp79EWkyhtatr8eYZ9gk2f6fSyshipaeygqeOsF
	C1A94YablTlzi3kAjCaLOWdfxOTt10BBuymCaZvI6EMXX4nblAL3OVU460Tp+lU+IiOI21ObOj4yN
	cfNwMGhuR6/bSwUh+0fN+UR8KIZ2u8UqRrG0TaOGEn37bBd+nRh1e42xH65HvveDgIpJ/+0Jlpo15
	pyPvGt5+j0ejGbPDoLRetKq68/nwB0kJvY6ymRp9Csb9UjWkx7pgqPYwsAl7cCovwAphT10UP/PVR
	0CSOlSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iJ-00000001H4c-3JHK;
	Wed, 13 May 2026 05:00:55 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iD-00000001H20-3iIU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2aQBbG5BBr12ydhLfhSkL/E4J0Fku1F2nvWGO6lgZKA=; b=VnALRn2FAIPrnPvRuXE/00SOEU
	ellbJLES0qQ78J/B7thoDIkE0j0MlLAuYWZJZKgWmhikw8W4/wAwLZDcd4xDjWtJG/xJ3tugTfZZ0
	N6p5MhhkvEr66ewBSn4a9oSUihsTYk0YoOS0VyNACKD5UYNgubC7DCJylhaKqcFqAM+iMZyJZ+UVJ
	tV5sYEs4TvekiRv6A1f4oTZ/iYUu8W0uB9aqMglwpkuVyZtVY7yNULXCUow6y76WAAWEX8uMeqyye
	mTi/FID9oI6phlazitvLWmueyNVthwq3lXu9TIrummLy6DHYhFJ7kP55cM4AfWrpkMezUzNu3pfUw
	3W/NmIOQ==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wN1iB-0000000EbcL-1ih0;
	Wed, 13 May 2026 07:00:47 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 13 May 2026 06:59:44 +0200
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: add gpadc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-sunxi-a523-gpadc-v2-3-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648397; l=1298;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=/N5/DsYuZyXhP6df/g8ro7dcmFJQ8yyC3EItsyGlO0Y=;
 b=7IFLix/s5zhm6Z2vJ2rXvkQgwcq7m4r9e0QlY9IbP0q9Ao1SHxmHErk7DFQE4WXUIiCZzeoui
 XFAguZ705gpB2TreIeIY0QKwh5XXKhMh1gY77uJsYHBqyTPO6QiAESE
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_220050_115160_0A4F2505 
X-CRM114-Status: UNSURE (   8.87  )
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

Describe GPADC block on Allwinner A523.

Tested on Radxa Cubie A5E:
- 2 connected channels are showing voltages in agreement with
  schematics.
        BOOT-SEL-ADC ~500mV
        BOM-ADC ~1800mV
- 3rd channel exposed on 40pin header is showing correct voltages when
  connected to known voltage source.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 5afa8d92acbf..4e793aeccf89 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -340,6 +340,17 @@ ledc: led-controller@2008000 {
 			status = "disabled";
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun55i-a523-gpadc";
+			reg = <0x2009000 0x400>;
+			clocks = <&ccu CLK_BUS_GPADC0>, <&ccu CLK_GPADC0>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_GPADC0>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			status = "disabled";
+		};
+
 		wdt: watchdog@2050000 {
 			compatible = "allwinner,sun55i-a523-wdt";
 			reg = <0x2050000 0x20>;

-- 
2.43.0


