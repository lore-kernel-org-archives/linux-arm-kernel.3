Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7B606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UrcjghkM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06wfQWKm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=; b=UrcjghkMYYYxZe
	1Luua4sFbxii4eLBTRZ2/jGeTUHuygCgpwHAtrcd7G4JP1T0+yAr9hXhdhxaPxtjE/Dx24AuDgdJT
	ViuVmWYQTFPQsJsqYwqTXKvNNaLoxxHZhzcFsffR1Zxcvgxd0Znl7AUr3UHSa0JRegm1wyPIlnse+
	YMu+qqD15J7SIqS7PBWCJSXjsWcd37cTxZtn+g4MPWz2lsb/39SACYVzCFliILmsESZ1RQfh0CF3F
	up0023iAjTu/yOGyhBGCTZjoG2Bvnlm4UePJeMek3AOSch21IaiW1Kc9o91Recdr5Pu/GkzLWHvQ7
	eijPY5yUHZANaFLV/vwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Af-00000001Ofi-0Qo3;
	Tue, 03 Nov 2026 07:43:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99p-00000001NYL-20Pl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2806376a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691732; x=1794296532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
        b=06wfQWKmLOhl+M4UGJwUhPXxRdao7TnyIXZYjTkY2HFw92KA85pH8ZEACOToDjFPYa
         BPpupbYkJFBRxG5IGvQoe4cr+y3+K03cOiLWaOtfgvZKo7+zd+bL2sJUFQaPG+kGFw1Y
         R6czKjIcCR0AYioPOGOkh1fRSRKT7loTjptiLzhknpCHsH5AdNvXJHjxxuBrHIETwbE5
         LOg05nPPo2sBDVV+M9uvUivCN17s7lMGKtZsWDx+bSILoV9T04jtD6SlrlrjKeMK95vd
         uZJ4AfTNGfjQbA+1XklxeIrNf9Y1SxnoTwkCwpV0cf5PsfnbdBzwFM5ZSX7RSFFyUzqd
         vPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691732; x=1794296532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
        b=cPu/OTOkoAOlMiOJxdrJI8DAAMJUbfQeUZrh9xAIcK8B9GsW9mBd+/d+aEsJp8/HtO
         PGnkSQL4pUzQ40+m6fTRRSYLXjNvlj2qxywwoAc4IrsfOnXVCledBAXNbfmmUqxx1mWc
         jZrHsI1rctzHBdqT3OpvQN+tU+r/Ws/ZV2IoTtvy9kURXscXB6IbWbFdbcuVDJkgLs70
         nSODKAb717IUJeFX0RMQkEeTe+IvFEpyfHCLhzdv2X2XyxTQlJvgDCQPlTPnULwgPDEV
         yCoOdIRYs4VYODX6ZIepaHlAdE76kLKFPCQlPFIPMtbf2HW768Lbc0LdGk5WnTjiuw40
         uLRw==
X-Forwarded-Encrypted: i=1; AKwUvBzdsO3OYPrknHZdKWvLQGXkBa4JkAfx9gJ5aIprPSQqI48/8/0F6eenLZLz4TMG1cYgW7Kwd1Gvs6B6qYZDeiMn@lists.infradead.org
X-Gm-Message-State: APuU4Z84ilglu2zDGE/FwmbW7HXYOvuH+sOoVmm8BmqoLaVxUPDNIvyt
	oA5OY/VOBPT4WX6Ayg4nN4p8zxpr/kjxLPBqZ/yGRP1XNFq8qZ6zOQU/
X-Gm-Gg: AYBFou2IoyWzxEvCuKvjSHR4sdprODbERB4bMeLdjq6GNa0fxoVvEHhgTcx5srU6/ac
	UpDFecsh2ILx7Fe6/jmIpLgdII5U8bq93JYsdESn8JhQTmnNDfahPU2zFOIucuucH8onuPgPDfN
	fFDCLuNduGUNrrdgZnmHry2HxGdeEmH1BPn98vAZp6urAI1OOCT+KpUqlzrjrHaMNLTcphTicNp
	h0YXk5rUCC5dEUNKQsNOccweYTBTVIGnr4uNl37HW7HukzG1EdZDLWXpHfhgrFrPswQXFGvDXFr
	Nn+sPPfdoHyHfnZP+uSBWESIY9o4EsV5aWQa+9z9G/zqBSjNyYI1IV8LioNmoni2mEr3gjN9eof
	LGHoARX0yYwoDgvxLerrOPd6eBYz+c+LsVXZLSVblAQBWD1TSg8UzGBXj/fzCEbH4562Vc2iJ1M
	QcaosQKbgCeUvJAtlcacfCjolqpZGwOcrjgCRRt8rzpSKsHtRrN1//ly3yK3W7/XER9LNy1hBv+
	QZ/UmgCB5R/Ocz4pt/Ge+ltl+w5uV5BtZcZMA1bnEM5X3LXLlkM7w/FiTX7prU/Fr0UTj16uGrU
	84A8xHkg8GHRAvweGMETKMQISF/7YECgsH31nP538UkC4VS45oKutMYG0gJFl8xnCkG1I1i6Tzv
	PNpwTjwXN9o4d6ce8wvnMpqji9dhmxLc/lBv0jGhAiR0R4BEqSVFfReian0Bm056Y5GPM3Q1PtH
	EragM=
X-Received: by 2002:a17:90b:1b12:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3ae89573fa9mr11002675a91.3.1793691732367;
        Mon, 02 Nov 2026 23:42:12 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:02 +1000
Subject: [PATCH v4 14/22] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-14-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8ZqQFFxpGVv9nHh0/Eh1D7Zh6Tx5J809tDsq8MzoHlk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/v6RDIyc+wZIkNMv1lJbLIvP8Wp+6UWbs3Skxju
 v1bY/6TjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTnbGBkaD3uUcLovI7pw/ocB5+Y8Dl5fqI3/La6ZrzdUO7mu6jEkpHhV4vq+ci
 2lKzlmjV9Twq9Llz7V+ytcmpKlalw66IF9x9yAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234213_791848_5AE3AF29 
X-CRM114-Status: GOOD (  12.33  )
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

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 43 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 43 ++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..74e9d11b3362 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,46 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
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
+		compatible = "apple,j456-macaudio";
+		model = "iMac J456";
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
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..c0692ddfddd8 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,46 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
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
+		compatible = "apple,j457-macaudio", "apple,j456-macaudio";
+		model = "iMac J457";
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
+	};
+};

-- 
2.56.0


