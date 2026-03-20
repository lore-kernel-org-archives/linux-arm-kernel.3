Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1EE109318F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5S1jC4GzKRWZlRIWjIEJX66RpWiCwNLjwF++K0MsrPk=; b=ikC31zNvplAlNDICzCMD81tit2
	cBkoQc0/n/oE9Bzr8/fOPs0gAxOway1WiOiH1XKnBQMJ+OFg9TMLAG4Fp2bDRCbff8e9CQx2gZyeI
	TnqmzN9E1BgQrNfvuciDLHptN756YwtcUKAe2EXHiojfVoVGlPYscraDIOeDFxZsBk7d4Lz1gQhJr
	tcQLlh7cTFeE9RHz598ghBYtRoBhSCTCg5Ax9ww1yYIIP/0CbqizkP3HbKRFmUR5+zmZR5fKf2Him
	lVRlNtENdKlejTcRX6YX9JcpXJKTGTtZbTQK5vV9cAOXjOgSATC0ormZyAvY8xy0eT5x3C5ZEdFQ6
	UOANalIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VQw-0000000CNI7-1ahD;
	Fri, 20 Mar 2026 08:42:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VQu-0000000CNGz-0QZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5S1jC4GzKRWZlRIWjIEJX66RpWiCwNLjwF++K0MsrPk=; b=rcfOk2m5zGtNf8qVGdqfySzpmh
	Ina0KbLvEhcXQPtstjplYuTxsXVdHbqCsRSyubjPUS1Ddpm34CqTc8cZoxGP+p33qj99Dmle+geRd
	LW7XzrgNRUt+KiXrnqOxxIMV33ILQge2m5H6PRLQ26XZcezJcnWdJDQkQvi3wRtDpBtcAmnn9GK5t
	qz415YBYHroEA5F2pZDJSsolrhEEJdV35kCoxEBFdPy6dp1r84wOBo/3YQ5TGnfg/Z2Gf1elhec3z
	jsYQnP2jum3LO8ahIutsRiskvUUyW+QmWtvFPvBRn28Yb/2pjayq0MBsda32tXOEtoj5cHn6eeOYR
	4bIH61Xw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55662)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w3VQa-000000005nM-236X;
	Fri, 20 Mar 2026 08:41:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w3VQT-000000000ft-2FXE;
	Fri, 20 Mar 2026 08:41:49 +0000
Date: Fri, 20 Mar 2026 08:41:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: yangg9 <cohenyang511@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	kuba@kernel.org, yangg9@xiaopeng.com, edumazet@google.com,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
	vladimir.oltean@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: close reset IRQ window and avoid double free
Message-ID: <ab0ITVGxiX5w7-0k@shell.armlinux.org.uk>
References: <20260320061955.833785-1-cohenyang511@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320061955.833785-1-cohenyang511@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014216_139043_9B1586F1 
X-CRM114-Status: GOOD (  12.05  )
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

On Fri, Mar 20, 2026 at 02:19:55PM +0800, yangg9 wrote:
> From: yangg9 <yangg9@xiaopeng.com>
> 
> During reset, stmmac_reset_subtask() used to set STMMAC_DOWN before IRQs
> were freed in __stmmac_release(). That leaves a window where interrupts can
> still fire after the device is marked down, which may lead to interrupt
> storms while the interface is transitioning.
> 
> Move stmmac_free_irq() earlier in the reset flow, before setting
> STMMAC_DOWN, so the reset path no longer has that interrupt window.
> 
> Since IRQs are now released in stmmac_reset_subtask(), guard IRQ release in
> __stmmac_release() with STMMAC_DOWN to avoid a second free_irq() during the
> same reset sequence.
> 
> This removes the interrupt-storm window in reset and prevents double IRQ
> release.
> 
> Signed-off-by: yangg9 <yangg9@xiaopeng.com>

I want to review this, but from this afternoon I may be out of range of
LTE signal for about 24h, and thus have no Internet access.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

