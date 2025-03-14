Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B96EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 01:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6RyOfs+Y+zXnQN7nD15L11CcONhA3EYNbvNV/ylslsk=; b=dui2iDjEiM5bDQSbjif/6hH4Mx
	bGx3hWnzYhNzW9MDOMz9dfmiqwU4/n2XtBLbTPgUOjEnco/xPUy/ibY0SIBYNfWDzJJ+AilaImDcw
	R/jV9XzwTIC08Hhs6ppHSZss242f50qTSF49hVjQLRtnsCocA1ZLWearYxFsQx1+K6AOmnUp5ZVWA
	rQHJvvBNoHhIs9chkljy7wQuhlE1tVUimUUoZqenXV39rjmlCypnww1NM3mZBPekgoMcg7ThhzOrm
	EUEz7lUfUhY6F/hmofDki3oY5Bz4/uEbEU8Pb48GpJbqdnQLYsGJ9R4pNrRurfxG6wN+pwDQlaGqC
	XU4KL+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tstkh-0000000Ct0H-1gUx;
	Fri, 14 Mar 2025 01:22:19 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tstj1-0000000Csqh-1vPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 01:20:36 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6e8a1a92bb3so2762986d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 18:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741915234; x=1742520034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RyOfs+Y+zXnQN7nD15L11CcONhA3EYNbvNV/ylslsk=;
        b=kJw9H20U4gplfyf3HhH3VZ7kJdKh6UfBvysD/3ukGyE0fYae2PLxDtXkH8z1Qnklk1
         dDuB8wrINErXXpzsXOo6jPe23PiFNxF0ljVj6+1qPwPpAlaSk2c0nHyDxx1eNRUaRU15
         gbDhhvyg68w9pA6EYoExjM0ROm37kOa3IXxMmR/1ds65nkU84azLQ9eiiVrLat7upCru
         sp+TENLkyt9LLv3aQKVBWpB5CLRZbBKygLw0FGPJ+CINoBSViAPdcwXHobSVnnULakSr
         ax9F344bNBp8lbYYfe3W2F1CjnX7FuZAF9vnMRfni1S/funJdjyBBb+Chy2swo2mTjcX
         BjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741915234; x=1742520034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RyOfs+Y+zXnQN7nD15L11CcONhA3EYNbvNV/ylslsk=;
        b=fz4mCTlBsGM/0cNDl3IAbBXkJKRf4kggFqFymwYGla3ecDiCoXxF0EN+7FesPuAlLU
         zKWt5b35WvauVtgnueduORSAsE9K87hC863ac63lTq7zvAndZ028ARz+wP220AJdi61H
         jb9knjhLAnGOEvRPqBHkN+gpETLbb+jO4Y+0orWOd/M4stvgQ4E7nVQvDfFzTSIebEzT
         kliSrb6iqkJQH3arpCSJy1qceFQIxAaeds6XOBkIvwKkrkWlFGtVXBazuUZLHioyxrvZ
         4+OEl7DdtQlYdLK5aRkugXfYU9QnVArGPkMx/vSSWOloWYdEjj43/U6ho73eoC98eHcu
         hrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyhSbaCGKOTZJ0dV26RPcdHq/wj+XxlZgi5zieSBur1eAzQuyuLhaz4hk4wzrCDmgtU94WskPgCunRwMnIqUoi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk3CJE0IqgxmoQTQwnBOzhb6ByP/ssr3/q/9iu6vAlb4TZiU5o
	f9iovy7vl8lTBW+yC9SsCOcIK3TX0CqF/0T/mCfdt6dV/fX9zlI=
X-Gm-Gg: ASbGncv9GW4pfi1szRFxJyTZ7XfJu68Wx6KL2f6n5M84So05N4cDslaMMSFQGA74yBt
	zdKgxyhICYYh9E5ZpS+hOcWC4uiiqDD9htpXP/CpMi5aVIaIy1XXM34c7yV6efpaWnh3Z2XD5ku
	pv5AtQsqFeMyijk/ExIc0YvZjlwLTqWn6jA/EfjTQ2O3soKlLtlR1C2kqBcD8jBeeQbIwGsFpc2
	g4hK7IfJ+TVqaO4xk9sW4je7cV80m4CrHH0/0Q2h2B2yp1haQZr4Cq+KY3zLPlsYb+OS7CCtNtL
	ZyVnMMGLilL84OUUXi5wA+iXVDpEwrCgnqNKg+HVRw==
X-Google-Smtp-Source: AGHT+IGfhPTAxaf8B75RLgjVfZQ9MQSuBX9YLluLR5rXcZosHQPraRrM7+8ySbbt1uADkGdyWm5Dew==
X-Received: by 2002:a05:620a:440a:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c57c930378mr23367385a.13.1741915233700;
        Thu, 13 Mar 2025 18:20:33 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c719f8sm171847485a.36.2025.03.13.18.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 18:20:32 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/sun4i: backend: Fix error pointers in sun4i_backend_atomic_check
Date: Thu, 13 Mar 2025 20:20:29 -0500
Message-Id: <20250314012029.668306-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_182035_499858_4752143A 
X-CRM114-Status: GOOD (  11.48  )
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

The function sun4i_backend_atomic_check was dereferencing pointers
returned by drm_atomic_get_plane_state without checking for errors. This
could lead to undefined behavior if the function returns an error pointer.

This commit adds checks using IS_ERR to ensure that plane_state is
valid before dereferencing them.

Similar to commit da29abe71e16
("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").

Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..a8e0e2123764 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
 			drm_atomic_get_plane_state(state, plane);
+
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
 		struct sun4i_layer_state *layer_state =
 			state_to_sun4i_layer_state(plane_state);
 		struct drm_framebuffer *fb = plane_state->fb;
-- 
2.34.1


