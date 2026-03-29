Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B2C10D148A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 00:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1x7gH1eTuySIxAjJtVXx70vFzTUtBL9VqU5Cc+Qdgk=; b=oGWJ4FgWdcG2ipdEGK3EjCANow
	pngduVW6Ng39g6lh9O8GdSbTNbTY1gXiz92JtuNsQcXE20BMGllm+216QcoA52tuviQFB0WYERJfT
	rlPma4EszAjT5J/rqCSjOPkrhUn0Kr8pbH13s3Jw20Xlgr6QwNOBrcyYgtwH8DQ8SY2QZ9j4jD9d7
	gol2x5295hmwdPrDUMocEGiCMdWTDoTKTYkqpY/8OLZrcA8A8gtWdSym57JlFSoGEtm3K3in7esu6
	c1Z35DNJPvG7v8tGVCM57d8EF6ml5XMGiuYp6hGwDieToa9CDyW3af+FHDDlWNDmIg/8fee7pKgxR
	VaMG/jSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6dje-00000009PMb-1ctI;
	Sun, 29 Mar 2026 00:10:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6djb-00000009PM8-3hze
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 00:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k1x7gH1eTuySIxAjJtVXx70vFzTUtBL9VqU5Cc+Qdgk=; b=ahnmyFwF1QL366ZcprC61eQJyg
	G1UgkJQqLB7dkm9aPLyzxuqR9EPgWfgvH95nfE3+iMnt1YVqf0TIsY403UOvbjXc8HXrks13us6C5
	33TPAzBn/lOaJHYJuJD/yoXvUqJwxBZueDLEtcBzoRQTX9MR735dIXF69OPIZoSRFtkn/fL27AY/s
	AuWMr2rwju1O08KKs6jK6f6FzM16Frky+JLims+uknyez9OB5gJzSuQIFScm3kxptfzHrHoGbo/C6
	2TSAIJaxVrKD6C5iqFk5YutkWnhEAjopQggF0El4ogOkcAmMW6nj/VqVcFjEaeXvzW8f9FbKoCgAM
	WFtdTKqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53134)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6djU-000000007Yi-3RjU;
	Sun, 29 Mar 2026 00:10:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6djR-0000000018F-0z79;
	Sun, 29 Mar 2026 00:10:21 +0000
Date: Sun, 29 Mar 2026 00:10:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 00/10] net: stmmac: TSO fixes/cleanups
Message-ID: <acht7WzzX2BlITQy@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_171031_928166_574968AC 
X-CRM114-Status: GOOD (  35.12  )
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

On Sat, Mar 28, 2026 at 09:36:21PM +0000, Russell King (Oracle) wrote:
> Hot off the press from reading various sources of dwmac information,
> this series attempts to fix the buggy hacks that were previously
> merged, and clean up the code handling this.
> 
> I'm not sure whether "TSO" or "GSO" should be used to describe this
> feature - although it primarily handles TCP, dwmac4 appears to also
> be able to handle UDP.
> 
> In essence, this series adds a .ndo_features_check() method to handle
> whether TSO/GSO can be used for a particular skbuff - checking which
> queue the skbuff is destined for and whether that has TBS available
> which precludes TSO being enabled on that channel.
> 
> I'm also adding a check that the header is smaller than 1024 bytes,
> as documented in those sources which have TSO support - this is due
> to the hardware buffering the header in "TSO memory" which I guess
> is limited to 1KiB. I expect this test never to trigger, but if
> the headers ever exceed that size, the hardware will likely fail.
> 
> I'm also moving the VLAN insertion for TSO packets into core code -
> with the addition of .do_Features_check(), this can be done and
> unnecessary code removed from the stmmac driver.
> 
> I've changed the hardware initialisation to always enable TSO support
> on the channels even if the user requests TSO/GSO to be disabled -
> this fixes another issue as pointed out by Jakub in a previous review
> of the two patches (now patches 5 and 6.)
> 
> I'm moving the setup of the GSO features, cleaning those up, and
> adding a warning if platform glue requests this to be enabled but the
> hardware has no support. Hopefully this will never trigger if everyone
> got the STMMAC_FLAG_TSO_EN flag correct.
> 
> Also move the "TSO supported" message to the new
> stmmac_set_gso_features() function so keep all this TSO stuff together.

There are a few more issues that I would like to fix in this driver
in respect of the TSO support.

STM32MP151 and STM32MP25xx both state that when the TSE bit is set
in the channel Tx control register, TxPBL must be >= 4. We don't
check that is the case. Sadly, the documentation doesn't say whether
it's the TxPBL field value or the burst limit itself (there's the PBLx8
bit which multiplies the values in the field by 8.) Given the unknowns
here, I don't have a solution for this yet.

The other restriction is that the MSS[13:0] value must be greater than
the dwmac core's configured data width in bytes, with a recommendation
that it is 64 bytes or more. MSS[13:0] comes from
skb_shinfo(skb)->gso_size. However, the header plus the MSS size must
not exceed 16383 bytes. I think this can be catered for by adding
another test in the new stmmac_features_check() function:

	if (skb_is_gso(skb)) {
		headlen = skb_headlen(skb);
		gso_size = skb_shinfo(skb)->gso_size;
...
		if (headlen > 1023 || gso_size < 64 ||
		    gso_size + headlen > 16383)
			features &= ~NETIF_F_GSO_MASK;

What I haven't worked out yet is whether any of these conditions
just "can't happen" with our networking layers - I suspect the
gso_size < 64 would be one such case.

Next, the hardware has a maximum size for segmentation, which is 256KiB.
I think that needs netif_set_tso_max_size(dev, 256KiB). We're currently
safe, because the default is 64KiB, and I'd worry about whether we'd
overflow the space in the TX descriptor ring.

If anyone has any comments on the above, that would be good. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

