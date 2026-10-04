Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7C6CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbpkMZVsBdBOWRwxjTkLihKxr/UR5S6eo3rRMVyn4ks=; b=L3+ytdsSddkD1eJMA9nv9rJGg2
	WoTybXpiYG1D3pFM7CQBiLgMeV4axeujhtwlJJlBCAna8cWdy4iCDOGhiH6TFNQZuJfFQQQ5HS5Co
	o8kPd2rZNl0d6DahzUnOj9PzndaF9kjRAj/L7/oQ4KZ/lnwLp7Usfv5QIipNe7Ywm8dluQLZWT1tD
	hLpzq3tlHQR0n0JhTfMAL8+30b7kj8rJbfpwzm/e7Az5PCmWxtJLvOs5ES4A2SavITH2s7u1mmOnF
	M3VXw92e0DYIqwL+QE+UOGyNDK36uW8o2IQSfhpvD/ISkA44iz9bCgHuPg/L7VyVQgrj6wFlLOrFw
	rlXCmESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT6r-0000000FI5l-2whA;
	Sun, 04 Oct 2026 20:47:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT6o-0000000FI2v-2Gt1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:47:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1FD71A113A;
	Sun,  4 Oct 2026 20:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C58B3604FE;
	Sun,  4 Oct 2026 20:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E6661032820F;
	Sun,  4 Oct 2026 22:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146815; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AbpkMZVsBdBOWRwxjTkLihKxr/UR5S6eo3rRMVyn4ks=;
	b=A6VOebVNjDlnkxLhmL0E3QTdnjmAbZ1/upC3qI/K+qBTvGg1CDBKmCqWdW03bm9DRqEd+k
	9jl1fMbJxIE9+lmjR2yhoMejcH/YpKYZ6IWH6e/NBD/q00evPj7xVpf/6VULIaDBBKAUy0
	06r7+AQvaxr5xdMUzBp5WiU4vjR4HHKAfVyYKXQxmllN8yhtNTKAhafa+GApsfwTlaiDuA
	Xw/8fnbMdqmshvOt1wpHXCS+XTojvtghdyaNPSPNMFwfh00kH8MSynAeymjDUY7HjmAAEL
	3lPz05kh+LP1wPqsN/zQ3jGd+c3QwT3qCIEDOZBgQPWE4G1O80VAqb6R/m+pRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 22:45:31 +0200
Subject: [PATCH v8 7/7] arm64: dts: nuvoton: ma35d1: Add LXT crystal and
 clock-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-perso-ma35d1-upstream-clk-v8-7-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_134658_747899_F0EFEB66 
X-CRM114-Status: UNSURE (   9.36  )
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

The clock controller takes its two crystal oscillator inputs from the
board: HXT and LXT. The LXT crystal is not described at all: add the
fixed clock node for it and reference both inputs from the clock
controller node, with their respective clock-names.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Fixes: b69af0984732 ("arm64: dts: nuvoton: Add initial ma35d1 device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 6 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 6 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index d7670afb0a63..7752e85734ac 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -36,6 +36,12 @@ clk_hxt: clock-hxt {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
 };
 
 &clk {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index 8f3cb18d39b6..5c65f1fe5da9 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -36,6 +36,12 @@ clk_hxt: clock-hxt {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
 };
 
 &clk {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..9a341c2b1397 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -92,7 +92,8 @@ clk: clock-controller@40460200 {
 			compatible = "nuvoton,ma35d1-clk";
 			reg = <0x00000000 0x40460200 0x0 0x100>;
 			#clock-cells = <1>;
-			clocks = <&clk_hxt>;
+			clocks = <&clk_hxt>, <&clk_lxt>;
+			clock-names = "hxt", "lxt";
 		};
 
 		pinctrl: pinctrl@40040000 {

-- 
2.55.0


