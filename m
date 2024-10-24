Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94490CFA456
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jC9nW4+TeoUKMdwW7mwvVLcB7GS8bnW0QjfI/mZVf+s=; b=BICmPQiuQB/ntCf4RhnsMp7tke
	U0Ict32zfDxtWM7er5/D5NDJnicBbwAldY4Yc6aPp+GR1BhDxHvDmF+0c4gB+n8MoPrM+kvPZZBx7
	3VMDMx+GN1CLc++kE2AvC6pk6wyfJk8ZQRr1KFb6ACwAc+tmUpeulqaLExezbiS7Md3Xf0H0RSh9d
	cZL7F5szfebkER8tHm32xf5K31miJaEka0eCxERzerVtVKvHcGl53PtWj722ntckSA8QxVUdMI+DE
	Zf5jvy76xBkGrQ9OBM9LzeO7ZVf7kRn5Vi/WrxaOoCtoEQX9xS64PzioJennx/Yd+FVzSTAk3IR0T
	nzdBroyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uiH-000000000LQ-3nj3;
	Thu, 24 Oct 2024 10:05:05 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uXH-0000000HYsu-3e9J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:53:46 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 3854C72C8F5;
	Thu, 24 Oct 2024 12:53:39 +0300 (MSK)
Received: by imap.altlinux.org (Postfix, from userid 705)
	id 336F236D070D; Thu, 24 Oct 2024 12:53:39 +0300 (MSK)
Date: Thu, 24 Oct 2024 12:53:39 +0300
From: Michael Shigorin <mike@altlinux.ru>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>,
	jeffbai@aosc.io, gregkh@linuxfoundation.org, wangyuli@uniontech.com,
	aospan@netup.ru, conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org,
	dushistov@mail.ru, fancer.lancer@gmail.com, geert@linux-m68k.org,
	hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
	ntb@lists.linux.dev, patches@lists.linux.dev,
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Subject: what about CoC? (was: [PATCH] Revert "MAINTAINERS: Remove some
 entries due to various compliance requirements.")
Message-ID: <20241024095339.GA32487@imap.altlinux.org>
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
 <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_025344_263683_E378BD58 
X-CRM114-Status: GOOD (  16.85  )
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

как хорошо, что по-русски можно писать то, что думаешь


On Wed, Oct 23, 2024 at 10:45:47AM -0700, Linus Torvalds wrote:
> It's entirely clear why the change was done

Might seem so to you, but apparently not to those wondering.

> And FYI for the actual innocent bystanders who aren't troll
> farm accounts - the "various compliance requirements" are not
> just a US thing.

US is just another victim of those trotzkist slugs --
you can ask your father, he must know better *why*
those have been expelled even by their own ilk
a century ago here in Russia.

> If you haven't heard of Russian sanctions yet, you should try
> to read the news some day.  And by "news", I don't mean Russian
> state-sponsored spam.

Linus, those "news" have cost your family a child already,
and Elon has paid a similar tax.  You have been limited in
your right to tell what you think right here in linux-kernel@
(unless you speak hate against *all* of the Russians, yeah).

You've agreed that black is white and vice versa.  It is not.

> As to sending me a revert patch - please use whatever mush
> you call brains.

It's not about the patch but rather about the attitude;
Documentation/process/code-of-conduct-interpretation.rst:

"regardless of ... ethnicity, ... nationality, ... race"
"Focusing on what is best for the community"

"Examples of unacceptable behavior ... insulting/derogatory
comments ... Public or private harassment"

Get back to single-standard integrity for yor own's sake.

> I'm Finnish. Did you think I'd be *supporting* Russian
> aggression?

Have you heard of casus belli?  Do you think these were one?

http://nypost.com/2022/02/21/russia-kills-5-ukrainian-saboteurs-allegedly-trying-to-breach-border/
http://reuters.com/world/europe/russias-fsb-says-shell-ukrainian-territory-destroys-russian-border-guard-post-2022-02-21/

That's February 21, 2022.  If I yelled all over the place
about "Finnish invasion" after Russian IFVs have rovered
Finland *first* for no good reason, would I be right?

Feel free to ask, I actually grew up in Kiev and e.g.
this bug fix was done there as well:

http://bugzilla.kernel.org/show_bug.cgi?id=15658
http://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=c9e2fbd909c20b165b2b9ffb59f8b674cf0a55b0

Please do revert it too then.

Drop Linux network stack while at that, that "roomful
of Russian mathematicians" is now declared untermensch.

> Apparently it's not just lack of real news,
> it's lack of history knowledge too.

On your side, Linus.
On your side.

Hope you're still Finnish, not a Finnish nazi
(swap "Russians" with "Jews" in your email and
re-read it; it's my homegrown "nazi test" --
if this change suddenly makes a text "nazist",
it was).

It is the US that has pushed Finland towards NATO,
basically to follow the grim destiny that the former
Ukraine currently harvests, and that was prepared
for Georgia (that evades it), Moldavia (that rishes
full speed towards destruction), Poland, the three
Baltic states, and now your homeland.

There is no regulation that can force your own heart.
Listen to it.  Not to emotions, but to the deep truth
that never cries aloud.

You bow to the jerks who are *afraid* of opposition,
because there is no truth in their father.

Remember those who yelled "Assad must go"?
How many of them are still around?
Those siding with them perish with them.


PS: last time I've seen RMS in Moscow, he declared
his support "to the Moscow protesters"; I've asked him
whether he knows that the initial issue was that the
dead people were identified en masse as those "voting"
for "democratic" candidates in 2019 elections, and he
stared at me and answered, "nonsense".  I've emailed
him after BLM affairs to ask if what he sees makes
sense but never seen a reply this time -- and dead
voters turned out to be not a purely export-only
"technology" a bit later (pretty cosmopolitan).


Господи, спаси и сохрани раба Твоего заблуждшего
Линуса и ближних его во веки веков; аминь!

-- 
Michael Shigorin
(whose first book on programming was
Hyvonen and Seppanen's one on LISP)
http://t.me/anna_news

