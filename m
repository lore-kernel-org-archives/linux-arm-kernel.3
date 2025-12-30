Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B8FEE0215
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nabQCJqKlBQXC+lm+okeZoBzrh5jPLLfEQ7mZ6JPtvo=; b=FMM3VnaVdVhf2rHbI9HrovXSE+
	BbKm4RmE2K57VUuort6TMYhbgGfBJ8iqwzR3bmIHHQurFK+X44u5iTFxNN/YLIyuEwZ4bAtDEre0D
	LIA1MJ+vZlN6ZANRKJn3u8eV54fSqSgs/KG35CAjTLoW4kaGm9IVlGLjlDkCJ8oGOqvSKE5PsQxLU
	zpLgjVQW02rwVNENLUle/5GJEObVJj0KQpy1iBodbA4RSjT2CNxjXdiYr6SKAHb0oWW8CDXuE94Fu
	dEMB4stb+rO0fx3McpYDy+LGFGO0WlOBfOdQ2/ho8ZHapQntkCeAO38cW5S3M/HLRfgvIQQneYeJG
	xmeeKuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabl2-000000050M8-1X74;
	Tue, 30 Dec 2025 15:35:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabkx-000000050L9-37Sy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 15:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nabQCJqKlBQXC+lm+okeZoBzrh5jPLLfEQ7mZ6JPtvo=; b=5Pl0fCbuJqu7Et0weELcwVXtpV
	1ARiSNGuY/8OKPPgkRUAwRclA+bSHkBnCeI1qEpc67aptY3qZjqdLut3Zo20Pf+DkX1rMtMpcVQkf
	rlAbNb72W/fMhsTLjqxnQfZcc77vzkqDjYCRnhGfG5yN+pct4Gt7xRI/ur+uxRenATDw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vabkt-000sjC-11; Tue, 30 Dec 2025 16:35:27 +0100
Date: Tue, 30 Dec 2025 16:35:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1
 and v2
Message-ID: <51825dee-c2c9-4d94-b741-ffdc2fbfa773@lunn.ch>
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
 <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
 <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_073531_776344_306B32F3 
X-CRM114-Status: GOOD (  14.04  )
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

On Tue, Dec 30, 2025 at 02:34:14PM +0100, Marek Vasut wrote:
> On 12/30/25 11:46 AM, Andrew Lunn wrote:
> > > +&fec1 {
> > > +	fsl,magic-packet;
> > 
> > Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.
> > 
> > WoL for a port connected to a switch? Have you tested this? Normally
> > you would have WoL on each port of the switch, and not on the conduit
> > interface.
> > 
> > > +&fec1 {
> > > +	fsl,magic-packet;
> > 
> > Have you tested WoL?
> > 
> > > +&fec1 {
> > > +	fsl,magic-packet;
> > 
> > WoL again?
> I don't think WOL is used on this device at all. Would you suggest removing
> the fsl,magic-packet properties ?

Yes.

	Andrew

