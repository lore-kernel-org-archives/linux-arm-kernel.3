Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2ABC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1gzXDkRAfSsLirw5BNtPwUstkVTvPynwJOx+2Xmj98=; b=TcFprR3/ByOJzgLyxbRNP4mWRB
	RnnM9IDh0yYxloHx2w7P5iNRkOeKchnFuqYjrHRWZnOi52+6I1dN1HQhHWJ1JTwBRG17gYMvR1x0e
	qpdvEq5CT4Fa9YmnZ3oVzSdjtbG3PGJo7sVlCBzY9L4zCg0m6wlg6yWxrKHlE+J4Inv9+3w+tP7Wo
	hWd2QOnXQL1DuuoNyU7XZnnpGbazKrwaYiPjKJBo+9DwhePtPaWka7NgNSKO6QX6L16HJj5/VaToF
	TrzbIES5HIJXHgyGDJm2lMODd7cu/dORtv1n3jrjYBiCvQumEDlnvslCpQezJ6v9pQYI9FIK7ggn1
	nQfHxv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco5G-0000000BmjD-312A;
	Mon, 05 Jan 2026 17:09:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco5C-0000000BmiB-39pO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p1gzXDkRAfSsLirw5BNtPwUstkVTvPynwJOx+2Xmj98=; b=zRa4bM80CQpDZhryMbMzsFsCkX
	nSTrr0PLgUmgV2ncgRTwnc7GCglwhlJuPqwCo0qudRA6hSdqBLskS4xVzUzIHSQFGY4hz9F7INgoq
	mfiGiiYOVFDGpT7cZtMJKkzRa4Do8Jp1sKQPyavQBrAr51ZNWYlkSqQS0vTcZu9VaClmpLXXtiE6d
	W/kVKKKyM7BJD/6EVps8zWXtA//ja5QMDs+yQ9TBJE7d9aQeNEfaNa3UV87WUdAYthrne9uLs0IzV
	ogILDDhFXIYbFwnmnKEbcsuAxq9Ru/0wRcENC3s0BRpsOkPUu4l/Psa6D0FG01cyrcTI+nbfX7pki
	NYIOAJIQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60322)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vco4z-0000000089f-29LL;
	Mon, 05 Jan 2026 17:09:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vco4v-00000000822-2qhH;
	Mon, 05 Jan 2026 17:09:13 +0000
Date: Mon, 5 Jan 2026 17:09:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVvp70S2Lr3o_jyB@eichest-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_090931_555753_1CFF9AAB 
X-CRM114-Status: GOOD (  19.63  )
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

On Mon, Jan 05, 2026 at 05:42:23PM +0100, Stefan Eichenberger wrote:
> Yes this is correct. ERR050694 from NXP states:
> The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> be no preceding preamble byte. The MAC receiver must successfully
> receive a packet without any preamble(0x55) byte preceding the SFD,
> SMD-S, or SMD-C byte.
> However due to the defect, in configurations where frame preemption is
> enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> byte, the received packet is discarded by the MAC receiver. This is
> because, the start-of-packet detection logic of the MAC receiver
> incorrectly checks for a preamble byte.
> 
> NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> they show two tables one where the preamble is preceding the SFD and one
> where it is not. The text says:
> The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> between transmission at the source GMII and reception at the destination
> GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
> across the GMII. This case may not be possible with a specific PHY, but
> illustrates the minimum preamble with which MAC shall be able to
> operate. Table 35–4 depicts the case where the entire preamble is
> conveyed across the GMII.
> 
> We would change the behavior from "no preamble is preceding SFD" to "the
> enitre preamble is preceding SFD". Both are listed in the standard and
> shall be supported by the MAC.

Thanks for providing the full explanation, it would be good to have
that in the commit message.

The next question would be, is it just the NXP EQOS implementation
that this breaks on, or are other EQOS implementations affected?

In other words, if we choose to conditionally enable the preable at
the PHY, should the generic parts of stmmac handle this rather than
ending up with multiple platform specific glue having to code this.
(This is something I really want to avoid - it doesn't scale.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

