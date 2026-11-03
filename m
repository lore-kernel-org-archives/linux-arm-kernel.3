Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287B1606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kEws6jye;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MvyzUk0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=; b=kEws6jye9gxdZo
	xTsyCtot1AxK7l36D3S80zQfW1uIVF3OOr8RKWg6QXh6sokec8skw7lcL9Dnr3K7tZMz6rO3zQgD0
	7LSQ7ZHtg9BBBkeYTHIWI22I3iBdxBcqeg0+ouvOmUjNXd/ltMbmRDGR4dn1NLrjAK6GP1Y7rPUaS
	NVX5UZxyhAOhExj32iisrkDi65eEKc8r1tp+dYvD42EWYVpbKl5TMwvbliWNmPWzt3JMpkmRySMf6
	7K05Rjo9abYTO9wEd5DGGcODUf0naMRGR02vyvaSI5Q2DSVEgbMrcW5/2tY81XupR7B6kW1HhlGsd
	2ScLD5sEn+wYze0tpzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHe-00000003Qwb-4BTd;
	Tue, 03 Nov 2026 18:30:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHb-00000003Qtn-0ZRN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:30:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a208d93758so48074645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730653; x=1794335453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
        b=MvyzUk0fllrBbNBeyRtZB8OS1ueOqjyHFIfhbZ5W3Ywwp6mV0JDzjNuZWHKOsK33gs
         JgkIs2O2QeYdPDcsGwTqkR9NS26EUO8ZxvtpWQodNLJsTamDYA4W3q5yXPJBe7gXd9XL
         W8GMgr08tKahrc9YhnlmRt3Bb5qRrHMt26d35EvhxBqhBGBngmo1VGs6yhhZUKi8+EM4
         NuaFet3G65bOzxGa/tzlRnCpIYnDdOZDMA/VoYoxdWa7kNRFH4j6yu++VtWeSNFBHRvN
         Gms2c/+aSjDbUddIb5UDp1CcZSl01U4HStQHEmrg9l9eK24Z7XOQy8GWcEpcUNYy2MkG
         XMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730653; x=1794335453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
        b=xq2r968ymLREO0mQLYIeGWN81gOWaibDRu194wOSzEAqxDRD27kPkQETdgZQRAZf/w
         nYQWnaRlYUqBva6qKUt69jY5Te1athcuTfF3K3w2BpbAM20jgmxFhvFLRh3DNQEgW5D/
         KxDjy46nSM3vYVvMJbcWge3VqeKDLRibUN2lxh3BVVzawb1FkAJqSWbBJmm90FgrG9J8
         cdIA65x+FvUqeXznhzD1C1QHGqeujO9DsCWsAzW20PhDPgjsYNn+z+Ky2P7CrGJpTeyV
         8eoNE8qQ4+gIDum9Flz2hKLC6Q8NXNHHGsgSdNi0s7SgcRZ/5gbIdE0yuvKpZiz+myM8
         iXHA==
X-Forwarded-Encrypted: i=1; AKwUvBy7jBAQDx6U4F9ws633tBpoBHlsLtWMfvYTYBgVK9O9oc2rnYphUCa+B1F+zs07BtUYhmjQ3J0SYgjzxeVJPPr7@lists.infradead.org
X-Gm-Message-State: APuU4Z/jv2MStGDWWnSNymRrhre0r1lEr9TIB4V6WynjinnA0qrT7Iax
	bdvNkr5uTlmo8M0xS8jqq9t7yeiBsvFCwA++00qp3V7BiGbLiVdJaicR
X-Gm-Gg: AYBFou1ZRCbYMNlzi7E77JXaEG5wXCR0CQt+ourBAw6nYW90vnLEOtmUuBPR7ks9dzW
	4HX1oemqSoqesHQH/bXiZsPReMRlcA4MojO5gYyJGXMTC+l+NeIa7btLxDOdIjQZTUCJnK1ry2J
	D65k+DissjBXgJGzVUK8Dn4lE3XqqmBcqu2CIuCLLod3hRx4jVfXJpUakPnsdFRnBTUbdH5Cf+3
	Iva8Kndaf0ndvB8koH5hkEI5bQEa5W0goPWo8oUTJJq3wiTNKnkMy5pMFOHGqyOIDXUPQDUKYek
	JVn9jXndYPaEx5u5prSm8omACuC9lzkR1PaF0iOk1xvcGm840ZWvwzO8p5j7o+5sd0ubP3n04ei
	elKjlNuDsM3WYAaDspL1v/NG+vEAc55o1C+CQq4v1x7MUplojv5L0NCRBlRBHk+vU/Z34ynhoe+
	z3fDiM9WC4+M/c4UK3dq8/O6INnQWExVPBCCYf+vAapMVvYLMwrjcD6uLApQFfcIT8LMn7PK6D2
	RkiIOIvVOcdhggVoHA9Tw7iJRfvZ63rSqaWzGeHaVafLX//GQz7O8PioaACQoGH21ilVkPoWQPS
	B6t+7WnrlBnYggRER8L5Ue3+ZnbdQXw6znzvhgwD2iIBMkbkDkjZEsAN9+2NsTL0MWyBeuMmSRc
	TO+eytZd/K5sWcKr7JjNxFYi9QTFb9D4M/yaxFKa+W46MZHa4x0zPjhunaGK0c5/r7mjtDA183Q
	nfwngTurk7cq8HKQ6qDB1HJYVpSNVjiKa8IwjZFzcwFQ+ajeb7VRLmoWKgRfJDDJ9qefRRI3xQO
	8lWs0zY/zhnH620hJDI+S2h4EpOZ73Upa7t6bmVNJfLLPxj1w==
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr314385885e9.10.1793730653132;
        Tue, 03 Nov 2026 10:30:53 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:52 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/4] mmc: sunxi: Set the IDMA DMA mask
Date: Tue,  3 Nov 2026 19:30:28 +0100
Message-ID: <20261103183030.81078-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_103055_188043_8A9AAF63 
X-CRM114-Status: GOOD (  13.94  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Controllers with a non-zero idma_des_shift (D1, A100 and H616) store
buffer and descriptor addresses shifted right by two, so they can
address 34 bits of physical memory. The driver never sets a DMA mask,
so the default 32-bit mask applies. On boards with DRAM above 4 GiB,
like H616 boards with 4 GiB of DRAM starting at 0x40000000, every
buffer above that limit is needlessly bounced through SWIOTLB.

Set the DMA mask to the range the controller can address. For the
other controllers, it stays at 32 bits.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 9744b6b860ac..479420071c2d 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1385,6 +1385,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev,
+					DMA_BIT_MASK(32 + host->cfg->idma_des_shift));
+	if (ret)
+		goto error_disable_mmc;
+
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
 	if (!host->sg_cpu)
-- 
2.43.0


