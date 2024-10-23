Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA74ECFA463
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ3gyldhS8joMJJp8RQYoZtzaPSJsdJPE2HaJSDoW4E=; b=wafHbWGugl1/HP/irnxpXdn48P
	O0uHE8E1H1E6DW8oWgCvxs+AOzRyeJlYWtwTyCNqxl/TsbYK906qhcQcCiyUPzM9+Z4K+cpu/iRKT
	epRXbLnDDibXYktQOC3EhO3j20uGPvn41OksNQN5r5iNvKnUadl24DXpV82+GyXX7oxaF+5eakwpe
	FFH0nmGFW7hqsql/BlJAwBRHklodW2FxutbP0A64pNY8y4xQMbwk34ZDsORFn35Nia71f8sGP7ImI
	P429xi8XgUtmsGyty5ZJU6AJjcNZDq3irzxYZwX/qGhku8GcmAdZ9qiypRFFoQYU/wTVH5ru1SBXr
	648/1ABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hfq-0000000FlwK-3sFn;
	Wed, 23 Oct 2024 20:09:42 +0000
Received: from mail.typeblog.net ([2a0b:8bc0:2:73c1::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gpe-0000000Fd3r-1Qtj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:15:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B5D5CFB3CF;
	Wed, 23 Oct 2024 21:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=typeblog.net;
	s=mailcow; t=1729710935;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AZ3gyldhS8joMJJp8RQYoZtzaPSJsdJPE2HaJSDoW4E=;
	b=kCijJnm08z9C55C1OhSt2FDysBPg1YmlgNXc/2YZ0FlY+o4LpPhyVh+A6Z4xKATicIabnV
	bjOmKV8EeUqsvTwommg0zwOPI8h5oL8stKnjWpYa/Y9vjZOkLBSbC75ZnmuJzab3LLFkV+
	NxQZ542GYTjTixcGInRplXXhTedUBKUxFHnyaDNzyh3n7srV9ueRkUbJaBjvi/3+wS3xtd
	yTtWzqgjv/IHq+jH9l/j/ot3YZfV6f8qVVFRrAgA7eKa0iaxH2UOklM9omy/KNe4d9se4T
	ZrHtzu6J58ko+Ki3zKtJMRnMpiLty2UMLVoEv10mo7x74bsRMHlpc8UyW85UzQ==
Message-ID: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
Date: Wed, 23 Oct 2024 15:15:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Peter Cai <peter@typeblog.net>
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_121546_727623_769F8C04 
X-CRM114-Status: GOOD (  20.92  )
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

Hi there,

Not a maintainer, but I have made several bug reports using this email 
address. At least 1 reasonably-sized patch is also currently under 
review in the networking mailing list, along with people from several 
American corporations, so hopefully you won't automatically assume this 
email came from a "Russian troll" account.

Ok. With that out of the way, if you still want to bother reading, 
here's why, in the most un-provocative tone possible, why your comments 
_completely_ miss the point why people are upset:

On 10/23/24 1:45 PM, Linus Torvalds wrote:
> Ok, lots of Russian trolls out and about. >
> It's entirely clear why the change was done, it's not getting
> reverted, and using multiple random anonymous accounts to try to
> "grass root" it by Russian troll factories isn't going to change
> anything.

Yes. Everybody who has more than 1 brain cell knows, in general, "why". 
The point was never to ask for the obvious response.

People are upset because no reference to _exactly which compliance 
requirement_ resulted in the removal of these maintainers. No 
open-source project can live outside of a political entity, but that is 
not the reason why "obviously" can be used to write off such a change.

Even just stating "we were contacted by <...> but details are under NDA" 
is a **much** better response than "due to various compliance 
requirements". No one is saying the LF or the Linux kernel should be 
outside of politics. That's impossible. But it _is_ possible to run the 
project based on _transparency_ and _honesty_ instead of "why can't you 
see the obvious".

> And FYI for the actual innocent bystanders who aren't troll farm
> accounts - the "various compliance requirements" are not just a US
> thing.

Again -- are you under any sort of NDA not to even refer to a list of 
these countries?

> If you haven't heard of Russian sanctions yet, you should try to read
> the news some day.  And by "news", I don't mean Russian
> state-sponsored spam.

Before calling out community members who raised legit concerns about 
procedural transparency, maybe it is worth doing a quick fact-check. 
There are a lot of suspicious looking `.ru` emails in this thread, but 
they are not who first raised the concern. The revert patch was sent out 
by someone at aosc.io. Look up who they actually are -- and before you 
assume "state-sponsored spam" just because of the language of the 
website, maybe you can also spend more than 1 second to check where the 
website is even actually located.

> As to sending me a revert patch - please use whatever mush you call
> brains. I'm Finnish. Did you think I'd be *supporting* Russian
> aggression? Apparently it's not just lack of real news, it's lack of
> history knowledge too.

I hope that either this comment wasn't written by the real Linus 
Torvalds, or that Linus was not under his best judgement when this email 
was sent. Because just like anyone who reads the news would know about 
Russian aggression, anyone who knows anything about politics should also 
be able to understand that individuals and their states are different 
concepts.

If these maintainers are associated with the Russian state, this should 
be cited as the reason for their removal. And you know what? Most people 
wouldn't have any problem with it. And then you can say "we are not 
supporting Russian aggression" with confidence. But this is **not** what 
was done.

I seriously hope that Linus Torvalds would have known better.

Thanks,
Peter.

