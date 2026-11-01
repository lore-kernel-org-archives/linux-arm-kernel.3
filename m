Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4E4606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qb0lZEyV;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=T9GvqOur
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=; b=qb0lZEyVhYiIkr
	KcCJ4gdcbrLhCuU2XAGanZl5Ll/HsMw6EXtA/mIfGup5qj3ZInMJmhMSJSw+HfOtFaGd4gWSg+Atb
	vqlPJg2d11MH6cK7wdG9UnI1oqi3KKwvowx8HqRzUjhBkh+iIdxYnabrg7RJ/N6X89FdQA4908tgg
	oBmwUvf5PCxIoblDYDInPq1UzpTzVgeHdgVxlUvKyma0SPFZDFEMqhXt3AUW/9XwEba2K9TBQV8id
	VfnxsMElgQ4I6DhysqEVNWuqQW6FQT2x4B12DBwzSpuTBQZEP2wqyXrARWtNpQZ8xSikeSeO1HKuH
	AUmgYjNQSaxdsFTEMJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVY4-0000000EX3Z-1wVM;
	Sun, 01 Nov 2026 13:24:36 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVXz-0000000EX2m-3sk3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 13:24:35 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8871ada1a26so15349267b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 05:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793539469; x=1794144269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
        b=T9GvqOurp91soz9tRuSO9qGcLaYQ54w75oE5HYtEL09DHTaunfwf2uEA8mWGZIFZoN
         GbXqjZSxICL+N/zWGlwX9f781FoHKCj+d8wB8obV/DyJcYlnQTpVhSA0+Dvdc8UTXxF5
         atwudBvl3YWD1KWgMqpjut6tTFSi87qqAypL5kI1joV8G5dUpaYaiy7DCoZ4n4f80SP+
         N1FvXokx6jtRmCMke5fQ74gW2fo+blmJoYdikEc67+xXGx5t+dQydZyHH68wur6UZedB
         zZw/HDfemOd6Cdbyk9gVMqDgslAFCUlMwxhTzQfqLI7hWAaQQY9uMV/et7e/SrQrKJMg
         KpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793539469; x=1794144269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
        b=C2iHs7v4A+SpVo3E5fI4jdJfLeh1ks6AEhnD/SMIZCW2+em2ZXjkuaELxgfmqXwgWf
         9AIOopunPWj42vUNicAIk42UhRe5vTw13Bi/SK8tFLoEAXXUx7bAq4tyuVlZ+wpQAWmz
         sRSbk3dnmembAgrC4FcPo8y11LImGDDMbLX/rHBuIQU6WHblCmZf5QawRc+1QEjKUCx8
         oxDMeQ7eojM5J2SC+GGA0FfgKkQfrGV0z71DjHG498wbYZpHYYqpmK/n656GplMjo4dm
         g1mnNvo9R3WKdZ3kDkDzcaatU7NZc9aMyEZIfct4mclvoNZQ4KxMibaa9RPjGyb5IEGE
         2ggA==
X-Forwarded-Encrypted: i=1; AKwUvBypa6Htirn5J8pLjczxycH2/nezC4yAgj2Kna/4CxT65f4iIvNeUmitUkz5Z64mkLexcKZnDjptFCQFWy3OMAC4@lists.infradead.org
X-Gm-Message-State: APuU4Z98kqdvTnwQsE8XoQpyeZA7nYSu4d9Oq5SwtlZFySBFHPCLQAAd
	3cZAree3feUmlurnM0jUgdM9utXZ03qVnXPkKXLJTsnhn9NObB42Jt+xnQo5wfmG1g==
X-Gm-Gg: AYBFou3zMwMrfQA13yykm8G32b1HLmby+kS5gIIWfbwmGk9HyVte3iAcNb78oj9J8wl
	88HxkFNMoE1SKIVQQUH7L4gEkN7S44IAQSW+T3m4mGxktdVvQjQJUbxGLbXxz33flxBf+Tcnth1
	GiYtlqw89rjVpuQ7q35t4O9W+9ryaQRVog0yt/3wN1o0FwR2VdmnhcU160x1FGvmzZ1ApQvPwma
	801oQbhJyibtCRn5Ri4O3y4GaVK2Yj5voOtWmOO7GFxe9rOU0hI9fHq/43RTddDmbqZ3nUfyQt1
	oEWbG3BOefrtBu7eo+AD8RZ4dkmZAETBXH7xSE9xOqX8Jmhgy1OGflVJkqi7QDsdogYhENowmGP
	33Ynl9T8ByUXpFsd8QNw4Y/EimINSrNGapsdFdfbJhUP5t2/3NolbAzcrZWCckvI+xSUPPDyJM5
	GG2EK1iGN6RDyJdyuM3LVWXoETESgz/An8g3FphhaB3hKGx5xOjs1C07FIfUUYnlPImHtVqJb6z
	QFyaueFercKe5N2VKfhcjGciOKTQqJ5RwkM5gjrnoYgFwiDthoy/EAcVZJ4viJRmmg+35as
X-Received: by 2002:a05:690c:4:b0:8b0:a352:f978 with SMTP id 00721157ae682-8b2b65af008mr40507547b3.4.1793539469488;
        Sun, 01 Nov 2026 05:24:29 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716433bsm37301417b3.26.2026.11.01.05.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:24:28 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
Date: Sun,  1 Nov 2026 22:24:22 +0900
Message-Id: <20261101132422.1396104-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_052431_974401_AD0F00F5 
X-CRM114-Status: GOOD (  14.19  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

media_entity_remote_source_pad_unique() returns either a valid struct
media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
therefore never triggers, and the "pad not connected" error path is
unreachable.

Replace the NULL check with an IS_ERR() check so the validation
actually detects malformed media graphs.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Cc: stable@vger.kernel.org
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Add Fixes: and Cc: stable tags, as requested by Jai Luthra.
- Collect Reviewed-by tags from Dave Stevenson and Jai Luthra.
- Diff unchanged.

Link to v1: https://lore.kernel.org/all/20260514193148.2357371-1-ingyujang25@korea.ac.kr/

 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9f..91e9fa0341e06 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
 		cfe_err(cfe, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.34.1


