Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F6FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlbIe310WlqxQlCzQsZku/DHMOFOicrxArfMuFNw1Gg=; b=wYbq8hJMJQlzKjwtD5BfIzoYoL
	SidfYV2lcaT54zsBxAOpDaJnKwCt3zl+SjoP9JNSQAnicops19X8A8qGh+x3IZyv8iiNriWe/WYso
	oBC5S3Ljrueusf5gDa524xKbIWlUEKAHDZv2yj+Zd+ISwrup1HrcFAx1dpL5521LVVfuBe/05EehI
	/GbpP1mXOP+n3qbYGljYJ+sULVkr/NeYg90E6gXaVMYf7JWThHKyirknCNWx467zX9l6UyqYS4Si4
	38t3UH6Ff16JDKtMjH5W0QPUA0FJuoveLCgKqatXnfmaPZkoV58labnp7lTeAmrUGoSYkXXCzVRaM
	mibWkraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJYO-00000004Mpe-0Ovv;
	Wed, 26 Feb 2025 15:42:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJWp-00000004MVS-46RY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IlbIe310WlqxQlCzQsZku/DHMOFOicrxArfMuFNw1Gg=; b=Gr6mqL/5KT3mi2rXH+/NzlclrA
	Lf50svvp6oZ9jNNQ6De4ANjM/sZh5i35wXkvVdJa9o3ZfmLJZz3/DFBnDykr8rGv5KuQuwiV80Xop
	V34TZm6Dq09WG63RVEvT2AzKVwUxU9afefJjx+C1s2HAyXwsFN9acOg7fDEnucngr3I174nfaFaX3
	wIunBfhAx3BdnsUigzn5R95ayXmUE9XX74HhhJVY2XAeDQRJbKrxtqtuN3/HTnD2ZKTq5Gs1nXv/V
	mimnlMLCz7dFvfWNnvaFFyaiB4md/ZjoifI6z/ttueh3w5VhSYfBePvd2Mp4VWNar3ihhB7sPkw4D
	eWG3nE2Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53160)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnJWJ-0004je-0q;
	Wed, 26 Feb 2025 15:40:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnJWF-0007DP-0q;
	Wed, 26 Feb 2025 15:40:19 +0000
Date: Wed, 26 Feb 2025 15:40:19 +0000
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
Subject: Re: [PATCH net-next v8 2/6] net: pcs: xpcs: re-initiate clause 37
 Auto-negotiation
Message-ID: <Z78141ZNWEYDSi5l@shell.armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-3-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226074837.1679988-3-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_074056_017383_7A5E6AEB 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Feb 26, 2025 at 03:48:33PM +0800, Choong Yong Liang wrote:
> diff --git a/drivers/net/pcs/pcs-xpcs-wx.c b/drivers/net/pcs/pcs-xpcs-wx.c
> index fc52f7aa5f59..f73ab04d09f0 100644
> --- a/drivers/net/pcs/pcs-xpcs-wx.c
> +++ b/drivers/net/pcs/pcs-xpcs-wx.c
> @@ -172,11 +172,9 @@ int txgbe_xpcs_switch_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
>  		return 0;
>  	}
>  
> -	if (xpcs->interface == interface && !txgbe_xpcs_mode_quirk(xpcs))
> +	if (!txgbe_xpcs_mode_quirk(xpcs))
>  		return 0;
>  
> -	xpcs->interface = interface;
> -

...

> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -602,12 +602,37 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
>  		__set_bit(compat->interface, interfaces);
>  }
>  
> +static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
> +				      phy_interface_t interface)
> +{
> +	int ret = 0;
> +
> +	if (xpcs->interface != interface) {
> +		if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
> +			ret = txgbe_xpcs_switch_mode(xpcs, interface);
> +			if (ret)
> +				return ret;

The above modification changes the functionality.

In the old code, txgbe_xpcs_switch_mode() does its work when
xpcs->interface is not the same as interface OR txgbe_xpcs_mode_quirk()
is true.

Your replacement code calls txgbe_xpcs_switch_mode() when 
xpcs->interface is not the same as interface, *and* it can do its
work when txgbe_xpcs_mode_quirk() returns true.

So, e.g. when txgbe_xpcs_mode_quirk() returns false, but the interface
changes, txgbe_xpcs_mode_quirk() used to do its work, but as a result
if your changes, it becomes a no-op.

The point of txgbe_xpcs_mode_quirk() is to always do the work if it
returns true, even if the interface mode doesn't change.

Therefore, this patch is logically incorrect, and likely breaks TXGBE.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

