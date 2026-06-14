Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CFECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 22:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoouwIl7ENWFJcsKQwFnZPx//JfMbetXKC3Kqh1HdNY=; b=zyZpWq8UF6+Z9ERqKjPMo7com3
	f/D0F1IGEBF0f6y2JovubOQL+UNKizjkMLBAv7qYqhgzOuz3TmKcm0qi2r0f0mHgRom42uVxXYHp0
	U//HvsCKIx+JlovklVszeA7/zvW5cFrmvij1alG6Y+/4M8WdaEXw3SqsPM2Il6rO5VKkZb8y2wv1B
	aOlMmbtGVDO/85hZ1pUABQxAa8s2V+Q2hYNvXgEfb5kDb87Ag/lZJdHvFTZSw3/3ZzzNDHH955dj8
	8ObPJ3wYGADiO+yaylJ1KIPGThpUFdY2FcCQX+3faj4tA53uMXlZ/BiHbj86xzJ3jesWaGKKr3+UQ
	k2lKccZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYt64-0000000DKen-1Wvw;
	Sun, 14 Jun 2026 22:14:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYt5q-0000000DKe7-3Ofl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 22:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aoouwIl7ENWFJcsKQwFnZPx//JfMbetXKC3Kqh1HdNY=; b=HIbAbVudDeCzIlARtEGn/DlQl9
	2382Mvs6aHVELbjukDg/2u+y9823wKm/qSAsfk4S4d3lrCvRq/HWbcDuBua34khCh6J8VVTlZdbJ4
	r8ynAIJnhdpoSXWgM/oEtBsQAgPcpTJ3W0kOTvnRrkbf+ElP3qehqs6n6OvO1FQUKOt5x7hk/kMt9
	P81xCFQAr4T66cIGXAstuO+3EleyabhEH7Mh1kidvm1mev/VgWSAQXlWgugt8XaiTTiyEiFACdG5t
	927yJaXHunSXsm0nZJ2J7VRRFn0J6cn2sDbRs2VlF3O22P9y7QJGjLiuL5tlnvntMHE3mvysPgwKC
	aj8YdlkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57636)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wYt5k-000000004xx-2dXf;
	Sun, 14 Jun 2026 23:14:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wYt5h-000000008QG-2EyH;
	Sun, 14 Jun 2026 23:14:05 +0100
Date: Sun, 14 Jun 2026 23:14:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
Message-ID: <ai8nrc0ZUfPaqC_7@shell.armlinux.org.uk>
References: <20260518014920.135011-1-enelsonmoore@gmail.com>
 <CAD++jL=0qYGoygUwGEXQL7C_ROnC7kfpRv8RA+H5tNWwYu+pQA@mail.gmail.com>
 <CADkSEUjsS8bOXDhgZ2EW40xifDZ-pk5y=YqyWT-+vQNd8JikUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkSEUjsS8bOXDhgZ2EW40xifDZ-pk5y=YqyWT-+vQNd8JikUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_151415_127765_387CD7DA 
X-CRM114-Status: GOOD (  13.29  )
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

On Sat, Jun 13, 2026 at 06:50:40PM -0700, Ethan Nelson-Moore wrote:
> On Mon, May 25, 2026 at 1:18 AM Linus Walleij <linusw@kernel.org> wrote:
> > Looks correct to me.
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > Please put this into Russell's patch tracker!
> 
> Done!
> 
> https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9477/1

Should be s/arm\./arm/

Also, you can use:

Link: https://lore.kernel.org/all/CAD++jL=0qYGoygUwGEXQL7C_ROnC7kfpRv8RA+H5tNWwYu+pQA@mail.gmail.com/

in the attributions in the commit message to indicate where more
patch context can be found.

Lastly, too late for v7.1 as a fix, I already sent the pull request
for that, sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

