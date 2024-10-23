Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3ACFA466
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DiBGY7JXTau9/+lExprJsgF423QWQvTINVO37mbHBA=; b=C+AErQ1ZejcWtGoTW3Eh5wiFdg
	lW5UZDZZvlDrz9u9NZ4BUJj7D4/2UiBxtjfbjWVG7ttPTt/95gnh3ZFV+bPcecXbTjOt87P8kdOOe
	2bSjklsyeb7KSI1YU+DAlvCbsCrvEMKmWpZdv5dm2lQWwBeO6dbDSQrdBDnWZFIj5T5ul/va86KJ0
	VkuPKWw/6z59tJmhbpzQcxs6qGI+wJQeCNgIJ3ubnv9Ut624TwWFFrS0rwj7hBfvBd5ZfPMSlJXpZ
	pcBXAAGdJOiyi0nGMmYqgZEkCuRk801eLvnYWiLI5LZgWRCBgZPC0eiB21BR376jFUKTsByAgLmsB
	eImkDvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hhB-0000000Fmlx-1el5;
	Wed, 23 Oct 2024 20:11:05 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hNW-0000000FkIx-0o4F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:50:49 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XYfmH2B6Bz9t06;
	Wed, 23 Oct 2024 21:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1729713039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DiBGY7JXTau9/+lExprJsgF423QWQvTINVO37mbHBA=;
	b=r2hHWu/gsNMva0I9QpfanG6ib8PMatoREIpS03GQI99J5qN8kYcgZDEQ1a0TaReloWibzZ
	bZ54lvnJek1CXI+BYnY6aZtMSl7X/R5Yv3b6pe0jO21XelmY+QWq7vXPmtSQn9PFTImpvi
	kvfSOWFc5LEQE3wGn9L8a8wSgSiBfBklT5Y40nj43eWhnILCGp2qEQYbGWfHlsIFZSTy4y
	hWQalszvnBs3MQa3UbqvIgfi+l7k6QgwiLPkmsDRA9hmJ+JSMhMpGX/Kd2Q514C4QPGfbP
	3APh6xRPvSFN0/6mnVNau4AeuVXQUkWF6fTS4udK9eWIaW9K9+22sY/0nm7Fsw==
Message-ID: <dc3df94f-7281-4a42-8db1-ee4f556b3d6f@mailbox.org>
Date: Wed, 23 Oct 2024 21:50:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
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
From: Tor Vic <torvic9@mailbox.org>
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: wwofu5okm3posc3pe5gem39bz8ctt5wq
X-MBO-RS-ID: e798e6f1cba1393a8e6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_125046_477368_B2A59B70 
X-CRM114-Status: GOOD (  12.54  )
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



On 10/23/24 19:45, Linus Torvalds wrote:
> Ok, lots of Russian trolls out and about.
> 
> It's entirely clear why the change was done, it's not getting
> reverted, and using multiple random anonymous accounts to try to
> "grass root" it by Russian troll factories isn't going to change
> anything.
> 

I'm getting tired of reading this type of accusations.

It's true that I'm just a random unimportant Linux user following the 
mailing list, but this account is not a "multiple" account emanating 
from a troll factory.

'git log' gives you more info.

> And FYI for the actual innocent bystanders who aren't troll farm
> accounts - the "various compliance requirements" are not just a US
> thing.
> 
> If you haven't heard of Russian sanctions yet, you should try to read
> the news some day.  And by "news", I don't mean Russian
> state-sponsored spam.
> 
> As to sending me a revert patch - please use whatever mush you call
> brains. I'm Finnish. Did you think I'd be *supporting* Russian
> aggression? Apparently it's not just lack of real news, it's lack of
> history knowledge too.
> 
>                        Linus


