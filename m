Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDF7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIuQXlKSOTLM0UZ6Crhipj/YtkXxsn86lQa1Jg9sTq4=; b=C12VaWrFDyJE3UWp/UJSRgdV/u
	FEXQk9hpeGS+aEApUVwKJbMCH0w5IqLyMfaHm3wss7m/qmfZLSjVn5RWL6c63N4/abO9WXskknCFX
	v49YOGgRpAX6uGEabm1dKVSYNUtKM4odRfEiPpEs8v0iRLgQzVWIsvzCobVBdOUtnlXE5yswS5mWm
	tTOONliKi9HyIwj20dZ19tAcEhlakGhc1EU3joxX3RFnYD2uSMUNHqp0yOG2P1fDLOO7qLaq8pJAL
	/wEhL4mSOnojd4iQRC6749ZD6UmEw8rKz/1FHW0dCeRe1ppqzoDkoJjsDXFV+OoEyhhSbH2qMTVIV
	uzXnbcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEl8s-0000000BmPZ-3uKe;
	Tue, 13 May 2025 08:37:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEl6t-0000000Bm7z-2dEK;
	Tue, 13 May 2025 08:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E32E0629CC;
	Tue, 13 May 2025 08:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E58DC4CEE4;
	Tue, 13 May 2025 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747125334;
	bh=AQsw6m7iH5by6TnMCmB9Fcyzck4JqC+iM5hS4GjSXTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKRyHWXQ1Ci63Evz8Btig3gSKZnRJ2oQPD64QOiVjNS+aHTHvyJl0XrXNKlyfag/Y
	 IOstQmBNvqBol0UBuLeiZXhJsF6MuKwK3FCYmxTd32Mk949NRR06rKkdajNsXLQdVf
	 DTDnPFDBRc43DaZei1QMHRjFhEqlRL+OMwqK+lD7RSfACwPhji6Jn4leHixc+tJRoS
	 fSddiK2SDvfnC/3HTBT8vqH/QOxksGWXHnqrBU1fC9DqiSlYdlCF98SDSQ/yg4Pq6n
	 8XCbpE4CUONrW8BvlicrLpW9NF7IEHcHI5pNnKFalA/D/eC2XYsD1s9nqqom+jMMuD
	 bfxYFaLd9LTiw==
Date: Tue, 13 May 2025 09:35:28 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, geert@linux-m68k.org,
	pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <20250513083528.GA2936510@google.com>
References: <aCGPuKtfprIvwADa@smile.fi.intel.com>
 <20250512173800.6767-1-trannamatk@gmail.com>
 <CAHp75VcXmOByVsuwm0m0+FYXoaxBc1CLKtofGgHfB4sMDg+T2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcXmOByVsuwm0m0+FYXoaxBc1CLKtofGgHfB4sMDg+T2A@mail.gmail.com>
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

On Mon, 12 May 2025, Andy Shevchenko wrote:

> On Mon, May 12, 2025 at 8:38 PM Nam Tran <trannamatk@gmail.com> wrote:
> > On Mon, 12 May 2025 Andy Shevchenko wrote:
> > > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> 
> ...
> 
> > > > I think setting PWM also same as brightness_set API. However, there are
> > > > many PWM config for a LED and it is one of other config to make autonomous mode work.
> > > > Therefore, standard led API can use in some use cases only.
> > > >
> > > > Please see the link below for a better visualization of how to configure the LP5812.
> > > > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> > >
> > > To me it sounds like you should start from the small steps, i.e. do not
> > > implement everything at once. And starting point of the 4 RGB LEDs sounds
> > > the best approach to me. Then, if needed, you can always move on with
> > > fancy features of this hardware on top of the existing code.
> >
> > Thanks for the suggestion.
> > I understand your point and agree that starting with standard LED APIs is the preferred approach.
> >
> > However, the LP5812 hardware offers more advanced features, and I’d like to support end users all
> > features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/.
> > It is easy for end user to investigate and use driver.
> 
> I see. Good luck then!
> 
> > If I want to keep the current driver interface to meet this expectation, would it be acceptable
> > to move it to the misc subsystem to better support the hardware?
> 
> Don't ask me, I don't know what you want at the end and I have not so
> much time to invest in this anymore. Only what I'm sure about I
> already expressed in the previous replies and emails.

Briefly spoke to Greg (now Cc:ed).  We can all discuss this together.

My 2c, whilst falling short of deep-diving, is as follows:

1. No one is going to enjoy reviewing a 3k line submission!

   - Instead, submit the smallest driver you can whilst still retaining
     functionality.  It is not good practice to fully enable a
     complicated driver such as this in a single submission - let alone
     a single patch.

2. Hand-rolling your own API from scratch is to be highly discouraged.

   - There seems to be quite a bit of overlap in functionality between
     your bespoke API and LED's.  The LED subsystem already supports a
     lot of what's being implemented here.  Instead of letting the user
     configure the device directly, why not offer some high level
     options and attempt to infer the rest.  If possible, the complexity
     of the device should be handed by driver, rather than placing the
     onus on the user.

3. Shoving this into Misc because you don't want to use the APIs that
   are already offered to you is not a good approach.

-- 
Lee Jones [李琼斯]

