Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968D6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iT4Lk/9j6jfvzdv4mtNNNlRP6HP4iXENTaMgFI8ZadE=; b=U3o1gMTqt4JBTPejalNAHPd16o
	7OEgwrt+Of60/TzC+4HGKBhEjUjL66no/bgt2ddElP7XwgTMuMvRm4JW+C35JaHYgvTTJdlmfwbfg
	A00ofxxXIIX1YEqT6ZnMED0NNssnkiZvIy7HYEcCXd2piReHUbhP8C9uv8F77AA8ApU3iAelmlhk9
	8oPeXojxzVfdYEAyu5XbqXv4AtFnP2ltO6hZ3sXGLHUZUQvhA7q35QTqqQrBx72SkywJFUje81IFN
	alxyxbFvxMmiPfRW+5uufBR6G647oAmy2tGJnaFfGhyZRcAzKJJnIWIErFlfSfX8+fKpUv4TK+E9H
	BPX2lljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNFa-0000000AiY5-1vIV;
	Thu, 02 Jan 2025 15:36:42 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNEO-0000000AiNv-2VgD;
	Thu, 02 Jan 2025 15:35:29 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53f22fd6887so11019157e87.2;
        Thu, 02 Jan 2025 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735832126; x=1736436926; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iT4Lk/9j6jfvzdv4mtNNNlRP6HP4iXENTaMgFI8ZadE=;
        b=AdXOhgBj+6ilYBdTdlTR5QSsO6O+GZHVvu21aThozvWFj8345kfIcrc87NELw2Dh8o
         fYojO9av5HUeKGL9C6jViwXuqV4P0nRy7WOBm/HFD9m50LDv3VTm2nJyaiTleojptRcG
         F/jfklWce4yhss7YvS5AnPdMCmeSvx7rmc7QKRNB1QoriFG+6uhucmo/38JVzV+YsI/f
         gwCfzeKSwuaX+Jw70k5NMwueFhZPReukAr0Cj7HpE0o4dLzlnotbU+rM+CLIDcSZ3QCM
         Fm0QPI5oF0QueNycVRtq9bDn5NANkAaMUZZGImB1uTStVGRsGuKkMlNRiMLd3eFLc/Jn
         7aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735832126; x=1736436926;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT4Lk/9j6jfvzdv4mtNNNlRP6HP4iXENTaMgFI8ZadE=;
        b=Ux9xJH6jsqjgHJILU7tujh03Ht/rxidNO6HqSwMZYZnzUm2WyTjhAFs7qXX4w2P5LY
         83sB+dI9fgsNZrscDM+M1RsA440vp7OjNgFCNgv5uTLpTFuivJGhX0ZkOrHXvRdvwR2E
         JbKlrX3D2cCYObyg3adDeidwBFndMjoCGu/tvDO5JdEpCJbBA4uSJUta5YAHTdJYEXHc
         CEsiNMDQT+TVO6GfufD4NLHij2rlDZMgha1zgBjxiQ++04F+X2Ax/ZYDjokzs6kxSHpc
         sJJnV4fN4It/CFvIJMJXT7jwufsR/AHZi9cKprq5eGDPlUIOK9MpwO06HJ/UsycYAyyW
         3ttw==
X-Forwarded-Encrypted: i=1; AJvYcCUO++81+TqTNgvyFTUND/CwEWWutc3jFWZctHZxhNTx0AStFBIbWB8Z9WZ6+TL0+8/u0R44F3goO3jobrSrERmr@lists.infradead.org, AJvYcCWgbi1tJjQ5kJ25DnCuxL4DxO/LtOhuuwYEDQpQ6LUySn5ET8+VoFtd3M6dP9p5L8H3BFfqlVCWAxfGQ+P+mKc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrDly3lAxhVs1zLkvfJw2J1a2zoabqzwT6YAI5gMlHtmwvVgro
	CFZSo8wZwkR2Tf524EN+zHqP5T9i8S2mQFdYEJl27ZytgxRzdfgk
X-Gm-Gg: ASbGncudkST3yo+HvTQInyBReskdP3pz4UqscVbSVy0UufN4OoMuUFp5n+aAusgA1wH
	PPE/lGsePnlDmVNOIPOpSXjcAzVryuQnFIsHyfJfjRTB9h+0BwA/fn5w4DfJ+ye3qsb7pEYOPLi
	OXlFFAKsR7CUx+4gkwQ4hYHM6AQ14/6U7h3QMLTGo95KbGFf3eAjZNq2gbyDyEXOcPfB+/WKw8Q
	cFhKzXfc4Sm9ZQVcqfOVcv5/t0zyM+jJ4V84PZav4PAWAQlJ7L/w+ru1wCIqoTucre9eiMyw8KE
	GaG5FA+n4OBYYqcdRvDm/C/vq99sswt6PhI/2y7dm9dMKA9PQ638
X-Google-Smtp-Source: AGHT+IFuQdFNtPKtYU0kU7F2ognrgVg6FfagolZHbxa4JZ1HZFQ63T/tY5ua6ZtGvZjW1YAsQ2kn3w==
X-Received: by 2002:a05:6512:b19:b0:542:2e09:639a with SMTP id 2adb3069b0e04-5422e0963efmr12639162e87.10.1735832125581;
        Thu, 02 Jan 2025 07:35:25 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223602617sm3958832e87.109.2025.01.02.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 07:35:24 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Thu, 02 Jan 2025 18:35:00 +0300
Subject: [PATCH] media: rkisp1: allow non-coherent video capture buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
X-B4-Tracking: v=1; b=H4sIACOydmcC/x3MMQqAMAxA0atIZgO2iopXEYe2Rg1CKqmIIN7d4
 viG/x9IpEwJhuIBpYsTR8kwZQFhc7IS8pwNtrKNsbVB36DunA6UKCFupCQnurmlLnSu7b2DnB5
 KC9//dpze9wOZweAXZgAAAA==
X-Change-ID: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mikhail Rudenko <mike.rudenko@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_073528_639071_814E0075 
X-CRM114-Status: GOOD (  10.19  )
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
non-coherent DMA allocation. CPU usage also decreases accordingly.

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

---
base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


