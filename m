Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63175C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ETJS16OnTYl7vwlekxa+pFGq8xk1BazLklga/IsiBKI=; b=ieSldVjTN5K/G67EEPYpfsVzmK
	mOjMHYpqy943smCwzdAD5GdPgtv8eMpyilKkJmEdgFJ/2nfuwVF8ZgJj0Jo1iqnmZScdRHrgY3Z+h
	XzLkVTpgFkP+y/cpY0fZJa3hE1nZuzc6iO+EpoLzESbY3lBrOdxxaGzToeZbOD2AjVAfNvStSEuJe
	mmiCDENncFos9tYzUz8YG2HDQ7oRZkB1gq4oHW1N53CRPaXJtMBgrQg6QxlxEoPkDjtdXfy2Aho39
	lYHEM8jbQjCwlF4bo0rxbm76gQBUsfIjKl+SN2zEeNE1fWlNVOnpO4yRi3rBurHMthQRItqv38/UQ
	namNeEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Wz-00000001Z6v-3ewe;
	Tue, 25 Feb 2025 21:31:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2M4-00000001WNo-1Pc0;
	Tue, 25 Feb 2025 21:20:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4397dff185fso53341665e9.2;
        Tue, 25 Feb 2025 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740518438; x=1741123238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETJS16OnTYl7vwlekxa+pFGq8xk1BazLklga/IsiBKI=;
        b=VtUSiKONkFAhHZDJYxiP5LDy/KxfFRaYlL5zzMD6SHQhSOlpPeOKlSGo8s2/8fKsST
         0ge0EqIDtT8aDsI6Eb3KpQIUj0tBlWeAyQOyYK557OFXUrdTNayJM8cXXX1otqKL7m0a
         NMJrcAh6TbkHDXLuLVKZgkS0YmMV7cHHoNwVHKtw+3cAvI0Gezz1Aw7UuFoixJQJdCZY
         hDGrJwvQ8fs6Dwwhnm9fZaOBmKbA+It9P3AcX6RczyPLQzlSpkZlyv5+4O7EA2ZEUd8h
         ywx1o4r6Jg0AGEO/DPuj5k3fQEZxBDC2JQ5Ks80yCvUcsyu8rIKJ5sMCsCd2wMmlPHQ0
         xKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518438; x=1741123238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETJS16OnTYl7vwlekxa+pFGq8xk1BazLklga/IsiBKI=;
        b=SKKYfZXd0YMW0EANTYtZ1MeXo24FesGguqMg9F553vOT36JBEIWmVmx5qxlVoKNaAg
         juVtz8iI0X4bBDMmvT9LFpyrQbukK5EWP42eRKezIap2t7yoWBxP3+yw0OeaqYHfWTtQ
         OScV09o9qDI9QtM8G+au68cHqs6hAblizpI4NGUo4l1FXspUl0NWy3nfCv3nXXPyTRMf
         rL6RRVryZ3s+tecBuTWxUPeOjVFOLUxVjJyk1g9lc5C+WHk6AwYfrHQkTUe+qHMyBiyT
         ZZnBZKcTvETlUDD/vdTmpIouRk5mmY0ii4ON4XBVlpEDDK+RwYxkare2IexHcYcxGOti
         9OgA==
X-Forwarded-Encrypted: i=1; AJvYcCVAvA32HYBiXm7feG52SfUk5A7o731M6achlE8uZbM1/aeIB6ciDtJpCKrlE4CNlW3pCJZj1tJw0PyD1ai4Xd6Z5A==@lists.infradead.org, AJvYcCVfJrXQs15KbuhNw/+IFWRWYI/HXd9wliZzovG9svH4mEUkrNxb9eLVnGVre0UKHR41obwW+v3iXc5JYo4oM0uU@lists.infradead.org
X-Gm-Message-State: AOJu0YyigsnlmkQtTYjbMPWi9GG72o8nsAPBh7VmymH5chCSnNWnIt9Z
	4mxWDHiOKXK90l8tIVoziHOuP7J6PCmipqb8M/uCjLaOkb8G71hC
X-Gm-Gg: ASbGncsSsR3De2WlQjoW4aGLdeYCCOKYpZg6D4sQcuWK2ziAsOBVFBQL6BKxh8Gmkf5
	j5/XZ2dJxGkjRZjx8WQXStIZ5VZUpniXCAfem+Dskv8NMWsncBDBK7uAXvMeTNiUr8APjz2mTmJ
	HK0eZYe6QZD51BHyZqtabPMGXoRdinn9EBY9o20NT0tx353CHX0T/FXMkOHRBC2Cjj50uAZ1P9a
	TPFeODqGmbK1efHdf676mgNoS7rGCSTBo8L9zLJGu8pSLj0zUb95s5hmBOE7IxYjkKRb+ZJpNmF
	otpEv3ptYPgim14fCNV56JW7rOEbtyapC8gtbXg=
X-Google-Smtp-Source: AGHT+IGb4WNnMBJZw29M3uaY/4XEnbOyHtds/lEjO/1INAFbGy/YiqTYqtMMwMU9n7j05m1HLtMuMA==
X-Received: by 2002:a05:600c:4e8b:b0:439:6101:5440 with SMTP id 5b1f17b1804b1-43ab8fd875dmr7917395e9.8.1740518437510;
        Tue, 25 Feb 2025 13:20:37 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86cc26sm3605357f8f.30.2025.02.25.13.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:20:36 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH] media: platform: rpi1-cfe: fix pad in call to get_mbus_config()
Date: Tue, 25 Feb 2025 23:20:30 +0200
Message-ID: <20250225212031.188987-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_132040_375430_3E3C982F 
X-CRM114-Status: GOOD (  11.85  )
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

The source subdevice might be using a source pad not equal to 0.

Use the already existing source_pad field of cfe.

Fixes: e7bad98c205d ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")
Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 69a5f23e7954..7db4fe5e0fd4 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1206,8 +1206,8 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cfg_reg_write(cfe, MIPICFG_INTE,
 		      MIPICFG_INT_CSI_DMA | MIPICFG_INT_PISP_FE);
 
-	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config, 0,
-			       &mbus_config);
+	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config,
+			       cfe->source_pad, &mbus_config);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
 		cfe_err(cfe, "g_mbus_config failed\n");
 		goto err_clear_inte;
-- 
2.48.1


