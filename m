Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1677FE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsv4DyFtp2uJhVyt+kJ1zSZIlddKaM2KbUrSxNXbbHM=; b=BleVNkCkTwRgGNNJtzY6m6ZpjE
	+KXfwxaAraWiI7bft1fJP2+EcZeq/J5ZzLwl7W5xdf0GfqYmGwk+7TSw+K2Tv21yDYopnVYdtv7Pw
	I1FL8A4GzEayzVsuqFc+MTi7e1ZZxiu1pmatMSiK6Jg3FLSqHgAJDadpxt9QS8JezPuUaCsAMYMUy
	jUgj5Y9NvFnz4Bbes8SIiXsqRYl4lUXxHx8qIZ94pvrLlCxdbJNRT761KqrnuBmaZ1OuWM9HRHq8G
	z/g59CJ02OleLCVuodIM+PGbC16ayc30zAGOALu7mpr2W/WeFxtjK3EJGlNS2eM+UEfV0Qn5LgXev
	xytuSOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrNh-0000000D0xn-1WIf;
	Wed, 04 Dec 2024 15:33:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrLA-0000000D0Qj-2P9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jsv4DyFtp2uJhVyt+kJ1zSZIlddKaM2KbUrSxNXbbHM=; b=VhmVb4Z+UIhP450eSpi9XGP++L
	WHF1/2i0fXq701JVCHs3Q+7euJhCmkavJGAbcDQz2WP5gPFxCS6LsCKH1i2OYSynf9YRSLmiUVGZA
	AXDjXFdw2S5FuBxISyP/pNPkWgBm+ejlyNpY3EFiPsZi2pSWulRodEh2sCY5zhmIiY+B0vAJEK/HE
	odzhogCgy/waj8VXZBX21s5wGFiaJE/eqtj/UUHhA8ZdJM5tOT9ohuUPQ/NX68FFtIb5tQTrqmaGp
	IYbqXKlE1Jk8Fkqzu1d9gdeUrc0b/ytKpvlYFSFuHLZE9hwBfMn6zXcKcKCU+C6VBBmOArIzMwWLO
	c18FROEg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47318)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIrL3-0003Vq-1L;
	Wed, 04 Dec 2024 15:30:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIrL1-0005dy-39;
	Wed, 04 Dec 2024 15:30:51 +0000
Date: Wed, 4 Dec 2024 15:30:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/15] ARM: mark footbridge as deprecated
Message-ID: <Z1B1q3Q3B_3TFlMn@shell.armlinux.org.uk>
References: <20241204102904.1863796-1-arnd@kernel.org>
 <20241204102904.1863796-16-arnd@kernel.org>
 <CACRpkdahQhj5u9ATghszi-N2OYhFbvHF_W_eAMDAU+vhmvdrJA@mail.gmail.com>
 <Z1BpNQjWwxEKFbg0@shell.armlinux.org.uk>
 <CACRpkdY-uKYqAR2Sj_cG7dPAtXMFG0Ldka7U13qZSFr+w15WxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY-uKYqAR2Sj_cG7dPAtXMFG0Ldka7U13qZSFr+w15WxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_073100_609924_E2FDD378 
X-CRM114-Status: GOOD (  25.35  )
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

On Wed, Dec 04, 2024 at 04:14:07PM +0100, Linus Walleij wrote:
> On Wed, Dec 4, 2024 at 3:37 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> 
> > > I am booting it occasionally, last time to test my KCFI patches.
> > > But admittedly that is only to test it for other SA110 users. I remember
> > > that Christoph had problems consolidating the DMA used in this
> > > machine as well so it is standing in the way of useful work.
> >
> > What problems with DMA? The fact that it uses an offset between
> > physical and PCI bus space should be nothing that causes a problem
> > for the kernel. As maintainer for Footbridge, I've heard nothing
> > about there being any issue.
> 
> No issue other than testing and iterating the patches I think.
> 
> I was thinking of this patchset to do dma_direct_set_offset():
> https://lore.kernel.org/linux-arm-kernel/20200917173229.3311382-3-hch@lst.de/
> 
> It seems to have stalled some years ago, but maybe there was
> some other reason.
> 
> IIRC Christoph was onto me to test it on the NetWinder, but I
> couldn't locate a good DMA capable device to test it with.
> (Would be the soundblaster but then I needed some userspace...)

It isn't soundblaster, but waveartist, and needs special setup to be
functional (which was all in my OSS waveartist driver.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

