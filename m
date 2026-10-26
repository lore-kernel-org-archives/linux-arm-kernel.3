Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D267606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ojvr67Ep;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iGa5JcoD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=; b=ojvr67EpGsf+yLi5O5Pp96gUv7
	GCAWnKBvfAggitJahJt4nULoq3Umk8ldTUgOKCkMxprHEUZZYRGj4U+ZazIg+8RimPQRihtaneg58
	KE/e/1ow39Kv1Np3dukAsb4pTElVmaGKsfgZBBFVqwO4UYS18rw4XmwtffJyMGc0pmWfx4pS7n6N2
	jzDCFfRZ49wsSwfPWTyQq0J+fCKjuxZrODYs/Hcs1dv/oLkS7BREeeUXAL7KB1k6NURVvRqL11wkU
	NxmkAIWfRuip1ejXzVtPy6B4ua+xWN5sVM2F7TtGGwEWxC1HiE1ttmxN7OsPto/TMDnoFKDaURF3H
	Ro0raEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIlt-00000002MZx-1MHN;
	Mon, 26 Oct 2026 11:21:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIlq-00000002MZ0-38Oy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:21:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so11616385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013701; x=1793618501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=;
        b=iGa5JcoDOS4yaJhhXrrp5LjB//mF4ppkt71+AapHtiYF5Wt9SxVRBZnBSy3sGdT2HW
         wkQ5ILiZKaCMpDjxontdtNfa55ZbN9u559X4XFz8MAt/lauK2vKQe76HJIJNoQj8xykH
         Kl4FkUll+qELVknneBZmq+eWgExbovUtV2xvXwWZ2QzvUsYPrWintcdKRtV3nV1aFWGl
         K/0nUAW6cgjHf7iM612IKXW0MlXyuqgez2eVLDk3CZ4wXSfq/Y1WWTqJ1ERHhw69LIXP
         PpkjcqAkybALINnD7Ov8BH26FFHH6SZ7ZqC1PdRuL6oSkiYbsILsb8wF3OFEX1cpkHzR
         K8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013701; x=1793618501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=;
        b=eF2kV/Vw7fC8Ip8gASbRIpXn0gDgxYZFRxExz9zdq0YrjQrVwrxxQpPsoW4e1/86Qc
         c+OJkTzVXgN/c23o0e2v1lxFmqKURR49N3CmPbtP4UOAmkHWx48NIlwaOtyGf/FmUvC3
         lrM05eENobGbKW3c3ojox2uAYozUkucTQJlIHqFextNiSVAYdN8T6IHqgICrTgDC8SGb
         OC2+9vNnKRUzzHhYUV+Qy5jPz1980RL/8kHwKt+7f3YleH23yxoxVV6qlcGOXdQ2Ow8U
         WQ9/E+B3oAunvgUEb9sWskhHxaFvA5oW/2/46GDRp9N4MdXWydkNzZyr25q/BOPbBQMh
         SJJg==
X-Forwarded-Encrypted: i=1; AKwUvBxpSDmxVCuEGumRF1pEOZQN9Nyy/gfmp9QxlYY9TiA8f/AAjfRbE95vlwnrcsYcusjMfflFfSyYDH6xTxW0STNs@lists.infradead.org
X-Gm-Message-State: AFq9FYIQFiYBbhvwZKPG2VHDs7drn1Yy2wkJ1+oCQf8S4gRGi2HANPhL
	OqR7X8xM3XugRtuQyBKNeLmURNXjT+lVg19O0QCeLIIJ/iwDK9J3X/1t
X-Gm-Gg: AYBFou3ardM8T7FG7vvibNXqsVarQDpi0ghEe/jElLiRx4YVWJUBdQhWuUhYrZEbpIV
	cili3NoxAdzoBBaFSprcv9rCVCvo7Kffq3A/CNZ0+OXKstrXHwd0rOIEsBj4MeE0usEZBHCCkgj
	sS+ybkN3a/dnDuJSIvpp1BDYm9MUd4Zs3Y+IGzpSYT6JC/AXjj66zxisoAMOAxqJwfFqAS6taNN
	37cbTXgDf49JYepnnCsCupvhMKu14Y0JfqJ7NHmu9+3qEzMO+6Xsn5kC6Lgiz+3eg3VTBphVFxD
	+kURqYSnCyDgsLJCHFA33N0f/zZMBnNAWmmF5E3JUaEP1YoXbRRj1r69A4AinlQi3PzgwKLlKqR
	IOq8LrxHhKvHSC4AhmQ323PdB5PzkB18pSNTk/giSIz77OyQ7A86YF1Bu7mp1DD97OVP24lZg82
	SSfIW7x4SYiuLAjKPa14k1sWMXftUTtr1II/c5bMzRN3JzYg5auwEQizyf+nK1mSmETtyyYn+VX
	89NZQE0maWpMgJQ/yBDwfDs0KJYeDtFWQQ2eu+U6rNL6vFJYvmlV+zwLTRedeLg//lfjQtFXDva
	zVa/3Jks2Z3E/UEvLaR0ifGHUibTHUPp0vT87NkXYn96wFBK3X5G3TMsG//MR01tgV3XAKU=
X-Received: by 2002:a05:600c:870f:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a35ac9d1cdmr111940265e9.17.1793013700496;
        Mon, 26 Oct 2026 04:21:40 -0700 (PDT)
Received: from fedora ([185.252.220.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm16557911f8f.27.2026.10.26.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:39 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Date: Mon, 26 Oct 2026 16:50:33 +0530
Message-ID: <20261026112033.36310-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_042142_800084_6FDD410D 
X-CRM114-Status: GOOD (  11.44  )
X-Spam-Score: -1.9 (-)
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
Changes in v2:
- Join the memcpy() arguments onto one line as min() is shorter.

 drivers/spi/spi-mtk-snfi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 6e96e50fedad..7eb7b40db11d 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1016,8 +1016,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
 
 			if (req_left)
 				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
-				       buf_fdm,
-				       cap_len < req_left ? cap_len : req_left);
+				       buf_fdm, min(cap_len, req_left));
 		} else if (rd_offset < snf->buf_len) {
 			u32 cap_len = snf->buf_len - rd_offset;
 
-- 
2.56.0


