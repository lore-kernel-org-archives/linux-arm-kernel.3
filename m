Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459FEE95367
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1E7CAwuXrYPxHlFOPrxyXPY7SSEplN4OArYOvdFacSk=; b=1fezusvSHrl/0lV68mw15q1iB+
	8UCJrggveGcOfPpTTvSk/ydJc0vIfCR1zX5TcZCNvV57jLxi8RXS3Sod9LvIVPryJeSLIR44ZMSl6
	lktO/4imT1BfJNNf7rqrNr+KNixPkIyrxra3nNy7BPDKo7I00w8jF5pwmV4cL9AEyKODLuRt5xaho
	awS40yT2/3wTdjYi7CoGml9YRrjabBGPbEhKqZBBn79sijUL78lg8uVhqVP9J+Jvb51l7+yt8lfD6
	TnPjDEDlfz54x0y5etFALiuug+dGJa3H4VT/kS8HiUgYKdZ/KmySXwwdCQ3NCM4XANR+5tdjLClHb
	IR86oPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZic-00000008GQ7-4ANm;
	Wed, 04 Feb 2026 10:02:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZiZ-00000008GPX-0Inz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1E7CAwuXrYPxHlFOPrxyXPY7SSEplN4OArYOvdFacSk=; b=qmxmXqaZfPIfu7J0YiyN2AFZRV
	fKqrZ7aw4rRYg2vLyJ2WDhmBa+//Wn9SVTot1yE7D2+hlGkUEw3LYIdbdd9w6/z6Jk/7LFHTlnIMP
	tWcSYTwF8jEQjJYSr1NXpmb7waNJdCy6pVwWwBTL3UK+vO8Gx0pLJp64PoCFv4W39KU1Sbl7dxXm9
	hwFRxFmhkCvOXF+4g7QGI24YGkr1yTKq66kSmbtHUKE3bNgpVQE3N7GmU1yhkZKm7ybLH7QIMlWbD
	Vv+QLFE1lLr6AL4U0zgsTyL8BqqRG+QT8y24B8k3Sv/vXEuxykh5rzYpDY9p5On517XU3nsfIrAkV
	zt3i/pkw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36008)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnZiL-000000006BM-0luA;
	Wed, 04 Feb 2026 10:02:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnZiH-000000005FY-1E17;
	Wed, 04 Feb 2026 10:02:21 +0000
Date: Wed, 4 Feb 2026 10:02:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
Message-ID: <aYMZLWOlFOPTsnWx@shell.armlinux.org.uk>
References: <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk>
 <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk>
 <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org>
 <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <86pl6kamjk.wl-maz@kernel.org>
 <CAD++jLkfcVSeKf9eNzXpe2AUD-7Gaw47gxHwqZtLuomWed1u8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkfcVSeKf9eNzXpe2AUD-7Gaw47gxHwqZtLuomWed1u8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_020240_879126_7B3F8446 
X-CRM114-Status: GOOD (  22.55  )
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

On Wed, Feb 04, 2026 at 10:49:24AM +0100, Linus Walleij wrote:
> On Wed, Feb 4, 2026 at 10:24 AM Marc Zyngier <maz@kernel.org> wrote:
> 
> > > Another reason would be that appended DTB is in the same
> > > league as the GPIO sysfs despite we GPIO maintainers hate it:
> > > a feature users highly desire because it's easy and convenient
> > > and practical and quick and thus refuse to let us drop. Every time
> > > we try to deprecate it more we get a good beating.
> >
> > I don't think appended DTB is ABI. The GPIO sysfs definitely is.
> 
> The reason the GPIO sysfs is demanded is not so much because
> of ABI, like if applications are using it.
> 
> It's more about developers wanting to play with their systems
> interactively to figure things out or do makerspace projects
> using GPIO.
> 
> Likewise I think appended DTB is appealing to developers because...
> "it boots, ship it". ;)

Right, but what we have in the kernel works for those platforms that
it has been needed for. That's what it was for - a stop-gap for
transitioning 32-bit ARM to DT. It shouldn't be extended to new
platforms.

No one answered my question whether there was a regression or whether
this was for new platforms. Given that lack of engagement, I'm just
going to say a flat NO to this, since we don't seem to be able to
communicate effectively.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

