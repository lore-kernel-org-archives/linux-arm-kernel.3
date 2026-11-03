Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07577606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w39Pz07p;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1zo/GH+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=; b=w39Pz07pJqcXKo1WGQOGFHTQty
	o5mG8PZjjxcx3AT5i3vH01JGq88780JIaOk+EXqW9PVSufv6cWzj8g6dqUP6OaSJb2CJfRdr8v2Z4
	5IaKQtFMrXb3qpM5FQEtsdwQSLtCkSyobp9a1gaWEXsH8C3U+llP+Av6XyZXjXNayASYuKhMEzN/0
	apubYtiGriiAAuTnCQ/I1ULVZwk27yrz1wpez0b0rkS9CIVj3L7D+QfW8H6Nd9ZApyfwihQ3MJy0I
	Setoz8HQgi99jnkg0k5wMGphR31HE+EHXICqNsC38qZCsveYV5bC80NELs1xLUmAbjY7sgXeuE0wi
	zsGe1XRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLWn-00000003eOu-3QYx;
	Tue, 03 Nov 2026 20:54:45 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLWg-00000003eNB-17IA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:54:41 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b0d126f631so203217b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739274; x=1794344074; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=p1zo/GH+Y86NqfBSJ54kgBdCuNAy2Hlt3ZPNWR3odtJX4wDKHErz8/7yXb96Me49mA
         M18hEDV+PAMPzTyXmc8TwyTSJS+/nK/Rm1JjhGzsnHJSRWE32NcX5fJc/RNE60mYkDqW
         M12qo3bQZroxyhl5jS+4gDZoCB3lpj9cHkZsSjPpEzywOiblV3edKNGAbirJ9MLpwkQi
         cAcv1MPu2BdjuMuasGqL7NHh9jtEyDsmQXuJfCiJwYdoRCqVzwGOmfGuXk6EuvHFlYTT
         zECuMtHBUsJJZAJtdrfbwiG0NoHiUsjU31XIRuivWGI45BqWUqD/6Bgkt4PWfzrf/EqW
         /4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739274; x=1794344074;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=Qp0a/K5Bur7GJUkMeBXuNe+xEoTUjCQHuB0UDcU9v6FqRGGp6OuyOLfTdJYPIzFhzi
         NENC5xGb+HmrBPfb/+LC6FZY2v0Ocqmn3uaOH5NM5eKHPd5XdVV4Ro8ORwU78KGYiFQv
         Y4r/NRE9BdwJXgsr/gfEL4sa8yqmWw6Vf+B/x/CmgaqB2Ifhn1PzU6ZQuMNoxi/S4fMW
         /DmA6nqW0HAZK2Aq2aKf5Km3raXi37dPzOc8VA95BwU+WqCpD7oaai4zyFtaPeVBv/Jx
         2sk54MTFDPYpcAIcLg51+/v8wbwSv6wH+NNXIbPhTYOYa6dqmrZctZ98gEQy4jf2SyMf
         w4DA==
X-Forwarded-Encrypted: i=1; AKwUvBwohsHYRPxJyETmYJZgdu7vkAYgxC4RDWvsBfPC54d2wrH3jOTKnQ7b2QpXfG01SeWv5nk5wqAWdF/h/Rh+U4eO@lists.infradead.org
X-Gm-Message-State: APuU4Z+2ne+KgS/UltLyHAXCzCy9Kt/YzT4esEzBKNj6Pw6p3vzD36b2
	T1Brv0sClq85qX2gDCvgLWeFcZiLsyw2RX0uhyJDJrc22Ye6tMPoXBh823cobH7H
X-Gm-Gg: AYBFou2TkA8s5ncD9MBFyDYrYjX+3D2MxeGZ3U4vVI2fZs032wPsnbPWKZEarXiKYNy
	/SjH1UYls5Ja+LK1W4+b/r9TQ6T9VFoJug70fs3lHzPX6AmHi2Z27PJyVZAVtUqHoWl5YjRJHpp
	mBfzmOYepOWe1e1h7WF+y9tqdps1S5uChoO+KvyG67AEawlWjKkTf/irSiP4fznE8dIZJnKcvqE
	k+kQKreY8sbwgw340otcxddV78w5JMJwdfGeVT/EHUlVm4ju4XKJelMnObDnrlrqNuNK28AHOBU
	N4ZmwwZ5AW0hQHNOrFzmOUM9R7nA9zT1eDrmxRMy7YHJ5KhIAlBKrJrSHtWWc+IdnTuBthP2FAM
	qdKnZRt5GA1EhgumZndmjQlblSUbmAwAQnegNzk/vgxB5Zih2hpcyYgU3B3Up7c2HxukA90hNRt
	JPWGXfNLSuD/Atim9yCKJpg+oWORe83r9WDFNdn2JiSktdsnqnov+efZtwXBvPpmD2Syz5fXEgl
	J6cF9N8CISOPu/WrTrx3Y+hxEJ3+hSm0AiE923U8zTn8SMCHr6C95gUzBQvu+VTREmK3KHmVmkB
	rTlu9/+NueRGYHkPfFkcBPSYNncWbrm+hc6ggih70RnckgrWOSVs+oivYA==
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr112559257b3.24.1793739274317;
        Tue, 03 Nov 2026 12:54:34 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm4805187b3.40.2026.11.03.12.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:54:33 -0800 (PST)
Date: Tue, 3 Nov 2026 15:54:29 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: staging: media: sunxi: cedrus: spelling correction
Message-ID: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_125440_037923_FB397572 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Correct spelling in comment.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.51.0


