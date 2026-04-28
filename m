Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDDAFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fP7ePjTcwfa8sYcTj+QY4Q4HIO8JodrbqgkRfuKs+58=; b=xA3zcLypH6Rs5ZN1B7Og8eLKpN
	GcsxBLiM/npeaGkDJ0Sl2wt3QJFcJO5b+/C/XAGw7ji0Ep71QI3sGH8XwrcMVB+4Qd8f6PBUbj1kc
	Lyzw6+ngNQJIDjTGIhV/d/+gvZakaYC3VEXrZq5ZQQzmoYyuvKxWoojZ06FmfWCQZgi7Q7+d7RUrW
	XxS3FCxx/vBc08xLc2HxSVtzaHUrtxGo5B8dhd5Xo6p9CzGsSFB7mDM9Ji6x5/XTAgzEnJoKvOokZ
	wjlGxUUzRrYmWZbzKe5U2foM6mCWNeAyaWLajnyYxvTACoo2zYbHmpH0QMpqRIDc3pMd/1Rtk2/13
	bqC40flg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiQw-00000001XF2-2oM1;
	Tue, 28 Apr 2026 13:25:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiQv-00000001XEX-29Bi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 13:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fP7ePjTcwfa8sYcTj+QY4Q4HIO8JodrbqgkRfuKs+58=; b=SZxm8wdi6UulXSjZbG7jBrbwMa
	ztgGnofpmMjh/BcBFtE2Zi0AvYOjI9SvPw/JBf1mIE69EgpQeMZecQOqBCLp1e/hdyTyOZDRAyZsx
	o/JdXvsDqe/54W+kmeH/z7wqSzO6bo2BFWp7uZ4IViQs38OKsZuD2ZopTcZh3UkVeIwymetR+9Olk
	BGHTs/GeDF+PedLyr2oRYTpUSnFLQWicl0U8KOUZheQZsIoSNRdYVGay1AUBirBRVLM3Nkx8lcKmW
	6LpkaItYov6kk2J1pImFLNxP9aIJnsthjyr2A02uv/WnLA2SmFqjDVUqLfG8R1Z/OyurGEnqozQxs
	m31X1w+A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiQs-000000039ll-0mFj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:25:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 489F440229;
	Tue, 28 Apr 2026 13:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F96C2BCAF;
	Tue, 28 Apr 2026 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777382694;
	bh=Mbk7GJhzzHEOvI4/qFSYDMc92u86YKebUsjdgehgAuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlkFwXz0zkNo/cS4uLIzu8CJsJA+Gy7EPJmTOv8jt5oOyjTHBpxdBg+ZaeE9UJW95
	 kedR9fTTgN57okQTaM4Gc8uQDIwuae5pRI41THfuXii83zd4ZVLFEn5m0mJVF/wx1u
	 OrSWGzqHcpIgtX6u2SeJ2bvUOnBTjgRi/5ejvOR707E6dfieaBBIwSAbX2fRwVkJKM
	 +eGjG0f1J/WooMr/yU+3UvUnNgeJn56Rj2h8JqMopfBiAYryhWKzBUWGhssSSbhaNI
	 CzxgFSlNyfeaVsdXgnTgkN7Gdap15ZEOZarc9TcUkvhh1C5X/5RakRkAxFJHm0P5vX
	 CO4oo/GbqRnmQ==
Date: Tue, 28 Apr 2026 15:24:48 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Bill Cox <waywardgeek@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, stable@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-sha204a - drop hwrng quality reduction
 for ATSHA204A
Message-ID: <cbk4ho3bpprjxvcywv4sudbmb2fhfsgaguoywv5mhtoql4vhd6@f7oisxcrvii4>
References: <20260428101430.514838-3-thorsten.blum@linux.dev>
 <25ntssyy6t5uwxlwfpmrpzpcq6xv62l643hflf26hxi6lv5wqu@6vub6ysczjvd>
 <afCo9PbDpTYeqGd4@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afCo9PbDpTYeqGd4@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_142458_418662_A516D76F 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Thorsten,

Bill also wrote about ATSHA204A [1]

  My best guess as to what's going on here is that the device has a
  ring-oscillator based entropy source, but that it generates only a few bits
  of entropy for each use.  It seems to be called before generating each
  32-byte "random" value, which is why the second set of 32-bit values have
  more possible values, and the 3rd has even more.  However, the number of
  unique values in the final column of 32*N byte values is always equal to
  the number of unique values of the entire string of bytes.

If this is true that the device generates <256 true random bits and then
mixes in non-volatile pseudorandom number generator to produce 256 bits,
then the quality should not be set to full 1024.

Marek

[1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html

On Tue, Apr 28, 2026 at 02:32:52PM +0200, Thorsten Blum wrote:
>
> Bill wrote in his review:
> 
>   "If I made no mistake (and I do make a lot), the "random" data from
>    the Atmel ATSHA204A is highly predictable when you disable the seed
>    update to EEPROM."
> 
> However, the atmel-sha204a driver doesn't operate the device in that
> mode. It uses the Random command with seed updates enabled, which is
> also what the datasheet recommends for highest security:
> 
>   "Microchip recommends that the EEPROM seed always be updated."
> 
> So the reported behavior doesn't reflect how the driver uses the device.
> 
> Thanks,
> Thorsten

