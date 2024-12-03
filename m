Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E350DE74AC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+WTzDeex6MvV2fYh0DDtmM+R3bGWHPFsxwrTc0tB2Uk=; b=kBafvgItT/w4jDYWDOlmxIJfsK
	sY+Der3/RQ5kz10yu6CXdYdUPJySQ6PVQGeVASjGJ+G1XReXnRiM5MToLtYDJMbFrU6ycozTSwiNS
	rhcem5Fkap36b6I00l8pMVA0ogPMfjJN+Ox2WaIg27Qa4w0RLtTyWgu9fRzuxDZc/9LsyMqu2wgh6
	oHhvMOb+6vUOkZwbn/ts74+H+UsZvYVQ5OyTPvTNdzHipsx/QWqYcLwUBTxIvv+Zo2zxSEi2wVlx7
	vtNJYrnkPF/vyaAhIzZF4UQsll9473/PBSGX/+URX+kX7mFZn0+KMKPDU8Fx2aOQFoa1jhXda3j4+
	wgMY5Z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVNw-0000000A2Dj-1Xl0;
	Tue, 03 Dec 2024 16:04:24 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVLw-0000000A1rm-3iqp;
	Tue, 03 Dec 2024 16:02:22 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-46686a258c2so49137591cf.2;
        Tue, 03 Dec 2024 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733241739; x=1733846539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+WTzDeex6MvV2fYh0DDtmM+R3bGWHPFsxwrTc0tB2Uk=;
        b=TundCIp7axpdiLFoKhAIV9h5jxKF2um7YDBW+5MVnCetIwSMhqGZIvHQNf2PwZTHem
         HP82+NjCuV1bvFeBVr88IPhA6pDytVzer6dUuN0Wm3+dpny2VDfEwqy0aE2lZswtFHdC
         oebzeN9phVPQKcjh/nvyInxoc/sDzaTVn8wI2boDi5qr44gc7t25KDNemx7cY1c1co09
         cJisGIbwMGzu1XZ+kv2+W64D4oNSXygkHRLju4fkfkby0XEgD4TSi2Da03tAOrMuZU4b
         aTIvchIpJxAPAkilmv+K6HrQwpsFptHFb4kfSrrOlT2SUf3xhRz2pXGcmPYJEQJN1FBC
         fyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733241739; x=1733846539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WTzDeex6MvV2fYh0DDtmM+R3bGWHPFsxwrTc0tB2Uk=;
        b=Vt+Qx2ynXB/LmN3MvWNrKNfGjPiETq7twWWMfAHaqCZuN2fs84mt+5AW9x7z950tdL
         YYPJB9TKn6rRLxC0RX57nea2NDrEz8KwzXHtiS9Tva5QEkd7fpzOA93a7aOkOvhhpESl
         kK3R6ppEO6zXMj7YP+X3wDJWmKZvMXpiLOEuzVOwUZ0maAJC5YXP0rDUOn4EQ1mb1Fah
         MJEiENP7KIxgPEmiYI+0yGMwl/9hDNeEKCvxAfX00rE4IWL0ny/2gAMCkyiWG99Xizv3
         mrqIi8XMnkDdod+EEhpXKqk4R/pHObniD305frFFpxlEyIYgQcTO98mj44XkGdH2C7Ld
         Cw2w==
X-Forwarded-Encrypted: i=1; AJvYcCVLvdLJjsHTUqIfquN1dfieiuxm8VyeGvCNX/Uh5MUqSOjhywrMrl8XExs0F4EkPwwWv2KJrDFEHrb0MO6bNJ8i@lists.infradead.org, AJvYcCWkVOOk5aD8Fh3MjkJTId0fbQfuk+akEy2LF1SnY3UXiulaca9J3JxyI4dFMfPdPpZ7ueGh+8WasPxbRsJD/GM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhDl9ZMqUCbynahFsXJkxfN8ju323muS1QfDErNh1+meAZ8kFE
	3/3x/GzqAdTDr8BcHMPwbGhWw0mnMctzuJpzmeNF+cemGAVaPNI0
X-Gm-Gg: ASbGnctA3PxF1iSEohl+6LAh/PUB3pSKGEUj4Y0Omk37nq8dKQXkUDT6OGLBe2GrhaK
	lElIp8+8bV0bRY/dio8Atbhp5riRO7IP102N66cGj7itnaGVviT/iAM4gmxPzSoTw3T9TOQNIG/
	dpzYiArbQarQzvqpE9P1TDYCLVP+lixlRr7x7ZuVyefWUGYO0cFIYgoYujEhNKyCIdVhQErV3nc
	4oOoCUw58FPM/DBsiHsv6+SnyrmTKzfTepNrDY3XS5RZ8pyoAPg11rh4UwvIlsmKugXvjtfDXnk
	Z9+bdWD+7INtsWMhy893Z81vfemXuSHBeuqLZ+YWc5G9CQsLQpPixetYg5Y=
X-Google-Smtp-Source: AGHT+IGDeeGWcRCTKyUCOq7c8fevpRJKKIBDhzv1JtFZuhU7+1av0GGQHLhd5L0WUnUDcgzYEzYebw==
X-Received: by 2002:ac8:5a8b:0:b0:466:ad0d:f0ca with SMTP id d75a77b69052e-4670c6c5432mr40809661cf.50.1733241739116;
        Tue, 03 Dec 2024 08:02:19 -0800 (PST)
Received: from localhost.localdomain (host-36-26.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.26])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466c42319b6sm62809341cf.77.2024.12.03.08.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:02:18 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com,
	kraxel@redhat.com,
	gurchetansingh@chromium.org,
	olvaffe@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mst@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zichen Xie <zichenxie0106@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm: cast calculation to __u64 to fix potential integer overflow
Date: Tue,  3 Dec 2024 10:02:00 -0600
Message-Id: <20241203160159.8129-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_080220_924557_E32318C3 
X-CRM114-Status: GOOD (  10.38  )
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

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
unintentional integer overflow"), directly multiply pitch and
height may lead to integer overflow. Add a cast to avoid it.

Fixes: 6d1782919dc9 ("drm/cma: Introduce drm_gem_cma_dumb_create_internal()")
Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
Fixes: dc6057ecb39e ("drm/tegra: gem: dumb: pitch and size are outputs")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 6 +++---
 drivers/gpu/drm/tegra/gem.c          | 2 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4..020c3b17fc02 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -272,8 +272,8 @@ int drm_gem_dma_dumb_create_internal(struct drm_file *file_priv,
 	if (args->pitch < min_pitch)
 		args->pitch = min_pitch;
 
-	if (args->size < args->pitch * args->height)
-		args->size = args->pitch * args->height;
+	if (args->size < (__u64)args->pitch * args->height)
+		args->size = (__u64)args->pitch * args->height;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
@@ -306,7 +306,7 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 	struct drm_gem_dma_object *dma_obj;
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index d275404ad0e9..a84acdbbbe3f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -548,7 +548,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 	struct tegra_bo *bo;
 
 	args->pitch = round_up(min_pitch, tegra->pitch_align);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..d5407316b12e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -72,7 +72,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 		return -EINVAL;
 
 	pitch = args->width * 4;
-	args->size = pitch * args->height;
+	args->size = (__u64)pitch * args->height;
 	args->size = ALIGN(args->size, PAGE_SIZE);
 
 	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
-- 
2.34.1


