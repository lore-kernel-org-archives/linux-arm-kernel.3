Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467CFD232D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afgUmo7FVA0UMa1pCZgDdfCcrRnZeK5e78tq9RhRkhg=; b=tsAzm35BpfMpPERuuGK5QHtwPP
	3u0YNrC132QYPFAJDWTpLpzi27cp2Q7kurpCictyghflonuq3eZIx+zXeGRrr8DARInV7c6q5pC/K
	xaAi5p+YhXD1vtBarjAhTLGTNm2cc9SXAs5tkglPsQ7KhTSwuR9gTUf6xzG6avlzvCB4QmoROcAEM
	ZONhdCVqBDY5Kg9KMneAnvCd6H/MELF7YPNbprFyBwGFG8+YAN1WxjMv2+zxVv4HBpMLE49yda8oh
	Qa+jggyg+fRTm/dafvLyezEIwp3XRgpvAh8sLQ27Y5sjlexWakd7TdkDUPw0WVF7RwSns+PQbwvdZ
	qDaDaWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vedfT-00000003bQ0-3S4f;
	Sat, 10 Jan 2026 18:26:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vedfS-00000003bPd-06vq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 18:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=afgUmo7FVA0UMa1pCZgDdfCcrRnZeK5e78tq9RhRkhg=; b=TBBkE6S2viMmModJ7gC/H2/pmC
	VyCBuAULdIlBeFeTHMiw1k0FI9FcdG6ZYI1BUln5cJKJ7zM3IO/0Yu/jwaGbWHXh3HRxNGi2rvjC0
	Hz0BCuDbZYud3yTnPz8zwu+7fJzcw/sRSA+e3NdIRcGs1gh00G9p+549BbloBiq8ABhDnCErrYaTQ
	XU9rKs5jr5RWGdDFmocUJ9eDG56euyzXR2k6wQsPSkbZPJO3RsBcoAUlpiNd4mxtrNGTiokRmhwCg
	WmrJJK+oGJstSjolh+TcadHGN2n34Haq7qdOFJIgfYLrosyn5nVPStr8/UkuueO07+wegHmnt049j
	ElqpB2aA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44118)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vedf7-000000004ui-3O08;
	Sat, 10 Jan 2026 18:26:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vedf3-000000004St-0Hpf;
	Sat, 10 Jan 2026 18:26:05 +0000
Date: Sat, 10 Jan 2026 18:26:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
Message-ID: <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_102630_089146_3FD200C5 
X-CRM114-Status: GOOD (  20.03  )
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

On Fri, Jan 09, 2026 at 07:27:54PM +0100, Andrew Lunn wrote:
> >    rx-internal-delay-ps:
> > -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> > +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
> >  
> >    tx-internal-delay-ps:
> > -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> > +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
> 
> You need to add some text to the Changelog to indicate why this is
> safe to do, and will not cause any regressions for DT blobs already in
> use. Backwards compatibility is very important and needs to be
> addressed.
> 
> > +  eswin,rx-clk-invert:
> > +    description:
> > +      Invert the receive clock sampling polarity at the MAC input.
> > +      This property may be used to compensate for SoC-specific
> > +      receive clock to data skew and help ensure correct RX data
> > +      sampling at high speed.
> > +    type: boolean
> 
> This does not make too much sense to me. The RGMII standard indicates
> sampling happens on both edges of the clock. The rising edge is for
> the lower 4 bits, the falling edge for the upper 4 bits. Flipping the
> polarity would only swap the nibbles around.

I'm going to ask a rather pertinent question. Why do we have this
eswin stuff in the kernel tree?

I've just been looking to see whether I can understand more about this,
and although I've discovered the TRM is available for the EIC7700:

https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases

that isn't particularly helpful on its own.

There doesn't appear to be any device tree source files that describe
the hardware. The DT bindings that I can find seem to describe only
ethernet and USB. describe the ethernet and USB, and maybe sdhci.

I was looking for something that would lead me to what this
eswin,hsp-sp-csr thing is, but that doesn't seem to exist in our
DT binding documentation, nor does greping for "hsp.sp.csr" in
arch/*/boot/dts find anything.

So, we can't know what this "hsp" thing is to even know where to look
in the 80MiB of PDF documentation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

