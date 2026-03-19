Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4271090234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ru2Fyw9/wRTww9l5W2YBJiByY7OAMHrkrliQY5bMwTk=; b=Z+dXcC0/sB2ZZbKlk3bWVxfIOU
	ggKe0B102nFtFOS2LK3Jr/AiASxTlWrKY3mTQT6fRmpSp+/WTYFl4njc62ur69Mai90G350nkh+th
	6sZ6rJSLsXdyggzImu/RiTvIf3nwptVDG7L/j2HHm3esNMazkbqhXuu1lQmepce1RVeMMzx8euEZ6
	HXJcdAon1IfTMlD/CVJurC7Hdcd1Q21Q48hJ/NBb0+3B9KySNlq1as31r1W/pVHYnwsKjI9R1NMPJ
	FK7t/H+GZuBIV4fX/roCm0FDTYYZ5qsuaam5JP330NXCHvjJYLG/XPaGkzzNDAmeGLmFRTgkFRLsa
	s1atWCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EhJ-0000000Ape2-165Y;
	Thu, 19 Mar 2026 14:50:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EhH-0000000Apdh-25il
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 14:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ru2Fyw9/wRTww9l5W2YBJiByY7OAMHrkrliQY5bMwTk=; b=N4gy4iATR5gQKKnwVq2VhHDgj4
	hqTIPjXvJQg/Db/r1nEJ6Vu1FMEBEwV7SSblJRaHca6vmovu5ufG5SzbFij5ahwBruYmWw18aqLy9
	ySiYfaNnQQMfUpQNqgIXRaDWVwACoFxTEaYEbLby/PewgcMADwFAnpY7xFpQbnJX4gUKB3sUBz5IJ
	i8bNaWaLbcDTHU43+UCJrdqhfQEXVVJANqIXylSuuroFSWqFU/+yBzX8WZ7Dkr4PeDaMAeV6YAS5M
	5KWK3Pg6qNtHKCgOn5omFOJ8UUzQ7op5A2ZKdpo71o9a6IeY3HeE0owzhRJwF2nRu1phU7Zgc8EdV
	UrYHlNsA==;
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EhD-00000006FCN-2Vt4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ru2Fyw9/wRTww9l5W2YBJiByY7OAMHrkrliQY5bMwTk=; b=Jm0/FHE/zFlgYXS0GpQ8TukPNC
	/cFa9KtIQd8ejz/Ee4OLlojS5tymeUzPnljiBtojyKM3tqk7cx2B0anJwRWxJ1YK72ZzntK/XgoG5
	qx8WZfdwMaO/ZD+cB8RUtuRE3TJn1kr+bBEQD5et6NKD4xk9JGPNOZC0lhvlNI7R5yiCbQg8+WV7z
	y7lOqSismtweLaAGKi5vhkSMDSmmWtJPnho9yskezdLmjQpkBg3VXsTCwo031pJI7a8HoDGUQXEUN
	kH9nBtvgkUVDHTfXfhT38t4oxjgpKXSvsGVj2PvicBHc+u6pb8K87AdUudhpiFMsgoG5oqo/bOz7P
	eNNSC7Vw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Eh4-0000000DaB3-2Xp5;
	Thu, 19 Mar 2026 15:49:50 +0100
Date: Thu, 19 Mar 2026 15:49:48 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Andre Przywara <andre.przywara@arm.com>
Cc: wens@kernel.org, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <n3e6sot6hdpdj5fnjbltnjkiqfoa2oicm5t5scqppdftfvbqox@niblalzqvirr>
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
 <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
 <dd275884-665b-46ca-a72a-c32aa189fc25@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd275884-665b-46ca-a72a-c32aa189fc25@arm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_144959_767971_E52E8B00 
X-CRM114-Status: GOOD (  24.32  )
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

On Thu, Mar 19, 2026 at 03:16:33PM +0100, Andre Przywara wrote:
> Hi,
> 
> On 3/19/26 15:06, Chen-Yu Tsai wrote:
> > On Thu, Mar 19, 2026 at 9:46 PM Linus Walleij <linusw@kernel.org> wrote:
> > > 
> > > On Sat, Mar 14, 2026 at 9:10 AM Michal Piekos
> > > <michal.piekos@mmpsystems.pl> wrote:
> > > 
> > > > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> > > > 
> > > > The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> > > > is in unitialized state.
> > > > 
> > > > Solution is to set pinmux to GPIO INPUT in
> > > > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > > > earlier.
> > > > 
> > > > Tested on Orange Pi Zero 3.
> > > > 
> > > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> > > 
> > > Should this have a Fixes: tag and should it be applied as an urgent fix?
> > 
> > Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> > 
> > > Tag for stable?
> > 
> > The original patch wasn't tagged for stable. And it doesn't seem like it
> > was auto picked.
> > 
> > > Also: is there consensus with Andre that this is the way to proceed?
> > 
> > As Andre mentioned, the mux value for "disabled" is different between
> > generations. So we likely need to make the value part of
> > |struct sunxi_pinctrl_desc|.
> 
> There is already the SUNXI_PINCTRL_NEW_REG_LAYOUT flag, which describes
> exactly that: the new layout increased the bit field to 4 bits, moving the
> HiZ value to 0xf.
> But it's just a flag passed to sunxi_pinctrl_init_with_flags(), not stored
> in desc, and not available during runtime. Which is what I tried to fix for
> my A733 series:
> https://lore.kernel.org/linux-arm-kernel/20250821004232.8134-3-andre.przywara@arm.com/
> 
> So maybe we can cherry-pick just this patch, then check for that flag?

I'll prepare v4 with your suggestion.

> 
> Cheers,
> Andre
> 
> > 
> > Michal, can you respin a version so that we can get this fixed in the
> > same release?
> > 
> > 
> > ChenYu
> > 
> 

