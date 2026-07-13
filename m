Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 02:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hRnTUulKPiYornA9CIY0YUDODR0Yv2On60iD5z+Ovw=; b=OEn08WaiEjAoo8wPA23+NpOPXQ
	5Wk5+BQ6EsNtwdr+GYHCbmnfLIzDdhgTawFajRHKhysALby8q55rfajmIeQXGFklmvRION2etkW+S
	dpWE8czyVaosP2JyQIToIJGEQyP5GQBhHrKp/S9MV8hRDhks/zsnPOsVT4toRZj53c0Kgxp+xHf/7
	qNWIwVTTLnCFueO300IAqMhNuhwXGpCcATeGh+LUR/eeb3EcwRcqxbkSi85rqnxi+hwjYbkmwu3DR
	sZGJ4DbDWcAGdNPtgT1h/3t1dNRqzA628ZcxA++dVL4aSZdN5Dh1iM6uJCo+Hr5NZR8dUPhB0OVUm
	p9pAKyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6rm-000000080Dp-16e5;
	Mon, 13 Jul 2026 02:57:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6rk-000000080DY-3xNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 02:57:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5BAB60018;
	Mon, 13 Jul 2026 02:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E390A1F000E9;
	Mon, 13 Jul 2026 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783911474;
	bh=/hRnTUulKPiYornA9CIY0YUDODR0Yv2On60iD5z+Ovw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cG28i22fpIZ9ePz2SOq4tK5Q2IBQh5aMchvOUFHUtm57MLqZkzCUNNxakiFVRMQEy
	 20JdUtNB3Sbbm/QamvF99sFUFy3J7LMocPnufg3Yez4nFaLE39ZoB7UeDy0/QOhPqh
	 a9MITHEmltMmi+Hyba5xGV4yNwt8eaAtrGuAEvYACfCPYqZM7gqHTexbjKyCoMHDsa
	 ZMyCtqlYfr7Xxl37jRRgqwzFPu/wzE9gBJ1K6ID4Jms6xpYZBSQ014GSUP3l3DhdHQ
	 n4teOvJqClQgWLxBmKDJcPwv1/63Mw1+9avBygJe+dgmtKJFKOpIQk0bP0JarAemz3
	 RSx0Z07Rr03WA==
Date: Sun, 12 Jul 2026 22:57:52 -0400
From: Eric Biggers <ebiggers@kernel.org>
To: demiobenour@gmail.com
Cc: Russell King <linux@armlinux.org.uk>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <20260713025752.GF4362@quark>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
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

On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> From: Demi Marie Obenour <demiobenour@gmail.com>
> 
> This driver is harmful:
> 
> - It is much slower than the CPU [1] [2].
> - It Has a history of bugs [2] [3].
> - It does not have exclusive access to the hardware [4], causing races
>   with the secure world.
> - It register its implementations with too low a cra_priority for them
>   to be actually used [5].
> 
> Therefore, disable it to ensure that nobody builds it into kernels they
> intend to ship.
> 
> In the future, the driver will be used for processing restricted media
> content.  However, the kernel does not currently support this.  Since
> the driver will have future uses, allow building it if COMPILE_TEST is
> enabled.
> 
> [1]: https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
> [2]: https://lore.kernel.org/r/20250615031807.GA81869@sol/
> [3]: https://lore.kernel.org/r/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com/
> [4]: https://lore.kernel.org/r/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com/
> [5]: https://lore.kernel.org/r/20260524204537.GB110177@quark/
> 
> Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>

Acked-by: Eric Biggers <ebiggers@kernel.org>

- Eric

