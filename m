Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEB3CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iiP702baNdF+7Fw90ZvkFyuCYDheIf65+pVTaTUlsA=; b=dAUhcMSSGGA1nlW6w2NJ+mw1Zc
	utxcimG9KlwyG/TtX5Og+XbpYZD8oTeMPSCfL0fbtTJ9Ri/eDNpaF3kFNgx7Sv5sWW8OaNJFm4chI
	UwX+yns/WjTqyzmBWNhYqx+GlrFsdOQ1mur+MysSRsanrRaZf+Wk3VVbLAsyjOM0DTu2YhxscZhSD
	sFGKKz7Ic7IeTMVZoTerS6VbkU8hzuIuqAradm+od1TV/Lq1KPzMJGBYAFyhZGMAuKvP+cFJQZzJF
	2ZT85tLUWL4QUVmHC4o1DbksUOfVJoSE1linaWXTLgskKh0K6RHutzawK/sP6tFaXpz1IKxc8Ixzs
	BJZ0J3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfQ6-00000002enG-2t4u;
	Thu, 11 Sep 2025 11:24:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfQ3-00000002ekR-34uD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/iiP702baNdF+7Fw90ZvkFyuCYDheIf65+pVTaTUlsA=; b=QTOeBr6pyNDGlNdDVNt7lCTzyh
	g1dav/hh6qKd22BJ+t2SEZIRquQFlpQViYzZYbhqTZQjhJ3+JI0lthowRf1yqGnFOvyiPCJeEE9s2
	NUrHAOlWBpujYTAb/HWL2D3xz36aozHDGZfh/uP9zT762yC3XDknQ0YrHirjhDR7PSYf+RxxCaDnv
	/XzTZbZrJVC0zzH3A3gcqSeq+/9gI+a4kUxuKyM8iGC5jf0JOCBsH/bTEzQ7zVutN3XsNOc/kIjx7
	rhdSJHA9JD61AmSzXHFZ30OSNpnWUNpBaYTP18egfpoSLwblCRrWKOnUK4dg7doidyHyKrnz+dPah
	KiOedZQg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41542)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uwfPr-000000002xD-2SXY;
	Thu, 11 Sep 2025 12:24:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uwfPn-000000002JV-3y45;
	Thu, 11 Sep 2025 12:24:35 +0100
Date: Thu, 11 Sep 2025 12:24:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Rohan G Thomas <rohan.g.thomas@intel.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net 1/2] net: stmmac: est: Fix GCL bounds checks
Message-ID: <aMKxc6AuEiWplhcV@shell.armlinux.org.uk>
References: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
 <20250911-qbv-fixes-v1-1-e81e9597cf1f@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-qbv-fixes-v1-1-e81e9597cf1f@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_042451_775433_0AD83CA4 
X-CRM114-Status: GOOD (  10.41  )
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

On Thu, Sep 11, 2025 at 04:22:59PM +0800, Rohan G Thomas via B4 Relay wrote:
> @@ -1012,7 +1012,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		s64 delta_ns = qopt->entries[i].interval;
>  		u32 gates = qopt->entries[i].gate_mask;
>  
> -		if (delta_ns > GENMASK(wid, 0))
> +		if (delta_ns >= BIT(wid))

While I agree this makes it look better, you don't change the version
below, which makes the code inconsistent. I also don't see anything
wrong with the original comparison.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

