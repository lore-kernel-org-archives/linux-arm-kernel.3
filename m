Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6669A1062878
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYNLKIwQSasBdYZGFqUzejhZnpcUdrBH4ZJakw/Cw+8=; b=GZyOf7I8vR1+AunyFbdLFiD/dU
	dJKMP1wRG3phf7XG8WwsyQfpDyX+qcCV+t/KvIFUTQbX1P8ws57LU6qgEqfZ77YRRvX/eLfjDOGnN
	SdLzzMNvOaVF27wBEMaEVqm8zVyTTPdSv7I7zdqUantpaFe4Vpwb1GbLYvI1CsvKxHLowhCsIV5h7
	gQ1JYKZYyRX6VGJKkscuvvROHtxaWBr9VXyJEasbimCDrwmFi8mmcARfX9601bQPPLDQ5WqpJHMi2
	VaaaDulT4eawg44ZpVbDZ2314BrgR/qqvmg1tToJUFV0YXqeyOx7Mouy8dvRSMlljiJlkfcla5SyA
	b+2yinKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Inz-0000000BZNX-0E9y;
	Wed, 11 Mar 2026 12:36:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Inw-0000000BZN9-0rP6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=cYNLKIwQSasBdYZGFqUzejhZnpcUdrBH4ZJakw/Cw+8=; b=RH
	OIw8K0qHvCBbrvpteh+VT0BrYx/46g/NdI8GvvNAp31wBun/NJpCAvqnEdPQ9fs+QIFmMO6qK6Cwn
	g/+RhTu31W0S6gMZ99WhvWo+oEVArBxTPDaJ9R96CHAUvB8ggbzTCEkB8VzHD0LPiaMMC+7F0oziM
	UutcfMNomj8D0Oo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0Inf-00BB9I-F9; Wed, 11 Mar 2026 13:36:31 +0100
Date: Wed, 11 Mar 2026 13:36:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Roger Kan <Roger.Kan@quantatw.com>
Subject: Re: [PATCH v2 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Message-ID: <8249f102-cc35-4614-9e20-506c51a78d8e@lunn.ch>
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
 <3256b313-7671-4fda-9949-766906c344a7@lunn.ch>
 <CAGfYmwUfKk5OrFzJRHyu6h-Jf-cqbxfh62wRmxwOL8K7VfFGfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGfYmwUfKk5OrFzJRHyu6h-Jf-cqbxfh62wRmxwOL8K7VfFGfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_053648_263891_E3E2B3C1 
X-CRM114-Status: GOOD (  16.75  )
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

On Wed, Mar 11, 2026 at 02:31:48PM +0800, Potin Lai wrote:
> On Tue, Feb 3, 2026 at 9:42 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, Feb 03, 2026 at 05:48:13PM +0800, Potin Lai wrote:
> > > Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> > > devices connected to the AST2620 BMC SoC.
> > >
> > > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > > ---
> > > Changes in v2:
> > > - change mac0 phy-mode to rgmii-id
> >
> > No other change? Was the previous version broken, and never tested? Is
> > this version broken and not tested? Is the phy-mode ignored, which
> > suggests something else is broken?
> >
> >      Andrew
> 
> Hi Andrew,
> 
> Sorry for the late reply.
> Both "rgmii-id" and "rgmii-rxid" modes work fine without connection issues.
> However, based on the scan testing we performed in U-Boot, "rgmii-id"
> shows better coverage than "rgmii-rxid". Therefore, we decided to
> switch to "rgmii-id".

I'm surprised it works with both, that is well outside the RGMII
specification. The PHY must be pretty forgiving.

Anyway, thanks for the information.

	Andrew

