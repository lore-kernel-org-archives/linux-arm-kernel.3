Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9229BD185EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hif2hvnGrWVjKRMJEAdc4UWKgX381vfN7zL1PT9/Ogg=; b=1an+8yOG9C/Szq2qR7+bqjd4zO
	H0L02j3QnlIeOEwq5xX+GvBPYyRqpXB2OAzS8e12+SB+kisOTMkcLf1zqaj80kaFHo6Pl5y3P26UU
	27/keFwKGkqO53RlkkdNlzoZASYpz8Ojr/n0E+cMR3U4GSInMtYnp/JGa9gLUf9bjui6WSIuVcc2R
	gayCbuvrHjlzeVs/RJTN1jzyXh1RPr2Nvy/5oQ5Dd6fedZdK+vGycrC/8egKFIT7jihTmIgTe0B0J
	y8zNCIWhBm6VgVB9saJF6I4ItKAbVLYrnRVmLp7GiaRJLyYZbz1ECNcyis5RLKGsSJzfDxN6I5U3c
	sZLhcvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdozD-0000000Gy72-2LDl;
	Thu, 08 Jan 2026 12:19:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoz9-0000000Gy5B-0SNl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 12:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hif2hvnGrWVjKRMJEAdc4UWKgX381vfN7zL1PT9/Ogg=; b=J+7D1kdkycHTtChi2XvssBNcbU
	w5KuTSCZfiUJu4wSPTGY27d6eir99M1S+gjGJmPNPyAwMyGhw3SDy/926ebKBNS4wCrdJNSVH5NKO
	mz3nDx/hqkvsLkJdEzkJIImS17xDlqm6B6CzhyLK3atsP3RRpurPsv7nmr8W6VwOKc2CilVNp00OP
	VMoG+VJ5xaziRx5Bi0BJ1n+Mkxy+wlqzfBCjSib94EqcaQyEEc2oIpmNSQ172BD4zPRWXhQlAPZGm
	Mp6Bw3oYJV8R3CI07yVWp9+oXQmXJPk/Yx4eP8B7UWlU8PnJuERzP7HoDFccP4UXBe8MgyLlLrkIo
	e/u34BWg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56296)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vdoz2-000000002dh-1oTm;
	Thu, 08 Jan 2026 12:19:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vdoyz-000000002L8-3aLA;
	Thu, 08 Jan 2026 12:19:17 +0000
Date: Thu, 8 Jan 2026 12:19:17 +0000
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
Message-ID: <aV-gxT3Ijk_8cmHS@shell.armlinux.org.uk>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDiF-00000002E1d-30rR@rmk-PC.armlinux.org.uk>
 <4bf4ec53-c972-4009-b827-5083e080f32f@bootlin.com>
 <aV-X20nSS-JahPr6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV-X20nSS-JahPr6@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_041927_153300_86788AF1 
X-CRM114-Status: GOOD (  35.55  )
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

On Thu, Jan 08, 2026 at 11:41:15AM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 07, 2026 at 10:28:30AM +0100, Maxime Chevallier wrote:
> > Hi Russell,
> > 
> > On 06/01/2026 21:31, Russell King (Oracle) wrote:
> > > norm_set_tx_desc_len_on_ring() incorrectly tests the buffer length,
> > > leading to a length of 2048 being squeezed into a bitfield covering
> > > bits 10:0 - which results in the buffer 1 size being zero.
> > > 
> > > If this field is zero, buffer 1 is ignored, and thus is equivalent
> > > to transmitting a zero length buffer.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > Should it be a fix ? I've tried to trigger the bug without success, this
> > seems to be fairly specific so I'm OK with it going to net-next.
> 
> Note that you need hardware that doesn't use enhanced descriptors -
> which descriptors get used are dependent on the hardware rather than a
> runtime option.
> 
> Note that we have this silly code, which I've brought up in the past:
> 
>         if (priv->plat->core_type == DWMAC_CORE_XGMAC)
>                 ndev->max_mtu = XGMAC_JUMBO_LEN;
>         else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
>                 ndev->max_mtu = JUMBO_LEN;
>         else
>                 ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
> 
> where the "silly" part is that last line - SKB_MAX_HEAD() is dependent
> on PAGE_SIZE. So, if you build your kernel for e.g. 64K page sizes, but
> stmmac doesn't have enhanced descriptor support, ->max_mtu ends up being
> close to 64K, and you can configure the netdev's MTU to be that large.
> 
> Even with a 4KiB page size, max_mtu will certainly be greater than
> 2KiB.
> 
> That means stmmac_xmit() can be called with packets >= 2KiB in length.
> As stmmac_xmit() has this:
> 
>         /* To program the descriptors according to the size of the frame */
>         if (enh_desc)
>                 is_jumbo = stmmac_is_jumbo_frm(priv, skb->len, enh_desc);
> 
> the code will not treat them as jumbo frames, and thus
> stmmac_jumbo_frm() will not be called. This means we'll call
> stmmac_set_desc_addr() and stmmac_prepare_tx_desc() only for each
> fragment of the skb, which only supports buffer 1 in the descriptor.
> 
> There is the possibility for a descriptor to supply the next chunk of
> the packet in buffer 2 (with its separate length field of the same
> bit size) but the driver doesn't do that in this path.
> 
> So, even if we did get a fragment >= 2KiB, the code would only be able
> to send up to the maximum size that can fit in the descriptor.

Reviewing the docs again, I actually think it's worse than this.

Consider the case where enh_desc = false, so we're using normal
descriptors. in stmmac_xmit() is_jumbo will always be false because
we never check stmmac_is_jumbo_frm() for normal descriptors. Thus,
we use the paths in stmmac_xmit() which only call
stmmac_set_desc_addr() and stmmac_prepare_tx_desc().

For normal descriptors, these correspond with ndesc_set_addr() and
ndesc_prepare_tx_desc().

ndesc_set_addr() sets tdes2 to the address - this is the buffer1 DMA
address.

In ring mode, ndesc_prepare_tx_desc() calls
norm_set_tx_desc_len_on_ring() which divides the buffer between the
buffer1 length and buffer2 length. This means, in theory, that normal
descriptors can transmit up to 4KiB - 2 split across two 2KiB - 1
buffers. However, nothing sets tdes3, which is the buffer2 DMA address,
so either we transmit garbage (I suspect whatever happens to be at
DMA address zero) or DMA fails.

In chain mode, ndesc_prepare_tx_desc() calls
norm_set_tx_desc_len_on_chain() which only sets the buffer1 length
(masking off the bits that don't fit in the field.) This is because
tdes3 is used to point at the next descriptor, so each normal
descriptor can only contain buffers up to 2KiB - 1.

This all comes down to the "silly" code that I mentioned previously.

While one can argue that it would be nice to fully fix this, I suspect
the reality is that almost no one cares, because hardly anyone uses
"normal" descriptors, especially with more recent hardware.

However, my thoughts more centre around the idiotic max_mtu setting
that didn't gain any traction when I tried to bring that topic up.
The simple solution here would be to ensure max_mtu isn't set to
SKB_MAX_HEAD() but left as the standard setting (thus not allowing
the MTU to be increased beyond ETH_DATA_LEN, aka 1500) which would
then prevent buffer1 being anywhere near crossing the 2KiB-1
threshold.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

