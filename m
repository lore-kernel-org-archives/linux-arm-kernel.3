Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A96606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wfR5QaS0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIA71DZE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=; b=wfR5QaS051w+6+7sVCVkLi7Vzm
	TLfLcqcY3jstAP+q3byGyYFUObnI40CI0mCFTnpKE/5siR8xrL9xtwfNj2ErAWSU92wmfP4HqbhHH
	dJeK/YRCUzVDQzyJxshCXtthve+PHP4mJ9K6DmmEU4bso7iC/NswENfligIbj+8Fz2vdI3Z0lPuR8
	DZkJ0LsY+IRllaMz8vTYUNMoWHB8JvrFsmSftwcGMHDbjRsYhD0/ZkXeoUZahhPbSILSVu721OGLh
	jbwJpSAkMhIsPj9NzBlBMpVWw2zaYBeSHIEfXs/1Cq6RJSxmakTVMYApb/bjIdsUPGVD1Zj3Ihp0f
	f79zaMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYsm-0000000CLui-2qZw;
	Wed, 21 Oct 2026 16:09:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYsj-0000000CLsx-1QQr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 16:09:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so6666975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598975; x=1793203775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=;
        b=LIA71DZEozYDb1TLL3+cU7OKVWNSs0dSTVz2rJJ6P4LIorycREQEViD1fQ+IWFK3fP
         G2C9UfV0RE5xANJztnTdaAcOEB68AbKd/Q84ly8ciYJlPCmc/QHqk1xYCsPAad42hZLi
         FepkPT2ZMFIX8wFn1ijBQ9yhnyqETrfm/gna7X+B4S9IH8B7aWPeDvQFK8LkLknYElJN
         iPxVeXCChRHQK90Pqo1ZEl6moXOCgvP4JpMoVDA5QR1pH8kI0XPV8p/zcd3jSYPxQdLS
         J7ydza5uVMoV6+nmf4+3f92cPLcgz5uHJRMMmp2UMWCmxAbwTzEdtLXjeEeR6SefPGSc
         KNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598975; x=1793203775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=;
        b=yY00FjP0cpwkj1axPposZWEkV3MLkblW9YRE9RAxlFNnUvHk7D7Krji8uADwz1tLkZ
         FJ5Ql3A/otPkDfP48CNiY+b/L9sItBxAr1qGpAF7YC95a7W+QRMs5fUFQgJQEXwVyBSx
         7Dzrb3/U8RB2/ItKuxFLcYbHUeqLqlqPXn6sIuJc9MFcrI+zmBqiaUesnIH9Tvm3rxBs
         v3SGCXgBrhF2PzpnyeCDRd3VROByonfefyIDS0YcBCrgdzq90EzodtRw5wnnvCv77PFt
         wDXWmP6HBAYoNe1lcw2J8D/MUC5fPtJoGgkrWQm0Jrjo0zFwB5n3u/agT2fpc97/z8SQ
         Gbow==
X-Forwarded-Encrypted: i=1; AKwUvBw89uWvnFWwZPeoYo3Gg2SLbShvVI/sM+OCKf40Gyia7z8xxX1b35hhgyL0nUplPv/N7iVNciubMladJJrEpYr6@lists.infradead.org
X-Gm-Message-State: AFq9FYKbCIRvOs/t5BJlcupn1uLfQKNUWFjjhM/4tFQnWFC4f9q6zMnn
	K7QBZxpTRWUHnxfN8Q60DnQgVH5pageI5uxd5qsA0weYGjyvWoXGVfI5zaJXSg==
X-Gm-Gg: AYBFou0UBx2VlqvJTKr64c13IkFaj5HQU9PzWlHrU+J+gvNa7HQ04Rdks2lCzqIl6xZ
	WQdn7dcvhwLeBKmApRD+jdX5SShwQsGxcDrNWg7xc1fI0KAPJFCqujmXwwn7Wjfy28bIcNtAyyB
	s9XQZT0S3IfA8iyZNTgC4g7hqGW0tAHTg7JW4A7ach2TTLJmUDXAuPeKZiFtf4OEF5Wob6xxwp4
	+D3GvVd5NCrY8BxhPa01LzSZyz/qCw3wbNcV8D/Cj7BLmCEPkhpAxMxo7AlFu9E4/vxger1Hf64
	RngsEmFMYcUgF4wDA07k3Jn0y24OnIks/H6fh7M738v3/pv9SiSl52RX+s1VJhaWEH8TsD9KrpF
	GpFDJajR6HHsWpGW4/1Mw/AFnOXc7runrTx/wyxOORNRsqyKBslb1+4G6I+5OqACI4Bunz0kOCa
	YzUxXPIeIYWFcXg48nPYQvxK30WsVUhoUVd+0STWjx6rqBYWrKDoA8pOpzZaWyFtQrDokH+UwK1
	Jc5eFkNMzYuRW9hUQCJi8cH59JiBvpwBTH6ud9K8Ou63jdOhAMrtUAvkyDIU5vSudzOnN3medq7
	w1t/oKX+xoxBAHgEpCKA6st3dHydnNwQRBxqdQilZcNesmdcJ/ihZC69gO9c
X-Received: by 2002:a05:600c:3b82:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a1fdaf7464mr60190065e9.7.1792598975417;
        Wed, 21 Oct 2026 09:09:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm6226569f8f.1.2026.10.21.09.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:09:34 -0700 (PDT)
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
Subject: [PATCH] i2c: mt7621: fix copying uninitialized kernel stack with reduced page_len
Date: Wed, 21 Oct 2026 18:09:24 +0200
Message-ID: <20261021160925.286424-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_090937_393960_51618265 
X-CRM114-Status: GOOD (  13.23  )
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
 drivers/i2c/busses/i2c-mt7621.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 19dde7c4069e..b4d2f9c5514d 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -96,7 +96,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
 	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
-	if (i2c->have_scl_stretch)
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
 		reg |= SM0CTL0_SCL_STRETCH;
 
 	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
@@ -302,9 +303,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Set SCL_STRETCH only for Mediatek SoC */
 	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
-		i2c->have_scl_stretch = true;
+		i2c->have_scl_stretch
 
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
-- 
2.55.0


