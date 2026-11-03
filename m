Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8A6606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2NUsubxO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnN/tnWE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=; b=2NUsubxOauYJ/9
	LSXrROSQuKDCEjm8v9JoIaZvjZLVkPN1Evl5svF/71VHvjDp1Ph/pqtJSL35g45e8Ub3gH1pzWV3v
	a6DEDOIddcIrk5nidcWVmXRbNwslP3Ll9RTe/ONAg9yIAXqAhuZ0S3GyuR64EUPILSjDcawCqmPRc
	Y8giCEbBi3zbG1XKWbo0hU6g//5bUro0rGpS3+xgsP9dq+VbMreXo9Wj02hnlaY/g20vT3QrNymXM
	es1TVYLR0XLJokw8dHXSeXGzDxTDPVLSss4xgz9w+kImku5i1u8EO9YuFKPyBidi3QJLlJTaus+xF
	X/sXDwvH6Xz6IVUjG9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98b-00000001M0l-3Pzd;
	Tue, 03 Nov 2026 07:40:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98Y-00000001LxG-23eA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so2830146a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691654; x=1794296454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=jnN/tnWE4ES+wZQ0uDuwOr6WtCwzWhRE3lQhDU+1xQG4Am9wPbA4xB4rGS/XG4qPBw
         66MhTI9VD6r2SUvwggutG6hqM5hDln35kEwoExX1Fp8DK5c9mAUgEZHzrpRJdX7+fYRf
         wbj+hKDN19AUunDkSOgBEBEcwhfeF6mo5s+aaOThd6LHyjmhVlhT30xTmHoHTDvK8z70
         ip49yb6Va13LScP7emalEG5zyMaQTbkRQZaSzcO+a+/DV7nmauJ/OP0Ye8f9hINET2Id
         A6HbFlpRBtDTW3dXVcaGB+ThcAsF/8InvRlM/BqnvcVAyCSSJsbdXsupyT2mqO2H0EsH
         WTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691654; x=1794296454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=C1JBI2LkdNDdGUuVCtStBpkZqqSMwqyQNkW9W/stFejjLqlUWPeVESaek5NzmGZoHM
         y+MakC2NCUVvRUSySp6HLYzxWR6pmVRtNq9RvypFhydWr+cPDwDiX3sFFvXmNrStJUVg
         DpFqbWFToBJqQ852Sh4Erib0C7gv5545J7YdbVWePRH5yiea5A1ok1Ycd2AiRBfmgk0T
         HU5e5Ld/HIY+XkgXFGPWjl7zHsC6N/9fp1Tc6StIHNATB0Flevd0OzI6wQS097MqtBuV
         flPamltyEm+BZuRQADmlwvb3pF15gR77Ai0m5dX+T+ZJVfu3pSZ3umdIHosPA/n7Gks1
         etdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwoLNF/e6eievIDp2cJi+tezzcG4iP8sZOT329iYNMiQpxEXW3qopOoxFtCM2DGGxvqW/CO59XL2f3FonxpALc@lists.infradead.org
X-Gm-Message-State: APuU4Z9SysJ61tpMYflmvi1uMuUEOT6rbv78wkS1Ta0r1yGM/yEvm0lU
	HANlbStggs5yMj06fnpQk5NSkjU0b6xFhA9w/f4qTr1HD0aALhQHsynU
X-Gm-Gg: AYBFou3JrZW/P2Hi9Ju9j8vysKoocQp7PMoB7i4knkin3n++ubdyZUaSHTTlL8HLJ10
	sclYRsisro4aN03RLnDsk9TXIT5A2Gxb8VLb3gwSGgX2FsbsOcxUxKcjk1Fmm+CL0tBNM3J063d
	afH4baN6G2Ue4w6dly/2D0c0cpHFtZfW/nJ5ZUzkCFMKuzvU2pFu3BfVS1jwQUd4htXFeISw4k4
	u0Tj5u3LISDCXjbyqvgeUJ0QwUpXK8mze3PUYazkj1mSpYofP7MRjecl4wKaTWOCkRA8kp0faHI
	YI5NNuvHrHL0Ir4+wLwT9R/6txxdkrOhkk6LoN+ucVYLeYEzBMpcBepLA3Q7RaBSLMqRrPm6A7p
	wI65gUQ2jEJnxnhMCUGnjd4B9G8mk2TMo+iF4+8gLqJEWRfoG4G8MXrjLofp7D3D1u7n5i4ziWy
	CyGduqnshznC/R6P/0m9rMv0paXBHqI/3xbA1Y4tAoujcX15Z/MgPQY0GAOOVybRASKztxjl7Rf
	0XjJaZhi0aBzNzD2mVxDcGVd1Qd2dQcNeUtVVMVVGZwKpSQpc4CclkajRrjQMcvQxyEgwCd3DCW
	TGrCOCFTu7K9ftS8BZIDAsWQdYVDqWHnSlcZKfXustYeVN6iEo4vd4K1D5cO34TDK5mAWXuYaPm
	wcmK/DQOcGhOupcOsVAtJedotT/JXOOwDgqotMpKhDmsCgVFTYVI5tfZiRJORx2ll9fvkY1xWPU
	F1TrLNCwnVkDTJsC+6Y3rIW668
X-Received: by 2002:a17:90a:ec88:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3ae89817e67mr10390517a91.39.1793691653576;
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:53 +1000
Subject: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hdczG9NEn27ni3LRkyWf48VrrSCYHeqmgsUnxw+t7c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/m/vxd8mT2w9wzJq9zHr7fds5GpJlvk/hZ7rBVm
 d+O7vvj3TGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqp05GhrWvelleP2jLfaEW47KL67PTlYtSmlO89EQ8JZyOOl2/pcfI0MSmciz
 Bue742WSjd8f01zrYWO2W/i56zGoSMydD2E0OPgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234054_564291_61EF3E0B 
X-CRM114-Status: GOOD (  13.94  )
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

From: Martin Povišer <povik+lin@cutebit.org>

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f346..fbef941157ee 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -565,6 +565,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 497ea82c1778..1d60e290e40e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -473,6 +473,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_ctl_activate - Activate/deactivate a control matching a name
+ *
+ * @card: where to look for the control
+ * @name: name
+ * @active: zero to deactivate, nonzero to activate
+ *
+ * Return: 0 if unchanged, 1 if changed, or a negative error code on failure.
+ */
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+			 const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	if (!name)
+		return ret;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n", name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0


