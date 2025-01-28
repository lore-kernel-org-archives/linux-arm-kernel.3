Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912F7C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOk1tpd1Scx8u9ygptTnBU+QUAeBmZsMjmcHaDde8t4=; b=bwp69S5VXTZHva+qWshb2ydcZb
	ZWbGVhYtzOCR54Nm/NtSjey0uZudGyNrnFqikz1vFNb4wZZ75TNdAoDwduMNMYopZrI22Djs6hoHP
	UbqpP6f506okiT+USQBndxv8LtOrqg+3sDia9VXs/oIQL9ch1jTqE0OHfTHQSgTgnkwEA7CN5tDUM
	eX9IqoDvf1zHkW+6CQYqzkdNpdZ0fI7JxnKwWLwJDGfn9hL+yya0bsivosnQJ67Xot4R+17x6mtl3
	d3LugZ8+T+3Yuv6Ihe/NatnQkY8MCOBXRcSvlkzWq+3w2nReu9R/S3Da7L5pOerAHB6/sbr+/OhUI
	Diq2spRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tctU0-00000005s8w-3W0k;
	Tue, 28 Jan 2025 21:50:56 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsJv-00000005o1z-2mBR;
	Tue, 28 Jan 2025 20:36:29 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401b7f7141so5446533e87.1;
        Tue, 28 Jan 2025 12:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738096586; x=1738701386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOk1tpd1Scx8u9ygptTnBU+QUAeBmZsMjmcHaDde8t4=;
        b=FNNVtJpfb4lFTgu9zkzD3b5socyldeJ/Y8+OvuxGp9i8sYFSIhwcz9+nXS5cTVNRVW
         ocx9x8yPB11NyZwsRfkiDJTJjIdUpQR1Lo50vYL6Sj/Eog/6S1+igyqnqZ+aaTwrvYCY
         wX3TkYEr9IGaPpeEpOVc7TiryDCeEfn4Eh5xgemJ0Xv9DwYNiYet91I3vUnoj1PJdPar
         ICB1IGLYc78nGHDtz6Rx6TcXaip5vUmjyx4+mcYiW6ph8dOCyNPzzwKIoGaUKsTMmwqs
         0U+3nzJjcUrO6VfaWwUXpvu4neacsdAxz5N/EW8VIuiNHOfUhkg6YA2pKwAiEK3qJoKH
         VpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738096586; x=1738701386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOk1tpd1Scx8u9ygptTnBU+QUAeBmZsMjmcHaDde8t4=;
        b=UqabquubD19iPjpnd7JmGrlmDbTMfDgnKMpH8Uohp+EIcP+doWwi8oWHmduxbvdo4h
         GsiVORzMcPfDSovj4p1hYLa2MTT+QFyW/C2box05bEMhXIOme3ro4AWQLBiHT2iXaBJg
         bVyWEpYEknzNuGALiJHYejQ+cB37SKLAwn/ocJhb03pMA7cnbtzuRLqW1mjPRHBXXJnB
         sI5Bsg9KCiOaNN/OZGklPFIJF0ZEveL/+BLHht1oK/kJUmrN9SMHor18UvfHZG3/qW6n
         pQto9+WVKUIOKc8VQpyrFfGl0rozH6YQt/uBjWUd2SnH83UNicNJlb+Qm58eWB3RyqTQ
         +c6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi5yc3cReYda8upG7XgKSHxExYYzl8Ex/93ol54m95T7BfnsS+cuinTiCqtX8TpEFIcBtXM8NwJf0QqcbhMVM=@lists.infradead.org, AJvYcCXfZPpw+3XGqokCy9StxKOy5T8jyT3s22K/dMCGl3cGtMEHQJI0Fp4jY7zWSC4WEnbzp8vkkZhMPApWxtb75zV/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz405TuY5RdvIaamJOA0b+fX5+YPlvmHd43KApqN/omxXK4HRb+
	RbOZDi+PTxVNfAeIbgSbl+aCEg+hkHbREstpCdlVWzFLhKDuUiT+
X-Gm-Gg: ASbGnctLGhzZs1FgWcSrMDX1QtZ5ZWrvY1mG9NznOYqEbkUbSo5GIG8RhK0SJszu+XK
	zzgOohwbsnd9F+6zrCZMoDW69dfwTiqmOISlnvXEt/W4NdmVGj9c/NXfFIH4s6ckvB5Y58wzoV4
	Jnx70aH+CnIEw/WbOwbrRbDWA0/e4iyQG1y4W3f0Jq+lcTHha+Nq2xL8lK7eha0OHyrk4LBan4M
	Ll/RfW837CZjyg6bzwPGNU5KPX7hKJf8SoSKBh60jB9O4HothtCQxRHvZZSq1+4+tcODwCDwd75
	lsmpKTDT3VVmUqe4DZn+MSSSV9AUx6UdXpI9WK/MenNIfkxLcDhy7839+EWzWbYwqlIvOQbYfwe
	8q2OhA9R50as=
X-Google-Smtp-Source: AGHT+IGMzL/80XBmn1eSfudDP9ZNpYqbMrbvgK9R+lJGhmNTKy7DW7XmzgqBK5JBk5vxw5I6MfuFfQ==
X-Received: by 2002:a05:6512:b81:b0:540:17ac:b379 with SMTP id 2adb3069b0e04-543e4bf6192mr102601e87.25.1738096585531;
        Tue, 28 Jan 2025 12:36:25 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822fcb0sm1778361e87.55.2025.01.28.12.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:36:24 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Tue, 28 Jan 2025 23:35:52 +0300
Subject: [PATCH v3 2/2] media: rkisp1: Allow non-coherent video capture
 buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-b4-rkisp-noncoherent-v3-2-baf39c997d2a@gmail.com>
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
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
X-CRM114-CacheID: sfid-20250128_123627_707974_4B15A4A4 
X-CRM114-Status: GOOD (  10.97  )
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
2.47.1


