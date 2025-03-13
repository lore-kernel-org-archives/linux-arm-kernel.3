Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20EBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 01:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CplJ4qBm1rlLiAX8XwqfY3czuxTznGHQa5yRNrScf2Q=; b=xZ1WCZTESNRLmQ5DNOyJfdsFRD
	WwGpD6BKwfJ4LNCWUkio1gRFCDbc/ZDCG6jecYfPt6CM4TT0P95+TclL6XZNmzGkxPOAx/aitt08I
	WrmDeaN9c1F46UMNB5kD6lRP/maUk7pOCNG3dNQkH7uEiye2siFL95ft0r76KwP88ojHzQA8ymB0G
	lVCy0lo88mmHUSw1pfZMF3zzWKQxY6m1YiJeh+1JMhiM64kYrzzyJvpQH5jwBPDDs+Tyxt2uJsKad
	6+C0fWUXtLihm5C7oBHrdj78a3eRnnwKE3Io3GoUthrC2s9Dt9btBwHtturpU0j1k1gI7qF4hF7jp
	dIu/yO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXBu-00000009rH3-1sJT;
	Thu, 13 Mar 2025 01:16:54 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXAE-00000009r62-3AdE;
	Thu, 13 Mar 2025 01:15:11 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-46e48278a9dso83511cf.0;
        Wed, 12 Mar 2025 18:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741828509; x=1742433309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CplJ4qBm1rlLiAX8XwqfY3czuxTznGHQa5yRNrScf2Q=;
        b=RLgXZlT2KZHLxnT8Z6OQI0hhT9eKqYcmNh70qr3O/HNdv+XNMP5mGMaltkZ4fiDC1d
         7+xM0c0xKV2R0kuD+9F+AI5+52Qm5XwaMfV8yGCAbsoJrEVrKN/XwIowoM/hLSs4XQw1
         WviWnOuOmMEirOlAwIJK97TDDKbiAeNKp3NZiVAv5cI/yhQv8g3mqN3o2RleFeZBw4zQ
         Cg7NXTnVT6ZZRzxV5/CeJlSuMwC4qo7cObTZGmI9+F6wa+FqJZq2s4btI+W2jyb2/Vfr
         gCGadEcguoTdFIPPJ6R3q/X8efd0xUQWHxvCOpA3j+KJ6Ki0kFXTpHpY6GjDRAuvrB5r
         nFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741828509; x=1742433309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CplJ4qBm1rlLiAX8XwqfY3czuxTznGHQa5yRNrScf2Q=;
        b=QCYCeV9fDEyOgY3Imkt+zctiil8fHO/0by+uns2z1Mg2C5fVWhf7qf/IrT5opIdBbz
         GZEb5z4/sZSegA+d6EHWknbBaFxC+DUsvs+vLKF5xxLHjF9xbZs0gHh2i+g8kkbpITMg
         tBEQJrMrlwtqMYgpbgbztzdWIYA/2VwNEuwbWPEc53eNrnvN/YvDb4fHCWPoxd9JFXJG
         eXIJDCOJ1Lh0TOS78xV67nt02oMS3iwb+zln3KzJQKjk+X8EMkkg/ILvoBsoW0E0Vbrc
         Vg2JDXfz5Smnp3SRl/s0W6NMF/jXJjMDaiHl55Oc5QWpXyY46cMgbTTVjtgE3GYCiSTp
         wYww==
X-Forwarded-Encrypted: i=1; AJvYcCUIZC3LMWY09/shmhXuLcewljd3thm6LVUJxbeVZt2CDByFYkZzojThITBUQZncRrxMEy09tqceRICyTMjafqEI@lists.infradead.org, AJvYcCW+DEErD2khPEoCJWp96qb6mEpr3SZ1VEiSiCLVzwwzyPqn7wy5y9sMy7/9qtKPyM6qx+EHpTjSacT6D8nvGlQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqT8641ytKgsUrSL2TzDQtwEFacBwFK/dmXPcRXEeE8JgKnZiB
	9Qn7Yv+6KTdGHUBn/xkro2fMizc6HnYd/JvShawUBcs10Ub2Q/g=
X-Gm-Gg: ASbGncuSEpQHHx968MWlaAkN/4RfGlrVrfXvRdCXwGvOwFAnQQQcrDRcLWac9R0Tq8x
	257Ejfaf7PxhqwApIJteVu1n9Ie+65z0Q+Dg+GHPKBWkIfSGq6PtrOJzWDjQv978tmeOwqGJhMZ
	AW9aItz/nqqTo+oJKD73QkerJz1JNCodWNC86hkbKhHFzXTl+eH+PMLmQL611PHx/y7TWAyU092
	7Ev9hVJJCU7Oa/o/rdhjJrbzMAjfZN8dqsOtuFI/TiHjqS0k+d3+PUHTJZ75KN0vJicTJdGt/Es
	O3YqQsieZjh42UcztOa/RBPsn3oSkUOmLtXa9cGGNw==
X-Google-Smtp-Source: AGHT+IHkt7gdCvT3sZMm/MUWsh89g+gMdYyxh1jTYIM+y9Ksbzc5TpKWzBj7zvLRqPmZLC8TC+4rDg==
X-Received: by 2002:a05:622a:2b0c:b0:474:e7de:8595 with SMTP id d75a77b69052e-47666ca49c3mr100937371cf.14.1741828509184;
        Wed, 12 Mar 2025 18:15:09 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb6082d1sm2428761cf.12.2025.03.12.18.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 18:15:08 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	heiko@sntech.de
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] can: rockchip: bail out if skb cannot be allocated
Date: Wed, 12 Mar 2025 20:15:05 -0500
Message-Id: <20250313011506.3132295-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_181510_803302_80774A64 
X-CRM114-Status: GOOD (  10.25  )
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

Add NULL pointer check in rkcanfd_handle_error_int() to
bail out if skb cannot be allocated.

This is similar to the commit f7f0adfe64de
("can: rockchip: rkcanfd_handle_rx_fifo_overflow_int(): bail out if skb cannot be allocated").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index d9a937ba126c..90395cbdaab9 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -551,7 +551,7 @@ static int rkcanfd_handle_error_int(struct rkcanfd_priv *priv)
 
 	rkcanfd_handle_error_int_reg_ec(priv, cf, reg_ec);
 
-	if (!cf)
+	if (!cf || !skb)
 		return 0;
 
 	err = can_rx_offload_queue_timestamp(&priv->offload, skb, timestamp);
-- 
2.34.1


