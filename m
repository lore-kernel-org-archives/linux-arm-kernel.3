Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581EA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0RtnM+n3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JFHfv6wW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=; b=0RtnM+n3TKNuV+
	9EQ8b53Pm9bEvXRZnXMWhK+XFFmpCHkwd1eZKo4gqYZJmwvVLG8JMjmPNiW5E6Y36dzXbrSYrG06j
	CJ1+5wS13zf2npMesO8JRlS06rFXitveY1lsV6bOuaPwtcbtxR2VZOesOnrDJt7oGUdbvtGOdI3ag
	hKgKgG9y7JD/HgJ/+rYAXz9VuemqNm3tX5SdvipgWIs2IAw+/vV44cTV2VQ8Umj0rYw7WyoGzSNUE
	+4958gQkj6gDSxFHUCXj383OIspASJbt/EZMqE06XK3njCsQse0iSFSOJY2c/hZTb90T1am97eBVh
	qpgPTx6lcVjxdW1FeOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9An-00000001Oso-3rtk;
	Tue, 03 Nov 2026 07:43:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9A6-00000001Nx5-1Vrv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so3017317a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691750; x=1794296550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
        b=JFHfv6wWiBZI9GHV285i7C70wUmHJJ131tsjjJW9V+GvHhIs+6YtDUzT9F67hnVIXQ
         PIfb7bKYBQSGKTV0hnuCeJD7483kUBhoNQuKTXjo22Pzri4aDhtzmWNKJF3uUQo6s+h7
         7b7lpIx//WL637zM7WBzav6QSOIIIdYmlnvnx3ATIMJ/v2uuPc/LyILl9IX9b+Ew7phr
         EKWMOPjei87nV6dznsy89cNInwLNJ9biSRqiT0Q/u0sYYp5xp+Iu+583DEZcKJqrATF3
         JpcbXwWN5rnF7loubHPviyFQot1prJN29tvd0rZMX6BLF8+4h16WU/5rApEj7YR99/6T
         gM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691750; x=1794296550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
        b=B3hbon3/i+pi0P5BbXw/nPl9xuwZ0h++huNSsuLL20TS1cOgzeYZa35eoMKIOIv06Y
         9rQuFNKggR1PumQc+Jp8zf6mH820Rz4CyI8S0qRBy0VOnX61ax9C2Qz4N6So2k/HNhnz
         04ffLmcfmrXaNBgc7zzpdlV01GINgmZTpaS+vV6Z+OT9CKk2QTI9nY6/GC0y7NXadRPl
         5i+Ev0GI+gDaCCOdyvEoN3xmR+HdGb/3CZLm5MOswulI3HTBIPAHP/KodU7f0lJ5VoSz
         g2NH1EyjOFLdt5mF3yC+RF7WNTH5R1dWXs2+7liI6Z8IBnYm2rMHWNxCRt0i9LxEb5SJ
         J09Q==
X-Forwarded-Encrypted: i=1; AKwUvBwss2oJlFlJgOa2BSlRcx4Rm0ZLTEPu4FR/RhQdRUbXjmoFor0WE2fFy5nSVGnUcSZv1/yZ6lr/PHa1i2y+xEEf@lists.infradead.org
X-Gm-Message-State: APuU4Z/HPPK4y+uYuKvdqBMdLSM5hgcD9GGILFABPGXLn6QvStOgM1X1
	qXIV5Tlp5NQIV/8UJMq8amU/oDgY1fxIYyeCACzepJM1wa4jj31Qvx6d
X-Gm-Gg: AYBFou02ohpQAqsQIaUMgTJ83MSaPu9CMDtIqhC+3HzJgHc4RAzGiJw+DRcu7n6/LGY
	RJNOS0RBSKDSF0LlbRtHllSiMAYdrieLbvF4d6uP0y7YWKsDqJgcmDi6X4egAMG8pFdrPbzMCYF
	1/8N94up3PmduhGm0pro9kTpye1xWG8Bdo7wDHGd+NiuntIaDsW/pFDtwmkXW6Ln8bl/yKpcSMA
	peUoe5ySJI7lETmF2p88g0FJYcziPW1E6hycLP0ejAaDtVEXvYVmV66nx+YvmDFg4em4QsINzUC
	boftJ3Abn8GMd1HfcS+957mFvFhETRzSdlGBH2oM3EZxW0RaBE77PiT/2mS2InPP6tJrYATZljG
	JmSmidO1K3HgkLCsSKF3GRPlRDz0+jTrumILsIJDH5R8b7Xwek/H/SL7MHZ4sIUXasZtq73PtHd
	yn7tF0bJ/DIE5BsK7G0rICt12ThrxiPfUsXUAou8u2euuIZkkTOnwE9O7cysjNfNuq7IkTs9p6m
	PjJ7r8qw6fTzp475AdUOyjs8j22O8gioJoyS38DCbWy90eowLiHlVsIEaD9grac6/x0p78Fl6SG
	02VAku0Sflh+51+bFPO1pm8HGAJvAu1Hlv/cbVGrZrQfpDAYa8FlQFaOPB1RxDbLBdYsJ0Ct64v
	LQ33g5NcHlctO/w6SlnSHrF0oJW95TlrDX+XqfZhWN+CTzIGlrnNutVa21fmEvox5hkXDcPLm6R
	YfAYs=
X-Received: by 2002:a17:90b:2ecc:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3ae897c64fbmr10444576a91.19.1793691749540;
        Mon, 02 Nov 2026 23:42:29 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:29 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:04 +1000
Subject: [PATCH v4 16/22] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-16-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3946;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Rg9mnllZl5Kfvh6AnHIOcb1AniA07neRdlq4UArxIs0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88/vXtFsOrw2mjPLw2TDOIdztm19a/TrW/vumKnp
 tp7J5ivYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVeTowMv/1eZqvd4ov9bN2wee7J6X8VJr5c+nbO4iCdU/vvT5lSxc3I8Mg0ZL3
 bP8uNl9tzO/5YnOR/rcPW+sla05+ldOXi3gMhnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234230_837978_25AB8739 
X-CRM114-Status: GOOD (  11.15  )
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

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..c3f646e21934 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,132 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j415-macaudio";
+		model = "MacBook Air J415";
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
 #include "hwmon-laptop.dtsi"

-- 
2.56.0


