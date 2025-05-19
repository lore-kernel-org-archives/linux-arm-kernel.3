Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B98C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IqcrMvL7TRi/F7iH7e+SW+BnTVjngWX2CY239LaHS6A=; b=GSsoA0OgVthkvfiOyY+RIYRzBO
	3o6TSXZTqczXD2Cvsn64reTxEfU270qDUWkbdUyb8FIK5y6OkJmI/Pex50PTgiES7sy6xwe4A//Au
	/S7NlyBqlhpXnUZWK15CCOBV3EL54B/HtKsjkEHCo3/LZbKOhmLm1GTYuKw3Lo7kR7KvfGffaTj4z
	0DuWuqAXqBydItAgtIKKavtZvR85GvWJPZOerlib0bZPmstDBAOmcI7uAXMbO93wNC4sRIJwXEseb
	s31hTmY/gVwtfl+qj0Wy+ZOGAIU9nWS0lGOBSWh1WtsTwvvOmIdfIXjHpO/5LG6mge5izEVXghC7K
	sdl/kZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH34F-00000009kRj-275u;
	Mon, 19 May 2025 16:10:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2CF-00000009Zga-2uw2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:14:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-601aa44af77so3360671a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747667670; x=1748272470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqcrMvL7TRi/F7iH7e+SW+BnTVjngWX2CY239LaHS6A=;
        b=GL4AZAvkBylc2STsX9+26PpyGAMnDmBZvXlvUyQMCMti+NBNROzBCG4Qsf/CoVyMlc
         C+kXAcBCbFUHSbjLh+7Nez/+/7rYuPI4VnzqLAal61+1CN+43VR7RiWJjba7AGyNoCLM
         wc+iDWzgIwaSHJvbBewsWa2rY/1Kj29NXFKeH6gBtacIs+z6KrV/YpaKy+Xi3AnSREHz
         eXvBRYDI5AopaaBSZeQMe4kEl432qxeQHhH9acyjdZBBlKYOCEK7mIZ19tOnTEEezwMb
         xAJqgsObWsKkTF+TXXZmKMSaFQw1rAP0ikhw0SqG4QYygrHsv1uDaZ+WcvsGi+AbCSt+
         4/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667670; x=1748272470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqcrMvL7TRi/F7iH7e+SW+BnTVjngWX2CY239LaHS6A=;
        b=a/YfLYm7RTW7Wx1HKEMPf8JCQ839MgENf3mY5/+aCOZgpCuw09Q/qouQgsjhY+c4CD
         bkD4R++Z+KtRUNNY4BS4B2Cyvef2mklrMIhH3dx+7QQv5PoR5vH2haH1XgePsWcOaLuD
         YDKy2+BDc7d/l4w5nIfP/fF3PPWj51Va5G3pW/nlnT9pTYZyngTjzsgLc57O5w5M9bfL
         Q445Pc1cWjtLPDJ98iJsJY4wdEKgwO9JtgSOfUy6tD2zkvnZkoALvJoWbk9BeYHPCjGn
         UGgNGtMPeQiGcmtjJuNzCxFRvVgBp2Vbh559tenIdWOWafpdMLHmaGPf3ZZ14aASaPVE
         SIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXbPTWWV3rfM1Rep1je/lftKXGR/jMpzbfD1RubWk6vPndUg+KG4ADnJdGRdWCJSU884krzpSMc2w1cdcycjY9@lists.infradead.org
X-Gm-Message-State: AOJu0YwcvNUSomBgSeC0Mt203DgIkiTWBLKUGBoR+oeX7mVVn2xaQrsW
	1mYszeZUZm2C9oVSy6u5pUE6eL0JgdTotUvDh5OiWXtzZJRPimL9UlX/
X-Gm-Gg: ASbGncsQpU9s4S2uprpYk06NJu+Zw+0eAIbA34bdFYkqyOPPGOfrEZJiutbYNH2W7uZ
	EZKcgPKK00AHXGGS0c/TV60h6Zxp4q9se6GSrzVEdgSc1qFTzxpBPiNX0J5157aGoAQJKpraIKc
	6CMKkjaFB78oyww8vA4qAGx+iD7u8c7NBH4WqahEoZ/vOpcE7L8ngVkh2PySKwZ60fHhkSliZsL
	s8unPuS1yhr9LVwYPdXii4tS2P4pAYbUgmYQ6T5qC1TznbKjmAeZZ3Z5eNsxDuNn0G5hDzK3O+s
	dSXIhR+MMWteicmLEGwjpxl8HmK/NmxVsQ0RXxy1cMipHKpYmg6/hBDaEhd6q425eJsrAt4pMtU
	R5GE=
X-Google-Smtp-Source: AGHT+IEyDWsgk5ZuKcJJnCwuMrygWqmpsdfXmccP5TnaNBnDa5/JU98yEJj7J7lss4EJg1nxvJYFvQ==
X-Received: by 2002:a17:907:1b09:b0:acb:b900:2bca with SMTP id a640c23a62f3a-ad52d07636amr1189789966b.0.1747667669049;
        Mon, 19 May 2025 08:14:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f07:610b:a400:6472:d2f9:d536:4c30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b08bsm608522566b.13.2025.05.19.08.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:14:28 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 1/3] crypto: sun8i-ce - fix nents passed to dma_unmap_sg()
Date: Mon, 19 May 2025 18:13:48 +0300
Message-ID: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081431_734310_9F5DD037 
X-CRM114-Status: GOOD (  12.61  )
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

In sun8i_ce_cipher_unprepare(), dma_unmap_sg() is incorrectly called with
the number of entries returned by dma_map_sg(), rather than using the
original number of entries passed when mapping the scatterlist.

To fix this, stash the original number of entries passed to dma_map_sg()
in the request context.

Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f9cf00d690e2..7cd3b13f3bdc 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -278,8 +278,8 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	}
 
 	chan->timeout = areq->cryptlen;
-	rctx->nr_sgs = nr_sgs;
-	rctx->nr_sgd = nr_sgd;
+	rctx->nr_sgs = ns;
+	rctx->nr_sgd = nd;
 	return 0;
 
 theend_sgs:
-- 
2.48.1


