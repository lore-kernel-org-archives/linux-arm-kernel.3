Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3FECE8E89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK6I5PLe5vnn3daezNykv5OW7YZIVVGDimjgxMpsj78=; b=I0RYNsbWPwBQuDD297oiP/ypPo
	CLTDN32wuHXLllRg6dYUuB86je21ySr2ve21QB4JPLWSomwPkLQaaXkCZQJPbSUavgIWPnAeffCSq
	8UQSCrpgQAO8auiquC8wx+x29HJG9LK8G51VK8SZe+Yz2ovW7hu0ZRW1WGGQkNnoQQgB+ZgGqNCE0
	SHPJl1qlJcXqOdRQsdALnCZYsE42m5xT8124Gyzyp2Yg3adFvLFB4zYvnnI22hhUHQMrDzrmHUWLY
	yjmFFzAL2BWh6vrSpv7F46FD74fuPhuKeUKe1+CgbQL2/xbzYF3LCwWr7OwiZ4NOMFUcxKLddE0AJ
	Pj3rXmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zQh-00000000rWx-2a8V;
	Thu, 24 Oct 2024 15:07:15 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zOz-00000000rCh-0m91
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=metux.net;
	s=s1-ionos; t=1729782280; x=1730387080; i=lkml@metux.net;
	bh=YK6I5PLe5vnn3daezNykv5OW7YZIVVGDimjgxMpsj78=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NJuHu6XAru1iv8Y2QavuuXn7eIcashfzNhaLQpYlwISVEN7jyZRsWeq5aYWmXE04
	 BJoZ6lfZ1Xee9I5AGzleU6RaqJNyxg/yfai23dBLUb+jF9eRIxlWJsgBB4XKVceKg
	 Y4yB2vDQgrlw8UG8FRWtJZlmi2HaqHXvfFTCaQWYNyzfH2FXrExYPL0VAadeosJq3
	 ne2bQT0Bev9lBYGlhmoc1AVxSpAcEvUJcaArRqRcrXWwxvFL7xUubpKYzNFmQtnx5
	 685zFveblyfzE2/nKwKHh+0EQ2WioKmYMsZrS13Lb3kVEF68mX5Fg4KyS9fKZB14s
	 rwnqLyVQ5FEV5oLNGg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.1.178] ([77.2.18.78]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M1INQ-1t1FIj2u0w-007JkE; Thu, 24 Oct 2024 17:04:40 +0200
Message-ID: <64ef261c-82d0-4fad-ba8a-562f247340fb@metux.net>
Date: Thu, 24 Oct 2024 17:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io,
 gregkh@linuxfoundation.org, wangyuli@uniontech.com,
 torvalds@linux-foundation.org
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
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
Content-Language: tl
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <20241023080935.2945-2-kexybiscuit@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nD7udJPR/Y8fqTUurgGJoB/qYxi46eSgFx+TQh+iitYe5aVDi6Z
 VFnsGd1zdrspq7oX9tBwrzMW8zv+A64eJNH2qESGURPhq9NVflnVf5fIPAiviRapCpSjcYE
 tPx7vHUgVYZp8lhpA++4M7lJXlKFn99XQHeQDaFxsvc4m/jEEKsEYmwb4KDphNzFM9+KFOm
 +67Ve2SErcLMO8Fh7EABQ==
UI-OutboundReport: notjunk:1;M01:P0:KOnECGOcI0w=;7vm4sRGztPXGRYpossyB+BgG3a8
 nPGt+JeXxf7lrBsug8Tw2LIZwITMC514AugNJnyKXRe9dOjXQBhkLUvfv7re3r4Bkopg1FpMG
 tCd+jOB0zgmPj63gvQkIEMUhNMh/CpLF2G6+tm8kaNMt8G+Hb6RmDG95Qx76BbYzgbCr2USqD
 o217CPoDUUqfhkc5E9e/ZtfZWtWHFv8SdHq2oWTE4ibYe86UBrQrOKcCOvTlLZGCKlS8XOrs1
 x1WOwxb6NLTnPbSx8tWmtx6oGTJOx0uDb9BX42VQpHq8AKlKwCewARcAXE5bilS9oP+Gp1bHm
 4c+7iCouDV//xfjEsYd1EvlA5daTgIp3cNwHPTVUVXNxZKBrPcQsTaFgmVJu3LHapzj51Zt7q
 7stdIKxS15ptkh/lobQgAmyB7qc3vQ4vu7/iob0IzghtQ39YgBFqRnNQLZ6SrL/xTA8u1Z0Qo
 snP5lpbp5D7+cthEsOaXdXFESGCQ2SVCyuygxDsHuZGvua5CrMzBj4+GCwsm0pbSIR32wM2za
 TVd0zEHs9OtOXszUWdToWn//JF6YjRFsEh0PyhrYdPGWZoDxQ4kEQZVv8msLSUG538ZtGIOMt
 tkYarkyAMB1veVyWg8Nr8QrKB2K6qvQUyKdLp6v7eIUppJiRYsGZ/ByTnv0hIUtiSba1bszi0
 nwQgoC3XaxFa+WerAadhaBf4JKbz9HtLof0Hnj9U8UlfZLyTBpVtt3U3NjZM0/4RlFgDGiQ8e
 5424QtNJ0GUJ0Oes4+qNwjrIvwRuYSaqw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_080529_696192_7F47825A 
X-CRM114-Status: GOOD (  12.72  )
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

On 23.10.24 10:09, Kexy Biscuit wrote:
> This reverts commit 6e90b675cf942e50c70e8394dfb5862975c3b3b2.
>
> An absolutely no-one-ever-reviewed patch, not even by the maintainers wh=
o
> got removed themselves - at least not on the mailing list. Then the patc=
h
> just got slipped into an unrelated subsystem pull request, and got pulle=
d
> by Torvalds with not even a comment.
>
> What about the next time? Who next would be removed from the MAINTAINERS
> file, the kernel.org infrastructure? What if the compliance requires
> another XZ backdoor to be developed without further explanation? Is the
> kernel development process still done in public?
>
> Are the "compliance requirements" documented on docs.kernel.org? Who are
> responsible for them? Are all that are responsible employees of
> The Linux Foundation, which is regulated by the U.S. legislature?

<snip>

Reviewed-By: Enrico Weigelt <info@metux.net>


And, no, don't anybody dare calling me a "Russian troll" !

I grew up in the GDR, which was factually Russian/Soviet-occupied for 40
years. I grew up behind the iron curtain. And part of my family coming
from near Mariuopol. They also suffered from that horrible war (and many
of the wider family fled to Germany).

The only way for stopping that suffering is arranging peace. The longer
the war goes on, the more suffering, the more people just DIE.

Expelling people just because they happen to live in Russia (or maybe
just having an .ru mail address) isn't doing anything for peace - it's
the opposite: it's widening the war. It's rebuiling the iron curtain,
this time into one of the most international projects of mankind.
And it's just rascist.

If we really want to expell people for living in countries that are
starting wars or committing war crimes, then have a closer look at
who's leading the bodycount "highscore" since WW2. Spoiler: it's not
Russia - it's the anglo-american block. And guess who's leading the
hall of shame of using weapons of mass destruction: the US (and their
vassals).

Who's the only nation who used nuclear bombs against civilians ?
The US. And who's still using DU munition (also a WoMD - contanimates
the soil for at least centuries) ? The NATO (yes, including Germany)

Does anybody see where this all is going ?


Wars cannot be ended by more war. Only by peace.


=2D-mtx

=2D-
=2D--
Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt un=
d manipuliert
werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schl=C3=BCssel zu.
=2D--
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

