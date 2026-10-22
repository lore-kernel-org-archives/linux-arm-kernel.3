Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE7606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=njVtoFwU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jMFCvz6g;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tLtabJxC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=; b=njVtoFwUzcBtX5jmwyxooCt36O
	wqAitHv7xe1iaqTIOlwgl46m2JAxQwZUWm4ZgLAkeIRSJY9UBWSgUhUSfqRVK3+PEPn1h80eHRP4c
	gml2ERkFySh5vAiAvu53Lxf1LI/lo4jPlGnbbB1Y1gyBxgsysFVJq7q4g+NM+C1qzbmBDshjPtfmp
	9HVpKgoCtxAr8n6mN9zQkkh4jcEXYJhlxk3VFh2ANhzPH7laaqqI0kDdZvN76q6wOhxu1Wbyijm/J
	xAYMHXYhGKiswRZIk0uinlTN1LaMN4L4dx2iIQQ06XUoKrfn0EfdRaI2GzoVLf/l0BSIxL7b3M//7
	OZbH4Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpvX-0000000DvME-2GEc;
	Thu, 22 Oct 2026 10:21:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpvW-0000000DvLV-2adg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 10:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=; b=jMFCvz6gq79l/BuJs7PiVwybUR
	4r7XbucLCJoXHZmTeQAKth6JKgudCWIAJnnRrQpOVjM/JwSKU9y0MrGrv97ixYzUYoJmfk9BvNBym
	5QP4ovxe9QIute/pENI1VGvaR4RYZLvCwSfVT9rHv1Em4wL/Na1qu6KOM8RZbV1xk4vKBzYxh0EQ/
	0bkTzEx/bHMbI4nbnMDI/9Hhz0W3q/+2Wku/YBAdEltT+yVnFtlxr9YqwaK64HZoQIYQmJggfGgxj
	tpSTvFPKsx8c8Ied1aU01HjyWUjAgFLB53NZONrBiWP3mERJrMap7/HRhM/1uo5iiXNFiCXAmchor
	xWyhvPoQ==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpvT-00000006rNw-0bt9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 10:21:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-89ff475a152so618606b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664491; x=1793269291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=;
        b=tLtabJxC2FTg0Ey9LcJy2LTi4izLURdxA8mTFiRx4iuEIeEAccCY+DdT4Lvts1JDx4
         Z/WDXcV5sEXgY+pp45JDDKlKUa1PmJ4h9BC4ahfPKK8v/Dp28cLnOwuJTnOfxXVQO+K3
         Z/Ltf9XCCPp4PefP0rjO7kFsTAkg/NfeFhwheEsV5+FSbGRpY8ZdO9CQzVQWzSPFLdJn
         pXROKrwh5AhNNUBaeHoaylOw0NvNMtWkCnFW56i4ZjIYvu8hHai6CmG1+aUf+RMdKIzG
         8owaUqea4t4Ly3/vhFRUsanQMM5+wTIA7vrBPp5/kjQyX4k2eg8bwCJxbPM5mNZIY/BM
         7LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664491; x=1793269291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=;
        b=C98O5TQaRTY4MSmwevM2oflmTiO/t+hVR+q4ZeEuxnNuDHlx3plncnXNtPmh9MtO8/
         OavSlQ1O5H/fK0XQ146VNaNeK9e1ENWuyzPHNM2MuZMqBWXMmRO/ZU5iyLOyTG0FJpX/
         FLrh/bG1KWhwcMn6xmJ1vwJzNF3c3euUlKvu6dQRTQCDHcy83HJuVszxcyD8nutQ6ghy
         o+HVFW4QSWpm1LrvChhvCM0m1qw+bi51RnD2xq3v4nudbrQJ02nfLLOPhaVl6AkGzx7p
         DdyPfP3TkDUd4o3qEg8cvSid3CPNWir35I4VkVtZpYCJEB9HqQq4NSRwht8yDeFEORFg
         NqbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqVtacwNNRlVkD9lWxcZ5L+L4i9JdQcHNzPJZ98yQx2gxHHAL9CyXsunzU3I1XCclMI+/3zVdIekxN5hDwmDQf@lists.infradead.org
X-Gm-Message-State: AFq9FYLme4Qp1i/YXnj+/Io0zgdyNEhtsGciD/0nXLIznxgMdBEa/3QE
	KA/FbwionckuYtdTRHFf5b+P7A0bevyh8uRc1PAQC/3WdG5vERBfkKGo
X-Gm-Gg: AYBFou1TCZ/4GdKJoza+aAf0HgLeTfeFa/vU69lmq1L1G45s1naWHOce/JuafUAiwIZ
	eQO4rjrX1+QGrfioyGQiSZWv5vIvFoBbQUE4pIYjEyEZcUUkBPI0P5bTPN1nDkyw35fZbguGE/j
	nrpXITw1XcwB+jfiI6eCfeioBa7MLckpinJOkdj/R1PO7vFRrIke6B3qKG7rmWMYRgbmKb9LwqD
	tMvnmpBo9FUkMeCNoSmx4k2jBiBsMKUHbPq7JSicKkNeqpnmbj6+3zyRXvEwVjD5KlbgzwI8YT/
	FuXA1pFrraYAfe6ojH3f1ROM5T1Y02bgJXo6gnz5wovh5l1kxucBW4cKdi7urIojEedhUiuH2QP
	+J1dCBxaldicghkPjjnJmIBtJn3NmnzV1ulOgfXnXM+ks9BFNDdeEL+RhezYd6jH3qBHQKrpTUw
	BaY1M382H/CiYdUJeQTXiViRuiRYUUEIO2pC8Zvs3d7Atuo99CRG8qgFaoCPP/gIQ3HVZhHDT7T
	D9sGH730IaTzEruRiHIP2xr6W+qepnmSFGsPO4HVXJC+6/FJEMd4Mc9XWSoEserkK3+wyEOWe2b
	giiQbCPVm3eJldTLjq5gOkehrQ5UZjdiUT/YEFWGf4+8zmiSL0tG8IAZJdbF0oPQ+5A6WeCziHo
	z6tWzFzbjC+bdbu+/ZXhDiG4LrgIjPEFw
X-Received: by 2002:a05:6a00:2e9e:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a089f6585dmr3709575b3a.41.1792664491420;
        Thu, 22 Oct 2026 03:21:31 -0700 (PDT)
Received: from fedora (aipl-202-179-95-46.static.ankhnet.net. [202.179.95.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08933c9b1sm1943324b3a.3.2026.10.22.03.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:21:30 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Date: Thu, 22 Oct 2026 15:50:20 +0530
Message-ID: <20261022102020.107609-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_112135_527649_BD6A2131 
X-CRM114-Status: GOOD (  13.18  )
X-Spam-Score: 0.1 (/)
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

Replace the ternary case with min() to pick the smaller of cap_len and
req_left.
No functional change intended. Compile tested only.
Found using Coccinelle.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/spi/spi-mtk-snfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 6e96e50fedad..bbb65a21a684 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1017,7 +1017,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
 			if (req_left)
 				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
 				       buf_fdm,
-				       cap_len < req_left ? cap_len : req_left);
+				       min(cap_len, req_left));
 		} else if (rd_offset < snf->buf_len) {
 			u32 cap_len = snf->buf_len - rd_offset;
 
-- 
2.56.0


