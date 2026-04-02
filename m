Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4E1D3942E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eglLKrveNJuj7YOcmdnYRMdVElmq6kVL9OzjVIGPajw=; b=T6k4gTr/Rjw0M0Lwrhnj24E4g7
	h1xs3kSKa5jDdi2IQ6VgIRFNkuTs5y2rgVWU4eHNv7xfMHMKI/wFBvrT99ev3X5M30qSLq09p+4FT
	IZN5wsW2o8p2Q0kJQOT9W3cf1lRkNIb8TdHMgRV8KeUvtweVSI9JsWaqf+xFRfjWhro6fgcPqRWg2
	+ECvrBmuU3QjwnoG49lHILCdTG8N3h766E9YntW25ELSrDXBKp61C/wIeLkN1FVOccqmdkqULjLdW
	E0NvipnCWa8g3T3aA79CN7s0j757IShNGwaXPQHeuqd6bmYBh5gj1uztN+1tbdocFUhmqGe/aJ49X
	Q9K8ozOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JBI-00000000MQE-1raq;
	Thu, 02 Apr 2026 14:38:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JBE-00000000MPF-20lX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eglLKrveNJuj7YOcmdnYRMdVElmq6kVL9OzjVIGPajw=; b=PdGvsnb1gbCZELkYEOvXsBdgo3
	pxstB8JsTZnISW06js/AXkaTooQnQWt+WBKuQqCehMJU9pnAsm32Vs4AutzsTVrZJHfZLsvev30mt
	4mC9oBXgtWFugWpJ5Deg7kBR1L01IW4zS7JMCvFSqoBdCNBWw9DwCSdqZEJ8CrwzvpSWELrQRRdts
	QJKuHHK+CcVVgo3VfyUbRxI6h3/i8UAik0nzXVsRYEebECQueryJ2ANMQXZ6iea9mjyABtsSzIkkU
	6sj8650Uh8ssV+Dy/HjEMAwxmci/Tx8zsyaB2XFl8HDoJTOM76oXmvqIpSA0C5e6G3vN2q0AEAq5m
	poBIocag==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45144)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w8JB2-000000004Zt-1mLj;
	Thu, 02 Apr 2026 15:37:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w8JAz-000000005pB-2SHC;
	Thu, 02 Apr 2026 15:37:41 +0100
Date: Thu, 2 Apr 2026 15:37:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <ac5_NVLeRZTYm2yR@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
 <acw1habUsiSqlrky@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acw1habUsiSqlrky@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_073756_521626_258DD833 
X-CRM114-Status: GOOD (  19.82  )
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

On Wed, Apr 01, 2026 at 02:28:45AM +0530, Mohd Ayaan Anwar wrote:
> While I had made an identical change while retesting the PCS series,
> I was holding off on posting this patch for the same concern - what
> if some boards fall outside the 50 - 100 MHz range.
> 
> After some digging, the AHB clock appears to operate within:
>  - 50 to 100 MHz for lemans/monaco derivative boards (2500BASE-X
>    interface)
>  - 30 to 75 MHz for boards with an RGMII interface.

That's ever so slightly annoying, but it makes no difference for the
divisor selection.

CSR_F_60M is a divider of 42 giving:
	714kHz  @ 30MHz,
	1.19MHz @ 50MHz,
	1.79MHz @ 75MHz,
	2.42MHz @ 100MHz

If we were to use CSR_F_35M, that would be /26, giving:
	1.15MHz @ 30MHz
	1.92MHz @ 50MHz
	2.88MHz @ 75MHz (exceeding 802.3 spec)
	3.85MHz @ 100MHz (exceeding 802.3 spec)

Given the RGMII range, to stay within the 802.3 spec without knowing
the actual clock rate being used, CSR_F_60M is still the only possible
selection, even though it gives an extremely low clock rate for 30MHz.

I believe you said that firmware can change this clock rate dynamically
at runtime which makes it much harder. If there was a notification from
firmware into the kernel that the clocks had changed, and that was
communicated into the clk API such that the appropriate clock input for
stmmac, then we could look at updating the divisor.

We would need the firmware to give us a pre-rate change notification
and post-rate change notification (and be guaranteed that there would
always be a post notification after the pre notification) with that
coupled into the clk API.

We'd need stmmac to hook into the clk API notifier infrastructure,
where the PRE_RATE_CHANGE takes the MDIO bus lock to wait for any in-
progress transfer to finish, and then block further accesses, and
POST_RATE_CHANGE update the divisor, and finally both
ABORT_RATE_CHANGE and POST_RATE_CHANGE releasing the MDIO bus lock.

With firmware telling the kernel what this clock rate is, the manual
setting of priv->plat->clk_csr goes away.

Maybe this is something to consider for the future.

> If a future platform exceeds this range, we could switch to something
> like: plat_dat->clk_csr = data->clk_csr, with each EMAC version
> selecting the appropriate divisor.

Without firmware telling us what the clock rate actually is, that's the
only solution.

> Due to some urgent work tasks, I am still finishing PCS series
> testing. I will provide a t-b once done.
> 
> In the meanwhile, please feel free to add:
> 
> Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Thanks! I'll submit the patch non-RFC shortly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

