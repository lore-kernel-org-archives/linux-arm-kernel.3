Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6F2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ReOt+/AY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Ylzkyi/0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S8kh9aMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=; b=ReOt+/AYKgR8VZuKuobpzZ34nI
	Eq/FvANOxagppG220gNlikWkipFQyJobBpNdYMC/LzfDzUJT64+S0sm4bqOU7n+/55HCZX+CHOIDc
	IljGwr5eMNuX+yXvVPcntKNw3q000W3A6DonSss+4animCjIFFmYGPLwZFVacuQ+8sPUMCNnJW03o
	IDwUXsGjyaHIo66QnIrfp4hosEyTOe5P/Eo+/UszYK98bM5pG6rIP0q0zilBLae/+NuU9WJSzKHEU
	djZDTNSgnrZfIBaVEIifWrNLWvg7ixuAsUckVZvKb35bVvhDGow17Hddn/e6Gcd2t9TC/xmld8oCJ
	W+chj2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSte-0000000BWZu-1JRV;
	Wed, 21 Oct 2026 09:46:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJStc-0000000BWYh-1lyZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=; b=Ylzkyi/0268qOOLAzhrM6skHJ3
	WomVpwn0HghJxTpUEiT0g+m+Ca7KJSekWQRE8hORA6WCj3KnGNouykeMouVDT7FFXZsAXwdWWd882
	qbeWKWZ8f8EPBQmDK1ynYq0Bn4TUwpSp2eQpdJYxhmV9ZBQMksK6FxWHLQGL/bp2Fp9tIuLMIkp8I
	52MHoyUp7+5T5wm1Z2T019JWaFUzbTxr2b5c4bAOKm044RG8cte/gka7M1uSxqluA/h+tr8zjGfL0
	G/wxCosEqLy1kLEqDZulYaR3SvifdrBaUBsu1MYpANoMect2KwmTU+qBBGDCUQHKBYMwxrVChyy0K
	cKD/L1rQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJStY-00000005fRg-440q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:46:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so3474195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575962; x=1793180762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=S8kh9aMmOy4yzOMol7iwVjPdyxNHZRYXCdhbI+ooxD3beu4ULswK3u+gjLhTZi88p2
         A136JIlSbZwikC7NgvN38aXR66XJOc2+Z9Wqf3E2pd7JBWhr7/XR78zTjPNVJ7eH34RV
         +gVZGnekwON4ui7U216RoIRf8siXg05tgvAbfxyteKoYwklWr0Igymm/BWBc4nhz1DRG
         pUND/cuqSUexNf8UnTJbaMQ5n0LQYN1tEldTUQoRxMsG1rAty/EIbLA0OvuDrqO4Wfmq
         V+MZxhUDyOp4Do7gWhJaYj5ePlbWcpYrHuQ1Be+GgucYCZNtiFYcNy5Gpa9qfTC7KNT/
         SiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575962; x=1793180762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=tsITGsGyY/RhKu4Txz/4bX+wQ31Yw+jyMoes+jFsh0HPMT0+RNEFZ2OdjtXDt6sR40
         50mndovw9gtDixsWssB/U4vGqFbr1jcA0qhOunseMmSMbmW7VZ7Jg4nFnFlHB+HfBPwi
         ivuZzwSPlly5ddimvbxR9raTeOHR21l8ROOs2t+EUiYZrDMOq+QGDigJetCnKXWELbvL
         fRXYSmJIzbrqutH/7fxirp0I13GsoEFmhiHNFbbldhV62KZ9h2FptAnuQ6G8AlqPaJ2z
         pUY60zbEObn1rvG+QwECVndHnRcEhY85V+MMuKxxlrYYzJCiBngh5LAs+VpnDrseGQmc
         HC+g==
X-Forwarded-Encrypted: i=1; AKwUvBz1q0uUczs0gy1NcjZNsupePKFolZLcSR+k+zsUVkd1D9S0gLjlNSBsQVYfnjt1g60rMhybj2SgwuZALZx4ywZy@lists.infradead.org
X-Gm-Message-State: AFq9FYKMYAtWZXprgD9BLW/L+4l3rHYsiXOIlXCAjw5L2vUGL2PS4ogm
	hWPn6HnTh48VDVBbj+IyoD/m3W8IFi53f+WHuPkFT6nu0YacINhcTc9e
X-Gm-Gg: AYBFou1Nj6okZUq1waBWh3jAE+cHkPqZU7/ITKbWp71sklydYV/SCUB8xivwKbZam4Q
	YPVmfcPswk4ok2Ko6wpgMLnRclVh5aTWZBTC0R9vcB7vpQWfUIjJenOsOFXdervdJHLGESKHml3
	ZWo7CjBLnAwE3rlCLIRxMVc2cnJOaklq8FeIFa1vh4k4w7puQGZmehZ+RaqViVQLcxjoYUAAxA/
	SQg5RkGHI9MDESA3HTAgVVnsE6/yKXqah8U20RUozIJVZpNJklilG/cmJudFbt/xQ4f+fumNYv1
	YDcBJzqWII+JHmFRoQ1+oGip64zESIy8G2A/kvhizKgNlyTRUNbCQe57awBSD0hFXkQO25/T7sU
	Q9VtMEZwNz9JskbDY6gLle62fGPrlFXNAZEIqeNOSq9dU0+yRL3ZdAVm+sh/7i/0ChKy8kruLAg
	qerev3GgzqCAHaFvr3qPmARiBmVEXgW3p1aUy8xM7mq9JvPSA8qtYrCc8QSaQY+ctSXfIMAAoeX
	2cdRwkKLMFqbzTVC3oSaPhBxC0rnzHsuUVU2tS15S6vVmO2vrw=
X-Received: by 2002:a05:600c:1f95:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1fdd109camr28889945e9.28.1792575961841;
        Wed, 21 Oct 2026 02:46:01 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258427cesm4320300f8f.52.2026.10.21.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:46:00 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	bmasney+clk@redhat.com,
	dakr@kernel.org,
	jbrunet+clk@baylibre.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	nicolas.frattaroli@collabora.com,
	o-takashi@sakamocchi.jp,
	sboyd@kernel.org,
	sjoerd@collabora.com,
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
Date: Wed, 21 Oct 2026 11:45:20 +0200
Message-ID: <20261021094542.59417-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921102522.1640072-4-akkun11.open@gmail.com>
References: <20260921102522.1640072-4-akkun11.open@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_104605_380187_156E8A0C 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I tested this patch on the Sony PlayStation Classic Mini (MT8167) and
unfortunately it breaks HDMI output.

MediaTek HDMI PHY driver registers the hdmtx_clkdig_cts clock at runtime
[1]. When this patch is applied, the following boot error appears:

10018300.hdmi-phy: error -EEXIST: failed to register clk 'hdmtx_dig_cts'
  (0xffff0000018539a0)
10018300.hdmi-phy: error -EEXIST: Failed to register PLL
10018300.hdmi-phy: probe with driver mediatek-hdmi-phy failed with error
  -17

The original problem is caused by having the HDMI PHY node disabled in the
DTS, which is usually the dtsi default, but it does not happen if the
HDMI PHY is enabled. If this is merged I think this error would show
up on all the affected SoCs.

[1] https://github.com/torvalds/linux/blob/a804c5742bff224d4cb4d25dd383554d598be32b/drivers/phy/mediatek/phy-mtk-hdmi.c#L140
--
Luca


