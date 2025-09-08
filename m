Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C9CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEDyurSVkEEgaG+aWPBLXsNNKgorcG4Yu6vrLBcD5x4=; b=rJLPetKbqQ9DdaAz0udDVECCsT
	6RLJicw9hlpxu4XVJzKGoCwLY/yR8HF0NSDlGZT4cl/vv++AwrgeZQJaHDAiDwqAHzsOVs6RUbYZx
	hr3hEBUtq/79RQCv04/uxjar8yUFJu8WbIFUPul69Z0zkPLhIaCVY61MHnyphW6ItJhxj0uDdIhfU
	7SU6Xh63SXDAwko5QM/dpIpmHyNm+/hePmTD7fihgH2KF8gixzYzt7oD/VPoiQhyVDzai+9YfMpVG
	xhrtLZhXLc+dKG+54tZZu4jTLqKnka56NXmokf28MyQYQR/QaiEAh+/mwyFzoD7xXw8qpkylsVndw
	Rcl/ajSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviYp-00000002DYC-3YNZ;
	Mon, 08 Sep 2025 20:33:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf2W-00000000rOD-2Zsd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3B80601D4;
	Mon,  8 Sep 2025 16:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E08FC4CEF5;
	Mon,  8 Sep 2025 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757350103;
	bh=s02kopzJSlYiqLDMIOwawddi1A/EA0OWXDvYYK5KGXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvVeuPPlqrgkwm4Pwfx2gBHC5PxzGc63nQRmK+0toXwiytOzIAQ4MkK7bBNEulbzg
	 rLqfUwrk0xPM7YLnH+wBIxkurrkEZ4StvdPFDqeq1QNfzBHusy1WuUoZTo6II6CF4W
	 J8gDrH5Bildq1JqbhzEXWsFG7q17Mw/EFt1OeF/GGDRMGX62WH2k+eIGhn8uJ4ZLvd
	 bHlQByov+zZ5mLeHJqNB1EPHKspjAGQoHkzuI75fDGydkYku3i2Brjccrn32M+H4fx
	 QD6C6N+YzGYrlZqVMOpZxhPdT/uBjp7zcvQxMY89q3ADIUfUjO2Qj5MLSCyj2QQJ5e
	 K+99E/YRZhmAA==
Date: Mon, 8 Sep 2025 09:47:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig
 selections
Message-ID: <20250908164706.GA1331@sol>
References: <20250906213523.84915-1-ebiggers@kernel.org>
 <20250906213523.84915-13-ebiggers@kernel.org>
 <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
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

On Mon, Sep 08, 2025 at 06:35:04PM +0200, Jason A. Donenfeld wrote:
> Hi Eric,
> 
> Just a small nit -- would you commit this with the subject line all
> lower case, like the other wireguard commits?

Done.

> By the way, I have been reading every single one of your patches. It
> didn't seem like it'd be useful for me to respond endlessly with
> Acked-by/Reviewed-by, so I haven't. But I have quite actively been
> looking through these series. Thanks for doing these cleanups and
> reorganizations. This patch here especially is quite the relief...

Thanks!  I think Acks/Reviews would still be helpful, as it shows that
someone else really read the patches.  Maybe you'd at least like to send
those for the cleanups for the algorithms used by WireGuard?

- Eric

