Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF87606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gUnhorSq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=htmKBfiI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+4xiQOj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=; b=gUnhorSqrkra2+
	jkjYHowsOTFhrQirga6U8GHZMLa+xoIr7cWWfIZl0fThF8YZuvOVr7BH7AbxX9Sj62wpu0CniTTad
	Jj/70ps1tGSnGMN3Px7PR5seT9PYfPQ+glNWi8dIyZhUp4rnSRNUI/+UnCJZ/9LjazoB105FRSVi6
	sjlawr/ZvprS5tzG9R/hQWYo+6g5xsIK+wR0Pue/HkA3ZjOly87hW1oyxR7NHTC2xYxH7v3v/e+Fh
	PW0Y/ZAuHPrwkPk0WidOfxWz/wGR4d1BUL0N044/DT22QBPfKFsYp4LZB6R6dTf8BOI4oW5asBKAC
	yn3gVqRAKl8/v/8NXoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AO-00000001OJf-24Gk;
	Tue, 03 Nov 2026 07:42:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99l-00000001NP8-2jVQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=; b=htmKBfiID9X7cZUKOsMhcUNNqH
	CEcwmAy9Va2S8z8zRePKAMXzIBhTEKG5QBSGyu9gWNjvdmfjgR6huaXYmgwVn3iaLv8/M2H/UpwZL
	5OL6JzXzIDBaM4JJVvqS4a7gb4yOiZc08S933Yyuyf4pQegdtKC3bQnd3ECiS+iKfR1RhMQFX93ka
	EpfzqeKPYXuxPRtqhibHFfp37wM99dK87i+mCobIy/zClLKxIMRpAcVVw55vnVpdQ2dVXZFUK7lA2
	yeCc6b99H/O0ISirRrmU5qdt1LOjWAmdW2Zwthk4boX2VcW30sEhvhX/D39B7nH6PhowHECnpm/am
	+y27Ab/g==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99j-00000005D23-0Bvn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:08 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3248337a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691724; x=1794296524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=d+4xiQOj9QeURIAzneqM6iCGKCz02I+my+YQh4WLxCJ8CE1KNBLM4/2aztvS/4yBSJ
         ej6NsyedN5DqsiupCQORPRFUTTlVzpgG0Ryd9JzWZPbUP8fF+5PdSxcYgrhrh6rZi7j/
         VGnfnqYdWqZJ19EwVNc6VcuEOtC5ospcnHrRI+h0936VY3lYNo7olEVnz8pVc+mqmf5B
         nNAKzW1/NxafLUCu5nH9Ja67OVEdkJq5pZIDID5e1P1J+x32e5R5/x2FWJ7RhzRAiIRo
         0DdG7DEdU59kGj73OoqrpLtm81TUwh/vb2zjgf8WYuG9sVKqQbxl0hwk+eyjn5SHSLpF
         JMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691724; x=1794296524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=TNh/p1udhqD9L2lDWRhbWIWCZKjAsTams4v//5g4IOK86YymeUC8jokqsArLtSFOXo
         7mHtpQ1ulJ+TDlx/hA8jOv1UjRwcyoX9egeoe+buasSeuOU7au7ZxUCBVJof8O3sJide
         DhlBdDiHnDLPSPR8HpuUXUgsebiBlECUD0rauoPcWRJlzy5EZvqvuvRxd88V+/7hQQBX
         nY+BDpH7lkiO/m9T0flkkILN060+yo5Ly6vVsuup2ziLgfMn547bkTGaR8GrFsy4+eJQ
         8PPp0D/q31pEaivOaTKwTJPOFp+G1/44BeHZu4MEXLLe+yGssEUXn6VSqgJb8sheuB49
         mCYA==
X-Forwarded-Encrypted: i=1; AKwUvBzbRrh+0EHnSDf9XZU9A0VP9nm0rcSVFlfVCSShbh5jzDIOeR1qmHmVSAdCVwNW6DkZun5fXOmlNvdXFwnpxWwh@lists.infradead.org
X-Gm-Message-State: APuU4Z9YiYvXDTbxUYyao+exvSkHdEFfT8Km45K6Pggav93irmy2sUks
	Y/mlo59J7ZDENumz+6GOQy2ARfyxea+eYf10goNel2j7/ykPsn6d6vWj
X-Gm-Gg: AYBFou2QV/jeqNy7e/0cyjm2UJzYwvNg4IWPzv84OPNk9msCC/UdvK3eJTeufIA74MF
	dcrdkB2A9BUU384y/QP+Lep1ilZeVZzqY5j2bsQxl3PZgi10NrC6w4gt3feQVtyNdKx++HtqzT7
	uwVQ02qgpfpL070pTeb+lqzh8RHzcwFuaiA/aPhLYbK1NAbyeW88O5KA7vm5/LbyaxaXx0a9Wih
	924AQpmOvP63xyGQV2KQhBUGYDURG3v1cQUavqaQu0EDnQWTwPV9fODOJXGzNJh9DgZDGeDh/xt
	/cU6kY3VDv3SyvUzoI0JoC2E4frQ9U0cgNMmOG2r08Yrp7p8e7IL6dulNEhsnOy6Gof2hgVGzWy
	reL7lyvckOEeLlI5yK2XkGwBFiIT6YMqWXrZwJldnDVG0xvNMM7cOfH8Aus8Qnju0dSAi2Phoqv
	QvVAzQ/7Uf/i36d+i8iE+QCXUPnorqzxKzSnqy7Lvlly/HDrz3otaaW7E/hQCvIGyZnp3wHN28G
	M/0CjW/bFDoRxZX4F1AqNFWI01a6/U5cOTGAEegTsPelAQMbDmxy7XPjxVyvl02XXvQ6fptTz0s
	4NBAvEofTNOxdVqoD35NB+zqXu+ea2hNsy3jIsg/rT5JIaMrFH5XspO7aeDcFgJCt3Z+s1ZLy9c
	HIqyjtmL3yEpfDtZz04CwYGgmuifG05mlVZ/q49BdxDwpEgyzKmEBWJRvpqvX8rLN+TB0MTpET1
	KMcEI=
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7420951a91.17.1793691723756;
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:01 +1000
Subject: [PATCH v4 13/22] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-13-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=AKNOO7q0vuQyr2QN1X38WMsoOdMQ1mDEzPGmlv8YRhk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/7xJ/SVIuv/ng2cm7unSdmjQsFFy4sW1xg0fKwz
 tpI4L1px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr7ehn+u3b5/9eXOif15smaL7cXx6RvyDn2UaP4otCkj+8tfm06xcDIcOMpj9C
 VLdt9JdY+WBvIsCKR+XTLh6Pmmq7PQvty9yoeZgIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074206_805083_E4FC3466 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 114 +++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..6980247b94e5 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,119 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
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
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
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
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
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


