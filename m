Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC2ED149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSojNFdw8ftg3T7NakOd4AZhT9UMaiDwBHmwcORfhmk=; b=aWun3hx0AcDgjK8tO6WaFE2vVI
	g7tbrfK/Qf5vEId6e9GTZHQLICZlXe2p/ghWzgxvhpLWNRWUzd+C5P1FRwj1BfO3FWJGyS+qRVcxP
	d1eC6zZD3iPtY5fr5Pfdgj52enl6cTh/8tdfKH/lOZ2cy3SgjFIS0tlMi2HsO4O8FclW0E0ymbZSI
	5ARuP8hErE8PYwRSD1itBkceX09bSmbEhdzpoO2fBoo+4e/cqsMNJOcAsXDpd4BIFjLt4/ahOwrqt
	uC+8ZTr5zTSj+6niqkXtuB7y9bwzkXaxeqfM7djPvKM9KrvPl1GupkTDaj1TZ3jtwFvDbAGAUmVcr
	BIv9Tg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QEK-000000051sy-1tYt;
	Fri, 25 Oct 2024 19:44:16 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PDp-00000004pwV-41xV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:39:43 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4XZs5L3sP6z9snx;
	Fri, 25 Oct 2024 20:39:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1729881574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSojNFdw8ftg3T7NakOd4AZhT9UMaiDwBHmwcORfhmk=;
	b=gdBTGg9qaBnIiiH6XUTjeUDIpm/w19h2mJ2NxyWek4JBdbfHEfy1l85WLscQ4teM7X3Y8E
	SzmAWuY6Tiv8TrbprFm973WyyZ+4RlCRZSgfEyQVNqd0vqp4fkqFnrWEBZthKLrpibPdn8
	zOUeUEpcyhLgwtmKEbx1GfoJj+wV9qWVvuN6kVStn1ig/Bghe328CY4APIAqqMM1/M6DTp
	Oi88jdSqZLP4fc+Ctf69KIG1PcmVc9Uqx7eoBdxCRl/yvszGacX3FksxcbsLOSr1RTVZ7U
	RwAHePsvYqanhR6nADNx5z06lDr7cIO+uU+cHTctUfx45NWDJnFzydXg0RISPg==
Message-ID: <872c8823-f62b-42f8-8bf3-86342374aa84@mailbox.org>
Date: Fri, 25 Oct 2024 20:39:19 +0200
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
X-MBO-RS-META: fcapfso3xo4bfkqbzachb4s163eexrjr
X-MBO-RS-ID: 80e4fa8c609ea0e1360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_113942_188002_B8A91DA6 
X-CRM114-Status: GOOD (  19.42  )
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

I was a little bit sick when I wrote my previous comment, but I wanted 
to elaborate, so here we go:
> 
> It's entirely clear why the change was done, it's not getting
> reverted, and using multiple random anonymous accounts to try to
> "grass root" it by Russian troll factories isn't going to change
> anything.
> 

Of course it's not going to be reverted, and I don't mind.

I do however mind about the fact that you accuse contributors (however 
minimal their contributions were, like in my case) of being "Russian 
trolls" using "multiple accounts".

I would have thought that a man of your stature, knowledge and 
publicity, wrote a more sensible, neutral comment than that childish 
gibberish you produced.
Such comments can be seen in the hundreds on every major news website's 
comment section.
Unfortunately, this is now common discussion standard at least in the 
Western world:

"You don't agree with X? You must be a Y!"

There is no doubt that there are Russian troll factories - but there is 
equally no doubt that there are Western troll factories. Without them, 
this "game" wouldn't work.

You could just have done a simple 'git log --grep="Name"' to find out 
that most of those people who you accused of being trolls are actually 
not trolls. Because trolls do not contribute.

> And FYI for the actual innocent bystanders who aren't troll farm
> accounts - the "various compliance requirements" are not just a US
> thing.

Of course not. It's a USUKEU thing. Or, dare I say, a thing of the 
unipolar anglo-american empire. There is no way around a multipolar 
world order if we as humans want to progress.

Why didn't you (or Greg) elaborate on the "various compliance 
requirements" in the first place?
You could just have said:

"Due to the sanctions against Russia, we as a US-based foundation are 
required to abide and therefore we have to remove some maintainers that 
are thought to be directly collaborating with the current regime" (I 
specifically used a "Western" language).
That, at least, would have been somewhat honest, though still hypocrite.

And I did read through (most of) these EU compliance requirements 
because of my job (not IT), so I'm not *that* clueless.

The sanctions are absurd anyway - I don't remember that the US had been 
sanctioned because of their illegal invasion of [insert country of your 
choice]. US athletes excluded from the Olympics?? How dare you?

I also don't remember that France or UK had been sanctioned because they 
abused their UN mandate to get rid of Gaddafi.

The "country" Kosovo, created by a war, isn't even recognized by all EU 
member states!

And don't even get me started on that Eastern Mediterranian country that 
can commit the worst atrocities without ever getting seriously sanctioned.

Meanwhile, we sanction Iran (hasn't started a war in ages), Cuba (hasn't 
started a war in ages), North Korea (hasn't started a war in ages) etc.

The Western arrogance and decadence is disgusting, and I say that as a 
born and bred Western European.

> 
> If you haven't heard of Russian sanctions yet, you should try to read
> the news some day.  And by "news", I don't mean Russian
> state-sponsored spam.

I'm already more than fed up with the state-sponsored spam on German TV 
- and I even have to pay for that BS!
Now, I don't know how it is in Finland because I don't follow Finnish 
news due to a total lack of language knowledge.

I wish my country would quit NATO, and then I see that Finland *joined*. 
Sorry, but I don't understand. No NATO, no war in Ukraine.
Even as late as 2013, Russia and Ukraine did naval manoevers in the 
Black Sea - together!

This war is sooo totally unnecessary. Maybe you should ask Vicky "F!ck 
the EU" Newland why this all happened.

> 
> As to sending me a revert patch - please use whatever mush you call
> brains. I'm Finnish. Did you think I'd be *supporting* Russian
> aggression? Apparently it's not just lack of real news, it's lack of
> history knowledge too.

Why do you even mention your nationality?
Just a few weeks ago, I read about the role of Finland in (and before) WW2.
I don't think there is a big lack of history knowledge on my side.

My country was occupied by Germany twice, in 1914 and in 1940.
And yet, I have absolutely no bad feelings about either Germany as a 
country nor Germans as a people. OK, their government is the worst since 
1945, but that's a different matter.

Wasn't Mannerheim married to a Russian? Eh?

The former German Minister of Foreign Affairs, Guido Westerwelle, once 
talked about "late Roman decadence", albeit in a different context.

And yet, he was totally right even in other contexts. The Western world 
is actually in the state of "late Roman decadence".
And what follows after that decadence? Right, the downfall. And it might 
be a huge chance to create a better, more equitable world.

> 
>                        Linus

Tor Vic

