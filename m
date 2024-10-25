Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C4BD0C609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaLzS2qaJigWNLOldFetiqs+rgYiakfBQHgJpJQH0ok=; b=4tWg9TnxmJvzIwosBT+FamczxK
	7wtuiCB1BaYGsCgUaI9lxddrLC6ba+Y8Ochzc6wH1RK38X+lphPAx9aTcCDCInA15Xo5eFf3bOUWH
	S1DvLN3bUXi104fhGKIc3DjD5XETLFL957lltqFMsbgWeZT599HmaQev3pPTNrCAYAUCM/ngrsPz/
	R2EJcRMZwDyGMaGpjTMkxllC3NtHyjFy0MZKsODkfP38FabhzQlsewyWZwgS1g2+TcWRK7MR7Fdoo
	ga9/5I0gIIkQDRLB+dQD9mpt5t+xNzVp5sXmFH6IeCjP9Avl2rPCdPdZ2sHNCzR+8d8YtTXucUHHa
	QhHG9dxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KDj-00000003naH-2v3l;
	Fri, 25 Oct 2024 13:19:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JrX-00000003jo0-0jcg;
	Fri, 25 Oct 2024 12:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uaLzS2qaJigWNLOldFetiqs+rgYiakfBQHgJpJQH0ok=; b=UrLWioFD3+IF81Nj7052DTFI4U
	HHlf+h2qAaAaDBGEcmYLn8yd9l8RpBEvj9lQ2CUvYIoHWC8LsngOarDnksRT6ja+T7M8hi1WLiXTS
	5HH2fxuI+M2mWfbMwbFJk2la+fEEPtnMQXEEZFmldTftoeheMatO7DshRfbzkHChbDJG6i8PLaFl7
	DwF3TWEhtjfthgZNHj/Q78IAaI4r8IuBLMrFIz4YjMPJtEpM9IIuaV5Rro58ehbT2iMLzM5fwrJSq
	M0OeFvZ0Y2aPVeCk0cwh95hNllfZ37lQJ6uQ1P9X0nyyga41LglyvNENOjWEuhcDYSvilwijSIrtv
	fCLmPphg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JrU-00000008ui4-1Hwh;
	Fri, 25 Oct 2024 12:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uaLzS2qaJigWNLOldFetiqs+rgYiakfBQHgJpJQH0ok=; b=kp6vq3UEPeK6nUfz/w8v2v2WhE
	Lq8d+/sHZntmUJ1c0EywObGbYOcK1hIlBIGXEV4iTq9kTQbMCedm2lXASJq7uMv9yj1nWDSTNbiP+
	M+PgdGgfT0stpFbABjORFWF70lBaytRFHY/8X0N9d+Dc6WJ6dw6J0328StxxzbtmCvXQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t4JrJ-00BFG4-9v; Fri, 25 Oct 2024 14:56:05 +0200
Date: Fri, 25 Oct 2024 14:56:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <a8f9a6ba-b33f-4f78-97c4-757a15895104@lunn.ch>
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-4-ansuelsmth@gmail.com>
 <87aad5ff-4876-4611-8cf8-5c20df3559b3@lunn.ch>
 <671b7a2e.050a0220.4431c.03f5@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <671b7a2e.050a0220.4431c.03f5@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_135616_471837_B6B05EDE 
X-CRM114-Status: GOOD (  12.76  )
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

On Fri, Oct 25, 2024 at 12:59:54PM +0200, Christian Marangi wrote:
> On Wed, Oct 23, 2024 at 06:53:14PM +0200, Andrew Lunn wrote:
> > > +	/* Enable Asymmetric Pause Capability */
> > > +	ret = phy_set_bits(phydev, MII_ADVERTISE, ADVERTISE_PAUSE_ASYM);
> > > +	if (ret)
> > > +		return ret;
> > 
> > The PHY driver alone does not decide this. The MAC driver needs to
> > indicate it supports asym pause by calling phy_supports_asym_pause().
> >
> 
> Sorry for the stupid question, I couldn't find this OPs. Any hit how to
> handle this?

For phylink, set MAC_ASYM_PAUSE | MAC_SYM_PAUSE in the capabilities in
phylink_config.

For phylib, call phy_support_asym_pause(phydev) after connecting to the PHY.

	Andrew

