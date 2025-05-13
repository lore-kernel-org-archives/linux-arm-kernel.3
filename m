Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C16C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGYDBUCEbKO/tOgJs1z9dE6i8jB+UZG7bGfdUIao3pM=; b=Onnd47AEkkE+ZkwKSO2cse2Jcm
	wUcfJbOr45PXAjIHQCxrYQTUZxBO5iHSomw2Z+IVqAm27PlrWEafVZTboQxIhZ3SvIH807TcKhzsn
	ojLSHpkU3E3KCiSNDNq1wc0Im/DXcp1mgV5jlcaPo19YpH6WcwaSyw5ZgUhIx81tpQNX6uDomPWLW
	TwlyKDMz7nY22uY3XUJU0XRoPFTfqq0WmJBVo/w5942ZA7rz42bIcaWXrQ8P+8+lDiG37A+CKjm/C
	ITbdi8AYlLTsCxe7zH0mLUkHZoY8OSIeg2iIusEyAxRB5qCYPo5xzFeY7YVBmHxH6YjyDe1vNDmpK
	61ewGMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElNs-0000000BoZC-3k2i;
	Tue, 13 May 2025 08:53:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElLt-0000000BoQh-2bIX;
	Tue, 13 May 2025 08:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 679BFA4C8B7;
	Tue, 13 May 2025 08:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3546C4CEE4;
	Tue, 13 May 2025 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747126264;
	bh=JuynMA1lFeLJ74JpIm5SB8vTf5FUAnMBpNKD71wdRG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DT15juaJQaVe76NCzznf+i5OE8q642AWY0Bo46tPhsaMgeMNuN9vTJlQdnBbHvxNp
	 pFAaB6Q3SQAEB73ksaZsHmcnU2FXcNy+5kM7Kc/aXZQylqqK30abrcjihfdpMCVkEb
	 fbrpj/A5YfXJbMBQPYOqo17tFSO9RyVGIbngMCSbno52H+izNHxlDrEQT7xTmlPFU4
	 gX5m5LLcXLBU1nlH83EMbNwDzOElzGKYUipdDtBZOvW5muVXpIg4Sheb6gBCUfrSq3
	 HDqmfrk/a6DrXZ84BGFTQQwxBznP3uXMsMZa91JtMbGWNv9Tjzj48HFudUrxR/gFXf
	 oVG3HnaA173TQ==
Date: Tue, 13 May 2025 09:50:57 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, pavel@ucw.cz,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <20250513085057.GB2936510@google.com>
References: <aCGPuKtfprIvwADa@smile.fi.intel.com>
 <20250512173800.6767-1-trannamatk@gmail.com>
 <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_015105_728148_714650BF 
X-CRM114-Status: GOOD (  27.01  )
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

On Tue, 13 May 2025, Geert Uytterhoeven wrote:

> Hi Nam,
> 
> On Mon, 12 May 2025 at 19:38, Nam Tran <trannamatk@gmail.com> wrote:
> > On Mon, 12 May 2025 Andy Shevchenko wrote:
> > > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> >
> > ...
> >
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
> 
> i.e. a drivers/leds/ driver.
> 
> > However, the LP5812 hardware offers more advanced features, and I’d like to support end users all
> > features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/.
> > It is easy for end user to investigate and use driver.
> >
> > If I want to keep the current driver interface to meet this expectation, would it be acceptable
> > to move it to the misc subsystem to better support the hardware?
> 
> I guess you can add custom sysfs controls for the advanced features
> on top of the drivers/leds/ driver?

Yes, exactly that.

-- 
Lee Jones [李琼斯]

