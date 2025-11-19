Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E8ECF3186
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D34CtWTDd1vUfTflZaY/LmIETvT4QwvilMK5Cvqwxb8=; b=1xEKeyQuQV8Fi4DWvrlTCqDI6d
	k2O2rivWMWsFN83/UFv3+efwb5ccJ37y4SjytODh3WytnWF/6bdGamgW1hbk90TGJBBzf8Peybme3
	le5HW2pfdKrNgbTG7S9D60w6VfbLEShAmi0VvI+gNKetABw3VQXMoE6/OLhiY70wsL5ccI1TWcUVL
	MC0OAb90d4s+JedLzpPUXbS9XHi8sTysfQdhp7S2GEIpT24vyLxa1s/ievJzfPvy6Ls38LGLhueLh
	3n5j12hmKkj/Kw34i4pfuHwjvUyq99Buikdp1uhCW/QyF89Yp3k9kfi0/Md3JGm9VZOgnigndr0G8
	AVc0YllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf9Z-00000002wCk-1A7q;
	Wed, 19 Nov 2025 10:11:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf9X-00000002wBz-08v9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D34CtWTDd1vUfTflZaY/LmIETvT4QwvilMK5Cvqwxb8=; b=UlqN0QcHrqqCa0kWZnWMI0c1zg
	vxsuRMadYN1IICVUnzqxK5bT4Bm/DvusdFBCFL09cMszWSzQJm5n8cMPBEi0bw3Pap5wZEEB7PXDf
	ZSorIvKaiR76mgRBW+gr9bokyeYiQ3pe5gu6I8p7jZYzy1wg8nJedcteRrkTR4pB1MJyo4R0k4VOQ
	NwWswRybeiQrOKtzYrE2k6+SEx9oBlJ4eMjZq5cNOfxwoO1vMAiVkxtkeL1YtlCmVzeeNEp8NiBhl
	8edUmFmFjH0gYitWiyhJPOq+tMvdl0+5+cCpQb76qH1l1fuzrNNepmBH+LMFKWYFoSz8px66NTZbG
	ceRnB+oQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50806)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLf9Q-000000004Sv-2lDM;
	Wed, 19 Nov 2025 10:11:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLf9O-000000003Ki-1D9n;
	Wed, 19 Nov 2025 10:10:58 +0000
Date: Wed, 19 Nov 2025 10:10:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos-eth: simplify switch() in
 dwc_eth_dwmac_config_dt()
Message-ID: <aR2Xsk_aNar-2YMV@shell.armlinux.org.uk>
References: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_021107_097091_B15A01B9 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 18, 2025 at 11:18:01AM +0000, Russell King (Oracle) wrote:
> Simplify the the switch() statement in dwc_eth_dwmac_config_dt().

I notice that "the the" stammer has appeared in this patch commit
description, which is flagged as a warning in patchwork, so I'll
re-send with that fixed.

As I have a number of other patches that depend on this, all centred
around the axi_blen stuff, I'll send this patch as part of that series.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

