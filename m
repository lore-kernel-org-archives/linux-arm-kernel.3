Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A3A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jGZsTI6T;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ha91sClU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=; b=jGZsTI6TjzsxX8
	nbufQhOK2XgM7zW8pprHmY2YDay2mWC/h1opONYJP+QbBF0Dh6WzKmYVZoaOkQWiez+3RsilqLHPM
	3Vuy+5TZzBxWRfMghbe8/lRB7KOWl8/6ZvpWVh3Vlo24d5qU6s6YaPgbr1THph0zcqIIuNgaTT21D
	t5g+I6gZkr6YLxtUXzadzHPv7jZo2O44wzpVz3BQoIyIGmKA0RDVjzjgJXE34xqnuW1/6y3mChjh1
	Pc60lVXjwghmgfjetj9FuzUjmTV6r3mXuqOdxZPgE5JNAJEBxkSu3SK+z6OIUsNv+giA9gASyJ+Ic
	VNG/0VicMeh3ARKLcnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9B8-00000001PKN-3LUR;
	Tue, 03 Nov 2026 07:43:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Af-00000001OeG-0cpM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:43:30 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1533196a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691784; x=1794296584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=ha91sClUOOIMV97+Ze6co7yj3MVaprax3wA2al4CvHI20EubR4O3qMjPX+rUobQwsP
         Stauv7UfOgrawH/epJOdEcphQXcF1/Mnje0c5Nr5lOLAUgXaziP9O2Vx7DIS8QFQlXXa
         EJlTV07wJl/ieulorWT6F3K0slJocL1GtpeoIoT0iHgJqAgz905isRuAbo46wYgWiK3v
         MSEorIn9yxrgkiQ1csj4QldB4/zZ08u6kbO+uCrAsUDo5GLlL4cS2Mh+Fj37yhzIS2uD
         RIwo4Yqp06tWoh8UMAsyR5QjnXQT/ExpUbn3KA6xNhe+fi25c7ZE4RXX/QVeuWHAIlPZ
         3eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691784; x=1794296584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=2DvDP+QaoYOPDEALuWB6MSMbjWG6Hn4egsomefUzoOUUYtcM+HpCtsrYb+5yVNg7Ld
         X4ieJit4UOH2kGcCt3tkQTeHqQ2EIfk4x7lGnfexzkjUm31xNglNgPtDKWDFwXHoO8vk
         c2bIY58lquIi9VlVKQbTLVINvb8E45z310vMY+YTG1HjI8VU9ED2pybR6O6d9i/XNdLH
         fQCmDpzraaaAbjLiaT7/9ykzEPLSAmib0l7QTEqbZFemE7F0QxGVbh577WJ1qkCQB50w
         SWQqQqbAOh0SIeMI8xh2mNjPCKhmXhn31NHRJmNHACkRrUaGni81qarhaQMEpW/NRNbq
         AULA==
X-Forwarded-Encrypted: i=1; AKwUvBzQq7hODTJHDP4JbDT0ezz+F031/yGFb1+FHbEIZym/hlckHxmN7/W48I70LyxRX299ZJSysquF6etWoIm+m/fv@lists.infradead.org
X-Gm-Message-State: APuU4Z8whdlWttPkScwRTzUGq1L6//iGI4XjncMgkvOLyCTYYklxweke
	KVfaxLSI7yagchq1dO0GIL3ME83i2wZ9/0t3i7hXleU9IDxPVSTeCgnu
X-Gm-Gg: AYBFou2fB+0EVWZAtKFZMm3ybca1G0FS84XEwchuvqKJ4+LU6W0/QrTt9mV4Ug+TkSf
	cCicTwwx+l9gNyUar+8YT6lCWldqCY5zBbUcj8i/Yw/mPQeAtKTTVqLj+iV1NIWDySLXMTzSbdU
	d75no5AgcQqoYS9kO4r9Z6z6eixbj6tLTNmc2xO6SipNBNbE9Y99DLFPy30c6auUrRUIXU9Ycg/
	l6qp/89QjMgrm2WftOyk1HSurM/GkfPQJryW6o73J7fn7nS/wKinfmI1u2bGrRSQ9g/dvA7J4hc
	e8iuA0cbR1Qcx6Oi86I+bEwTjpgxWdY1fZtN7d+ogL7Hac1FLoBQyECSxv1c8bd/GRF2ev4LADi
	K0eKIXD10099E8R2TlKxQzBHUhne9MorX7iqnAF9qdYmGlXvNRLUOv9JUBX7TQF+VgqpcbnjPi1
	V5Eh7+y4AQzCtWpLbhvZJfZuT2T6Y73LUllG9QuCN2H83Ej+pVbQZN6HYjY/BRUMNhsS9AUldP9
	KxRslwKa0pRcC1sqO1B53EZVXvrpXr7uqtk7CScnu2dRusNyhEbMXuT93e9tl4PvEMObb1Kun+6
	dd/a28G0AvMt+rOkg/GM0SgYDZ9DvYm8F/PSgvQQln2GsBw14Qw4uNV1GyKh27mtgN+snj2SnWW
	/BSpJz+RjDw6d0+LvUlAyKdOZSy6E0IBxXJgBYxPfw0ACNoqwdILWW6YT0QIfYH5M5OLk0TGP5j
	9EHmc=
X-Received: by 2002:a17:90a:f6d4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ae895362cfmr7683697a91.3.1793691783996;
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:08 +1000
Subject: [PATCH v4 20/22] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-20-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nKyDcyWpWxK4UlDAQg1VAwHp+X0mdPayNaMxBUVyu6A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y8Y//97r25PvzvjpWdJ34WepC2NXJrklmvY5H9/j
 uWRz73zOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtnMnwV0hRfdnZHy+6mZX+8r16pv968468OqV3m646B2XuVvj+5TIjw5Nw/3f
 xm7LLL2+KOrTr6pPtNR2vJr/zvvMpc/tWg+cP5bgB
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234305_287925_8A10567E 
X-CRM114-Status: GOOD (  12.78  )
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

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 arch/arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 61 +++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..fc45dd9b1a94 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
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
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,37 @@ &pcie0_dart_3 {
 	status = "okay";
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
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"

-- 
2.56.0


