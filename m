Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB070CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8+XcZgP8957SPKwPpk0bkCHSO0BbZnOhhuPRsGrILw=; b=LPKLxUkWwkU6uq0IBJXf9YY/HZ
	HMOxwND7uT9ELMa+eGysP3g5RwJ0RCz8IjysXMOiqfyaLNg13ulCdIgbdiwsP4l2TnX1eCLdgECeS
	w1zD2Aiw/wh1JaL7pbZvZwpAJ1161pGIL+8wNipL6CQ4XcUw/esPzQJNu6em3e/S8SBTNKJ8BZVD+
	czZ1FuGQDPFrxF49Lrw5XHM5BRGNrb84NDFfoRNbatSvd1VzHLVurHEeTphwc85RGF04mDCryKymh
	oD9TZC8/Gf8bAFlfVlkq0Lu6755YMWyoiIGJWiUaWDCr8lcKjYat4T8Xzwpkm05s89I9rRRePoIxp
	1HGURSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0t-0000000FzAB-39Nv;
	Mon, 18 May 2026 14:32:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0p-0000000Fz6P-3hEm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-441209fb77eso1368061f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114726; x=1779719526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8+XcZgP8957SPKwPpk0bkCHSO0BbZnOhhuPRsGrILw=;
        b=DDevKZoaySAQ1KKxL5JVHZ4P0p7hjKV2uYWLwHMUcLARbC+98Pbcd1glkp96DYi4yy
         v+YOHryvMWirdBtquO6s8swIlb0ZKTBV/CkBEE3lngCqQoA0wZijRnDn3R2/T2/GVhms
         ecNAZeFxSB/H3dZLwHGmiR/2MCWLQgXOPagGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114726; x=1779719526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x8+XcZgP8957SPKwPpk0bkCHSO0BbZnOhhuPRsGrILw=;
        b=B0sX57aS/no+sOvoojvM6KKC0SjOHV2ZVHMI1er9J2kSZxLWzgs9jRQwGedfHH9Oh4
         arYvTouUwrMJ5Y6oQiNHWDq4Gx+BojzSTyfKTVZFviCOFj3HGIltAfsLMal+mcLUs4qo
         qerE9/9rlMWQBP0ID0xm6TWH3nUuiaMb9XF+jaazRBSI0vYv0DjqVE00zmud2oeEFF3V
         NuVB3BapQkQ+OESWGM5gd4HlTFzrF+WHfC00E8fxooCsz2PAafnjuikeQr+d2jiDrAIj
         1hrzhnXb5a/zWEiDZnwytLji2oCQnzlhaT7QrIuFvRAmyyFfaJlRq8BeJvd386IS9iJx
         Ja8g==
X-Forwarded-Encrypted: i=1; AFNElJ8a2NXJsZmZSNpZuWIoU2GtAvuo9UPXoTmZCzQJWvR+ydukqn0ryiru+uRMCc1a4zK2gMVDbKEQ270U+isseOWY@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwfly2vXLghRBJ/n58URVWSZZajlnfNCiC/AkPju0WK3q4JGF9
	CjMdfAMDt6nPBb/ntWeCzedx3tOqqv3juzbrUNTwbn8H4L4I2/SDixN1enTlMg0AEbM=
X-Gm-Gg: Acq92OGlhfsNPduAibW51aeokjus20ODeQy/e3iL6s1SHO2ZSAuk69mamDC+t/UPZCa
	5VkHbE4MbpVcgj17wQiZwzsB7XjEznUIRoBmGZ4CCqsyHTBnkt4bCiMcNgBh7e1qeGS/1bRJETy
	YeA7aWFzZ5x1srLBre5arKwPX/kviRy6gj9NPjAEUtCcmGgz/VYbWbt1yinXaiUabaDUDohuez1
	1s8UM6GusmS0QcQ0D0ofub3+9VHnApTGrf070nJI7Dl/orO26MdxabakYX8urC5En9GXme3IvId
	ko17pjwkTWEqifOdndtiVZCAXPD183uStlRfkaasEgu7sWrvWW5TmaGRqNJPtCn4HUc24MGJFOD
	ZM2cO+C63vcOU+CPUs42Icm83qaKtlUpYzQtmngyCn3RW87bGPt4MO1eRoiQPk0R6iDt8bchjLs
	yfsFfuFpNy711ZKgOP3rZ3OpZjNGyT7EeU+0r/J6bBJiAmnDAmsV296JoRTlrnuc2afGXHkBz8f
	PuTm4aAbNygfFTwrufV7ZSJ6VsLvdhHG16Vn9VjXRNMogxP
X-Received: by 2002:a05:6000:2087:b0:449:31ca:5e53 with SMTP id ffacd0b85a97d-45e5b75624cmr24382596f8f.8.1779114726004;
        Mon, 18 May 2026 07:32:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 04/15] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:19 +0200
Message-ID: <20260518143150.3138712-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073207_940610_1BA34EBF 
X-CRM114-Status: GOOD (  10.74  )
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

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0


