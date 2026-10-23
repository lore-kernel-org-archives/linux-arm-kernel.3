Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8987B606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hu/QmmhR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R7rM/IZT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d5nwKFsZvE5L1iVkiN9qlakuwuo5b+7GgbmdUMjeiGo=; b=hu/QmmhRRiwUGi5I20LNgjD37d
	ZOIvgi2X/8vGYGflh3qR+7JzMBbEMHxkcEpLGYUZE03662pV7Y1OEKPwUhsGd1M7btjAiXsxf4sAe
	Vd2FQdH2kHt6pKp8peTcWlwGmrHhZXaT8lpS7+6/65M6EuInShK+KrqfwWumuCejZETYu2VEUeHIA
	z33JpQJ+21DmKzj0uclbTS2ZUl3JMQiCRLjHNu27/u0s49RUbBhQOD23hn3+Zcugqzwzd94zHSFY9
	8XzyJ9jhoplLmXbAm1YeGt9AyWZNA4tJR2pt8tvXMSSxb5vYMEQjNMxBhO3Z9DuJ/50YzKZj0qhyx
	6Lnw11PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8b-0000000FpDu-0EyP;
	Fri, 23 Oct 2026 07:56:29 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8V-0000000FpAl-1L2q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so263976b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792742182; x=1793346982; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5nwKFsZvE5L1iVkiN9qlakuwuo5b+7GgbmdUMjeiGo=;
        b=R7rM/IZTdJfK2vNkwNjooYwkFSm/9dLUIuIyUWSrMKrsvWHyhZMUYkOVCN2ipdEGbm
         KF0wm0hAtxqIqkNlMsrS+5oEV1wnEMjWJyOHFreCkZkzDaK5lwYTwr0ow7emLOZ7XLo1
         NDKImv/fjFK6ZR8omi7f+hWz7TAvK4Su3i+F1y5ua9+hDjY4JOBGKWmjZeUsmYathTex
         PgqEpptjGdoHhsvHAoPA3VWcf3w1IZrJ74KqBP8mF6QmX9AaJnreCOltp+IXE6xk0Ih9
         eBph6faZaBCuj8bHuDgNb6UbxyrCFGrOgEPIZm/jDsVvHo1kBM5EAwd+UvsQRbo8JdBV
         kx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742182; x=1793346982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5nwKFsZvE5L1iVkiN9qlakuwuo5b+7GgbmdUMjeiGo=;
        b=KvhHR5zbu52LqZUcFtQFEdvY+Uoiv/jjDYzub/HSEvzJuAQcakPTYi7atJdpQ1AsqW
         yJfjW+XGtFAUmWHkLH2KqDJCvlV9v3koJgiqk0mPbCo7WO302cDYiVZcFtQiimxyGwqZ
         ecOCPAWNbc6E8dnl8u7EibgP8h5MxMfyWGaMMcI9jVVVHWh4JShYS1a000Ly5FqYsT79
         ghSkSeck3LG8Ea18NQsuFiosTMHiLK2KLVgMoMKCkxR51JBTmhN5TG5qCmc9VO67OZPw
         J2ECk7+/9nPFS/617edn2v8tKhdajkY9xVgMKjhh3fJD+MMl5hWnJ7EE7Z4xH2AETmgb
         ysqw==
X-Forwarded-Encrypted: i=1; AKwUvBxJOVoopUCiAogHEVqn3WkbGCZvsQZxHrKdmfNwmbgVkRTELaGAKVozqER80oBPjuQTyhQ2C909SHq9RYqdGad7@lists.infradead.org
X-Gm-Message-State: AFq9FYIHPITDzDiuUHnY4t3hLM8vSuWwtyJ+YpCFA/dQ4tyrZTcixomM
	p6D2CVlxXpEZ0KbzWRTzH9h51dhhb7yFBAuMbtH4YAyMM0lYXS0mXCCN
X-Gm-Gg: AYBFou2z5pTkbIzRuSKqv+mXi7kQrpuq6uIgt1mSel6Y8EuR2tFrOWpCxfoG1RSi+pw
	s0cmGjw/Wq73fDyokN2VQRdRPFYyf7IECaJn5rTbK/LtuGqf0e3Llvpc3jr25RNU46WPROLXytj
	2ta8UC9OkIMYJ9v3JPRSI7yV7y5JajH3kYa9rwWhMNRsptM7Rum0H/Yyi6jn22VO07BSvEfXj/q
	W8yk8owYX4nm60OSGR72GCipz+evfGK3NAZ4V2SUi7mMtTB5yvHvodfuk6LRlS72YdWlilsjmPO
	C6ptwUi0UJGbsgHz2AQPwGVZf/gSI9WgND9KQfK4+ddiX7i4oLPAeWkKkagq8ucuekElL9uizo/
	OGXA1KfeGADTsZBhSjeTaF6JOVvaGiLEhAqxQhLE48eP0n/M0yzbskBJEqyAp0SijEX4su5OoO3
	BmUVRT9DL6Wh0P8PtNp09pAcQFImlx886WUEml9QtekKJWPZ9xmMY07qzfPS4ZMQDsiCU/FW1Kx
	2j4pYm8IWdk4bwZF0Hh7reFMIU7JteaWdYpZDo5Xz+li18CoQj78SJfhOItT6ajlbHD6AJS8c+5
	R16llfdB4swyR3N1uNuX8dOUIdE=
X-Received: by 2002:a05:6a00:bd88:b0:89e:7bfa:f87b with SMTP id d2e1a72fcca58-8a2c472e08dmr1075229b3a.3.1792742182084;
        Fri, 23 Oct 2026 00:56:22 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c8ffc99bsm430968b3a.43.2026.10.23.00.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:21 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] video: fbdev: atmel_lcdfb: fix list_first_entry() on possibly empty modelist in probe
Date: Fri, 23 Oct 2026 15:56:11 +0800
Message-Id: <20261023075611.3559095-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005623_374067_CF2C344D 
X-CRM114-Status: GOOD (  15.86  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
bogus pointer computed by container_of() from the list head.
atmel_lcdfb_probe() initializes info->modelist with INIT_LIST_HEAD()
and later takes its first entry with list_first_entry(), assuming
atmel_lcdfb_of_init() populated it. However, atmel_lcdfb_of_init()
drops the return value of fb_add_videomode() — unlike every other
fallible call in the same function — so if fb_add_videomode() fails
(its internal kmalloc can return -ENOMEM under memory pressure or
fault injection), the list stays empty while of_init() reports
success. The probe path then dereferences the bogus pointer in
fb_videomode_to_var(&info->var, &modelist->mode). Because the bogus
pointer lands inside the contiguous fb_info allocation, this may not
fault immediately; instead it silently reads adjacent memory as a
struct fb_videomode and programs garbage timing parameters into the
LCD controller. This was found by code audit; we do not have Atmel
hardware to reproduce it.

Fix this on two levels: check the return value of fb_add_videomode()
in atmel_lcdfb_of_init() so the failure is propagated (root cause),
and use list_first_entry_or_null() in atmel_lcdfb_probe() with a NULL
check that fails probe gracefully with -EINVAL (defense in depth),
consistent with the surrounding error handling which bails out to
stop_clk.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/video/fbdev/atmel_lcdfb.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 53f015699..6820a2400 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1007,7 +1007,9 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
 	if (ret < 0)
 		goto put_display_node;
 
-	fb_add_videomode(&fb_vm, &info->modelist);
+	ret = fb_add_videomode(&fb_vm, &info->modelist);
+	if (ret < 0)
+		goto put_display_node;
 
 put_display_node:
 	of_node_put(display_np);
@@ -1075,8 +1077,13 @@ static int atmel_lcdfb_probe(struct platform_device *pdev)
 	}
 	atmel_lcdfb_start_clock(sinfo);
 
-	modelist = list_first_entry(&info->modelist,
-			struct fb_modelist, list);
+	modelist = list_first_entry_or_null(&info->modelist,
+					    struct fb_modelist, list);
+	if (!modelist) {
+		dev_err(dev, "no video mode available\n");
+		ret = -EINVAL;
+		goto stop_clk;
+	}
 	fb_videomode_to_var(&info->var, &modelist->mode);
 
 	atmel_lcdfb_check_var(&info->var, info);
-- 
2.30.2


