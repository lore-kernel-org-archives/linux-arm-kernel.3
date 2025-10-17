Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944DBCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGyYcC+d3YKTIer3CKrB01eeg5KvZEEyEjcSchgym/I=; b=VDoqG2upx4aMSszUOeiX0EmQzt
	JW55A+vpGJv61KAS1PekxQS6nfmcYLpiViUhWNfdDKf2KGOKI5jEBfec0LywdauOvtvZ2TrBJVW1n
	Yn2x9BXwI987UfyqJ6At1cowP8AKDymaigxRTFY4OgV/moY3LhzRkpgAD2hQtTpS2pOVdm0PEXQAQ
	DV3VBr0DQEdBgQMrZ4/xUa3oBghxYUAfbSGzqCutfGyiRwHg4QilZSaXEkVWGQcYTdg94R0JVhlhp
	bBBHFBxJmaDyV83Pbsv+zbiQ4KaXkyJ8daHo8A5Err8+B1CO6IzXRQiYUxgxNh7tWuMcS1bDgGQ15
	9V0DAknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jmy-00000007p3I-170U;
	Fri, 17 Oct 2025 12:42:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jmv-00000007p2y-3S9o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IGyYcC+d3YKTIer3CKrB01eeg5KvZEEyEjcSchgym/I=; b=W/2CuL+hGNToi9Z5Ya9VSH3ZG5
	WXVDOEvDRj1FSTKN61nZaKm5ZqpQcULX9Rlh5dVV1ggi4dYw4MJWDeoC777XmSJTFF599UZfuatXs
	M7bv9lYTfOo3uU+7M0R3YywZwdYEixlTiwaN080t7d22vLUv+nIk9uLoeiv0OIPbFnFVFMgdJDNOl
	/3QSlONY2oqkPNc63j4RAvUFifA2YC/Ey0yBO4X5NksD4hgiFDRXO7gnQb7becUfjqtEduVUI8JhG
	rfwNt9ohYZxv/MEpKWS36L2TfV4KLZlYSUsEZzea4G55cBQW5tD+kqSq8F4vHiLXBCEn32jx1OZgd
	U+bUqVqA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43812)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v9jmi-000000007sy-3bmI;
	Fri, 17 Oct 2025 13:42:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v9jme-000000004Jn-4AHz;
	Fri, 17 Oct 2025 13:42:13 +0100
Date: Fri, 17 Oct 2025 13:42:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Rohan G Thomas <rohan.g.thomas@intel.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/3] net: stmmac: vlan: Disable 802.1AD tag
 insertion offload
Message-ID: <aPI5pBXnh5X7OXtG@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_054229_882397_82649E01 
X-CRM114-Status: GOOD (  11.46  )
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

On Fri, Oct 17, 2025 at 02:11:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 650d75b73e0b0ecd02d35dd5d6a8742d45188c47..dedaaef3208bfadc105961029f79d0d26c3289d8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4089,18 +4089,11 @@ static int stmmac_release(struct net_device *dev)
>  static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
>  			       struct stmmac_tx_queue *tx_q)
>  {
> -	u16 tag = 0x0, inner_tag = 0x0;
> -	u32 inner_type = 0x0;
> +	u16 tag = 0x0;
>  	struct dma_desc *p;

#include <stdnetdevcodeformat.h> - Please maintain reverse christmas-
tree order.

I haven't yet referred to the databook, so there may be more comments
coming next week.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

