Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB29CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSxyMhepbltjo+/qfsH50GQ7y+k3llxjzRCuYimqObg=; b=WewX3ljzeKsInKlYFpCwvgKm3H
	wGv1A7640VdDi/1ELEOysyj/NUN3TeKbOYkeT6/sWGK8l0NIy5Dwc6NLvs1yeXzvEfH3ZTEKB12Bs
	/JbC0ACvWxloixmksi5DeC689Si+iuZ72vq4fkAdy/Z6X5IOWyT2ORwir+6EbsX+4NUADWvjMDWQq
	Dn2NdM7drlo4zBKwFPweh0Z6N3Ni/5vIOZAixxPlANGDjUefRIWnLov5wk6A5EqJ8zAtaBWMexBER
	b5nEZKuyXAY0L+GasntAF5+4DxnTz+Bs9bNjQ6XscFfEYNEZiE0zRkAeyqnoNIpJfI0wICjANIsnK
	Wrb7WSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUzn-00000005QxW-09EH;
	Thu, 14 May 2026 12:16:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUzl-00000005QxI-1dIw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 12:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pSxyMhepbltjo+/qfsH50GQ7y+k3llxjzRCuYimqObg=; b=PuVIsWGt4w3kr4lScOHZEx9psT
	1TSMC9poIx2IENKdygTtoS4gqmML85guMC3+3TY9jvdjhR5/wEvkx8WpEhR7jz8FW5IOlMyheH0qI
	gPI4/u437AYk7x+0suPOV/h118dfEaeRRh4yLNW0uAdNhF0BvtVZB8HlSDV/vqwwWH+GoJrlsHE13
	38RqSO6qXR0QennviDAjA8juz7RQSbdx9hX6v7bnaH4WKi3Ppq03kBa1xDZX/NcQC9tz4L2YwHTKH
	5lc0wwapYtXPGtcEx6108HekzKSRDaH4u58arfwZiTyGXmN+1Davh5pc0j+/OQ96AAcJ2jMgvZNn/
	FzYzUATw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUzh-00000002qYH-433s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pSxyMhepbltjo+/qfsH50GQ7y+k3llxjzRCuYimqObg=; b=RxES1V9AbPBFkgrLjmu0PiBWe8
	ulik2w1AH7SPArvIbxsubgsW9J0H8ELKcCdisyPfSZy4mlkJcWSSZ8/RQnxCFhsVyEdDq9/6w3IxX
	hyV3nJ1/v4d2Ao4lLDr1nHzyWxdCRN3zsXLjt7sOjagEZxx1wSbdxGz68Vc4T7d6Cz0Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNUzg-002tuE-Pw; Thu, 14 May 2026 14:16:48 +0200
Date: Thu, 14 May 2026 14:16:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: brgl@kernel.org, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] i2c: davinci: fix division by zero on missing
 clock-frequency
Message-ID: <1ce483f8-1d9a-40c3-a45e-6ca536010b20@lunn.ch>
References: <20260514103740.5416-1-chaitanya.msabnis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514103740.5416-1-chaitanya.msabnis@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_131650_433849_3216908D 
X-CRM114-Status: GOOD (  13.42  )
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

On Thu, May 14, 2026 at 04:07:40PM +0530, Chaitanya Sabnis wrote:
> When the 'clock-frequency' property is missing from the device tree,
> the driver falls back to DAVINCI_I2C_DEFAULT_BUS_FREQ. However, this
> macro is defined in kHz (100), whereas the device tree property is
> expected in Hz.
> 
> The probe function blindly divided the fallback value by 1000, causing
> integer truncation that resulted in dev->bus_freq = 0. This triggered
> a deterministic division-by-zero kernel panic when calculating clock
> dividers later in the probe sequence.
> 
> Fix this by isolating the division so it only applies to the Hz value
> read from the device tree, cleanly assigning the kHz default otherwise.

Why not keep the patch simple and just change the value of
DAVINCI_I2C_DEFAULT_BUS_FREQ to Hz?

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260514044726.57297C2BCB7@smtp.kernel.org/
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>

Please also added a Fixes: tag.

       Andrew

