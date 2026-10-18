Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA14CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=; b=qLmhqzHqfDEGoKbpP5L2MPWSrQ
	8uUDK7G4FUVyenD7KyvFokXG7AyG8w9RnkZJgOp6RmFxzfjdK6zzxUG3QUarqCZvsCyx8GJpA9H5q
	+17EkUZm92sVN1/W7y6QVzrSsjf1YBS77ZceY53Cx+z6aZ3tJLqi4laH79GyZZJ+mhQqCtbAouMva
	Udd8+Tk6SqxlOJaqlV8lZeFKLf73Kov8r/OCX6+rJMTOHtDsKpTGc5NPO55CCKcKfghB/FIV1Acf9
	7FnIUC29BpbLfkqbZlvEnl3xBRXVHHjMXLpeKtUQo3MsTq2kANhGx6Do7w3Wi8A9vWxY7YDGkHgSs
	xGiKk9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsy-00000005agB-2Re3;
	Sun, 18 Oct 2026 05:56:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJss-00000005adA-2q0p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1101979a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302998; x=1792907798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=i+Dxa8bfy6xFqJsee1Suq4UQCBATDEzM1BsbihUtRicj/LZtdTN69qqBrKkmEIeFTl
         apqMKVKMHD9nG4tJu9LwGawwwGRjXiVOw4a/lLKXh+g2SmqJP/nYz3c27aTWal+0rxln
         YV2XNRYHtqnSCbPFS3vPzJJhTnwK1C2/kxS0L9bCjX47SaSoCTz7PuaKEy/ZntysgEu+
         DAy9uEbhI3FOpeghbVyZ0HJge3/0V26u20W7WhGH6UamvQHi6qRMVHx3QZAEO7SUyYE0
         bBL5jBih6xm+l+Mp9Oa95N5lalRabCZAS7k4+aoHJ61ujJi8AmGpdc6LOGIYiGsj+8r9
         fgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302998; x=1792907798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=X7LZqeQRuY6ic6giTLEUID8MvhTOuaLUwP4d/W7K3a/TDP9mDuFSeQXL5dPxNxNyjG
         cjO4Wyt+fMWkPam6BHfHLqAtPFubzyI9gtaumSyfJ924fxALgc5++k2HtbiR6cf01jUN
         1vOkA1TuO8WOAQQm4KSWVltjTr4Q3n8h21yvRsTHYseKPSUOPC7yF+Bc8kzVdm48tlpI
         kubEfeFcdTPzXDKi4e683uAXyWkRZ08ZRA4aAlubVuvKAdSDoG+S5TclOSXu+J7k42fb
         +PxaUWYUhtMNcVuNd+CKyDrhp1iF/O6TIZ7dh3yt2ugUDQQ/UVlaEyCeRrfGSJBvbrM3
         bhWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOoqFI+tdTq/6nlcN97cw9FkUUwPXxrrM/sGbET0kCHFQrji8yfjFcMkcO/FY4tmrxQqYCklza2tDkBagS1JOY@lists.infradead.org
X-Gm-Message-State: AFq9FYIUPEuYXZjB/cLf/Nf03EnSh6MlNbHBPde+AGAP6COW6eu5Vzrn
	0ey1jzAhB4tyThWU862k1XwKRhFg8jOItdZdU2rI0nlZn/WFKD1l1u9E
X-Gm-Gg: AYBFou1h4VzbRYBz92qJx8P7+6W2P1P6CDVpRB//62TZ4t7xVq0hfEbqXevhEe7HJpz
	iJsSxGVUYIauACE4TgVPZ1zjT4cf5v1uTM7PkM7aOyXnve7PMindhZaODT9EBeToOozLTNdutgO
	PBxgIMtP6WCwA53QrZV4P49KDKZ77Ekz7bbxSdY6PP/mr3+zR9OkA0hEqBDn2xKXjKHMwzN6vL4
	BbudosS5a2DJzFRnT/sha53tUNDyJV/uM0okioSJgb1geLOblOyj+DFdpe5jQFGXhIPIBcxNLN9
	2ug3jge2Kd9T8M49I5w5ABRxbyLZZZNsaIPgBAxkCpmX+KZTLL14TtlZu+lUH+dhwlGh5Iq7INr
	rZGP7W5zfYiGT00LzFLDsW6zufr3eMs9F7qusPjaJMjmRFAcMgLmobYJt2QRXmDMWtUt7PCf8UJ
	KdfTONwUtdGT9K986+W8sJPsUi4QOWb29hPyF/a5G49aqJ0w/xObxsZ8dveoWBVRkHDH4Wjvali
	RFTgSFMW++F4hm0OXUHnPXSVKZbnVZUYbu811JOXJLj8U782ujv2NqVYxh4zor0Hih3NJNOMIqD
	QdHUiVEPtHLtSJKPuWlxsmxF3fqHfRWkjt4AXoiPVdkgZ0A=
X-Received: by 2002:a17:90b:2701:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3acef11c1b5mr3627242a91.60.1792302998052;
        Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:07 +1000
Subject: [PATCH v3 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-13-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zDYarNXpwu0fUg9Z/Q5DjYa8aciZr7oQNJE40M6audE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl7jjpbrPtfq/B2r8mC0i2v87d9qLkfoL1488r+7
 rk28cW8HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlu5Gf4p9x7XHTL5v7PhRMnxF01lBF4q3B0R8kZNlO+RrZ5irn5cxkZjlYts+l
 3+W1fKeeq+m6vnGKG0iGW7KC/y1+wzt+7UPUFEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225642_605585_876DD38C 
X-CRM114-Status: GOOD (  11.48  )
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

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 43 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 43 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..91da90b37089 100644
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
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
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
+		dai-link@1 {
+			reg = <1>;
+
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
index ebddde75455c..3e8d7648b3ac 100644
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
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
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
+		dai-link@1 {
+			reg = <1>;
+
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


