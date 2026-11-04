Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E0F606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BBObeahB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxW9IiDc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=; b=BBObeahBu/nv51
	TaVKKz/XjC1guT2bTClvCKzzpeP0uxFhOXagKHqpKrFtYExQy7o1A/KXiWfPFMbo1W9UWEhaqmloG
	pnHAWc/FwhYu/dD4c1NEC2kcQiYqtXE/LM4Ei239aArIgxG0WppkWSKBuXamnz/TbtMpX1Bqfk83M
	E3RNDhzkhdWFyqdkWN+FFJxvjTneGVuqwLXMzi1FmfZuq6cknph6aUnD1mV1pAoZunCIOltKAyLMs
	Uy3+JJ49uqh8jfm1pKAQgV1dxG9XrVl7uhNda2wNmu5LPzIY61V3oaUc5lXhS6W6xiVx8dXt33aDD
	CF+pAOMcNhDEiMcZdKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbh-00000006b9v-34tq;
	Wed, 04 Nov 2026 19:25:13 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbe-00000006b5R-25yu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:25:12 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-823e4047037so772795a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820309; x=1794425109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=yxW9IiDcJNIwbulDm54aZons2atEljF3RQcyvKVImOGJQKK7rVULqocS0OZcFC80LO
         DmAwh/igifBozfRtLmNZ49CorD7glNZFKdH7//lmuVhXC5QfOtmPEp2HU9swXkqsN/QZ
         GKU2lBKscVT5uDS4/ob2AqpJD9CVovDCUB/zpesLX4mDpJsVOTXFXR87rAn6miEcQCrz
         9TyfBgp2r4bBXMfFPfknA83uHFkPPrR4sUVZIcWAV+CndOiDoMtV2Gtnq0Mz5a9y0NR9
         fzUoYIGlCF0+pv6WiaAkGKvwe5jR35kEx47Q2SMVXjDB8uhytzn5qCQrqTUZ7kFrYIAQ
         vYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820309; x=1794425109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=NyypWE4jYmmvbZ2jHMhwSCfU48s3C4DKlZgaennh1UGpdx7Adbcs8UdTlkU2MPWt4T
         3FL3oyopLSKpxllPam9JpnEgKpk4eusThr3BKPJQ01brI7f3LsZGjOhBEpGJ307/fJSt
         lOGya3fY1uiETyFjEyWXcMjVSPpDUooDc2nhtaEBn8zX6IM6aRM8yfqnkHV0cFJkBPIp
         YF1LXq3kCcWCvF68XKcZpJRXgjRZ7TKJ0UFSOfggLYeHl8qjyT0qTWZuayeGUDDCOp1I
         CtPJYgiSRTSy+o+PJaZ0GNWO6K4m+TCLn1oBXLALWrvahRdj4mxwTEOv+4Hxug6Hzk1o
         bzFw==
X-Forwarded-Encrypted: i=1; AKwUvByRI28kB06x9Lc7QlXe2vRD6cUTDe2GJYOcJU4VIC3sA+TYWLikSG4CmHyFdMAtXqHIcs0Rn0f/kAVovciTuy9T@lists.infradead.org
X-Gm-Message-State: APuU4Z9rQFPA7JkpWvgrA41HTxhGy7pNoLjg3aVLHLwmDJ4Pie4GvK18
	QHTWraF/6Ef//6oy+v1henPclvx8KWKv133e5A406fAzKa+x/maKao2D
X-Gm-Gg: AYBFou169JqWUGIjMu4LjXUEsUP0V4Pvto9eV2AxKF+eOeKroe5gLvTYaU4HAbiQfit
	UXMfwYOGSoOHzOMOvN0ziBrMJmobUUIOThkvokw/z/TBzToNjv5aLc/cIZchtoPEyEVPoR2tt1P
	7ZlqKA5Xywqmk8OCv+ANxjNNkt0rANGuP18XzPRFw9KiP0jIbGaK4HLpj2fs8M45F/D4iMpEHjC
	LYQf8VGumTUkqc4vaPSQyXxmhtpx5gTRXbtTxoBNj1sdk+ye+rlBE+ooNSllMjEom2jJHfpfwte
	hrjiCLOy8ucYI9WNwgZR/ke6ngvYAHxRUtomY+YoOBenUFcbxSBOPSmUhlMTG+TvEM4njbmxweW
	kGYi7snW+gx/0lmaZBVrm/mUM6ADZxCdvjRrrEhTi8dr7rmWY+/ml2xPBAzRPpJFL3ynwh3VrEG
	3qsSQ+QMgEDOHGoWwu9X1acEmB7eGu6XsJdZPEigXfbXgLkPcQ8YPvIN0u5juclBCYr5jLaU3ny
	QJmWfiu8dQslRSso1RJNzhbU90W/5igU/yrSrSoQQY88MmgHUhB2cXtb28utUXhIi8qdGcavJaq
	316Nbdd8W+SHzvMP+7NYjPVD9W7Hd6EeZ/0tUl3TEFHyC0Z1yMj3lM0wobS1ZIrJ7DpG8qVh+kk
	02rZpBC0C8Qqfa0WwO7+mV+JR1voxwWBwTMfkYVgV+d6LiQypwbWE47sAmokt7fW4Msl9shlOlc
	TJJfXTheNtyHK0FGuS9iTgyJsKHmZtTCFV/d6rxHj/U+Jp27pRMqtK
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr12233182b6e.14.1793820309111;
        Wed, 04 Nov 2026 11:25:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:54 -0700
Subject: [PATCH v12 4/5] arm64: dts: allwinner: h616: add PWM controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-h616-pwm-v8-v12-4-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_112510_555813_E6CCABBD 
X-CRM114-Status: GOOD (  10.47  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b6580f0c6e0f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -293,6 +293,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -397,6 +408,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0


