Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1AFC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3/g4/jBSS+544GxD3Uqs3+ihWOI9sn+j4nRaeUAg7Y=; b=DayeBtITa/87WYVbqNW/KD+3KJ
	P9s6Fa+ui5jSJkf1/d/iLrC/K+BWr23/OA3GPkkTi+X2+lXJcUua4+VsrrulQzCum7/jbaMP/RYqD
	lkYJqtZrz2w9PAj1B5VguUQm6UQvnMvLrZ7o2yjB1pTgwRMeJDazn+lrlptaZSyVgMSsFRrjF1GQl
	zE1FqDqHuQFtVbQrfrG1V9EFViCaG4q2HHdRvIaYvOMnKRf0lKX/uGrcB1lh31bVE/IIw005aTXY9
	ToEwADWvOH+9PY/78TqpxxNEBU6S3kGiEowpeQX0Bs+D25I6K03ng6hBtMzyYP81yY1jZvLIMuSfe
	mjH1eE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPH-00000007d59-3D8y;
	Thu, 24 Jul 2025 13:54:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uevSN-00000007SYM-0cNE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=n3/g4/jBSS+544GxD3Uqs3+ihWOI9sn+j4nRaeUAg7Y=; b=ZBpdSnxsorutDmupx/4WVEj1SW
	1bm4a1Sl3LhmC7jKATKv6Bj5YVbhDxxMPBxAXZG6W+WhjzDrpfbfTQgHmOFy8klPSGkde/Myqk3Pb
	SHKyusWfHkjVxeysakRsTlCMlY406YskhV+RB00hIFeaHeEgYDfq9m/MRcdqhX6PzFYo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uevS7-002lEV-5u; Thu, 24 Jul 2025 14:53:39 +0200
Date: Thu, 24 Jul 2025 14:53:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64
 (AST2600) Board
Message-ID: <769d6817-ee97-4a23-b013-29bc875a00cb@lunn.ch>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-11-rentao.bupt@gmail.com>
 <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
 <aIGGdbIX9HaV4dB/@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIGGdbIX9HaV4dB/@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_055355_182973_94A1330D 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Jul 23, 2025 at 06:03:49PM -0700, Tao Ren wrote:
> On Thu, Jul 24, 2025 at 02:03:20AM +0200, Andrew Lunn wrote:
> > > +&mac3 {
> > > +	status = "okay";
> > > +	phy-mode = "rgmii";
> > 
> > Does the PCB have extra long clock lines to implement the 2ns delay?
> > 
> > 	Andrew
> 
> Hi Andrew,
> 
> Thank you for catching it. I didn't notice the settings because the file
> is copied from the exiting fuji.dts with minor changes.
> 
> The delay is currently introduced on MAC side (by manually setting SCU
> registers), but I guess I can update phy-mode to "rgmii-id" so the delay
> can be handled by the PHY?

That would be good, if it works. The problem with the current code is
that those SCU registers are not set as part of the MAC driver, so it
is hard to know what value they have.

	Andrew

