Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1948CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNUximqet6DWhyIz4nhEhfE/R+ezClJhU7cuTBXoYag=; b=AaIocZ7Ovx7dt0em2Z7ngsEvpe
	zf5GcYY0d+TmeOh6sqgNwkau8SdocPLYLSYiLSqY7W4xTx4Skl9ve03+eK70BiROqNBCXwrk5RWC+
	GzCo6oVDz3xmok1xkuTFr7ctw70La9hJQ1t34L5uNltPzJJjUi47BrihLSHYdiTF6vh3/urK3+9rh
	KvHokJbqLqWbMWw3q0+b/xTv3khZsAYGeOm/pxm/rDFQ1/lvddS4Cti1JZN0h08N3DPMdhbQtKiT6
	TedZjCDaFDtrbc3nIpEc57poeDhpOaSVqkzEiVSqu1wc5B+d72Ntt62uokLhc8PGwcnNqCh6pTUjB
	9e3kRvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kTw-0000000HFKm-3Plj;
	Tue, 14 Oct 2025 19:14:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kTt-0000000HFKN-3fUs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 19:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QNUximqet6DWhyIz4nhEhfE/R+ezClJhU7cuTBXoYag=; b=Xb4AaGVPDNsB5EUGG4ObRO3h6n
	DdfCBjHziOyMg1DbFj0LI4V46gaeDsVOVqZ7R7SJEGlu8vwilTtUnr+gm3fvdGWgvidwkYMsGBUNa
	+BM7VJDn13srbGPuxSr6UCA+jQGCqnVFKN2/6ObMDl1kAwNsnIYCuNDVFT1nZPUWoxSI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8kTV-00Awk6-Os; Tue, 14 Oct 2025 21:14:21 +0200
Date: Tue, 14 Oct 2025 21:14:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tao Ren <rentao.bupt@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
Message-ID: <33b9d6d4-bb2f-47e6-8d3d-94a2ca2b8474@lunn.ch>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
 <aO2kLyxGlGt12sKD@fedora>
 <ea64d3c1-e517-4bd8-9a2e-56432f286347@lunn.ch>
 <4e099ead-e6df-4489-a775-1730bc852dcf@roeck-us.net>
 <f801a4cb-3d27-439c-82f2-d5ee5aa0d810@lunn.ch>
 <7197bfc7-fef6-40b2-b3f3-182e9428dc12@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7197bfc7-fef6-40b2-b3f3-182e9428dc12@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_121445_930671_29E263A6 
X-CRM114-Status: GOOD (  25.74  )
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

On Tue, Oct 14, 2025 at 09:39:02AM -0700, Guenter Roeck wrote:
> On 10/14/25 08:11, Andrew Lunn wrote:
> > > > If it is already in mainline, i don't care too much if it is wrong. We
> > > > don't want to cause regressions.
> > > > 
> > > > I only object when adding new nodes which are wrong. If we keep adding
> > > > broken nodes, there is no incentive to fix the broken driver to do the
> > > 
> > > This wasn't adding an allegedly (sorry, it worked for me) broken node,
> > > it was removing one that worked for me all along. Obviously I do not know
> > > if it worked (or if it is even used) on real hardware, but it worked for
> > > the fuji-bmc qemu emulation.
> > 
> > It probably does work on real hardware, because it is one of those
> > "two wrongs makes a right" cases. So i see this as a regression. The
> > node should not be removed. It should hopefully get corrected sometime
> > in the future when somebody actually fixes the aspeed driver, and
> > fixes both wrongs.
> 
> So you are trying to force the issue by disabling the Ethernet interface
> on fuji-bmc until the problem in the driver (whatever it is) has been fixed ?
> That just seems odd.

No, i see this as a regression, it probably used to work, so it should
still work.

I'm just pushing back on adding new nodes which are broken. If it is a
new node, it should not cause a regression.

	Andrew

