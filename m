Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6544CD185C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8PVqZyZ8FmHtG2+Jl0DC3lIPhwjBMR5huUDVX7f8pI=; b=DX/vldM4GhKh2HTJ3aPGHYApSA
	dMcTBS8MNbH/g6h/qA74TkLqCI61KApLtyPxiKVwjMcFfeONw40DQfXiTPguemEfxOhxRvj3vIJQw
	6B+STcc+KzGgEkLH3LwE7LCcZbAyvY3/Qer4vos8yUcuHYEpj9su4dI/4NgXL0uPdwm8OfbCvmgnO
	n91cs45++5waOsLOpq2C0+gT2Hp9YdRBLUYUxXH0V5D6AHOD0h9P7wSYWEuL8lgLBdQBFUeh8VbFW
	J+GKKN2+crcnHl8g7RZqnHjAi+i+/i+t/3yO6dXnuL6M9wSJtuwhDJklwSxYuCnUJ5AKMEKmFOOpo
	hxda2+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoOW-0000000Gskv-3cmV;
	Thu, 08 Jan 2026 11:41:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoOS-0000000Gsk6-3hBc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m8PVqZyZ8FmHtG2+Jl0DC3lIPhwjBMR5huUDVX7f8pI=; b=En7ZicX0xj8dt/XD1rATyG1ioD
	xvHd5apW3BZ6RDeQoOirwdTzUSCwCZqV+Mwk9CEvuyzzgRkG6xG9sZnjms+Qd2ntav+yNxe4zLbEz
	d+UmqAfKqz3l2YGkuCH4+yoNLgYPX6Ona1V2xPRhd9F++SofE8LYoxcu67ExPopp7/kJx1wv0iD/O
	c7rmMBn+Lspii7dFz3TS7U1z1XBQytCEXs5WcLkcU//Yp5AAM26K6AsWUkmCgcgxmlT9g66MQnQGH
	XE7k7/5MY53TMWCNLXKnKAFSR9VQ+G3SUC8nYwdl4iTKpk81bMXOLZjKkgLrl5nBV7bnXf5bnDs7t
	j0rwNZiQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37404)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vdoOE-000000002cJ-3kok;
	Thu, 08 Jan 2026 11:41:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vdoOB-000000002Jw-2P36;
	Thu, 08 Jan 2026 11:41:15 +0000
Date: Thu, 8 Jan 2026 11:41:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 4/9] net: stmmac: descs: fix buffer 1 off-by-one
 error
Message-ID: <aV-X20nSS-JahPr6@shell.armlinux.org.uk>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDiF-00000002E1d-30rR@rmk-PC.armlinux.org.uk>
 <4bf4ec53-c972-4009-b827-5083e080f32f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bf4ec53-c972-4009-b827-5083e080f32f@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_034133_243014_1A4F2936 
X-CRM114-Status: GOOD (  25.39  )
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

On Wed, Jan 07, 2026 at 10:28:30AM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 06/01/2026 21:31, Russell King (Oracle) wrote:
> > norm_set_tx_desc_len_on_ring() incorrectly tests the buffer length,
> > leading to a length of 2048 being squeezed into a bitfield covering
> > bits 10:0 - which results in the buffer 1 size being zero.
> > 
> > If this field is zero, buffer 1 is ignored, and thus is equivalent
> > to transmitting a zero length buffer.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Should it be a fix ? I've tried to trigger the bug without success, this
> seems to be fairly specific so I'm OK with it going to net-next.

Note that you need hardware that doesn't use enhanced descriptors -
which descriptors get used are dependent on the hardware rather than a
runtime option.

Note that we have this silly code, which I've brought up in the past:

        if (priv->plat->core_type == DWMAC_CORE_XGMAC)
                ndev->max_mtu = XGMAC_JUMBO_LEN;
        else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
                ndev->max_mtu = JUMBO_LEN;
        else
                ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);

where the "silly" part is that last line - SKB_MAX_HEAD() is dependent
on PAGE_SIZE. So, if you build your kernel for e.g. 64K page sizes, but
stmmac doesn't have enhanced descriptor support, ->max_mtu ends up being
close to 64K, and you can configure the netdev's MTU to be that large.

Even with a 4KiB page size, max_mtu will certainly be greater than
2KiB.

That means stmmac_xmit() can be called with packets >= 2KiB in length.
As stmmac_xmit() has this:

        /* To program the descriptors according to the size of the frame */
        if (enh_desc)
                is_jumbo = stmmac_is_jumbo_frm(priv, skb->len, enh_desc);

the code will not treat them as jumbo frames, and thus
stmmac_jumbo_frm() will not be called. This means we'll call
stmmac_set_desc_addr() and stmmac_prepare_tx_desc() only for each
fragment of the skb, which only supports buffer 1 in the descriptor.

There is the possibility for a descriptor to supply the next chunk of
the packet in buffer 2 (with its separate length field of the same
bit size) but the driver doesn't do that in this path.

So, even if we did get a fragment >= 2KiB, the code would only be able
to send up to the maximum size that can fit in the descriptor.

This patch fixes the logical problem in the code, but doesn't fix this
larger issue.

The real problem is the setting of max_mtu - it should _not_ be
dependent on only the kernel's page size, but should be limited by the
capabilities of the hardware and software. That was what I was trying
to raise when I brought up the issue of max_mtu, but no one responded.

So, I decided to only correct the logical problem instead as it seems
no one cares about the bigger issue.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

