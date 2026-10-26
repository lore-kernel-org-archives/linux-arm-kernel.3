Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE9606A8CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=art9W6mV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ewfTgzr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=; b=art9W6mVwRQkHT
	M3teejdNC0yuhfj4CUcf3krr5A4p+rL1XPuc9/jBEck/O9VAKQTQ8z9BUcIXSuxCyrPWAmYjNhnw9
	ReFphLhJOOJmdbIWT3eqVopz2NYvSEG5dqOCSYEoaIIPFtFsdAEDEWKh5EfdCZC4yGTLYGj4KXHxm
	6hBlIjUKupBkdZyFb7gk77UFDZMaZO+xjNMfu2yYEz2VmBxIZz2UuJtENe2VyBgymudu5s1JUqNBe
	eoBWAllcZqnqyMAs7rIJLV912uiBVixFKxDpcfec56yCDgmSRmDJfRBJvSc74v/jWY5keFku3qVP0
	pSSF7QRfHBeYXRhWzw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHT6-00000002AEk-3awe;
	Mon, 26 Oct 2026 09:58:16 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSx-00000002A4w-3dTo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso1370670b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008687; x=1793613487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=;
        b=ewfTgzr0vaia0Stg6x7fCEi9Wpn7ttYHLsLWQMj4645YkXB2wcN88vo+QaSgewdNh7
         awiu4FnZyzsbIeV1nC1RTDQoQF714ey+apc1K2idUl6R1YNobp0NKZhWjxF6GTdbiPRP
         lellNuZIhofxaKDv3pG5i0V+kNClp9rNvVsjYkaHB7yjXKyLUhJ4uBl4Tr85v7TtBnKR
         ybjt/Hyzr/+If7grCqQLt8ON2xZLeVdEOf+/GdHqmZVgLv5fozm00HCJ+8khAfSxtwtx
         YD/Zb3StO7dkc7EUByAZxI3g8GNOivSlpyd9h7AlTKqvGBCxfsM23udo4NpY7KXxSgYF
         gRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008687; x=1793613487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=;
        b=pQTMj4oFqtF/EwU4gZOFDdCib5HhvkkFip9ppynq1jvmM9LXkjymbpq2Vj4NV4S1rU
         hWzW7mVzLjIZZoa5oj3nB+QTTr6JvRr5jYjXutCd/QdohI2w4bIvsDBMzCY1ujqE/izQ
         9Y2lBQagqty8WoHHYp9uhuSh/gXBoF53G6n9UYeoFNVtg7x0WL14Y/RKFW27kG72hwnL
         kXJdab9R5W4KtGBLIdFMu8DOuhnJDqfKB+gwAldMazaq7AWyRQZV1pIwZBlF3pYNLQ5Q
         MjdjApWr7x0YSOMs7qjl+tYkL/e/3t/buZToyjDS4ck3hoBkK/6K9nfUeizsNr+9iuLN
         HqZg==
X-Forwarded-Encrypted: i=1; AKwUvBzDAur5NSgbaVv2IzEaVbYbxU/riaI6gcPAMIlbtoDN/cG+dSVNKQqtiOPFvWjs1yBqnfOEfLhyVeFa56N5VAWX@lists.infradead.org
X-Gm-Message-State: AFq9FYI1ZJMg4cBgO73c0tEgcHJPxGKEcibDW4O0EZlxbmhow1mGG8MN
	cANyIHiR27Np5fpgIQv5BkyUNXNAa59rABftXItURhXvBE4sZ+u8XiYk
X-Gm-Gg: AYBFou1KPL4Tkm66jxkmKiyGNoVPAwSbx+6M6ftGl/NUV2dENUMt26xt7WAepdrGIMm
	/m4DNrZRZzxPBYSi1XRtrhbgy1ppKQBR94xOv8+wCsmZ5ye1pgnZ/zY1ydaVmX82r0C+/gP6wTs
	bGEGa4iX7jcxG3CH12cV5Vumh5fAVTZY1m9IRsjK8oz0Qw+v72UuthYUCPTdkBiPnGVDFQqc6g0
	y0OPqZkdW1ezBQmG8yDhgoW1jsIAgcYsYVGArkLC12z20hNEImbprbVBvFwSXFyn+gKz3UaG9rI
	c0kilbAbkQZLIqJda3AdO1icM7jh97EXMnLw7kp/AglGsVJ3SMTKU8vLAsK9NHpqVsXVMIGmWom
	70uDdVTiNoBE0a6QNOXfHlXD2E2rulAW1rvwKV090aIFCmaf0Nw3HrHjQDlGIN6oyNd3ba+eXpB
	OmcRgTRBKEa1oRXDyfQcCo0n4KC1VsTX+eRHogyA8O3V4TWTn2n00GRkRCBUrJz/v7PXhfoUi/M
	PQAKvtLP9ZOE+N+JE8I318nwT4M+I5SX0PLFYGJgGEEqyM6hRJRA+KEkpjgY/IXKsJmvYslLeeA
	SUUUp19IyQ==
X-Received: by 2002:a05:6300:6bc9:b0:3e0:ee68:77e9 with SMTP id adf61e73a8af0-3e7bfa1f8ccmr4070259637.14.1793008686851;
        Mon, 26 Oct 2026 02:58:06 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:06 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:30 +0800
Subject: [PATCH net v6 3/4] net: ethernet: mtk_wed: free up rings during
 detach
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-3-a52f6b15d2fc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1486;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=UWHNlBK328nlitWq3waPngcB77Xg7ScOwadSLgwLsIE=;
 b=LcWwNARY5jB8Z5a4CvUeT9ByKEYHzcoTRjRnxOpYFt8K3OYc1Wc+OQfcw9T3+x6N+n9wZodMM
 vTQfLdPO0efAw5SswG0HyEDttPwooeBxSl8S8ABpC+lIWlPcNYoRqqJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025807_948759_9D6A04A4 
X-CRM114-Status: GOOD (  11.35  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

During __mtk_wed_detach, rx_ring and tx_wdma aren't freed up.

Fix this by add them to mtk_wed_free_rx_rings.

This patch is pulled from mtk-openwrt-feeds to address Sashiko's review
and edit to rely on ring->desc instead of an extra flag.

Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch
Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/message/179000700034.2160803.10594281691384015089%40kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3f0be70c3f14..3044a7a8ea03 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -949,6 +949,14 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, struct mtk_wed_ring *ring)
 static void
 mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++)
+		mtk_wed_free_ring(dev, &dev->rx_ring[i]);
+
+	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
+		mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
+
 	mtk_wed_free_rx_buffer(dev);
 	mtk_wed_free_ring(dev, &dev->rro.ring);
 }

-- 
2.55.0


