Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5A2606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aLQaLJ7G;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mzRmPu4c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b6uibeAd1xqDy+X+4zICpkfe89xnFGYtmkkgNj7URCQ=; b=aLQaLJ7G2vcPFIjNt4uA4P1o7p
	2ljmv3fgsKCjwH7FVUpLwzIhXQX0W/MP9VlT+E/h/9LlOJ1vdzj7t4yjI4FSN2aYTMk6Nc/xqvbxe
	7DzgJIjl9qU0ZStprxJSBdHZeeoOxglgeE/QwsJdOhuvGyqFU5QSifKbZH9luiX12tiCs1XsIu0G/
	XiTleB1OmggwjQRifOCFBQuiUMhIn4p/Yw0uWqvj3AFPu03EhpfoF1t4ukMfQaO/c7oxm/87zlU8w
	scyXsjb9WZCFN91INqu++6Sz56stDGN3gFpeKrLlG4aK3ODOy8ZYPilcth1wXTEXUZNNqkumMXm3U
	7vc455HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyd8-0000000EqXA-3hUD;
	Thu, 22 Oct 2026 19:39:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyd5-0000000EqW7-2VEp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:39:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso120468f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697949; x=1793302749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6uibeAd1xqDy+X+4zICpkfe89xnFGYtmkkgNj7URCQ=;
        b=mzRmPu4cn71zNS34MwYTXUBqwRhei5CP/xPD57sHLSvrPRmOfM4n/JBIBg2loh6izW
         uHgEi8NEolZmxvUZJAr6xOdu6r+ReWyBz2Un50VbkteaFE3E8TZ0Yts4h+yanCR5X4OH
         wsrZ7TeDDLnTDoWqFaByMsfckLRiBMjk1obHTyG/fY9r4+MChL9dtZVRVLSy3wLN3yFa
         Je2jERbQpQ272QgIYEQwdIhTTdP+RgwHyQ+2Bhvjvkts8ioySeNpd/Vv/5EXEQMbfBgv
         XKan8rwodkACzgXz9kh+CHElFnUhghdkBubVELXjMitU0q3oaXf3PRj39RUajV6PN1rM
         lF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697949; x=1793302749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6uibeAd1xqDy+X+4zICpkfe89xnFGYtmkkgNj7URCQ=;
        b=p0eotx9slEsxyPwZRNXODJEB+DUCkQUBSTew3VWM2Tm3D3RZPp1PawFUKBCOSsreHU
         fhYlttDbTG+5Ozc4iuZv5yXL4hVsUfvNXtDfCRVq5Eb1pyZ9hyDHCG1NOM2PVrt96XbY
         bOphLwiT3bqBsDMWMFnksZx4tykyiHUKcPuxUiilrv3x7mWRS+xJIxp0ipJLP94dJbs9
         9+xObxStzrWkbILXez2B0yAM5jCSOj3notTfNBTMLbms8j+qlPoEu2Y4ntz7rXTMOhhi
         bRQYjJF0qI3aWVR1lrCWp08/Few5cGgZTYQQIxiIWioPX6Qb9JI1Yvbs8Z7FOZvsQopc
         xz0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjpiATls5mPudAf6BdGvFDbrDJcUBj2pU0Qh4ssh6ZAsravIZvVqLJUG0+C4Y7fNOt4u9tMYWreZOqr4u1qG8m@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9g51yp7sQXXKJ61gxLF4UGJAz/fpsdPkHZ3oRNprSL8Yg16Xf
	Axekh2BBQoS/3Qn6PeO7C3D4038rn3R5imcf1fMB+BSBjGPvucznwgIq
X-Gm-Gg: AYBFou1MMpruQlIDUSs55BoM/gfTyrMa62BdriBWVf3kfe03mznZXAIiC1zswDNcm93
	BPEVtk4Y9We+YCZbAUae76yxnXdMSFpXbUSVV8KTeJlPb9OR7VJNtrAhecgPeHuyV0h2Mayi6ZO
	mN1W1k/UcrIoQJ26UwAlniAJMdgbzoIiwaCLgWd5bPw7z3SxmDvPw6B/S2b5pCLC17v+5koWsRn
	oidP0YR/Ox/Vm+877Upy3yRTiHffOdOndH0DtloBWyOlWu3TO6SqZp0xPbiqdOnSYpMMOx/TUNT
	lp1LYH7B7sur8Zob2/kNnSZpJh8XB0TxvnOKvLVbcPtKrrVxMPyVAtr/Kcwb0jwHKmyXAZ6FeJP
	jWiz0BJg9H/SWPyi65UgWmO4n90sePIkrwfy3cpj+mYwNKto5HZXQXJIZv0pMpZuSMpcFoiaWqe
	kowrJ3FKXfyC4nErgLP6rLP1CxPHLnZMFGdEWYpdB1WlU3pDjGbQN3/y3yM/VuXuqxDfnM6AsSh
	+68j7CK9Q+dHcG3+0tI5GN6j70x5kQaLgn3AlqTNyUdr0fVVY6RdizuPYzod3vgs/kQ6D/pg29K
	RtpUpUncT5ZdcG4cfcMlA71phFrUJv4lBN4bXE3pBbSJXsb2UvqgYjHvFqUq
X-Received: by 2002:a05:6000:46c8:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e264af00emr8712598f8f.21.1792697948972;
        Thu, 22 Oct 2026 12:39:08 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38026a7fsm69730f8f.15.2026.10.22.12.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:39:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel stack with reduced page_len
Date: Thu, 22 Oct 2026 21:38:51 +0200
Message-ID: <20261022193853.670625-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_123911_822749_4BD09488 
X-CRM114-Status: GOOD (  12.96  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
stack data is copied and written to REG_SM0D1_REG. Equally on the read
part, an unnecessary read is done.

Guard these extra copy/write and read for the page_len to fix leaking
uninitialized stack memory.

Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..9ea5e3f9a763 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -144,7 +144,6 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u16 addr;
 	int i, j, ret, len, page_len;
 	u32 cmd;
-	u32 data[2];
 
 	i2c = i2c_get_adapdata(adap);
 
@@ -186,6 +185,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 		/* transfer data */
 		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
+			u32 data[2] = { };
+
 			page_len = (len >= 8) ? 8 : len;
 
 			if (pmsg->flags & I2C_M_RD) {
@@ -194,7 +195,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			} else {
 				memcpy(data, &pmsg->buf[j], page_len);
 				iowrite32(data[0], i2c->base + REG_SM0D0_REG);
-				iowrite32(data[1], i2c->base + REG_SM0D1_REG);
+				if (page_len > 4)
+					iowrite32(data[1], i2c->base + REG_SM0D1_REG);
 				cmd = SM0CTL1_WRITE;
 			}
 
@@ -204,7 +206,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 			if (pmsg->flags & I2C_M_RD) {
 				data[0] = ioread32(i2c->base + REG_SM0D0_REG);
-				data[1] = ioread32(i2c->base + REG_SM0D1_REG);
+				if (page_len > 4)
+					data[1] = ioread32(i2c->base + REG_SM0D1_REG);
 				memcpy(&pmsg->buf[j], data, page_len);
 			} else {
 				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
-- 
2.55.0


