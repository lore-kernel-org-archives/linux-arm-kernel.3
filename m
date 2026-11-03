Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40754606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RjtzM8Ww;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2PWIBII
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=; b=RjtzM8Ww1MIgaF
	IKo4tNLAkKPgXtt2l2CLNmyUmQutlMre/uqHZU7aPuEed6lHTvGCYySZha648jiDkQfbISVBIiL0m
	De48MEXfgF8qXTWwirx/SayDdMZistWTOKU53z1eRMyruSR0fCH/34S+dA0OHueh+Bh84QG7RelnC
	uLfT/8OjRcsVteEmm7qofYimGfCnkqd7MuFqCu8Nelt7qC1z+4fiP5v/fdm2i+ZwFFYK+ToF+l1D/
	r8w9PinpSd29/Ay1zEy7i0yG+ufFykwsW72wSSqkFfEaU69Na6/2SOpNps7VacW1pXh35ayaFS/TG
	uBm1p25OAeX2+QVrhcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AM-00000001OGP-3VrO;
	Tue, 03 Nov 2026 07:42:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99P-00000001MxN-1yhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:07 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2312431a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691706; x=1794296506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=n2PWIBIIo8oJu6Ax4DHZAU+fbjQnSq3qeQeBMmYXHPKGqyTjql4sny5EWo21fBNCyE
         0Qv76ILibNu/xHu1XR/PRsImwiZUCK6aMZNb0XCv8GuzQaR1RcicRqiEoNYm1U5jVy4+
         CADOgsa2eZtjbGGhEWEWcukw6UCue2yBxAqMP+9YIFkqqQlOsUxxN6s/sQM7gqMgZ1vs
         Mu4SbbEZFeN5opsaSX3QaotquAVHF73Nw2mQB+HxqRon0w/Nj+6ARcS3h15SvWRnPz+L
         S+tYO+arVKsOe4kQScCGZyUPW0VtCtTY3ymKJcfvWz38xOz/PPOSPshku8wjVHmgUvE7
         wIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691706; x=1794296506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=zckdvVQcKtDlmjAW9dVzZ5+lKrjc6725IyRosGHbY3KwE0x4PjmtrENYV+Y7opCTyu
         GanK52e/n4NB1csp0P8WJzv+M6rm7F8UT0ujPbFUWYMZsOnM+Sk3B+37cMfJE37eLojV
         2xOyqoqtbebMyg/wtcdCH1vS4kmBmDJ/PpY5j5zqqURDlMEwlvNTjgx6D9B5Mj5NS4Fk
         4APdWDqfbUQbqVaEFJ8N+rttVDBoB+0C0rVPHsJOujN7e0bjKz2t6VjsHRkXsz3YsJh9
         4oxSGLcyNfE8GjtCMbMOJwpz7Y6mDQHJTwds4XTH0ANCMt/qdMlFq9v/pVpwC5mU3740
         NJJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzokALxBF3EDJi49lgdByO2ycOLTsU29snGtnOWum0yIBsx2Xu2gjz9gAC1zODAOdrmjvphQjFVaP/tH8SVTdIm@lists.infradead.org
X-Gm-Message-State: APuU4Z+4MUjrHlwym/JqkdoIydO1rKSZRcCa9KGRwApp+ZxYAA7apYaN
	/qZ5kahPBxwJlNK6PHswns7d+QzN9NPP5YoVmZ3AGdczzZxzIt9a2EM9
X-Gm-Gg: AYBFou0bMoKZb+IqHZ+iPNZA3RT5+6JJ4vYelFdQuUn3Gl0QEr0PEuaBuGZQtELjE8M
	i5XkbuQUWJiUn54DtN85xJ1SIBVIc8To5VSf2q98kUhz92jrI+rWOkATuEZNNX4kR7amFntVJkE
	3ht/aXxTQJkx0BGafXbAQ4ipqm7zDP1oScAxpvIkCs5AVedkiQE9TkGFKN8TsQ3WJERi0HTL4dk
	G1yDiW660/+OUpC3NGco9o8uAg8Y46h+JMIuEdKX36rmvVoLspCG7z7gxyeBzNO/+LJt+DNuNH8
	FMVC9WR4NQwp3jyozebsAeBRgV8tR5Ntz2K2svSehXidWVY14QEOoQISeIS3OezeV+iJyFBIBRd
	l9VAZPmXmD98sMqMehtFanN5dg6cSZXIi7kfQRaSemtAIcU8avijpfMv4fSPTLwsU9bLZVg3WzR
	9iyF5ifOkdunct0QswJFRx0117husXEHbLnah2AZ6HogHa7+xPU9Sxod5dBg4lsBsii1xuvV2Tf
	v74Xd6OTr1fvir+9mCbg2CctqFDnQ8quilTF5ozYksR642OD/vaTaAJLu+fBxvNHkHlUKCnjwmH
	GPVb+wFredzriR+eYgI0vPmdK11IIc+rhmxfYf55AqMR0Leg638Amjm8MymfD2X+Jx8LUDg8QxK
	lEwyVwwsP1+5h8KdgBqHZNV3pAHCCqivw/pW9Jn6nOMCqKFrrB6UqhCvzANiTRiTc2n36Rqcxmu
	kgeiYq
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr9578811a91.39.1793691706582;
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:59 +1000
Subject: [PATCH v4 11/22] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-11-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=TytIUXjJL8r3NaXmKyOX8nX4Lbzdfp/ScRYJ0q4A7Bw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89x2fO48DAsFK6dtH2TTMEeh6r2Vx+/xxg9e6bdW
 to/6/yFjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSfVWf4n6Do+UD+o9H/Iwu3tjuwHzrNUMB7P39p6hynibxu+343RDD8Ztl/91t
 skAdfhWSrz8+MTBaRnIfZG56t4tilkCugsPQfDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234147_628112_DEFF4313 
X-CRM114-Status: GOOD (  11.45  )
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

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..2fcadd77b1c9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,74 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
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
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0


