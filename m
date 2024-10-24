Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00569D0BB6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hzPHXL7yVtH/29drlD8KFCkU67ToL1b0s3TIV33fws=; b=zKH1NCbkMb7AHeB2YlQLb1a4io
	meof9vddoJ5xFZSMZfULmB9zQLThX5qdBF62a7yZV1CxESR9p05Zmwdm64t7TKLGs8N0zghrcRitb
	GMdqCGuGPLckeTpN11owk7uvwPx3x3FGD5zUFw1G+wgP9AL+P+4Nhr5aoUP7qCCI0G+3sje89LbaS
	kgObomUwd6n8su/wAj56G6s7U/9Bpi1khX2J+qH7GZGIcLZbRlFLTCHeUgoSzK+cRo7ssnYXuzgKV
	3IO4HD4/50sxrlKqiRSOXShSm/uKCAlEpQqEIwgWVq1gY7Ron+bsKOXzFvjE2WIDw4SWZJ9xfXxRo
	0i7Z3ylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3szl-0000000HEw0-1UL2;
	Thu, 24 Oct 2024 08:15:01 +0000
Received: from [43.135.94.23] (helo=mail.crupest.life)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sxl-0000000HEGx-2Nky
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:12:59 +0000
Message-ID: <3793b353-3324-46a5-a28e-c62632d979ce@crupest.life>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crupest.life;
	s=mail; t=1729756957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+hzPHXL7yVtH/29drlD8KFCkU67ToL1b0s3TIV33fws=;
	b=DSut3PAdDgDKav979ZySQ7xZ3PT3h9HN1WgojZXSzw9Qru8JRAIvHY9viC9y2v1oVN2Tjv
	jlbXjJnPiQH5D1W/1vURHMADBlqm6ZmD22LS7ZMcOwphwSBAjZT4TOcxIAffTnSxknirX1
	VhS1S6yogLIv+z+HwV/GUZZI6OM5O8XNtstuuQF4I2kjVsIInYtlzT6iv6iQX/+Qu6w6eJ
	WRVaYyznxI06a6gz0NW/CK7UnDjdGJttWT5pvmDWplMKHihHhYvGolMj2MuudgZbVk81Oj
	geJjv+nukk44nB0ECe7nTiG531Q/pSnJM58/4NB0AUJOQG9oOnuyXNrV9hjYlA==
Date: Thu, 24 Oct 2024 16:02:35 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Tor Vic <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io,
 gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru,
 conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
 mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
 ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org,
 s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru,
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
 <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Language: en-US
From: crupest <crupest@crupest.life>
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_011258_046046_60F36973 
X-CRM114-Status: GOOD (  11.17  )
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

 > multiple random anonymous accounts

Your assumption. No clue. But I don't understand how this is related to 
Greg Kroah-Hartman's patch.


> And FYI for the actual innocent bystanders who aren't troll farm accounts

Your judgement. I think they are not innocent. They would also think so. 
But I don't understand how this is related to Greg Kroah-Hartman's patch.


> the "various compliance requirements" are not just a US thing

**not just a US thing** does not help proving Greg Kroah-Hartman'spatch 
correctness.

> And by "news", I don't mean Russian state-sponsored spam.

I read. However, I think they are not **Russian state-sponsored spam**, 
maybe yes. Just like you

  think the news you read is real things. But I don't understand how 
this is related to Greg Kroah-Hartman's patch.


 > please use whatever mush you call brains

I'm using. I think you should have also used.

> I'm Finnish. Did you think I'd be *supporting* Russian aggression?

No, you won't. But I don't understand how this is related to 
Greg Kroah-Hartman's patch.

> Apparently it's not just lack of real news, it's lack of history 
knowledge too.

Your judgement. Maybe yes, maybe no. But I don't understand how this is 
related to Greg Kroah-Hartman'spatch.

I think a smart man like you should not make such wrong logic. And I 
don't think you have to be smart to understand this logic.

I think Linux world is a professional technology world. But I don't know 
how Greg Kroah-Hartman'spatch is professional or technology related.So 
we should **revert it** as it does not fix any bug or adds any feature 
or whatever and it removes some people's contribution. It is **clear** 
why this revert should be done.

If you merge Greg Kroah-Hartman'spatch but not merge this patch to 
revert it is because **you are the leader of Linux and you can do 
anything you want**, then I have nothing to say and just do whatever you 
want.

Have a happy life!


