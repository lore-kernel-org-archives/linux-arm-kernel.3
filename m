Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E2606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2vIyxLuY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMq0r6i4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=; b=2vIyxLuYeVsOCbaNSJQ+UCRgtS
	AV4OukX0hnlcKAKBtEpqZGeDO6MAXDbISOFWjWgCWT8AeGHDob8ktp6uBXiYZ9EvrGwjbpRvbHORT
	p+b2gLJcGEsY9WK5UENq4XYYODqyRYukSkcYkOs5AbPt6HXPkAGfZI9MIVWdtpN1nZyOsKXztplLe
	Ffv0rbm48Kek383h8+x9yVhX8/7zH7c7KWOKP7Wiat9hh9GWC7Poy2DdlWosQKT3HJ6/ff9D3EO6U
	VXa7MPa7TiAYwvoYS9A3GUnBDZ3caefkDaKdRCvZcdOvEgDDKGUOwvf1CaBWRON0Nf3AQ4ZlTectQ
	wdy+MMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOc6N-00000005evo-3rVV;
	Wed, 04 Nov 2026 14:36:35 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOc6K-00000005euU-0kaf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:36:34 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1218753eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802990; x=1794407790; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=;
        b=bMq0r6i4KCDzTw+fkhZFW/M6pIwaFkxuTeklprnt/ife0Z+Zhwaw9V6RXjobtaNAhs
         oRdJ9vVi+UTXlxrg94NztmdhZ9ByBx/h02pqrOBCs42LgGtRAOv2RJovfdGGw4n7ntyj
         uaZKKTleya1qdDt297mWMP+/5Trqe8sEjcPjHxcNdl26us3AqrFsjmw0GSAP3aq9dtUk
         d2hCfykRy+3FOwcJ62nLxK79fMXskNHEPdgXfr8Ij4VM0M1GUAo8Sgdgq2P0pn5hHMQN
         G4OghRLKxcbmNXvDfggzNOVjHveMJRVtKrlb0x5+cbdUXZb1bq2/pgC/6etDeznITRXw
         YSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802990; x=1794407790;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=;
        b=24vWA8A/B7kAyhpkJozF/By19ss0m8Dfa36XxS1CiULjlxUa70S1FJYuMIWRJPlFUt
         8jCuB+4NyNN2Jgh0vaoyALRat3LJG5hIDXOgKGvRES4PY0rVWHmW75pSI437gncFTQhz
         vGPlG6l45CUgx6+bERq4lXjhOy8/B4//jfempBuowyTi/8imyt0ayLVVkcE4Pt5CMaBQ
         A6WhVX7UGjLn+1olFy8u16NuKFhbWfXVx13unw69X7nQ0kcFR5DOYxtbqOfBhBefcYom
         z3154O3OtqVguxS0L3MubN1Vo5kADVB6DUS1drZH3/ywxU6fHimYE6DRxZrTrpp54R2d
         5Eow==
X-Forwarded-Encrypted: i=1; AKwUvBzyXoFimv+YLkBvIxsvjToqgMoFo1LoOzkEBDMzvyD9xcAVuJNoU2bfaEpoRRkfJwEhAiCUFjbrg0JMEONonRS5@lists.infradead.org
X-Gm-Message-State: APuU4Z88oOgUFyHbo0E7VTUzQoINOppTsb+3/ybzE77mtrmqXg8b2f+k
	PftO7D1icE7VlCI99q+MErErgypnCckjCCFmlCSqCL4ddGoVJZAFRpos
X-Gm-Gg: AYBFou2IHHQw5vvLLPIgfEztZOC4mJelkMOeAtGnVUPF+cb0B01RI2aR/P46PYfmJoQ
	0Fa/Y7gSiR8xyhuGI7q4Ei7OQU7p/KEYq7we7tlK96gxnV4vC/V6vTI2SIYyMqbKwqSFWCjDgX6
	4OsQ+818xJm4gHN5EmvdKn80DycxBlT+JRkPD22PhrSuNKzSBsTDNtzkmhgALfkGEyhsgemkeNW
	iHAlcvYKlOtqFor4k7xoxSW1mtvbBNkL0d8wrZ6RsS7kbBf6W0MrguFsBKP/1wyoQocMBhx2Thx
	3faFqOQlErzON5trJcQ5Zia5eJ4MoCASk9QFX+fOambdoPMA05xvOX8fVhY5SVXmWqmiAA2NuLT
	mnpiRREDWkNQCYveANfwi9Ag2WpDMa9/FwYF2yhau0CglEbjf/ySkEMPdoWbmuWpwLE+FyzFPVD
	63slph4L5Qz5CBdW8RKYKiWh8qoAAdyXy1GkdyLC4ajhVf7Ur84s08rUTuUm6Ee/0d6UbmKKBwb
	cVMzKhIrAcqDUhYGDNTx+8y2o00Wt2qPasJ0F3A668qTkHBOsX43S9cqirRV/Srd69zZYXREwCO
	peD3NPxEs4L18SrrDPu2acH6BosGYvXu/H2yygOnqG3jcD/0040vtkQGlaQ=
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr29593192eec.35.1793802990157;
        Wed, 04 Nov 2026 06:36:30 -0800 (PST)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm6208241eec.5.2026.11.04.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:36:28 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Wed, 04 Nov 2026 22:36:11 +0800
Subject: [PATCH] net: ethernet: mtk_wed: fix double free in
 mtk_wed_rx_reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-double-free-v1-1-efa52326702f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBRF0a3IH2uiRRO2IgZaD18EaRGJ2Ltie
 Ab3XuThGJ7K6CKHgz0vc4CMI7JDM/cQ3AaTSpSWMslEu+xmgugcIIw2RW5VnhZWUyhWh47P71b
 Vv/1uRtjtXdB9Pyt+IfBvAAAA
X-Change-ID: 20261104-double-free-b6b95c2539c6
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793802984; l=1229;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=BAz+fNM/Iyf94+H1t6m97KLkVam+zChfLqMn+estExE=;
 b=n902yQuPJrVcZaUjXryGj97qgtl3JwbpauFUgWDNdIsyHcSg+2Qqp6KztWjzVWsc0l44pJhUw
 UWdl6ZEPjM4AWQvGOzBGd31a3rOHoTI09O+BKXmwl4p8a63U8pOu72N
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_063632_215483_B59F8D8E 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

mtk_wed_free_rx_buffer already calls mtk_wed_hwrro_free_buffer but
mtk_wed_rx_reset calls both subsequently. This would cause double free
because dma_free_coherent doesn't set freed desc to NULL.

Fix this by removing the mtk_wed_hwrro_free_buffer in mtk_wed_rx_reset.

Compile tested only because I don't own v3 hardware.

Fixes: 1543b8ff02f0 ("net: ethernet: mtk_wed: add wed 3.0 reset support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/map/216156
Cc: stable@vger.kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index f40ac5794341..5e9674c9e63a 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1723,7 +1723,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
 				   false);
 	}
 	mtk_wed_free_rx_buffer(dev);
-	mtk_wed_hwrro_free_buffer(dev);
 
 	return 0;
 }

---
base-commit: 11140c51df12e594d6bf2c8d2af5dec63b0219ac
change-id: 20261104-double-free-b6b95c2539c6

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>


