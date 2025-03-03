Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D15C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BR4u24CndhoIfJBpcQq/sKMFSqWxEklL6+36Y45z0A=; b=KLp+RKWzqXFC+ti1HjvKNqznNi
	mfP7Qr5WihTyueh+CRVc4wInb+GOPs1cMlDxGKQszrZc1DNaW3VEAch2YZF1z7uaOJhZ7a+uvzaDc
	CFCaDnpohtuXwhDEq5B6YQKSvUvkPJ6o5aWwNrO0q64eEC8gyAU0uboVc3x+qiTECq86QjLAtVTAz
	RxOwZQ4QZQQCVNC0kOSqeVhRBFhBBcBZFBVh4XCDhnwxrJM+DlgZnR0zVwGbB+KSPhuzasrvFCRDj
	rQzBYR4uNxDp6kSp/46SFNuAaHajGTzDzO5ZJCtM5qTdg3cFwpgUv8m4tXCCYBoNJgc1AfbQW5coT
	6URB2X1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8UA-00000001TsK-1nvt;
	Mon, 03 Mar 2025 16:17:42 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8LA-00000001ROE-2DIM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:08:26 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 8CB6711401D5;
	Mon,  3 Mar 2025 11:08:20 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-03.internal (MEProxy); Mon, 03 Mar 2025 11:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741018100; x=1741104500; bh=6BR4u24CndhoIfJBpcQq/sKMFSqWxEkl
	L6+36Y45z0A=; b=Zi1qTlKj9Y6OldLM6lz620Az1C0Fh5UofcGoDQujGmDhXhnP
	gXTOWmBHhpSElCWfXqpyJOC3Mp08aQ4Zdn/rlms0a1DkANA9jvaArJ6sQrMp9OP0
	iTfumkBSDgj/43BigCCOEKsXLSLonfPgB4/TSY5YIQx88UdB6g6vVxjXoTkaqapU
	+aKgR/pBjT63bqh9xWeUD+/S9S6csjFWoHi/YqXrdppvFdj3wC+9jcFEhgl3ppJM
	mhOlXFCWGEz0f4Gxz4M7GF7C6QSqUFLd2TxKjbIQ6NtgYRtMY/Uv7YfvRx1kEaBq
	sJY9rJk/RyE8Dy6/hNUvBFO2jmxpenGPOqgbnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741018100; x=
	1741104500; bh=6BR4u24CndhoIfJBpcQq/sKMFSqWxEklL6+36Y45z0A=; b=4
	OcJ7WqUxMK0GCYXS5cCNJGVilnqLDiAO2sT1CZbDnF42DjxvfjyaVRxz5y2FjjEN
	91qdDDw0Y+DE+C00rHL212ryC5JNnBe5Wkl7u6DqFxzhWwsIL7cuH/PwCId+Eh8i
	BjWLmP/wLexMPe3fPYkLAE+s8b6YaqtD4HYcBjL+WDjP6ftYwaU3o6vlZKakBz/W
	9jWQvuQ6jI2wXslDU/wimmMyohIwkuXnmmO4BvpRLeLXLR7iLRDrIqMDC7m4sPOj
	SxSgpyZsqSf+rCJPeWR/uBjLhgyoTdvF3incKkO9mhIIAAU82ihYBfcDkJnNNiUd
	lABY+SlyAHXPWjwQ0Qy/Q==
X-ME-Sender: <xms:9NPFZ8sTUp1mbgzU5tk1eQzld_NYFRcwxeuZnZPZNEGi8gNK6VFDsA>
    <xme:9NPFZ5fr1EobKMMKm_mOBWKH4Y2xtO_Akv4eeOWSf9n2d0B-YfMv47uIQgWQj_Jau
    l1qrIG4i_lw1-7uzcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeeutedtleeiuefgjedvgfejvefftdekleei
    gefgfffhheehkeetleehgfetgedtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghn
    sehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehj
    sehjrghnnhgruhdrnhgvthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehl
    ihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghlhihsshgrsehrohhsvghnii
    ifvghighdrihhopdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9NPFZ3xR5kCZvrT6DI_V52eG2N3aSdTiCIJQlkiykupWVvBn0WLr-Q>
    <xmx:9NPFZ_OFeXr7SUqy90EjZW-ab4I8wO50H-gQGd8vZQiYmMJwC9ErEA>
    <xmx:9NPFZ88eXsZkgkXD89JAhuBR9lXriDFCyEgschTqBCmP3q67J67PLg>
    <xmx:9NPFZ3W0e29h2GHGOCUX9qX5D--dnCJKyWfMiQogBwGYsqGDm2eHTQ>
    <xmx:9NPFZ7mE15yIdZmTLNsEoPcZec4Sgi0x4SHGs65j5JGkj8hA3ses8Npk>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 00982BA006F; Mon,  3 Mar 2025 11:08:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 03 Mar 2025 17:07:59 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Neal Gompa" <neal@gompa.dev>, asahi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, "Janne Grunau" <j@jannau.net>
Message-Id: <634502ea-6389-43c8-8236-7f90f864f73a@app.fastmail.com>
In-Reply-To: <20250303154012.1417088-1-neal@gompa.dev>
References: <20250303154012.1417088-1-neal@gompa.dev>
Subject: Re: [PATCH] MAINTAINERS: Add myself (Neal Gompa) as a reviewer for ARM Apple
 support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_080824_916107_57445D50 
X-CRM114-Status: GOOD (  12.39  )
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

On Mon, Mar 3, 2025, at 16:40, Neal Gompa wrote:
> As a member of the Asahi Linux project, I (Neal) have been involved in
> reviewing the patches downstream as part of enabling the Fedora Asahi Remix
> distribution for years and have recently been reviewing patches for upstream
> submission as well.
>
> This formalizes my role as a reviewer for ARM Apple system support patches.
>
> Signed-off-by: Neal Gompa <neal@gompa.dev>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>

Nothing much to add to that. You've been reviewing all of our downstream
patches when preparing Fedora Asahi Remix kernels for quite a while now
and provided good feedback so it makes sense to make this official.

I'll pick this up in a few days together with an update to MAINTAINERS
that includes our SPI driver files which I think we missed last year [1].



Best,


Sven


[1] https://lore.kernel.org/asahi/20241106-asahi-spi-v5-3-e81a4f3a8e19@jannau.net/

