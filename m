Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E8AF013EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x21XFiKWNX9OSKttQyxY4H13HZnCZYTMHuJhv60Nsyw=; b=cineQJcTkXwUIpU8uaCpgsVdRU
	8g7DvADGI46RlSXp0cX/SKqHPd8TtArUX05SBwqQUvEaXkO+EAyllJSTLAGAQ8IW+rUQV5oW16gfU
	gxVLl0BUM0PPf8EZ4MT1udxn4xeZSKOORLc4VPgPpcYAxkmGPFCBBuPG/yCUEbgskbXLOEggVseig
	erEdV8dM1CJpU3DnLUXFdZtoa7ZrPOCc29nOgxaE6XPGNcE8Fg9VYLuvOUebOow1WgVnrFlUacNYS
	wHYKTo5PdWYd8m7Ed1CYKwFisDTRFU38uU4ppUNUqjT2F6BlIvPh2cb3qBeYIHiRoAKe/Wrn8LC5d
	cJ1FDl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23rJ-00000003b0w-3Xne;
	Mon, 16 Mar 2026 09:03:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23rG-00000003b0a-31Iu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x21XFiKWNX9OSKttQyxY4H13HZnCZYTMHuJhv60Nsyw=; b=MhTkSR+ONSdKHyO99rOR4NelmK
	EeNzxCC17brplbhzSS4XLCIaP23lo0lY470qFfFb7lUvkfraYhazE/cArAGUT5rMnJ+ThXRcDP9tJ
	N/B3Ol/B5g33wzaBR1lULFs2QvXrxWpNWvw9aF7XEQc/GZdXF6U8Au0rH3jYpnVkPQphbmneEWdIW
	OBKKs7I31VMXi/z6vKI9/RfGYBdry5Ofs18cQty9iafbqMJgaCx4x2uYk1ZEy/zC0NpvvNiDxsgr5
	IO4xiCkEgdmjZ6h2e/U/NIa5bFVZnAMO1wN216HbavaGtd5i9J2kyirLJo3BPFWYuCp0vf/h+JwZi
	SoKzALbA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44006)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w23r3-000000003Wg-3LDr;
	Mon, 16 Mar 2026 09:03:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w23r0-000000004wi-3A9F;
	Mon, 16 Mar 2026 09:03:14 +0000
Date: Mon, 16 Mar 2026 09:03:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	antonio.borneo@foss.st.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: stmmac: fix pinctrl management during
 suspend/resume
Message-ID: <abfHUrOpHnjv3GGW@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_020330_807655_DDFBF0B7 
X-CRM114-Status: GOOD (  27.27  )
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

On Sat, Mar 14, 2026 at 12:37:19AM +0000, Russell King (Oracle) wrote:
> On Sat, Mar 14, 2026 at 12:44:56AM +0100, Linus Walleij wrote:
> > On Fri, Mar 13, 2026 at 12:08 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
> > > > In the deepest low-power modes, the pinctrl configuration is lost
> > > > and is never restored if the interface is down.
> > > > This commit ensures that the pinctrl state is set in all cases.
> > >
> > > Shouldn't the pin state be restored by the pinctrl layer?
> > 
> > What we have in the device core only applies "init" and "default"
> > states, and provides these handles for transitioning to "sleep"
> > and "default" again (like a state machine).
> 
> What I was meaning is that - for a driver using the "default" state,
> if the hardware loses the pinctrl state during sleep, isn't it the
> responsibility of the pinctrl driver to restore the state rather
> than leaving it in whatever states it happens to be when the SoC
> comes back from suspend?
> 
> If that is not the case, then don't we have a major issue where
> drivers using pinctrl but do not issue any pinctrl calls in the
> resume function are buggy?

I would like an answer on this before this patch is merged, because
even with your reviewed-by, I don't think this patch is correct.

For example, if pinctrl loses the pinmux state across suspend/resume,
then this patch only solves the case where the NIC is down when
suspending.

It does not address the case where the NIC is up but WoL is disabled.
Also, what happens when WoL is enabled at the MAC, when we expect the
NIC to still be functional - which means that the pinmux state must
remain active over suspend.

This is in addition to a more general concern that almost every driver
in the kernel is likely broken if we need to switch pinmux modes on
resume to ensure that the "default" pinmux state is restored upon
resume, which seems to be what you're saying by giving a r-b for this
patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

