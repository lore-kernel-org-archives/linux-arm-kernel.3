Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D4606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WXamYgvP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpWIlKRI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=; b=WXamYgvP3DSn+9
	CmKauvTXZDuQe62IVwii11xW1JbvTGNZm2nN/LZ+V+DcXd4WO3dSJhf86PSRlTj9R3JmCo2DYal+8
	7IwlwkF5FAJNgjOQRFnNiQIXK/2zYbdfmvQjw9GrWZCXgeIJs/aP+XwOdopMjvvHYXm0L06hUfHB6
	iiPG+A1fBKjjYdZPksQ6ngw++ltHoCzIpaVmZx5vQyYWCLUCASWD9A74Zf0PpNlcNpP8I7gIeZLsc
	+MTUd/KGMvNVJGTc/5h8NoQv4uW7uXpW9FU4pn1mKNHFn+9uu4rerEAIJywdw4/NtM/cJ8inXDF/u
	xl1JDD/eYbB1bG9lyX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98t-00000001MI2-0gB7;
	Tue, 03 Nov 2026 07:41:15 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98p-00000001MES-3GmG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:13 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1182816a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691671; x=1794296471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=zpWIlKRIJ9EVE0AlIyWOBwT9rRchwzoqFUxQRcDd4s5Q1aDV6qMRsxJrCldrzzwJES
         K+L48if3c1g2MPYj7q1BXOF/8o5LU0/h0P5XuwIzJvYCcknhuEckHr4ndwxzZNx5Fhpb
         JD4OYCyXP1elbZ5Ho5Mm/SC4Qn6mWIDFvTHFGEsQyR5/jNC5ttDBvf5Re2Ulvzon9Sdp
         sh6gmHnc2Mz55VQ616fxFZ7h47/Jbn2VwSond0nYn8GzQalNZWZm58cSA22Cf3vaWp40
         6PyxEirbvlrnazQX6m/G4aqvtGYvkMeve7JQUWbLjiiQxlonJ9zW+Vz/2nwMl5NeWStK
         j1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691671; x=1794296471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=ERUbHOSxVyqGEAU4/97/NnveugwLuGHwkC/Jgf0pl2UYcxKs/vnwIvvkVrNK25PFz2
         QFN9k8XCAvJxgtJfKjPRXlav9JdCRhYqQskmWi6W4FmAmWhslShKFSf1J7VPzX5W8dq/
         tk8NVR2/I9bCMnglQGULID69Z0qTWn0SFJxwDM0Wbay1JAmoecB0pFyIKuWkEQaQ1z0Z
         PwRThxWjc/PonqHpGmShQSlRbuxfvLDTnKvTUzUuckDgd+p9T0Yv2wJSpCov9xGUTvPA
         Ta/l2Cffn4rCstWffwFDOIMdKft3+l6TEaljt8BKzTDXYChpJTOdJTb4miTxaG9ICSbf
         T2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBx75b9aMjo7AXHU7hT5neO3X0Ech8G6mbM9kMffUCQpHpc9ayEHnNnpU2BoCTTna+jQOSsQLbvUMWVw7BaoYxVQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9Fj+sGN8tnhAJIddpo1/j7vTvR2/HajqbFtD/9dh5ia7KA9MMI
	BEDSxESklPPesTN1yM+tiXdRLagVRnmNRLfOBq/soHaq5lAO4FViA1hJ
X-Gm-Gg: AYBFou2J2jpzIBOhcnLUOoWix8oRZaNJhLZfEJ0xYG3UQwQl40b6rQe8bBwgH5K5BVl
	7pJRPgTOgnBhVnvZiAD7En3ZFypcBFlvspcklSpsgVlglqU/zoz3bJ1MOS/ss8BF1hds6KU1Du5
	QOgpuHNDFdCFVTz85YQ1ICs7LVBFzaaha0PXU9Jq5OyuuAy9TjJXJSGDmQtBN4jy8pzX2zCYwAp
	ZnIfCo/HdGQpdw5Ix5WG2nyQnkcX8OZeKh8lxdbsRxvbAGbmG/CUD1RwV39CgVNHCfhF21uboSl
	mWBdr4acsEdpZXfUpZ8g43Y1v4hfNkQrMVt6OYqd49JPtp52Aj1Zj+s5U7lnicJ4HhcvAPBXWzg
	Ukv3DxlSUTeEqAb8CeedcRHqbzeyGyPKn2CEcWHLwwjeVglYgUQx546QqXwpAEIKWkxrOO1mtf7
	gZIH8XNUrk472Z2s0e+bL29CuMW3VlUx3sDJCTF0PseJvdCU1P/Vs6ShLnYwaT5wOBaQPAgDqIv
	2OpEkJpPNVqFPAPzk4UczP8+JuLlGnbZNW8KcENna/uLhSAtFzoxdT6qwkudpg9sMMUmmPehxZP
	kpVCEkSBNKQCK6rz8hkDT5+d0o105pMYxYpOP4oDdeXJm9FqaqyOAv54T1RJ2dTBN6fCjUTpCtR
	Pq4GNuNLGzwwrExToVzlON0yf+iDPrNQCTz7JdsQm0WzpVI94PLoAyWSJ4a01XOpllCfphL8BDf
	Z/8IE=
X-Received: by 2002:a17:90b:1c07:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ae897c9501mr9764839a91.19.1793691670795;
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:55 +1000
Subject: [PATCH v4 07/22] ASoC: card: Let 'fixup_controls' return errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-7-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2OZVyHzqzH+8PcXoAdYlRjbU/QYAqY/WFwuuw7hvh0s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88dv6PWURB1okEw5aSq8G7Wic51S16aXTmtcOFTt
 eLLV2z3OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMdvpPhf2bIkuV7z5n6rp6tmH227+eD7Ie9ojtd1veKTHyVlxhwSZvhf+iWG13
 LWxZ/3KeeNcnGfUeJ1OWZzZXCR3bNaWVlULpzkA8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234111_820037_B7ED4D56 
X-CRM114-Status: GOOD (  18.41  )
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

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                  |  2 +-
 include/sound/soc.h                       |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 +++-
 sound/soc/soc-card.c                      | 12 +++++++++---
 sound/soc/soc-core.c                      |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index c77119f92dd3..771234028fd1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -992,7 +992,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f07aeb637108..f93e830ef4a6 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1283,7 +1283,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1305,6 +1305,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f33bece378b6..d4743d68deb6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1845,7 +1845,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.56.0


