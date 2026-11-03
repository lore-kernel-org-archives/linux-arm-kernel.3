Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2054606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EblJWMYR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPVjnm+c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=; b=EblJWMYRqeiuTR
	3DdjjFRMtrHxv7hdPFy523OaSoMIaQWrnXGUNqwy45RPezlD9khdwr5DxsKQCfVP8rGinq8ukAy1r
	pNscTx+TKWFZURKcCz679zTEoYL1IKIDzggbL85qjSO5vAfM1+jWgZ2Ox2ra2OLbFuK+xue1LaS5N
	lgs8KBFfMWiWc1bgEpJJdk5TVvNifjpP/0+Kwe3+Rr35idWV2xqJ7EFe7UejjG9qSaK338+MY5IBD
	FEZycv7y5rDSa9fVzAjmByFYpfgJF7l1vDS94TT+WB1vt4Ljk7tPgAbwJt9rIBBCHC/LoAFhy7EBs
	HyXSyUwHCI5nL4qeGfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98l-00000001M90-1agx;
	Tue, 03 Nov 2026 07:41:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98h-00000001M5Z-0RIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e985106c0cso36148215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691662; x=1794296462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=WPVjnm+cvWRtUjvP2YZCDKw1aYUJo6zw+ia4o3TnQRzgMDnut0pnN+MptPZXlQNwIk
         5iX2BQkcx3ge39Ej5TXeHU8b+vTnv46yY3g/zjn4xDtB1GzuRlrLmIxu9Vn0fF1nDp3v
         lqnEo4az0k8XEZHV6EKQ2NjRiMBx0olz9Bd69vgwSK/WrjEs+Pb26l5BOSStluhvtVWA
         b3PST44rzIsI7iYNbv/j8XsC9Wl2h5TfE/P/Xf53+78GRcPQkgO42x6AnitDiex2Ifo3
         DsdLEnLudf/R4NKFVV1/ihiYT5fb80Kr4F5urZ6wFdOZwJ6XG/qkZpynT7oyXP0VefuG
         7nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691662; x=1794296462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=bkEH4FssYQcbvQ90+FSuNhvj8/GZSGFAavI6QyrY1xjyf3YMZ0pk/h2LHFL7SUmEd8
         +xWW5pf14DTIp3HmDnCw18cMWUOvmG2cCWdqFxD6558Wj5qduYEhVEfFnAAXi1Qhj4zs
         hmu7aG8dqHWlnWPay/ClrzFFZuQEiolh8YDM4BDkYH7gvF86dzNyZj1CexKdZGlpAL4i
         qIndMtfxAQuFZ7TrlsynwRtxmqAkQCqZlBgcr3b6EjB/g0cdOSWIRXnsyoVhBEQrikxf
         7sSdADxVAZcOgl8ON9xH2HHCUB9loXiSNV2ik5LpoIm9xUU7Dzkk45cccY1+3ENGPHOX
         75Vg==
X-Forwarded-Encrypted: i=1; AKwUvBx9OqIg/+71a7lzXBkVlzu/X2Zy8OUfL+QIJVCwnpH3OispTaY+l1POC8wQLYJuldq74/6s92drlr9hMq3ziGTP@lists.infradead.org
X-Gm-Message-State: APuU4Z+N0UIyMD8n//3jYJWs+t/jKlSBlO25FwWzqVYaWM0W5FVasEA/
	OiwvnNI9M2YwFgNbx1Qhx7xmnmeP7bJX+zg1gqffb9mH2NgEunSf19rf
X-Gm-Gg: AYBFou11gCBGmgZvUroGh2XAIQ7cfgqcdoc+rpKZW6RMpoXqInjjlg+G3G8Va3yuKA8
	8yPpvyoCDFy6NQyWsbGTeIXzR/OdsvsL7XuL4AcZeK3bX/e/tD/v6v+3nMXMYdt9ePuPfpP3D/S
	rHEglHgP2E/u6AZuLnI2FGSiZl76AET3B8HKk8aBPD0QplwowptXuWPoNiUGjdMXVESkS6c2ssi
	vcHwaZ2lzFvlwl0i1fUzdop41KqraKddshWazSd2s2lFENNM49rIGBrfaxJU72Sk1keET1ffhER
	Zlh/LC2fx5Ok96nc++UAgKYqm2nCHRbdT0oq/m+cb5Xe0EA9KVAwzgy71zgTM2z+ASUDmZpdbaP
	5zx4vdJT3nABvgO0SC5ymfRVQ1KFdSMMEk2lCQGURen7NLKVqmibLjc9j73URs+P23m1EtbMw0H
	Ct0PFAA5La+2q8ChofHgHxLuw519CwduWoTOyIyz5kwbKpkBtTmLZPqtksLtvIt4tWm6kPz9gh5
	Q0JvSlS6rnoo7DGlamBR7WMpz2BUdUXwBCK8AR+HphqdBBuLCiVhH8rhL1fnEHjI5WDkfgJJDK2
	eQiTopbR3tRXYoEQsRqiwvQ62obER9kMFWgQ6ECM/f9wEae9laMeMtcCPd2fd72Kd90mEhe3vYM
	HkGN9uM0emN19nyjEVnmdc2thqOWVSkDPwWxXixj2jqPJvbNLUrn0IrQAWwqpXcW5IeF1Oj1Yd6
	61E9s=
X-Received: by 2002:a17:90b:48d0:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3ae8983c697mr9569540a91.43.1793691662194;
        Mon, 02 Nov 2026 23:41:02 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:54 +1000
Subject: [PATCH v4 06/22] ASoC: ops: Introduce 'soc_set_enum_kctl'
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-6-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZOqi03cyyWOVQz9j7HJ4ZmFw5Ix5rcoCeApwbxKDnBA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+VbzVZeGCSGtuf7T8lO1l2PZw9+d9pc6Off7xS+
 a//rXq4v2MiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVv1YzMuwxlZYSjtp//6Xdd/vzhn+UEiaI2Nl8Foy+FXurk6WcZxvD/9CgyNx
 P55mtvLP3dn/MKNAJ7Dd4zuef8XD7uayGQ/n3eAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234103_294820_53872534 
X-CRM114-Status: GOOD (  16.99  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fbef941157ee..c77119f92dd3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -567,6 +567,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_ctl_activate(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 1d60e290e40e..1cd7f1caefe4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,73 @@ int snd_soc_ctl_activate(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	int sel, i, ret;
+
+	struct snd_ctl_elem_value *evalue __free(kfree) = kzalloc_obj(*evalue);
+	if (!evalue)
+		return -ENOMEM;
+
+	struct snd_ctl_elem_info *info __free(kfree) = kzalloc_obj(*info);
+	if (!info)
+		return -ENOMEM;
+
+	info->id = evalue->id = kctl->id;
+
+	ret = kctl->info(kctl, info);
+	if (ret < 0)
+		return ret;
+
+	if (!kctl->put)
+		return -EINVAL;
+
+	if (info->type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info->value.enumerated.items; sel++) {
+		info->value.enumerated.item = sel;
+		ret = kctl->info(kctl, info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info->value.enumerated.name))
+			break;
+	}
+
+	if (sel == info->value.enumerated.items)
+		return -ENOENT;
+
+	for (i = 0; i < info->count; i++)
+		evalue->value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, evalue);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @value: string value to set the controls to
+ *
+ * Return 0 on success, else error.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+			  const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+	if (!kctl) {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n", name, value);
+		return -EINVAL;
+	}
+
+	return soc_set_enum_kctl(kctl, value);
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0


