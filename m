Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD0E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2OCSuxGI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsH39YCn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=; b=2OCSuxGIdwC2dh
	W2KRUAtpXo2fIURonW+kLVdjw8Tygig6HhIMuQn4qbHg7lZXuletPpqAuLaiiRDA+dA0LxcK9sNZa
	czECGv0Wq9d5qMe0m11sF/6D2Pyza3yYIMI9tTMCG6/xSfjSpo6k+LWQdwbwSJca0nh6yQNXDvZnx
	RAzfFXapVNdk+4+f6hFFNc7+MsxC8V4yWKH/PmBWnq9ch7yA+sAkc9/XbPhz5Tgtz5UXpdMHD/AQM
	+PsN0/DGvgXs/FVDmo/Z9MulYPmbZ20/HtpeUW2z8WVHM7DVRMAhRdYtpDhG+m+ZQvNgPrnGw5C4F
	6Uem7UjDMjLlRPb0kneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ao-00000001Ovt-453m;
	Tue, 03 Nov 2026 07:43:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AN-00000001OHP-3ZSc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:43:00 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1834736a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691767; x=1794296567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=IsH39YCnUy6JZyopqcROBQAAAtIagWS+L3Mv7acn3a1iCMgvaymv1p46h0IIr3wSxd
         qWzPXJK2MvJjHRAN0uB/OeTd7D9m26jJQnanVLO/kyZisdCMG8nvTalSQAzS30yoy8gb
         1/gpPNm5HeyAKe3JLdwWL5EKVq+QHBQqJ+4H1WXgXaU4Y4veyfDyTXajY6m7hehe/E/q
         Spw8D6Oay5oFhvAdNBgPDf+wbk8mXPBI9yUM5+CsrpWt2WXT/4g3y344ODD9hEDPar3B
         oTHvKzJQrDYirDzPdq7Egjm3sT+qBT5YfdrbfH8E47kom6s5ZFrEeryM18RIuuqvCHpu
         J3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691767; x=1794296567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=la+6yjLHCbT+ArTbYc/NgshUj0x7RnAVDVvCy4I5rR6iPGb+FTOxHEFzL4PvVB+1wW
         eZvgsTGUnDkXJS+e0wmGSO89oSzSsaql51wzefkgx8Qt+7zJ92mqtY6BXkOscHOyvpTe
         HoTwKTvy7HfgYE1LMo+xAsM13c9tS+389B/j61lqU7PslkeirFqA6usluQys4ui2jNW4
         uqVR1DuQLtOxqpAeIxjYKs8DcCfxBCyN0tvUpQXzUIgi2zhadU/SCyhgLSNbNkxEJcE/
         NAB1mY1hNXlnGgyVjvMzBOk8+UAG9/Xv6P7/3bDqMwTla4ElAVBk+BMtPq6HApnU3l7r
         kXrA==
X-Forwarded-Encrypted: i=1; AKwUvBxOMAI/o65mCO6tz+j6/BVCdwcwnzKqneRdPjQi80/DuOvOXYFP+mbadK63BjTeaT4UrkACHmGb3nWyRTanwMCS@lists.infradead.org
X-Gm-Message-State: APuU4Z/1cs9ZpCcNzKFN1/TUPtwhJHNeh9jz1DPJM4mOtg/ZRYFI2Olh
	5kY8ZirII/3C9JMTd+Hk446I+JpFna+izwZyzOQUMfya30jEhZdWCb4h
X-Gm-Gg: AYBFou2XNeEeINxlaI/IR16xCBUIqDwXk5excN7VDh/KncZgAH7Su7392GYPhy58wnL
	t01GG5vYSYlwT1KRb+BUkQDK60KOBUbXzTx8G7BVY+7sQjhg7LwN+Z7DJBVmGMF0T5nD8fGdcKz
	dMpEx7jTHy3/a2sA7HNFntHH9zVPIQ54ZlBmHbGdl2PA+U60+DaRee4JErGW3aIU5qHVj5fJ09c
	0bltYyeaQfxxDmdb9B3idHMJNyJm74B6HTC78KBasOx/SR3L9muz9Ao3Wina2rj1JL89iD2M2bz
	B/oebEcldYXoFwEXMbp6/RTWV52s/TA0oH2wleXFdOxrhxuzlUtXAGCrd0NzKG9sQ03X4yXpW+n
	55Wd9wg1uFveZ6OiLTVFsa8aLS2Nc/z6ps2C/TFFfrx4pYFgjlfep9tO89oN8Zt7oqqynRUbAN2
	UfH2PBrtH8rXGw5ot0Tmc0eq8T5iaG5dklQ5muCNojf6iORsNeujeQSZMgC06+g+aZbsfiixry+
	V2GOpDy1N6ifud73LB1O3pj3iX1XJ1AECtLUG261cfldf9TB794O0jOdrBbCUUDCmTth1JYVHG9
	TC+3S2BfFZHc97fhv4QBCC+RfXg6CCdwHY0UTM74dmvsugDheg12IGJMtspfvqOZE6SutF4HiA9
	fBW9QQ3GeoTYfCgmupheL31lFKMFbpR9AOs3bRVPfn4UhgzLhSXjI3VQuQaeWzEc4cRSyB9cKd7
	deUi8=
X-Received: by 2002:a17:90b:5847:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ae89773f17mr9382729a91.19.1793691766813;
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:06 +1000
Subject: [PATCH v4 18/22] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-18-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8fzOK0BtAM9BKavKDtzvC9SkMIH3VaTohkyi9BTYOYQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88bPdw7+8zxaeJR3g1PXwjIeS0/LufRYzbxXFvRF
 sbQSU8aOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9ajkjwzoGp3vpF83+FtboLflt1byU6xkrr57qIumIVLazKrVXdzH84Z7/WCp
 jd6xtRMr1hR8S35z10Ou0ZEixmRvEKzjfMmcCIwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234248_078365_B1C9A8A3 
X-CRM114-Status: GOOD (  11.20  )
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

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..832c18538cab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,109 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
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
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
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
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.56.0


