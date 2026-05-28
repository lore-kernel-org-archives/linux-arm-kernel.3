Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C68CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRKrhgIJK76DvhKc8lDcKP3ib2MuR8el2Ira7SHuRmM=; b=dPdE2YpYdK1rGX89PNpak/BX8S
	LQZd1YGwB3d2DexwttVm+PIJwy8nF9bUL1DMq1MqmI+TQVShWKT7axGjaMWz9LaJuo8wcyebgHROD
	zqvDF7LOTqVgmVIU7w6EC5bNEbf3bZ2xVAILffaNACTW85t/oP+kcEXi3ojSXubc3BoXS3MIu23Hi
	2egcXKEcemW0s8KEhKTkaIdHUXNoEdWNBqd7Orh+OdngJOWMN9oqu3UtcazQjarolZ4bijkJ1zuT/
	bEP4pThCDt5ssmJ+AK99DjMRjqhIQaJInTBFLAPvjBNlWdpvsmoLlUtABQtGQbgJUG/rJN4BgtGAM
	GfRjpvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSU1V-00000005BRN-2o4e;
	Thu, 28 May 2026 06:15:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSU1R-00000005BQi-2VrR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:15:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05408401F5;
	Thu, 28 May 2026 06:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A541F000E9;
	Thu, 28 May 2026 06:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779948912;
	bh=sRKrhgIJK76DvhKc8lDcKP3ib2MuR8el2Ira7SHuRmM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=a1PiQ5PNbkQnWnC30lpTKTrwQYadp2w2p0U8B2MzUZ5lWlCEg0QyM8AMQpzycZygv
	 FvaONnp6/lnAoptcCj+C4fhPqVxWAHoPwlT2PsIAhUY7XxdXfxfB7r0gxJ/EkklHqh
	 U5ndV9vAuvynZvJxFqWjKIjjunTWrj5iQNfFfCbCVeDwjPS+jZvG6up2mqiawURVp1
	 10h8wkyHeYvVGogUukL9e+Tvhycvo9j0HJvcM0FO4shNmUGfNCdJHV4IA//H0sJ6Ur
	 z6ppWdUCbsjcN346iIBfcyHHa989xSLwor4KttyXLXjlad1+MJkD93DFKd1s+u05h5
	 GEt+TdRSegiSA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 16194F40079;
	Thu, 28 May 2026 02:15:11 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Thu, 28 May 2026 02:15:11 -0400
X-ME-Sender: <xms:bt0XajrytHanjxs_yj4VHOwSDlHzRL5SxpDAUSIT9g1uf-cLrEA6lw>
    <xme:bt0XaocSspHV73k8Rh0IljsG_YTbMQa0gYuD9E_9_B8B1jrErRuGPwms96rNTuWq8
    _f0Da94NGpalCFrHr12MT4ht7GSnQ07fFTPsZ4uPU-sNIzBCSjiEK4>
X-ME-Proxy-Cause: dmFkZTFYpebslvMFokJoFBZEvhS0RRgsf2rUv7/D81FLAhtEAxXQxJWExaQNrYQvlunXOY
    BzXZlDOzIwICfsvp+wnolkeo3xWaLn/+d/N1LoUHlWUfIIXpugElRdYZZhTKKZLx2NpaJJ
    PyWtUJneOFaEFjJXOZDovXcM+hcpCMkINXksgmiCh7FrU123DTD0mHWjBUvKOYhD8/JeTN
    TgPCJc7dtiYEtEx5zWv39oFWvBCiqMAXb7+6RwUz8fhWr3X8lIaHUIuBBnsPFiQvXo+j77
    IGXF3FavQsXan91HQUIjAEhEyd81hdiEOEQ6SWdmeeaV3xzlrbmsV5pyW87rxFO1TjRYav
    e5AhKyOc6w3NP2RJAbo6/Tvbd2Rovf/EbsfYc68imA924zqCOVWKi2MaPL5udgbalieRsA
    M/2Nqck6HrqAjYKDfE8dPO+thC/pusJd1m1kFl1hUMvXnbBzG6J0BR34+LSR0y1Tvrl2+B
    uxLxG3/KyN+eD08+3YAizm1p6ZaI8JM/3kES/5hVqTZUNaQnVyEpq1aF8mkaWJh0yN0R+O
    gF5o6cRko4vpi2DVE4lbi6sZ7pZSVT/Uil+xYbx06cpSUDfB9YPcSHustlMlrkIsF06PpB
    /0BqrViHB5NhSI7arFBkuGzWRFGbbY6KrbjEkCFwH78CDaDP+qSFu/R6R54g
X-ME-Proxy: <xmx:b90Xajr8S2ObbLDSohOd1_NPqRrPN5O1PNGuPqEpeC6IyTrIIQBCew>
    <xmx:b90Xaih0v199Mz6FRRhghaPgNUlTmWrXGttHjyt7rYw7bBsx7Hd0sg>
    <xmx:b90Xatx17OOg_OzLbvS1_aiB5T4_yiHY60aHTVCuxr28PCooE6xK3g>
    <xmx:b90Xao-mBPm8n5JsUbMvYRNM9JTvpVNBmiqte0PcOEG4yaJ8VeEiJw>
    <xmx:b90XaiC-u174RWXUQ5rTVkL4hh4sjD_5HdRLN_Xj-bbWaR1FoLJbAAXi>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E26E4182007A; Thu, 28 May 2026 02:15:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 28 May 2026 08:14:50 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Jann Horn" <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Message-Id: <87fbe311-5657-4e36-8a33-7404980a9df6@app.fastmail.com>
In-Reply-To: <ahfWnLIwZXJvbvNg@kernel.org>
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-30-ardb+git@google.com> <ahfWnLIwZXJvbvNg@kernel.org>
Subject: Re: [PATCH v6 13/15] sh: cast away constness from the zero page when flushing
 it from the cache
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_231513_688333_A30A7709 
X-CRM114-Status: GOOD (  10.71  )
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

Hi Mike,

On Thu, 28 May 2026, at 07:46, Mike Rapoport wrote:
> On Tue, May 26, 2026 at 07:59:00PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> SH performs cache maintenance on the zero page during boot, presumably
>> to ensure that any clearing of BSS that has occurred at startup is
>> visible to other CPUs and DMA devices.
>
> It flushes the cache there because before 6215d9f4470f ("arch, mm:
> consolidate empty_zero_page") empty_zero_page used was for boot parameters
> at the very early boot.
>
> I removed memset(empty_zero_page, 0, PAGE_SIZE) that was a line above but
> missed the cache flush. 
>
> This whole "clear zero-page" can be removed IMO.
> 

Good point.

