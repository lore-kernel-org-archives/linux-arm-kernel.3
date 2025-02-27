Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A5FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbxxJ9pdlSP3U09DcPRoocZLIIpwjB5GRyunBWX+jlE=; b=Jl3ntwPevGZ07hUR14CTkv+qj4
	/eUVYmbi6Te08f2ef1lNZICZ1BmUIHaxtXmVHtZKU1HvA8nqJSz930Wc2lm7KpI8KezY6jAUxhgdo
	s2drOK43U8MlA+hIh8C/2fxBctKrs7eizRzhgHWeOEfnWwcjLDa7i2yeANu7at2yzRcag8xlnN862
	gd00pkUH0c4DI0zxuUw89FE924i1ka6+hgOqm8H+UgirjTI38l7FaBtjW/NFYwjM2nmInqnsnXYlk
	g0Y5M2RTDsyxaI9coj6KaoIZ/B9SBaX3Lw1ElxXZuAqoxEP9LQJVJEPu5KfUIpbO3+wcBWoO8Rc/B
	F5ncRdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkw-00000008apv-3bnL;
	Thu, 27 Feb 2025 19:41:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhdM-00000008ClU-3N8t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rbxxJ9pdlSP3U09DcPRoocZLIIpwjB5GRyunBWX+jlE=; b=bJ+zGhXU3FlmjFeUxlk/urw9rv
	L3AEa6Crjr/Tt+MWVqCW0ex61iL/HQnvl3iWgmhVvH4aJHt0TkewpstPiWl9JPfnh4xG7Cb4VmA3H
	yyddM7pcXpXp+dBWq25hy9PipEB1RwCOXRY82q4gsJ30fsMS70CyliJYkoLmHF/IQw2ZA5gupv82F
	D7iolgE/gBFu84QJaTZoJ61CB8hgph05k8nciXdOQu6/rKC1BCkkqpqX0njPqk53QtXiMh7G6UJiN
	fpPWiy8fBrDilcnDsPoqV1N1h8vcTvR+syRi+ISMqC3Go2wLTTqRCVecY+SaMdYTuCPXaiGoT1bJi
	XeF9wDbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48846)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnhdD-0007oW-2A;
	Thu, 27 Feb 2025 17:25:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnhd8-0008Jo-1M;
	Thu, 27 Feb 2025 17:25:02 +0000
Date: Thu, 27 Feb 2025 17:25:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 3/5] net: stmmac: simplify phylink_suspend()
 and phylink_resume() calls
Message-ID: <Z8Cf7j530L2QaUqT@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1S-0056LC-6H@rmk-PC.armlinux.org.uk>
 <16e3f674-0267-47c1-8825-7f15a379332c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e3f674-0267-47c1-8825-7f15a379332c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_092516_839051_1D31F85D 
X-CRM114-Status: GOOD (  10.76  )
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

On Thu, Feb 27, 2025 at 05:45:35PM +0100, Andrew Lunn wrote:
> > @@ -7927,13 +7925,9 @@ int stmmac_resume(struct device *dev)
> >  	}
> >  
> >  	rtnl_lock();
> > -	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> > -		phylink_resume(priv->phylink);
> > -	} else {
> > -		phylink_resume(priv->phylink);
> > -		if (device_may_wakeup(priv->device))
> > -			phylink_speed_up(priv->phylink);
> > -	}
> > +	phylink_resume(priv->phylink);
> > +	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> > +		phylink_speed_up(priv->phylink);
> >  	rtnl_unlock();
> >  
> >  	rtnl_lock();
> 
> Unrelated to this patch, but unlock() followed by lock()? Seems like
> some more code which could be cleaned up?

Indeed, this vanishes in the next patch due to phylink_resume()
moving later.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

