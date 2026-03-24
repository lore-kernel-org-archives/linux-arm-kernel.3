Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C26CE9A756
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM7docOz3+I2UfqJvceRPUIWzXOJQc92AP8ly2Gule8=; b=ot/VUeBtHzbw8Lx0eH94unMbHb
	vAlTylEc3UEy649g+7nf09Mz3yq2wknOcGSbGKg1Lsjp2gug6J4dWSjQfT0bzePjECH77XQ6ZwB1a
	JgdxKbKvtO2+4/EH4t3li/ds4sleSb61usiFRdu3sW2gNz3d5WlekM3eoMi/8Y+ah84GE4FwfBp/F
	ZonFtV1oDKRLR1Gg+IoW1uiHkeIT/Cb9zvAgS/Y3xS7EKO72z+4yPW7f0M+nGksbTmagEEMYEQZF8
	6XswXELGnx7NtPLteF8iRHWtYQDM7OK5HtY2pXXU9LwL3LInMz65GwQzT3kInnJ1eW1/cD7COBJdL
	P66JUzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yQ7-000000018XE-1k6P;
	Tue, 24 Mar 2026 09:51:31 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yQ4-000000018Wo-3qm8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qM7docOz3+I2UfqJvceRPUIWzXOJQc92AP8ly2Gule8=; b=U46ofiATHLoxKEf4Yy73zNPJ1f
	JKHxWCjmWY3V+JggGvOa2auChkoOlNseqvnK4KxYP2+txgkdW6lKHd4EUuG0tp/qojPQGmbPd0vRo
	mypPEA3vT+mmT1sK3ao4nshMYjiDHpdC6470aaQKI9JSDROWEFCoNL7SaQ3yEY1mX9ElqViLalKSC
	WVJTQXtrk60btewfEUKLWCIDQTbevX+C0wjQa2hOOpfZd8cH8LxBUvEmpctJZ7LJRgG8XzI8+j6ce
	E/IaffiqP+Wjfi8GzxZMsjTQCHyhzqkQP9cyClWU+Lw52ugeSP3yIyiSrbr+jCliAp07mqi1SsPfD
	Z66GwNsg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56012)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4yPv-000000001ia-04nV;
	Tue, 24 Mar 2026 09:51:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4yPt-000000004y8-2A0m;
	Tue, 24 Mar 2026 09:51:17 +0000
Date: Tue, 24 Mar 2026 09:51:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 4/5] net: stmmac: dwmac-socfpga: get the
 phy_mode with the dedicated helper
Message-ID: <acJelVznH_OUwn9A@shell.armlinux.org.uk>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
 <20260324092102.687082-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324092102.687082-5-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_025128_982209_5AE68A6B 
X-CRM114-Status: GOOD (  12.17  )
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

On Tue, Mar 24, 2026 at 10:20:59AM +0100, Maxime Chevallier wrote:
> We enable/disable the sgmii_adapter in the .fix_mac_speed() ops based on
> the phy_mode used in the plat_data. We currently get it with :
> 
> socfpga_dwmac
>   ->dev
>     ->drv_data
>       ->netdev
>         ->priv
> 	  ->stmmac_priv
> 	    ->plat
> 	      ->phy_interface
> 
> where we can get it with :
> 
> socfpga_dwmac
>   ->plat_data
>     ->phy_interface (done by socfpga_get_plat_phymode)
> 
> Use that helper here.
> 
> Note that we are also being passed a phy_interface_t from the
> .fix_mac_speed() callback, provided by phylink.
> 
> We can handle that in the future when dynamic interface selection is
> supported. We'd need to guarantee that we have a Lynx PCS to handle it.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Nice cleanup!

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

