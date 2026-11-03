Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED88606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NysUnZ8k;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JE/JmGvh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=; b=NysUnZ8kzCNJrM
	3MLqJ4bIBJtK5dyw0EyG/xO6dTYE1x0uFcre5QiMRtfwX6AlIjS2pylmHy0ZUsW3xJFqVqIy8f68x
	AAloY7rgSmd4DOMgulF9h/W4SBzd5/Ss4fMcG1KYu9lg1WwcdsMD/5iDQ/VmGf65vkv3hqnczsryA
	24iDNPoPGhoF+xZYnVee/27BImbvJOCehToRDbV7T+nc4BiZiMwkOUwqq12qROnJXdxEl08x9xiSa
	qqyWxfzQC912arBb2obNZp+mFxn/NezLIt8DEX3xx3X5Xj5gIgwwisKLptVbnDbBb2LFzRFzUL3IP
	ciwHm2NGknUuCKFOO09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Au-00000001P6a-2QUx;
	Tue, 03 Nov 2026 07:43:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AW-00000001OTe-0S3I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:43:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2280860a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691775; x=1794296575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=JE/JmGvhyUbbJJDZFQ6wydHYWwCMyPxduf8MF1xrJxWxBa1l6wBxzEwy+paaiJEIrS
         whaZWfOoQOBNSa8GjX2YcrWU2rPhEhWQXUITQ/9ZobMFvAmest3xp0FXjn8+z69sjZDU
         lo+os24INn2/7EZg4mCjKv7xbuuhgt8qZSA0w6vEB6tTOBGXEvKBrCLaJN33p5OG+hd2
         kTNsblCZdxeXRE14pqoQ5ZxkQ2Gzm67Y5BY7lLKz2AMWbrfrajfS4wPQ9TAF3bkAMFVK
         Vn6XQPjCYpXhpI0ZTzp8k4k4AgSRCtSVPKmQm2QBKU0cRdjZp/LTzLWkYtV4w4IE+/IQ
         Qjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691775; x=1794296575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=kmATkkbtQvP+YTfQ43SxuS2LW4B1HDgokb6SF8Npk3XXcY4u5wGjXSFulM01LNya1d
         7mS2BrN/PA8CWXmBfpwMjyJjMQsvA+O6aEyhjMKBRPMu/1hGcxX8pMGgXRsMGkZz0e/K
         yIuWnlfUoimhUkf2LNZO0TZjXr2hkN9Htpuwzj/WU8KTSu0e04XGTSRFA7qDcArF08Y2
         ZJpPfj9Fa5l2JpLUjB/Vly0+xy9DxVvEt1zBBnpMzOOAL+y4OMWrW6trdm2kMnys+bZP
         9XGP7QJvanexE+dzzBbDBFcbF//smqXz7wYPdzDGOvyTFbyo6hFLKLgGjvxNzWIubRJm
         hZHw==
X-Forwarded-Encrypted: i=1; AKwUvBxrKDLwepJYufqkbbZ/c38IGUNiE7c4DeCRugCSImglwj0qruslqdJ+OB+dxA5XDu7eVKpZW6LuywNBKm4t5H1C@lists.infradead.org
X-Gm-Message-State: APuU4Z/0mI6f4v8Y/1N3b6kzpqGgmpFGwGEjU8TAaE+C/m0i8SffUd7K
	LJJKKA7ausoX6VlU1FOAbdpoeObCK/GzfC2U8H6Hbc3biUrd0hW+Mjp5
X-Gm-Gg: AYBFou1EVRAnj9xsAvNsSwJwznHPOiue+EWsIh6nnO8eZk6epvhmdFBr77+27+I9YCr
	qvs5boz/3IOhfah2GldYH6rGlflCcDrO0LGwTe+BjgtBGBAIQxaNe2FTHBmMps/iu+X9HvdQnW9
	UAwp4KiWBgwkd4OPg38VJyoztqsvwWAqFAQMynzIOxP/jDAHe3Tzz4D27TIedmKoE6bym1VLKrN
	eJImfOkfm6WFcKjPsW829fxGM7M1Mj5Z7MWlnpqPeuS5DXfJ3eYif5xk1xZZ7vRcniPMwNIFtzy
	sNMb0zmXMd1sdq7Un8PmF8PXmcvR0LJ+XP+RDUDhRIb3VcUGk3R15XYyuQpLMW9mn81A0zOOsJ7
	RYziBwFblpMh4TFopGhP2zDgM9saxMlQKy+NyutGqpZv1/8LiJE1TG2OwXANmyg/z+tAw4UVWCt
	O0/rA+UgugiFfpyC/3wL0WWTjJkHAWk9+xTAQNqQPaAqFbG6VRw4x3gkNsuLBTsLKcSoGF+k5yi
	Wf9uONsv0DJPOUykrPId3TYTVXI5+GwakyryB4774S+HyWQof0xln3yx0pDg4xRe5ifJ/gRPdsA
	y5fC5sqNCAZImXxu9XXqiXbKXWA5BFOtDS+OJrBemRF9M1LSLPjQLltgBZWzp1jauc7LitvIOEq
	gT5s4QJCVhOJbPVqx1LLCEroXGgm2tWd+N9lG+MMmv1LIOchMO0tYShFsIrlYqa4IO/WXUhO7Er
	L9gN0=
X-Received: by 2002:a17:90b:48c6:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae897e07b5mr10233118a91.63.1793691775441;
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:07 +1000
Subject: [PATCH v4 19/22] arm64: dts: apple: t600x-j31x: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-19-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6072;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tVHb04ag/03f/ScM4f2Yc2EXk5oXeWx+RtEiWeg1z4A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y+Uvl+YaXR70WTZzRaW6iUV04JTViSs3a/08tnvn
 A+7twW86JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1nx4jw68f0oJpvl+nGCW1Leae+nJ7j/aOBx5r53e83PGJJVpS+RnDP5ujN2b
 37Hh4UPJNm1TuI4GLOdcmrdrYcGzClL131U62WPACAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234300_757116_700132AC 
X-CRM114-Status: GOOD (  12.37  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6000-j314s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6000-j316s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j314c.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j316c.dts      |   5 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 131 +++++++++++++++++++++++++
 5 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index 1430b91ff1b1..63ae47ea46e6 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index da0cbe7d9673..c8428fbf9244 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index c37097dcfdb3..05066cbde96b 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 3bc6e0c3294c..ee0339b61713 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..5237cb39491f 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -169,6 +169,94 @@ hpm5: usb-pd@3a {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_woof2: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+
+	speaker_left_tweet: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_woof2: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	speaker_right_tweet: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+};
+
 &nco_clkref {
 	clock-frequency = <1068000000>;
 };
@@ -366,6 +454,49 @@ &atcphy3 {
 	status = "disabled";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan-dual.dtsi"

-- 
2.56.0


