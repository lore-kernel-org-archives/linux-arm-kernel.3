Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ0FdpNgHOekWmP2VoCpsk8gYuzsChIxdkx5orIICcA=; b=BwqxbH3CkCJD4TDHAeCYg8P0md
	7XSDe1SzqL3/Zekv7UIrG8vngNcYRNaVbllcISKqfYhbf5y4BeotCHxM88zYWPM9oGb8M2T5aUH/v
	Eh1dKedYAwkgkMacwYDKd8yQiJwUxGDbPXSHwCCWzPIsRcKdwpj8ECtZHMcWyFQ3G+hXRDg/m1B86
	vdnK31Lb+w7YuDfvsHz5JnBV0eabTGEvT7UJ9V0jWUD+I2QBLgY6fj0TgtNj9kAO/qmc7y9NEV8Tw
	fkRCOt1KcRRE3zAgMcvwdEve1jpe/6qRGyYqVx1GB9qx7a1MQDlNEanTfOW6CIUDNZYJoJ/n/ZEOL
	jGXtHdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3u7-00000006izS-4586;
	Thu, 06 Feb 2025 15:34:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3sk-00000006iLb-1jwy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cQ0FdpNgHOekWmP2VoCpsk8gYuzsChIxdkx5orIICcA=; b=wFMh7IIqWLcDH4ZdUBSwhGC7hT
	KAple1XmoomeYbrKzex41iFR/7byyI62Rmox1VtsvppXUxxDoq5L0fgJf4nGLPX9/4vdsjn81cIcy
	ySrNV3KlsBTXGKznowYajXxOw6ivDfvB8TRz26mgBQTYCmh24NqZ1evcB+M7LXHGj6vc6TS7LZwGt
	USN46/YhkZzAd1KiVjlJbJejwwc2xJVVdJyKafyppyyK0LukdKxmTHaXua2pWNERrsvpsyAy32jsO
	UE3XUNH74+8kogXNTDPyepANF3PN20DY4ymDPjhitqNQzodxxNaaVwWXJoWHEdlingxOKpluTEzZH
	vAXhaGEw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54766)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tg3py-0002c8-0a;
	Thu, 06 Feb 2025 15:30:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tg3pp-0003WN-2X;
	Thu, 06 Feb 2025 15:30:33 +0000
Date: Thu, 6 Feb 2025 15:30:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 2/7] net: pcs: xpcs: re-initiate clause 37
 Auto-negotiation
Message-ID: <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_073334_449497_107FA8DC 
X-CRM114-Status: GOOD (  17.95  )
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

On Thu, Feb 06, 2025 at 09:18:54PM +0800, Choong Yong Liang wrote:
> The xpcs_switch_interface_mode function was introduced to handle
> interface switching.
> 
> According to the XPCS datasheet, a soft reset is required to initiate
> Clause 37 auto-negotiation when the XPCS switches interface modes.

Hmm. Given that description, taking it literally, claus 37
auto-negotiation is 1000BASE-X, not Cisco SGMII (which isn't an IEEE
802.3 standard.) Are you absolutely sure that this applies to Cisco
SGMII?

If the reset is required when switching to SGMII, should it be done
before or after configuring the XPCS for SGMII?

Also, if the reset is required, what happens if we're already using
SGMII, but AN has been disabled temporarily and is then re-enabled?
Is a reset required?

What about 1000BASE-X when AN is enabled or disabled and then switching
to SGMII?

> +static int xpcs_switch_to_aneg_c37_sgmii(const struct dw_xpcs_compat *compat,
> +					 struct dw_xpcs *xpcs,
> +					 unsigned int neg_mode)
> +{
> +	bool an_c37_enabled;
> +	int ret, mdio_ctrl;
> +
> +	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
> +		mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
> +		if (mdio_ctrl < 0)
> +			return mdio_ctrl;
> +
> +		an_c37_enabled = mdio_ctrl & BMCR_ANENABLE;
> +		if (!an_c37_enabled) {

I don't think that we need "an_c37_enabled" here, I think simply:

		if (!(mdio_ctrl & BMCR_ANENABLE)) {

would be sufficient.

> +			//Perform soft reset to initiate C37 auto-negotiation
> +			ret = xpcs_soft_reset(xpcs, compat);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +	return 0;

I'm also wondering (as above) whether this soft reset needs to happen
_after_ xpcs_config_aneg_c37_sgmii() has done its work - this function
temporarily disables AN while it's doing its work.

I'm also wondering whether AN being disabled is really a deciding
factor (e.g. when switching from 1000BASE-X AN-enabled to SGMII, is a
reset required?)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

