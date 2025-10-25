Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309C5CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jeBt/C+M83/qY7P4oGOdCypT2/psEDSb60WbPhdsRo=; b=hYiKmgiHujLYIjGhUJzNcHpppj
	pzdS7wpTbCKUgytHHI90Pj3cInQrMA4GHgG9SGr/kq7JbLMHRuuDsaTketBdpQxQMkqraRsaA5I+8
	7qu5z3jym4g5ewcSZfcWI8G/AaYcIGPJiNBuBWQKkHL4JogpMdfIkFmjNufLz8/SkQvoaOFwoq4PB
	FFqsrlX5VIvFu7N7M3G+z5cwkAtkPQbmk6k2KRzhu5VJ0PeVpu/cZFLbNS+mJE7I8iqgewF1w7yct
	N+7SxJ9Zou0In7QeMmDRuFg2zS6X3vqXKclSnLqZFWvjnrZRe9BiXZpj8HEDIzbjdrSKXk3Gae0gv
	WGtH3INA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaLU-0000000B9Xj-2sGj;
	Sat, 25 Oct 2025 09:13:56 +0000
Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaLQ-0000000B9XL-3bdk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 09:13:55 +0000
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:41bc:b925:1818:463c])
	by smtp6-g21.free.fr (Postfix) with ESMTPS id 50F58780505;
	Sat, 25 Oct 2025 11:13:36 +0200 (CEST)
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Peng Fan" <peng.fan@nxp.com>,  "Daniel Mack" <daniel@zonque.org>,
  "Haojian Zhuang" <haojian.zhuang@gmail.com>,  "Jaroslav Kysela"
 <perex@perex.cz>,  "Takashi Iwai" <tiwai@suse.com>,  "Mark Brown"
 <broonie@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codec: Remove pxa2xx-ac97.c
In-Reply-To: <fd5451a1-9720-417a-915c-1ee3149426f2@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 18 Sep 2025 09:15:23 +0200")
References: <20250918-audio-v1-0-e9d0df5c60d2@nxp.com>
	<20250918-audio-v1-1-e9d0df5c60d2@nxp.com>
	<fd5451a1-9720-417a-915c-1ee3149426f2@app.fastmail.com>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Sat, 25 Oct 2025 11:13:05 +0200
Message-ID: <m2jz0j4a5a.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021353_237285_C5094563 
X-CRM114-Status: GOOD (  22.08  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Thu, Sep 18, 2025, at 07:44, Peng Fan wrote:
>> With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
>> commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
>> is no 'pxa2xx-ac97' platform device created by machine level code, so this
>> driver could be removed.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  sound/arm/Kconfig       |  10 --
>>  sound/arm/Makefile      |   3 -
>>  sound/arm/pxa2xx-ac97.c | 286 ------------------------------------------------
>>  3 files changed, 299 deletions(-)
>
> I think you are right, I was sure there was still a way to use this
> driver either as part of sound/soc/pxa/*, or as an alternative,
> but now I don't see how.
>
> If we do this, I think we should just merge pxa2xx-pcm-lib.c and
> snd-pxa2xx-lib.c into the respective callers in the sound/soc/pxa/
> driver.
>
> Robert, can you confirm?
Hi Arnd,

That'a a way of doing it, yet I would have chosen another path.
I would have taken all the code out of sound/arm/pxa2xx-pcm-lib.c, and
injected it into sound/soc/pxa2xx-pcm.c The reason is that the PCM code
is used across AC97, I2S and SSP. You would have to duplicate that if
you were to inject it to its callers.

I would also see with a keen eye the removal of sound/arm/*. Unless I'm
mistaken, this code only works in platform_data environments. And if you
want to leave only DT code, well ... the long term should be to remove
this part.

The code in sound/soc/pxa provides another access to the same
functionality (ie. sound on pxa platforms), and is DT compliant.

On a personal note, I only ever used sound/soc/pxa/* in all my boards,
and never arm/pxa/*. I'm not aware of any remaining users of sound/arm/*. 

Cheers.

--
Robert

