Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B150CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVgsGf4Z/8axsFXoaM/enuI2zsZhhgsgIIwSowsD/SY=; b=q52fas3PJ/POengqlKOAsMXa72
	PkZhSI9N7o2VYWDSnulAR4xHobEV10ppm9PHA7WB5PsW4oW3U96hMXZgs8Xsu0rxaryoW+onjuZM5
	C/4ECpfKgQcFBLqvuZADZdwGaeHfPcJthiphAwUYOaX9leReKLFNTkwsmS9eljgKqYAWjiIPBgBx0
	KPD8CF0AtToWFu4deYLANRpXQP0WNyVdGPrpXoyMujO1FqTr6qlnSg3Q+JgbWzG+P1B04ceo1LoC5
	C3gbeGOH0JcNBPFu/vjexCIWo7LxkxZb44zFfi31cwwGrmeVUqouTcPF4cV6QWNTVRHtF8kWYkMA3
	cpvqEsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOa4H-0000000CeNr-2Vnz;
	Sun, 17 May 2026 11:54:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOa4F-0000000CeMy-0SRj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:54:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ba6485d219so8715205ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018838; x=1779623638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVgsGf4Z/8axsFXoaM/enuI2zsZhhgsgIIwSowsD/SY=;
        b=RNDNlCBtRPQFIWoXog3kSh/LKHc5IQ4VxZ8o2W+niuvXgOrWczHwK71Xv7HDLxB7ci
         4DMMXz/Kh6QGo7EehUu0MbfpcVveCyEu0UKGw10+r7A+OiyrcjZ9e240KzLOzze80dy/
         vkEHnVxAsbNsZrsTPZgw3Pl5wxrTugKhMC7xprbQsNQ7pU17BDFEH8BarzriqOJcfaNI
         AChhvHq7Itb9xVoFZrvyBeke/zXkMR3TB72UfXhySGykBdgj6fiNxZ2MX80AnHHqLyQS
         Wt4Jt++SH3KvMq1yu6VC0hDri00Lxu9xVVDvc79xYtEqnhdJJSfKPKCKf4+1Q5+7ZGEh
         eEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018838; x=1779623638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVgsGf4Z/8axsFXoaM/enuI2zsZhhgsgIIwSowsD/SY=;
        b=Tzqi5qUyvCg4+2NIfttuXYkrhq9Vtz0UEMNhzLcmqwGniK4u22v9A+OG0frFFI4fcH
         nfeo++Jmcam31NUL5IrsiuPygqRKMTAOcrx6zCjlqmV6I9huoyulMgFWee6g2HosmIyC
         1jP6xRQjOepvRK6R5tVg2PphZeT3QCFqIQaPWDWi/Yhl3zkeamcIhlt1VtQmoPs/bO7u
         qDPaowDPiBzmgt3LM1KngFQ0/po9LB/opLlPt0o70mxBk14tVPZjOEtXG+5Oi2pOYyhW
         rHvwz2y6SmJwjrp1/IjnQ3FuOzi2T7XwxEJRXueep8gIy7wgQL5LhV9XN23StTjmqgMp
         C4jg==
X-Forwarded-Encrypted: i=1; AFNElJ/Sk71mQQl0VjiLu2ww3jsU8KLgPOD+JdZGGB8X0S50v437Vjc+/a6LozA/lJFOA/sIIcrJlw4DFUJZhCDFin2r@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5HrA1eNF6EkP5LmBb6iqsmlSkeFT2US9EakrrM+4Du5cgaJaw
	bABV1AG43o5omo4FoPKUsDS6dDnPozX4C6rWz77sVhfxcbqJM+FP+FSs
X-Gm-Gg: Acq92OEplyAfyiwM5ntcoWnrviap8hbaOGBr3caMnCmfYPI3zr021AoxpOE0X75TA4x
	bdXd5Hx87mABK+XKPq099s1lRSqUaxuBA7UpMYi9PWbPVChOjhCVROrAQtoDZiJppkr/lvTh1i6
	eS5K5KXxB1PtL9GTWKUBNq11eLMj0MrBdrZtuDgt0MnyEGxdRKhOY6jVJMnrIr/LF0ZzP9Fvdnp
	S0nTk5d8Nhv8Di6AjAZMxNZZjFcDzxDBSOOlQxCkzZ/3cZKWtBT2amLD2CTTEZQjDpm5WOdVtvG
	0tyxMgAfePphGQQH03b9l8rvWOoepZnuTJd2+wT6m/Ooc52nk/o/G773jynU/7Auvp5qIUkkkgs
	xl+vc/YjoTYmnH51cVymORCyhJocMHN6F/bpSZiLS+WouoE0cvpsl7DWZla2o/taSjJe1vfrCxZ
	tFuYYiNMDDkGSYjr2NbrRk
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr125388885ad.27.1779018838177;
        Sun, 17 May 2026 04:53:58 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm118282215ad.66.2026.05.17.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:53:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: meson: ge2d: avoid double free on video register failure
Date: Sun, 17 May 2026 19:53:43 +0800
Message-ID: <20260517115343.955015-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_045359_149950_9DA32BC7 
X-CRM114-Status: GOOD (  12.56  )
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

ge2d_probe() allocates a video_device with video_device_alloc() and
releases it from the rel_vdev error path if video_register_device()
fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  ge2d_probe()
    -> rel_vdev
       -> video_device_release(ge2d->vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free ge2d->vfd through vdev->release().
ge2d_probe() then releases ge2d->vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index c5dc03905ce0..b367169e6ad8 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -983,6 +983,7 @@ static int ge2d_probe(struct platform_device *pdev)
 	}
 
 	*vfd = ge2d_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &ge2d->mutex;
 	vfd->v4l2_dev = &ge2d->v4l2_dev;
 
@@ -1005,6 +1006,7 @@ static int ge2d_probe(struct platform_device *pdev)
 
 	v4l2_info(&ge2d->v4l2_dev, "Registered %s as /dev/%s\n",
 		  vfd->name, video_device_node_name(vfd));
+	vfd->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0


