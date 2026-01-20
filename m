Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8E7D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Yv+dpRQRMN5qyhSBXjej37h+nZntknJMic+/TUR9+o=; b=rZ6LicdB5dB+buxAQqcs0TkJT2
	sWdCRnfi+6JzEhRLThu094Ew5GLb9zH9WRsMBFSB5aKhXauoimKbyKlUxUpJoSo3wkipN1CiOKWTJ
	XeytzZkC6Qtq7SnUxSDz9NToifJd8Wyyd14KDk+wdgCUhFAtB9x+8Pb1OyQw2ogVh0n2FNRuovlVy
	IRCz79fUBeHx98mZPB/Cr4BjhCM450Dk1YcRJ7OhPti9D3uj3rpAH/Fqr5r+FNj9tQs+EYzFZsYag
	L8jrS5CyFpZQAdow+UGZm/KA6u2sdvKlIKwx9tSpjAteIWg/OVG5u9OQZgOF7LotrXEUroI2LCrjH
	34RhZrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8l4-00000003amT-3D5s;
	Tue, 20 Jan 2026 10:14:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8l2-00000003alw-29Mp;
	Tue, 20 Jan 2026 10:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Yv+dpRQRMN5qyhSBXjej37h+nZntknJMic+/TUR9+o=; b=VJlC1K2gyJ9/otBfB1zskPXFfG
	W24edyx/d7uS+k2Lr5Px/mwPserfDD0u0ythB0g/la0lT0fiK/XOl6VikBxGutkeQz8Dr1DAdlZm6
	nhCCtkJSBoSPzlzDbLoSnAsEMSvsTR1l3dzC0zT9U3rTjWQCUDGJBixA6hMRwoHi4+9J+97gE0EI8
	q4wrj32W+vmtiKrQ0S3BRAaqfJO+6dQIgjDK+jDV4RVMnrojaFCPLJzwFqNl78mW3Yw5Ah6fyc1ib
	7q7kehaZ0n6exkqc7VXbWW5Z76+ZyUrodOlwZGR25zdXb8d/Mse00/lPaGbZdCJcxg9f6RAnCEE6l
	0eSB3V7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42602)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vi8kz-0000000064a-0tA1;
	Tue, 20 Jan 2026 10:14:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vi8kw-000000007RQ-3W81;
	Tue, 20 Jan 2026 10:14:38 +0000
Date: Tue, 20 Jan 2026 10:14:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <aW9VjieyiZCNbb-G@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120084227.j2wgbmjsrpmycpgn@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120084227.j2wgbmjsrpmycpgn@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_021444_569128_405B04BB 
X-CRM114-Status: GOOD (  10.98  )
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

On Tue, Jan 20, 2026 at 10:42:27AM +0200, Vladimir Oltean wrote:
> More to the point, if dwmac_integrated_pcs_enable() fails at
> dwmac_serdes_power_on() (thus, the SerDes is _not_ powered on), by your
> own admission of this PCS calling convention, sooner or later
> dwmac_integrated_pcs_disable() -> dwmac_serdes_power_off() will still be
> called, leading to a negative phy->power_count.
> 
> That is to say, if the model is "irrespective of whether pcs_enable()
> succeeds or fails mid way, pcs_disable is called anyway()", then these
> methods are not prepared to handle that reliably.

That's the way it currently is, and it's been this way in the
major_config path for a very long time. If anything fails in that
path, we can't report the error back up to anyone, and the netdev
is effectively dead.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

