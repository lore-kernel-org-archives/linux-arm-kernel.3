Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FDA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FDYtbGbt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LEplm5NO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=; b=FDYtbGbtWohN5N
	F5icHz6WLhX0OUJfouABYhSSCasWyo2H/yCwO+vrUigaPAYMNooH23JtUpmvDnyDBAGiBmGMpjaca
	XaAY5mW0z29VEZe1IFN/0sO0eqCzK526iRRHklq4VpQPtukj3Hr/dhVi8k71WXIHkWFs25j4gcNJi
	SeLhVqP12cdL+76Ox0H1d/aJv+DNWd6obtmq3eKqZiLblgl/0eBOKhN+Lfck7oN4G2wp9twzVZY0Q
	ELLFgseMtCmdUy0mJ4r7dQJ4IQwPcsu0ZpZoisQTTwaiuVMVMg0gT/GNKJuyvEZK0NopiTs0zWVq0
	XkXK+kHj15UvmuZnrNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AM-00000001OGD-2iHB;
	Tue, 03 Nov 2026 07:42:46 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99H-00000001MoA-0eST
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:05 +0000
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2060534a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691698; x=1794296498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=LEplm5NOICyyKa1FhT6gML4+NlOG8rP4skM1GCXYtpD3FpcxW36cPpNw7OzXIHnJUQ
         X++yZjCoy0IN5lUuE1FSL9VuCfjmgZaI5vrnRnFu3nXVC0Koec/b0jiSddbFacGxYr6t
         b0n8btiEDfoxFNKmrF/TqEIp+mtbIiF0lPpITNH+YWdNYty5xCvt/fUebUBBopXam/np
         XSJi/2bcpp2oIERDh5LLcnH65zrBTsG/VotDnWR6ZDz2Px91XrqCrCc9xHnl04YvvJVH
         uMYLZei1w+yUCdjLBD7E0/+qoCryLR/3yLxeE+5T13U3mHloUFe09I+GWSCYQFSj9g9h
         ic5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691698; x=1794296498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=p2ryBSTOahSJZpkOFkIDRa6JMGnql/SDPGeKfqujSoZPiJkYZ+AgLOMPA3s7gHYsa5
         8gCUUzbyKryQW7sYYUj7JN7DKIMVF/5D4756tht25g99q3aMAwsq1F4Y+zMISY7VDxN6
         M8mjyKmCTVJursgvq94/5pKUlzkesKBDQPio8EQHpm3Q3YfG4eEMFF0RsxeOvIKgZ4Vq
         IG0ESQeK9cdaGnPxvGmKqZjpv/fOdnYm4FUI1qwY1fCEIvKPK7dzbfbFB5iBE8YPb6qQ
         4VI9P1JHRSCTk1080eH/ePMzl6IWeW6kyo59cbGHnwlEZs2seg68yKHSTCqbF5oRQ8L+
         EXow==
X-Forwarded-Encrypted: i=1; AKwUvBzvg0MxXOQuBA/b/N3Sy74SpFFuT1ts5QjD1daHgkpUFazQwoMgJygJ4hYC9eE6D3vc1LPHt+6P+vtbJo4JHjPU@lists.infradead.org
X-Gm-Message-State: APuU4Z+0Tr+QE9wP6sUQWj5uxzAOGRZ2S6ki6T33bhyqU7v0t4WECH2R
	t5Lja95pdfdU6poyGicGxgAzYfWroLbiX0rGc3W8gqc/CF5RmQo4B7Gz
X-Gm-Gg: AYBFou2TLwPpS42A3rwQ/MsckBKo1IYPKGpQQvgnUfgKf3DfB4uUL8F2Qirdhpzq+6o
	g2GhhH2b8L7yKqiC0bDJxWZIt2dF5pat2k+9efTTd2bMFzUdPYFl4N4uQKJTM4RFcfjvXbLGnDm
	fnUNvoaV7c1flIlt+6FML6WBxRddJYOPRJdjvKB1IYHMDPjzWgYTo8JzUhkDDxZztf9J7qfuvqT
	UJ3tikAJu65eq2PgumaXSSuoUPTtLGqPixEn7E1w7+VVdSFl23VeUcrrHkXBir2Quj+oXYRkddv
	zdQYML7CtpxsFnYvcxwV/71CX8jeTHqoeIbRgo/q3exWkgjDp7nV3/hubmX/6EkHaZ3lXfGqbTh
	AhGLI+b7Y4R4SEnts9vO8xN9Ws7y+4WZjp+6wK1JAYhXWq8lZ5BOhKOu4jH/8XaMOmXSxP33vBL
	l9pR1A8ULtfGc5u3rRIhEnxoSdzk7Y4hqiRDbUjixvsucIepxKhYfKxRHSTWYFqJ1zxuFAih+44
	GwImXca73HRdSDlqyoKzACa0+PclHwYO3nKhUAp/uS7ycaPOfW6+pj4rV+XDjomrhsIDlardeae
	DNd13+Dm2O13n4390OqwU3MIhsVWCHr9TSVszf++69gD0Hc3z/Mv4IZ7ULCqys1F+gfrdce/qXK
	KsDSZ6sYmhMQj9jw67VSU1XcdDMGr21OowYf1eG5HJjSp5gqEL3T/6wXZl5RYNV5nWGGOnFqCke
	G7cK4=
X-Received: by 2002:a17:90b:2ccf:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ae897a8b33mr10316524a91.54.1793691697979;
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:58 +1000
Subject: [PATCH v4 10/22] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-10-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=91sg/4nKfvF74lrnGKYqCKgThTSUHsOM+GGCNFkYSqs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88JbPI72Su8M+7Bbd0Zf+xbV7Nr6FclxD/dnnT9V
 n7MU+kXHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmOesbwz/IYh5nksXNOV/8cU2vXil8j0SZjyleck+IU2sYVW3tenuG/yxuJtQf
 /2BkYBE01uGa7Zk4Hl963N2flDnT7cRpfC9jBAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234142_903246_B93A9B4D 
X-CRM114-Status: GOOD (  12.98  )
X-Spam-Score: -1.8 (-)
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

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..34694902c945 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator-codec-va {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator-codec-vcp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator-codec-vl {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator-codec-vd {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator-codec-vp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0


