Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE92EE6B58
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YHH0YAMAHnJ5UGh8pphcs9yAuxrmD7yQeFh/XrEM1k=; b=dKHIKPgX4CCnnThL+YYuDgiPwh
	Dx2/0EJJIKn9xTttvFWxiKYbhXLPLUNya+EQByJIbfO/vGfBoswnwtJUlRcWqyMlDqX1tvp220PW8
	AeokTE7kO53USye0IivawUIq6+wphj9c9d5ge207TwqafLBfCGGDO/sAT/vYycolg3SHackxWVjev
	Y6iq7Iz3owpagP+DnH+z+2Isny1DFvQkR0Z7EmD9KiF4ByY25FfGzDJ9gdYB2WVbrGkV8q+QXdcnW
	EEVF/aukHi3yIs6CQxikWR80fAumvIFXbOtkKtNOt64Pft3OTvGdSYt1eeM9SKtBAH4SIOg0F/ifa
	RaMI58Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSTQ-0000000Bo8J-2zRU;
	Fri, 06 Feb 2026 20:30:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSTN-0000000Bo7s-2At7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 20:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4YHH0YAMAHnJ5UGh8pphcs9yAuxrmD7yQeFh/XrEM1k=; b=cUM2ujHWceUzMbW20cIxqA4llS
	NkE8BDAwqzDmYlfweI9LHAUpWYlxzdrvLA5m1wdr0Z8+TZA5w10hCD+WxkQyEgPtUUEnq6GnJiU4O
	wvjdWjQJfmNXBJtzVpEL8q07G8B+obm9lIEThmhNkdCtmQZUAGs0j8PRgQtQcGwV6VHukgdN4P25b
	euMdVvZOmk2Z3Ol28RZgeWSFM2HOIFBjngDcaebtXbfDdzeloV790c2+Bj9G7f+PMqOWXBQQtPlVu
	z9kyVPyVhCuw6ZoRtG+Uj33nOwDBjz95xY11XTce8Ny/irboMl+80x5OPmDmfd34eHK2NLxH/3c40
	Rz9IKV0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42876)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1voST3-000000008Oi-39Cq;
	Fri, 06 Feb 2026 20:30:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1voSSy-000000007cx-01gv;
	Fri, 06 Feb 2026 20:30:12 +0000
Date: Fri, 6 Feb 2026 20:30:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jie Zhang <jzhang918@gmail.com>
Cc: netdev@vger.kernel.org, jie.zhang@analog.com, horms@kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix oops when split header is enabled
Message-ID: <aYZPUx2WrIkPmvIU@shell.armlinux.org.uk>
References: <20260206195643.11333-1-jie.zhang@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206195643.11333-1-jie.zhang@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_123037_894537_00DD1B73 
X-CRM114-Status: GOOD (  21.61  )
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

On Fri, Feb 06, 2026 at 02:56:38PM -0500, Jie Zhang wrote:
> For GMAC4, when split header is enabled, in some rare cases, the
> hardware does not fill buf2 of the first descriptor with payload.
> Thus we cannot assume buf2 is always fully filled if it is not
> the last descriptor. Otherwise, the length of buf2 of the second
> descriptor will be calculated wrong and cause an oops:
> 
> Unable to handle kernel paging request at virtual address ffff00019246bfc0
> ...
> x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
> Call trace:
>  dcache_inval_poc+0x28/0x58 (P)
>  dma_direct_sync_single_for_cpu+0x38/0x6c
>  __dma_sync_single_for_cpu+0x34/0x6c
>  stmmac_napi_poll_rx+0x8f0/0xb60
>  __napi_poll.constprop.0+0x30/0x144
>  net_rx_action+0x160/0x274
>  handle_softirqs+0x1b8/0x1fc
> ...
> 
> To fix this, the PL bit-field in RDES3 register is used for all
> descriptors, whether it is the last descriptor or not.
> 
> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Signed-off-by: Jie Zhang <jie.zhang@analog.com>
> ---
> v2:
> 1. Update for the latest net HEAD
> 2. Reduce crash dump message in commit message
> 3. Add Fixes tag
> v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/

I was trying to work out whether this was a re-post of a patch that had
already been merged and it was the result of someone inappropriately
re-posting old patches, or whether it was something to take seriously.

That is because of this in the patch:

> +	/* Not GMAC4 and not last descriptor */
> +	if (!priv->plat->has_gmac4 && (status & rx_not_ls))

Commit 26ab9830beab ("net: stmmac: replace has_xxxx with core_type"):

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 99022620457a..151c81c560c8 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
...
+       enum dwmac_core_type core_type;
...
-       int has_gmac4;

So, has_gmac4 no longer exists, and hasn't done since October last
year.

Thus, it seems your patch has been generated against an old kernel.
As you are submitting for netdev, it is a good idea to ensure that
patches apply to the net-next tree and/or net tree depending on
which one you are targetting, and have been tested against that
tree.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

