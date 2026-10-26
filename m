Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10F606A8D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tz+oAbp4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=scKA6ZLx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=; b=tz+oAbp4x1bJ2B
	1aukXEaTMj3t1XSFjm1DNenz3Wb9Z7Hkn1fW1opIJyhlfO017cW9ByLgQWBsT4Xv+8FKIsFb6VcJu
	ZomEz3o4SNIJxg7rMupDiTXBMavDl3ee2LGjRoovCtJLbjOM4QtfPxIbO4hLy5gYpHmqkaO3q/Fzq
	ziOS9YmpxSmTH6E6bsbSexqePlfC4xTTd+8BeuQCQ43FG1FC1Vgp6HWTGTeZ6BSXj8OxKrPjfNGof
	TzzUiec/beM9XaxBkNU4XlUNoYtS3AY1znGFiZJ/wuAPGn2kiIrxQ1ivjHcqYZTGp2odZcTFV+CkZ
	xxpU5IXaYo6A4UwAXdxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSt-000000029yX-3hKa;
	Mon, 26 Oct 2026 09:58:03 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSo-000000029nW-2qHN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:01 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc502d509c0so750083a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008678; x=1793613478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=;
        b=scKA6ZLxuqCrfxTdBXH8fgVynCPY13YVe3QV4RcTOV6qvlTIvz/xCLuN5C6T7oLMw0
         ssfuiYW09OSnSP+BsjSCjxpn6zgB4bDiBepohs6jGJ//fVH9cSbRoebDue8J5PM473k7
         c1DH12zu/JhSs26pxnAWmXu6wPeDvqS4lpYE0zwUKCqU3/l+GGvNcjmaNabyxhzQP/PQ
         p8BWCw2Km7N8kh30jpO0P/E82sXqMlq9j1xc2mKu57+7Y7Uvx6Ak5rY/dBqEQuqUCrpX
         IaeFhn0GWUCGWA2dMl2oqdv85DihfR9J+7ysSbZcgoruyYfQJojYR7DPN/vnRRlI1HgD
         MX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008678; x=1793613478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=;
        b=CMVDD6MUYOh5AnQlsLDwI6as6pvh5z9C+QdrdWfIpiF+LV+QuuUerPykIFe0ahhD6z
         5qYfdNIVQkoyeqYxh54d/puregI83InB5s/+zil1TZ16oUrUy9pQGi6SFR1eca6nji9A
         o29l63ti1upZUM6pKl5hhRDddGXdEeyiztCrafj/ci5ZqwonQgnvvLwNn4FqzAddYCmy
         o1qw7LkhyNVarjnihPSmxmvxVwnBN0S638mwvkV9vqnC4NkT7jPY97ndVNYRJp+4nbQC
         M5h6ESLKu5VizpJsqkGWer9xLyy0bZdh1oCcKZUrdZwcvdV7O7IvLA905bLuanxhWVMm
         Wgaw==
X-Forwarded-Encrypted: i=1; AKwUvBzne5hk20UORNhmiRjHPnSoYruXj+w37uOKpbieG3PTSsrX3ywMPTq2c8RuNzC8TQcn276qbFO2mIcJTmqfLQFV@lists.infradead.org
X-Gm-Message-State: AFq9FYJDXRo4ZqXp//N194q+8vVi3Vbnx8S2kyO/gxezjeD+TfDcZxUY
	mlru6VgIKDAf7AU0O+ieBk8HGsO+xCf+QqcEPN0BgIs/VNtmRknMVEir
X-Gm-Gg: AYBFou1/sXMC596ZKTpxuMNDnGbsbnXe9+O99u4JRNpFoaOIWoXmq48wmw2aXuE76LR
	BMDKHRJm1fsYxVkQ6snkgcV1WFvl4ZbNe+xshaSdgvFM2v19bD5n1lXi1oUuCieD+zoXKX3zg9H
	XAY2ERArv0kq9Les/AEkwIQT+73YbZ7EBRixYgZ7HQyVXDTbsqlhjW15weLJMu8Vd/vdmaOvEtj
	kqkR0ROXb+yzEjC80vhsPZWJcZWMncgARh1d5gbKq/hqt4DDpPWfNAGco2l95nZZxUq40zgpmSR
	WRbPi6zZN2VN1aXTpV+V/sYelvQ9Cz8A79hd8cxKAZD/JXRWjoOgdsbPAv3yokedUb56oMxawEb
	2Jf0S442/qC7Hp8ZJk3JAoySpVS4J4dWqxvifTukIGr7qWJlH0VF8XcEASjRE2kUyqOSIGc05Jq
	Le/ihGNZlHF53K1LW8CAvDw6eKfEGtMKnMghgAVbNzYIvYQCjiCJAdbhZYg8o1LRsE3JsDxsu2+
	Vx7ntkqdpfPwlxXwDixiatyMoHfTZGAoXE+wzAt6YgSXUo6J17NiJpbSAS6GnJwwYErruVlu4oK
	iQFcgm4wvQ==
X-Received: by 2002:a05:6a20:9c16:b0:3e2:8fdc:a6cf with SMTP id adf61e73a8af0-3e7bfab8c31mr5045545637.30.1793008677695;
        Mon, 26 Oct 2026 02:57:57 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:57 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:28 +0800
Subject: [PATCH net v6 1/4] net: ethernet: mtk_wed: skip ring reset in
 wdma_tx_ring_setup for WED v3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-1-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1333;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=8HcC/sQ6Padav5RauewUundESxCJLuNyI/jOB6FPbeM=;
 b=R5SprU2ynkzohGH0ikExaLYx4+eF5xyVGdW5pS1EiVbSfrSOVQZkSRDrh4OMF2weeFfeqLWGL
 ZcrEU0rxM1SCaaLklufzqHafB/m9GBLE0QH7+amfullCkw11RjQdxO6
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025758_773488_FFE666F0 
X-CRM114-Status: GOOD (  12.52  )
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

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260711112128.971-1-hujy652@gmail.com?part=1
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 53d3b7e00e1c..d55042ccaff1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {

-- 
2.55.0


