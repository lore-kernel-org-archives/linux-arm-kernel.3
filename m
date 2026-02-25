Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C691EEFD20A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwTftfPLORKMn5vbTjWLfPI4meAs67WbxJlY6dwYVxc=; b=FyemYRVIlG2CiBovIXJcwoTh8o
	vctXr2Yq9ZVkmMPzplvuT+IrVvS7gwkZ7QcK116voweEJXcS2U1kpJRRvDa8oSVVTQ38xUwChgWgY
	AsVwKxwguj12gRse99pAIPmtmSp6oaSP5+vMTPuayqcN5EzKdA3UaqjaPc1cCY2GZRYWytNX5fTmf
	gHoSzq4/vU1bo9YShaQzTaEDPw6WXidjX5ggSwmIE+C5LNLcLO3fUCNtPMXGERzWT/kTn95AUxjrP
	bP0B1o0xtFaiobwsm9U/ZsMYMESfnTQEZ5pHAYu5SWAigXUQYdEqH9M4S1jz9KAAZ+dLYxJ+IpM/U
	UFPHrYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAC7-00000003Yrw-0Eq1;
	Wed, 25 Feb 2026 08:24:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAC4-00000003Yre-2bbN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CwTftfPLORKMn5vbTjWLfPI4meAs67WbxJlY6dwYVxc=; b=R/tRZzxP/yP1+0uU5Go2G7UImI
	FkW+OyQsDbkpOuCA85OOzzN11W/T22xls5UVsZEJj1GH+rzl1/RR1U12RsrHIlGC5jezU3eb/+htD
	L4icO7bP/BS+iqdjlV82aZWGNQ54mjIJ4uzcyl1ZApRNy27gUYHSeQDdppfRMm9CXT+F/uq3jB4rC
	OxlhtzubJH1mnYyN9J1T7Ue3zlREQLshR9mt69cTodCZqvBT2pgfbhCVePLWafQLwvBVKpz1nJSh4
	ztiYKogDe8f1j+P4+7YjeRZJZlmomOu0VV2ZTaFyQc+e34qpa9snAQzkWMzEHMX5os3x/J3pFVRVz
	5CmjP+Jg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAC1-00000008ZFe-1aV4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CwTftfPLORKMn5vbTjWLfPI4meAs67WbxJlY6dwYVxc=; b=kfzVf4+IM4IiPw4cIgIYd3bERw
	+DP84XAV4/0wtN/BzlkFLseEOWDvHg5qQwgrzMP7UdzYPGcFGsl+LcyBC4dQe3XNeH6DojGmKUbjU
	lW9s5j9i0NG1gkC50JfQdFm1oESpk+TxLCAy51Ftlum7O5nHCGLZHyTlPw9p9vmuJSpoTDRNGZaJd
	c2f9aUY7+84rXRiU52Nk52OA3xS6MtK8ysgQ5Q0muYLqQSlfi9M7YNbGxZQ5AwVVtcgixmvEXTIxt
	jDuS98wXkr41ETbXxZIyRzGGJMc29PQf94MX/5VFdKZazR01lZbYYmmI1JQJ41Rqy8Vp1TYqgug/8
	OGMRSsGw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35986)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvABp-000000006C7-2ZRo;
	Wed, 25 Feb 2026 08:24:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvABm-000000000mM-2Dvn;
	Wed, 25 Feb 2026 08:24:10 +0000
Date: Wed, 25 Feb 2026 08:24:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: fix .ndo_fix_features()
Message-ID: <aZ6xqig4zh_Un8R7@shell.armlinux.org.uk>
References: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
 <20260224173037.7871e5ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224173037.7871e5ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_082425_691028_27A65400 
X-CRM114-Status: GOOD (  24.82  )
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

On Tue, Feb 24, 2026 at 05:30:37PM -0800, Jakub Kicinski wrote:
> On Mon, 23 Feb 2026 11:24:51 +0000 Russell King (Oracle) wrote:
> > netdev features documentation requires that .ndo_fix_features() is
> > stateless: it shouldn't modify driver state. Yet, stmmac_fix_features()
> > does exactly that, changing whether GSO frames are processed by the
> > driver.
> > 
> > Move this code to stmmac_set_features() instead, which is the correct
> > place for it. We don't need to check whether TSO is supported; this
> > is already handled via the setup of netdev->hw_features, and we are
> > guaranteed that if netdev->hw_features indicates that a feature is
> > not supported, .ndo_set_features() won't be called with it set.
> 
> No lies detected, but is this enough? The whole TSO enablement 
> looks quite wobbly (as you mentioned in another email IIRC). 
> 
> Only stmmac_hw_setup() actually calls stmmac_enable_tso(). 
> And stmmac_set_features() does not call stmmac_hw_setup().

Looking deeper, dwmac4_enable_tso() has two paths depending on the "en"
flag, both of which are commented as "enable TSO".

Then, looking at the "Enable TSO" block of code in stmmac_hw_setup(),
it looks to me like we can end up with some queues that have TSO
enabled, and others which don't (because TBS has been enabled on the
queue.) As far as I'm aware, the network layer doesn't support
per-queue TSO.

We can't call stmmac_hw_setup() from any path that we care about any
state being preserved - it issues a software reset which causes
everything, including the PTP clock, to be reset and all state then
needs to be reloaded.

Lastly, we don't need to disable the TSE bit (via stmmac_enable_tso()
when we disable TSO, because there's a bit in the descriptors that
also needs to be set for the packet to undergo TSO. However, if the
system undergoes a suspend/resume with TSO disabled by the user, we'll
call stmmac_hw_setup(), which as I note in the previous paragraph will
reset all state, including the TSE bit. stmmac_enable_tso() won't be
called, and thus the TSE bit will remain clear. If the user
subsequently re-enables TSO, then we'll queue packets for TSO but
the hardware won't have that enabled...

That's a problem today. So, while you're right to point this out (I
had missed it) it's a separate problem to the one being addressed
in this patch. In fact, I think there's two new issues that have now
been identified here.

1. The lack of setting TSE on resume if TSO is supported but but has
   been disabled by the user.
2. The interaction of TBS and TSO feature where some channels can
   support TSO and others not, which I don't think can be supported.
   So, I think if we have _any_ channel with TBS enabled, we have to
   disable TSO on the entire netdev.

I think these need to be separate patches, and this one is still
valid on its own.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

