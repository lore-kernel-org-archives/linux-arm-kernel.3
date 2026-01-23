Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C01DD778AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8X2Qe2GBeiLawBUjaVg5sWcX14l13OwMuQdvbXbuto=; b=1WKn7SpX29YIOX+IrfZKwOusQ/
	rw2F9Y7AUkUOA0N2FpHnJlsNbhiRe9dKapyf2p39ikUwwsnKAjilqf04d4IDo15l49t18MvVNa4qO
	/yhkucSGWDqALy4zJSiTnc+1pxFqulzCPs6QYyHXdvUTGT9txbFdF5MD8OLsp8C0f+2VRfyo3rTDb
	LgJ+tUyvYDQJq1HSd82RKu7JJnEc6edFY99tdsAWFCy6LvxeGiH6Q3aIWzUJsREf1hFxdqpN69+3X
	dqMkrA7GyfCf5RuPqBW2ZgcoQgnZ3ERwrYTKvl2Wmiy+LLuQpHsQuVBjoEoGNbYvZ8tpdlgj9I34O
	nHYI+OQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjN4a-00000009R8f-0Nh0;
	Fri, 23 Jan 2026 19:44:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjN4W-00000009R8G-3Cmy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F8X2Qe2GBeiLawBUjaVg5sWcX14l13OwMuQdvbXbuto=; b=Vi+KKTJLvBDJ5gb1XmjMzrFfkX
	OepU/znm3KgM9lIw1eqmtwwZaaIIc04+Kb5MXIY8ibH0se3h5pJYgGgOoehALiJkRZRsIouKr4gb7
	sQrYHEdDO4+llUaEt7gA4Xx4tPCXIMjC3PEVTfgD5gpy5lbkCp9fO4+EWuDZXPkY3TlU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vjN4M-004JUt-2V; Fri, 23 Jan 2026 20:43:46 +0100
Date: Fri, 23 Jan 2026 20:43:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bo Gan <ganboing@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
Message-ID: <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_114356_813860_E5C3F1AB 
X-CRM114-Status: GOOD (  20.51  )
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

On Fri, Jan 23, 2026 at 02:47:18AM -0800, Bo Gan wrote:
> Hi Krzysztof,
> 
> On 1/23/26 02:07, Krzysztof Kozlowski wrote:
> > On 23/01/2026 08:39, Bo Gan wrote:
> > > > I assume the address of the interface is fixed. So you can just key
> > > > off that to distinguish the two instances.
> > > > 
> > > > Since this is an internal property, not a board property, it is not
> > > > clear it actually belongs on DT.
> > > > 
> > > >       Andrew
> > > 
> > > IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
> > 
> > This is not the purpose of DT. Please rather use arguments in terms of
> > DT rules (see docs, presentations).
> > 
> Any examples? links? Thank you for your patience.
> 
> I'd say if the board .dts never overrides the eswin,rx-clk-invert, (E.g.,
> the SoC .dtsi has rx-clk-invert, later the board /delete-property/'s it)
> then yes, it can be treated as something inherent to the mac, and then
> "use arguments in terms of DT rules". I was thinking about use cases like:
> https://lore.kernel.org/all/20230714104521.18751-3-samin.guo@starfivetech.com/

Your device should be compliant with the RGMII standard by
default. There should not be a DT property to ask it nicely to follow
the standard.

Properties like

motorcomm,tx-clk-adj-enabled;
motorcomm,tx-clk-100-inverted;
motorcomm,tx-clk-1000-inverted;

are for broken boards which break the standard and require the MAC do
also break the standard so that everything works. We should not start
out with the assumption you need to support broken boards which ignore
the standard.

       Andrew


