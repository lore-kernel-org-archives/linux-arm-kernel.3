Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03206CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwBCYnwNFk4ZMTj+qPeBrwzZbK88LLQJgUmh18M8wj4=; b=h49ktMmrBYm6RrsHkqOb3MKwsO
	ZH2n/OSMcyTLvzZs7O1B55vaAG4lKdJvIErqOo1V12Gv6AtDmlxgAzm92cG7TNydf5UT/eFUs/szI
	ReST7Av6xM4Hz7KrubpODIZmBzJnKapUYyuTGgGW3LkXg24WIyIC6PyVabZdd+eyy8+WJsOS6fmIW
	FsC7P+lD55Vy2JRQ4UpPBQ9MhEHoMhXpOTQvYMIAxbTsJ0CWpLMulwxWDyIw3LIViDdqMZdXqU3UW
	+f3jbIJsu3f1M7owtME9RUNIaYA3ysKOyPTN4iS5GYkiWVt860vRWvjskGd3QRs1rwxVxvgLQjcf2
	MYXJm8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1JV-00000000MTO-29Q8;
	Tue, 06 Oct 2026 09:18:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1JO-00000000MSu-3qEC;
	Tue, 06 Oct 2026 09:18:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59C3140B73;
	Tue,  6 Oct 2026 09:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932121F000FF;
	Tue,  6 Oct 2026 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791278294;
	bh=fwBCYnwNFk4ZMTj+qPeBrwzZbK88LLQJgUmh18M8wj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrnFRMCbzA2dvkuIb9FmCIRXf86GBtg+uVN951Mp/yjNRbpw0ntKPKAeIjiNjzP/P
	 SXDDTtx5vrRRhL5+Pa4KqAWGOR3Dtxcqxh372werY7LeQGtSmp5q1PxSJU0Z9isJD3
	 mqdQrgbBE4SZzJc5f3wQd2Qnwwuvei29faM58vhjDwfZuL7fifJ6JF4vNtKY3bL715
	 lA/JZgGpZeptfb6agSvYSvvcZx3jB9jAC9iDAkfW/6MDK25jAl+tLNPG/V9rgyoXDT
	 U2+LljHN7+vDV7NvEf2qf2P3Bf2bAIJntyExKKXfYRtfemRjbGvrmqlRK4RtK5q1S6
	 G0bDMidMT8cXg==
Date: Tue, 6 Oct 2026 11:18:11 +0200
From: Vinod Koul <vkoul@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/3] airoha: an7581: USB support
Message-ID: <asS805-vbum46Oji@parshuram>
References: <20261005105535.2472-1-ansuelsmth@gmail.com>
 <asPCFDMXyntAV6lx@parshuram>
 <CA+_ehUx_B2K3WgLYkt2fz5jzDRB24LQRB3uX_VScZ2QSxCojPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUx_B2K3WgLYkt2fz5jzDRB24LQRB3uX_VScZ2QSxCojPg@mail.gmail.com>
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

On 05-10-26, 17:31, Christian Marangi (Ansuel) wrote:
> Il giorno lun 5 ott 2026 alle ore 17:28 Vinod Koul <vkoul@kernel.org>
> ha scritto:
> >
> > On 05-10-26, 12:55, Christian Marangi wrote:
> > > This is a major rework of the old v2 series.
> > >
> > > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > > configuration for the Serdes port. Such port can be either configured
> > > for USB usage or for PCIe lines or HSGMII and these are configured
> > > in the SCU space.
> > >
> > > The previous implementation of a dedicated SSR driver was too
> > > complex and fragile for the simple task of configuring a register
> > > hence it was dropped and the handling is entirely in the PHY driver.
> > >
> > > Everything was reducted to the dt-bindings to describe the Serdes line.
> > >
> > > Also the property for the PHY are renamed to a more suitable name and
> > > everything is now mandatory to simplify the implementation.
> > > (the PHY are always present and active on the SoC)
> > >
> > > Also other unrelated patch are dropped from this series.
> > >
> > > Changes v13:
> > > - Rebase on top of phy next
> >
> > Pls fix the chechpatch issues. There is new blank line at EOF, SPDX
> > format mismatches and many more. Make sure you pass --strict flag to it
> >
> 
> My checkpatch doesn't report the blank line. Am I missing something?
> For SPDX, is it ok to change it? The commit just move file. I would
> like to fix that in a separate commit after. (I can include in this
> series if you
> want)

Yeah checkpatch wont. Git complains when i apply:

Applying: dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
.git/rebase-apply/patch:74: new blank line at EOF.
+

I think we should fix SPDX ones.

> The other warning are about Kconfig description where I can
> artificially make the help text longer (no idea if it's OK...)

That one is okay, I this description is fine

> And the line too long for the define but making the line shorter
> would result in a disaster for the register.
> 
> Up to you what I should fix but I guess the real important one
> is the blank line but my checkpatch script is not detecting that...

Yep, line and SPDX ones are important. long line splitting will make
code worse to read, i care more about readablity more..

-- 
~Vinod

