Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D336D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 05:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=erUDxAeY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WU4IXcPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=; b=erUDxAeYn8vL6S+hssbqhs4kUc
	ac4DF5vf6KdFuKezKEP0Rys8wSBM5qbQwidzH2leV5o8bVZpvpn8k88FpcvhEONcHopr5hVmCVpwB
	Xm/WKMxXUIllNcaC/RyiQPOcLkPABAqhqvcpGDYa/z4Vx8Okwo5Ses+jxW322iXc2Y714/wjhjjXN
	hdS2afha4+pf3bz1yW8g4B5u5iH/dXgjZ8Y94twy8O7/8Jj0hQH4FQRWjuHAcx8Xj3pZ3l2MF0tiX
	GrsKbDRvplKinXDJDsMHTmHwXDjijFp6nciBVS39owspbfx5E9l7+08vD/CEIfmG/tIqU7EnwoAah
	y9hv8VSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2OM-00000008sBw-17kj;
	Tue, 20 Oct 2026 05:28:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2OJ-00000008sB3-0gTf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 05:28:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e5d0ee1951so18729715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 22:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474082; x=1793078882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
        b=WU4IXcPQG9bGTWYwR2XZowd4WLRH8MVPcfaDxbIZ9ChnyIh0Ql0+eL0XFoD2BR05Me
         cr+iHNW3sryxHvX6aFE+23ukAzNBm8FcCLdwzgLzydNMnowTkrz0Jfx4cm/3kqJDF78A
         vs0k3RWpuxG+rGfcri2EJze0zmdwpEHqGsgrz+c8edIS5Ck7RAhzGfiiBNl1FxLtwj8q
         Ja4zhE9EMTwqO9idytEWnDnEdMaoo7Q0VTThWxVGXr56KoeM+0P8nOuNBi/4VSz0vElx
         42oJMh0LKBqv8G4NqdW6KxnG8C9h/ttQ3ZoCjeVNPCrISL2CRXThFM/vkcGVr0Ls5Py3
         CaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474082; x=1793078882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
        b=odd49L3jazYM8XjCvnjEMySSPkEdnBh0RS7J5EHmu+tisLFoUcciVcj1n1EIixqm5X
         88dl8c1e2q4g0IdX54VBD2+VbpSAobG16RXLjYfPmi2PagnDEvXWjUBmkJ0/z4ImvQ8w
         ThSYMqhAh/m02lIfjno1rExtlEztvr2NwSEE7sqGmHTXwdGSuYwGdiHr09Ntvt9s8+0s
         yz6ydCBukwwuVeGamS/em93vaUzo+/igU7pWArHwa8lKcPMuShdIlSMorYN8IPIn8jab
         j3dM93C0wQvn8KsBqnH/9T9vTJ5NtQ+QhABRO7GqRcl4YMyd8UiIg5vwtQ7/ryuecl0X
         tH0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8d0kmJIgZz/N2it122rAZ3kYjbip+9YHrYPKw4k/8GB/tiPAwW5PgH5AQm8Lj1cOsYWX4k6VraJWJXqltKKHL@lists.infradead.org
X-Gm-Message-State: AFq9FYIuIpxzAb9/8+/qx43w5YfpBfIIQdiOpR8oC1wfMySEJasIL+Ak
	RvtmfirS2xlP/MaZCghinXV37A/mqxx2gDjWFbR96GnGG2AHgTFNkGlj
X-Gm-Gg: AYBFou2cFizvsNjDUdv8MiPFtgf0P86U7DHHH6+EwQH95T17XMWGb3GSJ8wOfg1Nzol
	4iu0iDZMobv0Botw0l+UQ/uEFcTsQWj/W0SdTqpnH6z+lg1sLYx0bfNlwPelDqCNDhKezOQct8t
	pg0Lbi0tmXnd3B8ur39F9oSIUOY632JcXj3eeVV8jmDIWPizNx4qnAU6PQCxkNZRZyWH0XPgA48
	RTSOVhDGPxT84MNPgkLkd+A9AQLROAnM1Dn7IGmk3hkj9k6X4K7knkaQpEtv51dr4C4VoAm63uo
	SSBFEsQI3Qy7hFIeUllddGwj2VSfZP5loHvWP6tberIXeQ2uZ/HIXiM/EUL/EzdxXfcEDk0TxKw
	/pyOrQ5asuHt/NVuatnCxaMxg4d0kWZ74Mj7VsXuDiewEoOz2tX5mCG8xzSypfAYtQVwXSgJQ70
	zusGBUlVdbNm7aNTQH8p4XtWz9cV464iLhs40Gmj850TDxMXF8SgB2Jow5W7ElW+hp7jetKzQQZ
	/DPCR009TiueG+/B63OtBmLyPJBVULN6kV7u+3hlrJbr1Z5mwCQ4TjKpnxF4MQTvmh0C/l1a2vv
	0GKmAX3diix0xA==
X-Received: by 2002:a17:903:fab:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2e9a6f587c4mr80082375ad.43.1792474082176;
        Mon, 19 Oct 2026 22:28:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1fd8a55asm3333995ad.29.2026.10.19.22.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:28:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8196: Ensure the DAI is marked as started on success
Date: Tue, 20 Oct 2026 12:27:47 +0700
Message-ID: <20261020052747.568770-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_222803_224511_7BE00928 
X-CRM114-Status: GOOD (  14.33  )
X-Spam-Score: -2.1 (--)
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

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8196_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Propagate constraint errors and return 0 explicitly on success.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index fbeba01b086c..f69ea22cfabb 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -161,8 +161,10 @@ static int mt8196_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
-		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+	if (ret < 0) {
+		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -173,10 +175,16 @@ static int mt8196_fe_startup(struct snd_pcm_substream *substream,
 			memif->irq_usage = irq_id;
 		} else {
 			dev_err(afe->dev, "no more asys irq\n");
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


