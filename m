Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B88606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xTBOmRJS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HrUNMqn1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VyJEjFE9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=; b=xTBOmRJS9Y7n7G
	z2trz5HZO7+EZlt3jfgYimQjRykVjO+ZVA6Cllb2Gnom6pTzJGl5ABM8pZijxcOXL7EnL4ZdNRA3/
	4tg634q/hncphgBgKTctannmutnkk8fAyOiAg8uuc3S2GEnkH38yubntyckhQdqC71h70OiG1x4cx
	MmvGraku0WjHC9cauhXRjiyiGRhcbIt7rrLQqBaMvUpBNQfkpMa6DkM0aHKQf6vubDBrfqIS7jOmG
	3O686vg53zK67EQZgaIhxMcz/2n6qAXiqmyqSHQx/8056rrUgz/3z4ryGL1IuzU3GBUgZ3Vqs3pVL
	cUWNGMGnP6pUAwJm5bHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9B7-00000001PH5-0eI8;
	Tue, 03 Nov 2026 07:43:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9At-00000001P48-0vb0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=; b=HrUNMqn1qWtqxMaPufkIx32MsQ
	a/JfEQCYuicFE9xP0JB7j5PtaTnhH60fIpaQJ/dh03MNAe5PJP/FUNATYO1omB2ZOkN1dqZZNeXdj
	1tqGs9FzpGk829aHLGgm1qBz25UjO80DxPk+1xroBrOulEYo7NBl1yZr/O0C58EqiRDU4+cAuqUsF
	POMT2w4cL5sDPDULGT/hbbRJM22v+zfJp1vtml+XaXcgFSSWu/+OwryvIFfQ/go72i2ZabywElohG
	3T0MGIN4P7g2LTHKPnTnZQMm2sRrLdVcvhLTTwAt5+ErEG9CHC1C0Rw68YSLhLeJAgbNbNkpXPDm1
	9/6bYDIw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ap-000000007tj-0bRj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:43:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1717803a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691793; x=1794296593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=VyJEjFE900hUoaXpGX52Doh7qLb8RUEu2HtNr4+XFAMDf6yhiulsW16TdiQRY50iZE
         tOwoJ0fW24gw6CNwVasybMU/KpBPDIY2aQ1hrokFyDvoY0nyXB+22yNUEOSO/3PugREo
         AVnBM6n9k7j9AMEypiUq6VKYaZMYhqA0SCp5zA2mPSEHCsK7TFfqR9T+3selN12JlPR7
         hrhY0YPODdPx2JsWRkSh0PEQcV1SpgUdgjpzP9kJx7OLRWHcn9LGpFcKSEzO6sgkkSrI
         0ZWIpo478eOxzqfqxlUn+f0rvcfVZywJELYu3kj99bi8T6a0y+c/piS9FP3a+r5N3M+m
         P8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691793; x=1794296593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=c+T9Gn6p/o1Ax4WU0+U8LR8oOKmHp2mqMjxpwKyWHhpH89tw01GUmRb9sn7m6sCTkv
         47R78ZV6K+hEyl+jeCJfjDgga+P/XH54TVmOcDzql94fQJRZqagC8duqJXytGLNlGfon
         cKWFqiHjqms0ID0ngXtpf9CTXUaH4qgtB9J9OTVzsGMrZ9QsZvNe0x9E/BTCRqAMg1o6
         lETRPyh+Yv4dI3nBX4uwt2/3/JyYT9mldDT4kiRYMW2DifQVTInroRUQMp48tDoJ7qf3
         SiO2uwBnjkRW1S3LSkRIL4dKurxVuS4paQAnmsYAFVFW3b5jyS5LHKActRfxvjgY3zDh
         WYLg==
X-Forwarded-Encrypted: i=1; AKwUvBws4cB1DGkZCs1YARGFHCDwEwX1dXRTSKtTApi3BIVWLF4IVvCxt7USpnjmMUtjbeR1OUboEv92gWLXpv5GM/Bf@lists.infradead.org
X-Gm-Message-State: APuU4Z+sVhK9/wTr0089XITOrBx3M1C3xTQJhazR8W02EEtSCDaw3MSS
	PiaOHrXX+DzWxfOje9RgptiHsoPcGWmJBSuu19NE4fdBypzCoFKf0oAG
X-Gm-Gg: AYBFou2462DX2nzto1Q0Dcm2W9OzNyHzXN1aE3t91XZw7vVATKV0wyJiwCxPpg4ZYuB
	4xUAEYwt+rumIrEDnztVPkpEwCFfBPIxB3PB8vbdmAQI3ya8LB9QK5n6m+SCIec75AwRPLgJr2V
	x3P9qohaK/YfIp92p/Vw2kymObwm8CGayFn92BGNDTdhh8pt0UgbGcz9HK7aE900deTL+eJV0HP
	lH5LK39JY/zf70nnYi85opI3T2AnItc8yY77Eg3Ef9Oj4u81mUDsxWYCTA25YCsPENXRhgDyLNL
	Rpf2ll6DATRrxNQtB3l/E1O+st0kXYSQiSVigp5RbZFXP5cm9XIvqi5mw456mEpXunf1rkIcv9d
	vvxrCixOyAPAjgpgc6rvpsq8hhEnGFOhEUc8p09uSM+0eeV+StK+JJpswIhljuKHk2AR7MDogx8
	99GMka51/Seq21jNqr3Eobv0CBd+zL/bUuwizQULceBW7xITdZUsJV067IlUj6iTpYSrpgKLA4x
	VTF96+Ivcr2hYHFdF1xCV1dxKRo7XIeEyXLCKT0hJbOBtzzuNZcqN1pVCCEh4g1z0pWhKKaxZU5
	JvtfLDBSv8wOGtIfByFaOmeEko3Sn+RyNnvWbsQQxBkKI/DqGD9vO3+hlUcH2lqid8azNAZUZ4d
	B8WbN42qxS3R8xS9EKpkURbQfwswyi1G69E9UVshhpoI92S1wU3Qgsc83g0M0LF6imxyZdVfgqE
	ahLCATst+N7VZ8elR6zzlen2N4
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr10686171a91.29.1793691793151;
        Mon, 02 Nov 2026 23:43:13 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:09 +1000
Subject: [PATCH v4 21/22] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-21-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Y5xIM4BZ0PHyivynw40OAddi1sDRIGnERSTTSJ+mmxQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y9wRso3TUh9auS6Msk2fH98Z+jd93PUc9fpqf65K
 rjLdKdTx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqNRBgZ/l1zC6o+0FBrukKdT0arUvvX43dRzcYnMjyW5bUY1ApOZ/jFXCG+ve/
 1Wrd0w8Dr8vOtLfWkeWfWpr8tnvh/bZh6Ix8jAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074315_266600_CD5D24DA 
X-CRM114-Status: GOOD (  11.53  )
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

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j414s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6020-j416s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j414c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j416c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 35 ++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0


