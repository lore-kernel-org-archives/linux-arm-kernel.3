Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E1CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOoCafVA6rbpLZQPmX36iB5alrObXaK1nsnhC+086Mk=; b=Qvsca6Gw4EI2I56SLNimap5Xli
	TqL0LaWJM2WQtVxinkdLJ4menlGDTOSXsJFTD8E91ekLrkn29GEhDJbL9fAcdHPkIwDhAcYv+IAZc
	uftvpXOQ40rsod8XRo/OOdHwTfKPoqRx2IqVmedC0W5Ki0qHhO//mxrCxIuqsBpMOZ4+BZWZ0m01w
	yAWo1/+3DUlZ/4BOq4mh7UefHPSaQUXs1EUiUA7lHHe8WqId8y/FHvobJas5zaaIlYzXaW33HVPAs
	3mldpbhdVsS8CN9UkaGZydARB3EkOSt31HJZQtv3OtAMmw5+yIQX2IzzGDQt+pNzi6JT0C3gvowGp
	RrVoqXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPpT-00000008H2w-1FK9;
	Sat, 30 Aug 2025 17:57:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPXi-00000008FRY-1RMm;
	Sat, 30 Aug 2025 17:39:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-248e3eade89so5602125ad.3;
        Sat, 30 Aug 2025 10:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575549; x=1757180349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOoCafVA6rbpLZQPmX36iB5alrObXaK1nsnhC+086Mk=;
        b=WEffpoXt7aIjuTcMMVl6M+5QghgKi/RjHqNxSRw9ZBu43vWSGckMqCHZjfQI3A3LHy
         /cXwCHadH8FKXsDgE5Aks5GBBmztH1v1hzgjexnYSHMwJTfXB4dRa1AI7fuiH7PdwGCE
         01LzfCe6jyUy60BQ8xjBlxYvk2+EIhW8KYx9ghgRNKab4lQRK9gWWkfFC99ZpZDN56UF
         W2FoCFc5rDjhoVkSHoa8mj7zAy9IgJCZLnOI4ieU9vpQto9T97+bimkd1VaqScANU5Hd
         zFmcU8jrYV7LV4DHiQtPeC3ZtN660oeqiKn/mfc9PeSweXWUnxjfg6TftLfIbRM3MUVw
         Ri5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575549; x=1757180349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOoCafVA6rbpLZQPmX36iB5alrObXaK1nsnhC+086Mk=;
        b=ClfBjlBvA+c/dWCNzkEYEn5M9v0VWV6EkipXAo362mpmwfH7ReKrnjCQq/yA7/Ff0+
         bQoBHmn2/H4BP+2sX7rhR6p27lcTIthpLGe6B6pBwbhYHL5powgGMb9uwoj+0bT/y30O
         u2XaNXi6vkywK7lW4foy67XIZgZJAubOMvKh4b61PiJ9KNnN1XTYXwtVV7OGTUewGciD
         kYpRZ4bw0yHA0bhC10h3/6VK1x9pIgFMr6yU0gWc5KeWC3dJEAG7lHNlm4KIwVwRUaCp
         6Sx9AqUhZ4awiIWWjMonfskstTkn43/NLZlr0s9tQe3y+z0Gq8PiFs5fKZ+TTfyHJ4Rl
         c3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4vUqEL8Te1JlfXCbVwowkTPaaTB8F8JG1ULwi4DqJR5tfsil3ccKVgspD5bpQCsLKhuo+OJR7jPR2TIyP+Qg/@lists.infradead.org, AJvYcCU9kDRsTenx7A6k5RMqLtrVkvCyBWS8roMElRi9FpAFl/+EmGx79e0ZYfQt8mzGTTBaBOtjh4AULEslsl5FjqfVcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrzQaZwMdPFcU2DkVmT8EVLDNB00I6u0lQgUlvxcVGbf5iFLYf
	FuGFCvtxc48UYzsBIan+zdNqN2xbM4fYyE6t52cisDAI9Rl/ZFsDVWNi
X-Gm-Gg: ASbGncueAdwdPUPPExNeUj5rk96CKWs/AdBFtAxleQvfoNxRYRO5GqI4akB+RVy2sfI
	1YjItKW7BjZMvEWlSO52SidM//kEMhqMl3fjMo1Lp5ZyxKSeuv1/+wn4tEGFmeeOfc9LLkXSXNN
	dL0A3vDhOSir1BAPwnqzdAWfxYKcmqS0SwqBK8PqFKeX7xmr+YrPmwFOH9pPTeVFO/zplxwtrfk
	nmQ5Ch2uVQSeYiZKpDbgN2vHIAtOy0k+p9heBSagNFAU80SaESs1F6nQvI4BP/MxcD5yCGPuG0Q
	sRcNGlWrAJpM5vcJ36yT/3XdQx6XATHOaGgoRDgA4bvCifeKEG0UbSLSPPOJ/Ud57nW4YfG/Tt2
	vjpnOw2aqnFVZ2Y2ZLdaC0pPHqU9ao0ZKYhdVkPOASQ==
X-Google-Smtp-Source: AGHT+IHTDqX8ysZkgx+mDXMRZKsxTFu34Ov03/Jj/KOA6Fo+OIeYKzdlGZBtzPGukVtx80QGvKg5DQ==
X-Received: by 2002:a05:6a21:3391:b0:203:cb2e:7a08 with SMTP id adf61e73a8af0-243c8457780mr3986145637.5.1756575549342;
        Sat, 30 Aug 2025 10:39:09 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:39:08 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH 1/2] staging: greybus: audio_topology: avoid -Wformat-truncation
Date: Sun, 31 Aug 2025 02:38:49 +0900
Message-Id: <20250830173850.323897-2-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830173850.323897-1-nogunix@gmail.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_103910_381406_C2D14DBA 
X-CRM114-Status: GOOD (  10.28  )
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

    - Fix -Wformat-truncation when prefixing device id to widget/control
      names.
    - Write the prefix with scnprintf() and copy the remainder with
      strscpy().
    - This avoids potential truncation and satisfies W=1 builds in
      drivers/staging/greybus.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 6ca938dca4fd..5bf8b5e29dd8 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1013,7 +1013,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				      struct snd_soc_dapm_widget *dw,
 				      struct gb_audio_widget *w, int *w_size)
 {
-	int i, ret, csize;
+	int i, ret, csize, n;
 	struct snd_kcontrol_new *widget_kctls;
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
@@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	n = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strscpy(w->name + n, temp_name, sizeof(w->name) - n);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1138,7 +1139,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 					  struct gb_audio_control *controls)
 {
-	int i, csize, ret;
+	int i, csize, ret, n;
 	struct snd_kcontrol_new *dapm_kctls;
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
@@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		n = scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
+		strscpy(curr->name + n, temp_name, sizeof(curr->name) - n);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.39.5


