Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8F4E83848
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 01:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BjA8YI4abbHFrmSC0kcj7gswukKzCoDbvbkarUE29Sw=; b=mm1f1dlDzEmqcdaqZk9kQh8eIt
	hsobiNBRwmFXskf6aXUrJDogEQ22ErKFMgdOY8jqvVLNPmTVwTxD6I2+XjgHLLVZz2QD7/bGsYN57
	WVWBx6ND5b/UOA9Mcb2+ChX+n4DKTsjqdlDyzM32EeypaORrRt+yEHP2Ak1rj1vooPdLUhFj6ngUs
	epoK9SNvxKxigof9SKbKemp9AS2DtX2dglZjAoqr7fODONKCSwUbVIzyTpY1O71Zm8b2ivcuYHG+q
	LjbfP8SQSSJOGyU2HknPRr4Ut+UTFnRkqlOU5LK0WCIeTj1ckmCMok0hLastKA+EI2+sGzqdBdu5F
	mkcX9fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsACN-00000007UXn-2XE9;
	Tue, 17 Feb 2026 01:48:23 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsACL-00000007UXR-42Ze
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 01:48:23 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-79639c2d2b5so38673477b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 17:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771292900; x=1771897700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BjA8YI4abbHFrmSC0kcj7gswukKzCoDbvbkarUE29Sw=;
        b=aThFcGxvByO3Qwy6l45tuQC4qXURPRj94fqoZrDapnfO4+jYMKwvIOIcHGNLNXsbNU
         iWCr+QiMPyn0tD8fozlaoblFHuiDJv4GFYP+uUcszEdP0u3kt/BXg3Ne1p3RtpRZCPOc
         1CJXiwsWvFfFMrgZT3A7xDApqFnpsNFS8GT3d4b7yIDt/MAcFMeZQA/N2czLRrpXFZsT
         8bRAZzkGU2NcO1k5DQ5J8QzRMd8CaTobbb9VyYobyxzHGkjjyS++wen5MkDHUylOWYk8
         L4tShHwwTHs+NOQHe8cWAE5ItKZJCeM+3IKI1FiIHKzc59uzLe8Ay2/cVmODwJx7CMS6
         qY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771292900; x=1771897700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjA8YI4abbHFrmSC0kcj7gswukKzCoDbvbkarUE29Sw=;
        b=UeyrNeksP3puMmOdk2f3nm9+aysftqtF4zYq8gplLSCrSCHoauCSQS+DExxXTbzvAL
         nKkEGbRsdw4u0ld/hGb9WD5jhX8RDxZTVot5Ns/h+G+gtPAn3QopOIA3u9GYFgAf7qJz
         ERGJb7o5YzAgqBx2rYYzSiRosQ6g1dIjvAAnLYSa2svR1gbRMOJvCjeaMxWK7itTAuvi
         hJe3vMyfl1k6o++AV9RS322RuG5SI6crcPMjns+2Wy8b91Svolpuemh9O1ghx43kJ/Y/
         Bu0VDznsfhk5+iPL17skksJkGJwl75B2ABlJETZ8AqVW6bsYd5sADLSLtgnzssAK3zBT
         Cemw==
X-Forwarded-Encrypted: i=1; AJvYcCWz67x9UGZvn0QQU7u+pdT3/3sA/El/Hp01R+aEQFLMhHi5yEwkQBSqPIHN+jgVG3Iz1u5SfAuG3oLwBpMh10zj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz88idtqWat1RFK036zj/PqktqNt4xvyVH76HB4FjZXOhapHoxN
	DIhW+65DKj5qSjKAt0qptaq+ltNjzU9hrk+yJ368ATuCts9zHLGgfrUk
X-Gm-Gg: AZuq6aLhEq5JN5E3nM/qQl8E0kD9nYjEdwRiTqpFcqPbZzqCCEFhxYYWZXJ4xOLsiEU
	EVHcXvbUBx3ZEP0rxzlicuyYwFzOsdkqaiKoY/xIxlAbt5zEqi6KfEJaU6rMleYdx/qAc2CHIM9
	LjVEB0awVurE0P8iYRHeI9aAswNBEop6vjnixSuiXL0kpZhShPyUMFh3FbdDGw7DmPSrnwJ5XTH
	65pMUt/0BSo6fXZmiprBSfUvx/oF2ZEq1ZpnWfn32+FtOb9qExSQRq4xKsZwRvRQekGUpGFr3i7
	iEso3vH74abWCm67kuknrGkQEQtBURh+gu9mzN0znBv7RssFljZXWtycCvDNnTTQjCg8A2UE0l1
	0nY2F1EwVUKOvG4nSx3zDX9Dqo/5zOLEWL61tYlmn6kBTxxR3dazzxUa0iRxsD3WtY6rI4S6XP0
	evulTyGa3Bf+UkWPrb6+Jp/61WS8WhrPWDhPv0U6IqNi5UkVi2jH1pJb6/ePzevNND+EjlYTxje
	caQ/jBiz4JCZNBxBjMygXweOfFAC0yp2PtHNUqsDKY=
X-Received: by 2002:a05:690c:b1d:b0:796:55b1:a16b with SMTP id 00721157ae682-7979e81638bmr110018307b3.31.1771292900128;
        Mon, 16 Feb 2026 17:48:20 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-797a668ad26sm43680067b3.37.2026.02.16.17.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 17:48:19 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/sun4i: backend: fix error pointer dereference
Date: Mon, 16 Feb 2026 19:48:01 -0600
Message-ID: <20260217014801.60760-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_174822_005953_B13ED143 
X-CRM114-Status: GOOD (  11.20  )
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

The function drm_atomic_get_plane_state() can return an error pointer
and is not checked for it. Add error pointer check.

Detected by Smatch:
drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() error:
'plane_state' dereferencing possible ERR_PTR()

Fixes: 96180dde23b79 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 40405a52a073..6391bdc94a5c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -491,6 +491,9 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
 			drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
 		struct sun4i_layer_state *layer_state =
 			state_to_sun4i_layer_state(plane_state);
 		struct drm_framebuffer *fb = plane_state->fb;
-- 
2.53.0


