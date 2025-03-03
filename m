Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F19C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqOngwUEjSuVUtl2EN2OtrWhKsT4v+sY6g+D1KtVO20=; b=IN3OeO7+XHw8nABqCnP+9C80lB
	xMca8L7vQRxVbAFIAyQozkMFZhLghTNLEMZhPhvenXHaBiJzaerMl6ZepTTWYParGfcmTg/R98LUS
	WEznUjGSZcFJySQI+A59FRhdYpPLuO8KmSqvuNULEbvzzkZzfkpyu/BH52oNvtZbWA8jLuJyR9Oq0
	WeKFu7bUqWi+tbAZbWB62vClBo/JBWM7F655CiZGuUXnXqT6z134mcsteZTRQadJEQGdehJaLWwMn
	e4jq1Pf4F9cW7weZOqu+QhzFYRvRPqp9NYTsB63cC6otiH3XMnCmZUFL2GTeQK4X2K4djG5AojEVj
	PjxR4kVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4xI-00000000kvw-06Gd;
	Mon, 03 Mar 2025 12:31:32 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp49g-00000000bRF-2RL0;
	Mon, 03 Mar 2025 11:40:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-549490e290dso3158572e87.2;
        Mon, 03 Mar 2025 03:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741002015; x=1741606815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqOngwUEjSuVUtl2EN2OtrWhKsT4v+sY6g+D1KtVO20=;
        b=UeQCcM9hQ+3EJhCZsVOizrBA5tJKFvqy+Ju7aXvUwbX38BThHK+m9ib2UW8S/RdyMk
         45c+c7P8H8PXrSQ0QxmIWcoDcWGGcZa0Pdm5NSmzbEenQIat7Dnu4Xz91/dFcAnDvqqP
         IFT/I1YIifgM/ZUUflpaEwJp07uFZBA5vBcxnrN8NJRRy/oAd3sbjIu8QziFStaSMZ20
         A+9Tl61JUFnU8rmXF7huP7Ta16j27k98oLNEFkOHb/4pgRT7LspuCXtuJqlU5uwGeHE4
         EXeXZCSn4VJdx6fcgzWZGQn2ZrrcLPZwO2//ZU6aewobnoLXnpyP6o7T3sn0cMgfkiR7
         D5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002015; x=1741606815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqOngwUEjSuVUtl2EN2OtrWhKsT4v+sY6g+D1KtVO20=;
        b=C3H8SZF8czTBoTNN3puuu1yUvSEnmER1qH7cULHaSev7y8LSXDlRA/uJeLnNN/rU22
         RxcavlyssJw6cuIqVLcmN8dq+hOsaOy8vmTSVnJ6vxFkIoa0vbtwejaACcKV6QjHTdsH
         pZAPOGnNIXBhvDA7bZvJn+eih/Gy2jzBW0mNzohjicgAuh1uV/12CNTplUMQCSiN6I6d
         g5dhqiX1rSPDHRX2V7ju/bb1T6k3w3RFxBgCvJCFFP0PN9BSR5iovR/Ea2kBhw/LLPzX
         zewmWdxIePIYixGRadIuRZDqehFFYYHisBAEAF0xroHv+dARivfoiVjchrzCUrKrvtqF
         JsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN+qO4Af5p99cWiQKGEFIpzeSudvSVAQWSTCk3Qjcp5Nbnis/RjJ7oXO5+ZHf/R0j3kPTNqPNqhCbUwqND4Jg=@lists.infradead.org, AJvYcCXsZg/1TsH7Rfwf1Jsup55/buJepp9KU++oI2P23mrcBBphY9wq+KrZfH9rVnftzqv/K2q8sRWf5A0nFZxIzZ8L@lists.infradead.org
X-Gm-Message-State: AOJu0YxriWKgFRhN2JBGvBDVOEg88ngufoEHm29FuWLiRJogdnvA2+Dw
	KspCfVxrtthod/QMmJ0ALb/LM+p4HNFGUtQr6X7zjcaEeOh4q7et
X-Gm-Gg: ASbGncu0OtZzn8USPC7EsgSSMZ6PHpERGGy9Hc/VzV9ixkSrzz0jQNdyRqzcQ5sFEuV
	pKv4PNAvvEfDWP+kVyhsVkL95GDb6j1UHk814RBGy6TPGoPWL41jntmQU2i3cjcWjTU9THSYDFb
	HJImy49olRhJRLEyBIuEahOEKaWw5hjxIuapz2mbGc/qDymYR6JTui0d9Ic4l1rc2ldFJBASany
	t8REgLyaB7xYn3sq8omjAiTnsQ4dHZRaLGLRPRwKf3CmSRZNrW+ycN4Awb3EwoX6bbidJUey6bg
	7J82oDUBt6UwZ4A4S30DYvJEwRXmZiL/LaL/YXAqMPp/IKQmZaTqWigf5fvzajpVAw2nx1vTPxs
	Y5R6OWDQZfIdZBD4bsL9w38wQtjE7It0TLglsUeB8
X-Google-Smtp-Source: AGHT+IH6/3bm43v60en4yvBpA0E6eJcZTxM/vDnluS8y2VWAPrUuChj3nEiAbcrbv7L0cQ0TzEE54A==
X-Received: by 2002:a05:6512:3f18:b0:545:1d96:d6f7 with SMTP id 2adb3069b0e04-5494c333056mr5105031e87.32.1741002014366;
        Mon, 03 Mar 2025 03:40:14 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54949de706fsm1125399e87.23.2025.03.03.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:40:13 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Mon, 03 Mar 2025 14:40:10 +0300
Subject: [PATCH v4 2/2] media: rkisp1: Allow non-coherent video capture
 buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-rkisp-noncoherent-v4-2-e32e843fb6ef@gmail.com>
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
In-Reply-To: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_034016_622795_D0AA0655 
X-CRM114-Status: GOOD (  11.52  )
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

Currently, the rkisp1 driver always uses coherent DMA allocations for
video capture buffers. However, on some platforms, using non-coherent
buffers can improve performance, especially when CPU processing of
MMAP'ed video buffers is required.

For example, on the Rockchip RK3399 running at maximum CPU frequency,
the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
non-coherent DMA allocation. When doing cache management with
DMA_BUF_IOCTL_SYNC, DMA_BUF_SYNC_START and DMA_BUF_SYNC_END operations
take around 270 us each.

This change allows userspace to request the allocation of non-coherent
buffers. Note that the behavior for existing users will remain unchanged
unless they explicitly set the V4L2_MEMORY_FLAG_NON_COHERENT flag when
allocating buffers.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 6dcefd144d5abe358323e37ac6133c6134ac636e..c94f7d1d73a92646457a27da20726ec6f92e7717 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1563,6 +1563,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 	q->dev = cap->rkisp1->dev;
+	q->allow_cache_hints = 1;
 	ret = vb2_queue_init(q);
 	if (ret) {
 		dev_err(cap->rkisp1->dev,

-- 
2.48.1


