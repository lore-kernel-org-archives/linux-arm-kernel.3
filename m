Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDAB606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0PcK23TE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Q2Jq9oOj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kx/CIC3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=; b=0PcK23TEHP98DD
	mGVP9LSWJtF4Yn8X2pSMHC8HYiIFk6GfHuvjv8dk4thIrcfLWNRl1hZ++u3gnHxdASBLq4CSufR6S
	zrIfJlMmoHEwx3gDciOuyX1xoqSqN32v/ZyTU14Xf1esUzZIu6/3cbsxhkQeIjUMJFSlLt/rTF8iy
	8LE0YbNPqk6gkWKLZ9i3EEgN3hhed3u32RdzIgnLq6k+bBvfPif+u0W/q0DtkFAmXdBhQWC2RJNOc
	GMIS3S5wNTba1TqEyMr5FDL9fMhpQ9ke770NgaQM/p2n/I9tjF67qRKAd3Ww8YgsX1P/U31Y+2uwz
	YbVhd3FGP0L4bwRYZKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AP-00000001OLu-3ZvS;
	Tue, 03 Nov 2026 07:42:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99n-00000001NTA-0x6L
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=; b=Q2Jq9oOjBPHl68uNUk5vjTOem0
	AxWb58lMqJHqsPQIE8MEh5ZyiopcDWF+CAPpsdPkvTgjBDQcLEyRW4UG2wHGdScPJYt3D/Y0Kkxs4
	kElIbAPUqLmH0ywihnjPALC4cygWnmv+ZibhspnDdLICXyrkRjCeTMYyHJbt1e0lqCPgdWQLUMCBs
	iUzEQJai2GLcRB+3X52eMKqjl9CaBVxG4zG6VV1wZYSwTTbg62MAejCD4IvjbvaQ7ro19Yko3/F9l
	Bu+Fkkk0jKLjcu5xzoyt2niUCxgywbvy6O85tMo0WiGyxj8H3ZZ1AvulKD5HP+/ApwqY3OBjDUVUd
	hEVC6C5Q==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99a-000000007dH-2RGg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:02 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4193479a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691716; x=1794296516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=Kx/CIC3Tas2jnWjC0rUTwKH6X+TEJJRYzO4qSzZ8NTeaaI0weYbe0G7UV4aL8jTuPz
         bIwYZz5usSqsoJDvagrvCsu49r+Obvey2NqRMETNS2auyMPSeOwk2ePgK8Hpm/HNzIzy
         IKElgoiSEb50t4lIOvIzlcz9KXENmjgbyJHwjzqxo4U2cReTXFiuIsq8bJQvvOlMnGD4
         vWqom17DS1yFH5PhPY7ZUGeLzsVgvP3OHMXwWBg/cBDLDsQ9tUB6bHnMx9mkmFKVFSMR
         5uVHZjNdvsowk0vhS+zTDcOdZgC5EZWM2jR0fgB19ebvCdKclmJcrF6Wg2uuHCaMnmUH
         rBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691716; x=1794296516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=Ty5JlYL3WTX9NO6H7PKHf45pTK2kORIWeptFWThgwoa7MqjLVJkqn8GKvUc1Dm2wJx
         aD7aPkWoTOsDB0SZGeb2fhAVlU//Ie1CFT/ZgrvHJxrl69os3dg6Q+1ohNT8mIic1yBL
         rVzFLS+YhtQRIE8fzjuE3IxjVfX1EC2qrz9GPmwClPIssMnmzX3MnrEeSrvWYepZqEai
         FgjQ6tC5QqZbhYdqXBApeFoVlVpJxvScRQm5mj9gP7uG5hzQH57brpT6sOXzlk38VDQv
         M5Ijlkw0bn5d+8diCTThYPw1Y9f7m3uw/xvbmWYtZmGcttEBROpB25v+EWIaMH6g2Z9c
         j3sA==
X-Forwarded-Encrypted: i=1; AKwUvBwOYiezHllgWAgsSVrnJPhSKBMv4+IjZFriImocItHlnIOIVbQvwUJLJmMVfHgu/BSwYDHqkEHmykqXDLDEmxAw@lists.infradead.org
X-Gm-Message-State: APuU4Z/1Un7fejtQuE3VRgoaWUikrfpt+F9kgF1wj3xvFf8hUk7h9bmr
	zTaveNzJslvmZ4LZg7Ktx9zACFfzxZ67usp6iCuIyFrgFKYO4hZ5ZkF7
X-Gm-Gg: AYBFou3af299rCH5yXODmF8S0bpQfJ5/1iL/5O5xtP30w3ImJdMvOcvcev0GJm+W7BG
	HxSHhLjyRz8fD7QHpkxD+XClVQkNl4YK/tGa3h56P6CrCC43obNWHbOiDryZHlSiai8DiPsiOMz
	OlgY2HEmnTsUoyb43yc2Z+ybsxj/7HXpcha/NKj8Mi//XwQ9qmJSuKZKMCtSoS3ZZbJePFny03b
	tw9OuRMSMPlTZL7hzbVw1LCgOSP9jmcoyOG2gFow4xpdm2c+U1ECaFs5IzAwHtVwmyb444kkNqH
	nhb0au+B6JmxI0CAA2NQ65G+WX1BkPRImrzn+BoeuoM4zwpOWfjmwa18mkHgRuJJcFoRp8jMXQa
	LYN8QT6NiRpJV4LuE/KDM3zZ4j9RpK57NLpX0uacu2ZxhRRK/6vAbU288+lq/L1yJnDJg52+5ov
	MhyCjz8SUbrzBOjHFmYfu033lZUMxCYlKe4lUL2DlWlibiZNGl/Gz3tVn3Kt+vfNXjtR2acyFmo
	XqVUi6B8+GWvA1bG+0e5BOksqV7YlUpaFbv9/WdYb/W89ErFTVP31fNKJRQ93PWnuCuqZAHi6r3
	LZ7GUMgqrWq/de7sYJYkFHFeT0vZDq3c0a4Ktfb6IFqu8AeG8o8Tqltdhazf1LuKpiTSxjX7ZcX
	QmUR+HN69n2blfdxfrC/jfNu8SvJkWU31xTebB0HO0LclawAvcvbhDdeJnAOhNokCggOt+iSBwW
	jBkqY=
X-Received: by 2002:a17:90b:570c:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3ae897c8820mr11559333a91.17.1793691715180;
        Mon, 02 Nov 2026 23:41:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:00 +1000
Subject: [PATCH v4 12/22] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-12-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5HKyFCsuZAaYnH07XINXm4pOIg/VsCVnTKPu6wyChjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+v45h1uUCPY0rCtPuamc+e3xb9dDx4p/h/1bLYQ
 4rqZ3v/d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaa5zgjwzPGSSEL1Dcw92rcS622su/eaLvyVK7rFWHex0oz5Rc3T2FkmHHyR8Y
 RlQduJ2s6U7+IJa5tnFLfq8544XXu+R17O25f4QUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074201_127917_73988FDC 
X-CRM114-Status: GOOD (  12.15  )
X-Spam-Score: 0.1 (/)
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

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..36c47734a1dc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,89 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
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
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0


