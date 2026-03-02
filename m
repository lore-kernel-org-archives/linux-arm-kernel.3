Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A13FEB3622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XVxUv9VFGIs66kBS1ywELCiYjFlBgmw/wMttbaL4lM=; b=xVbISF9TRL36ICUh65QpdR5uHB
	G44oq/DLZkAecXXpCZVDLEwvrXxnzugrrF3mdgcfwm3ewPZTGwphDZo55uolcKnLNesmbQx7SieGD
	iLEcaZVtPJDkx5MAwguCtFENbbFRAyY5iGZqk/LTo99fcbqUdy/QxC1G+Ilba1Y0HHWP/9MA67+nJ
	RLEdnsQtc7PJ/YD41glhLNR4CEShB9Eqbud16pt0DaFGegVgKoobPzTrYMy1cpPo5fKoYkF4cnV1S
	kgMzHgRW29z2/FWW3Qoz1ssIv2npZjY80MjR1mmw653f4HnJFFxvwqeqPIvf0HL6DguxOhPYbxtz6
	k6Z1JgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7aP-0000000Ddoa-3X3W;
	Mon, 02 Mar 2026 18:01:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7aN-0000000Ddnv-1W1M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3XVxUv9VFGIs66kBS1ywELCiYjFlBgmw/wMttbaL4lM=; b=gGtDOT+Qt9xtniDHEqZTXpL5qE
	q02Tcwgb3cHkjMblOBuBCbnaCjoXE4LWITTF6Pbgt3mOd0CUE3tpHk1aIKfaXPJWMi0G7ieaQPr6E
	iNMRM8hf+ka/Mvo37+L2xxLWHCKicGbduW6+B4dkJBjyyCfSre6dmbfp0B1MdAmooAxE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vx7a3-009iZ2-HU; Mon, 02 Mar 2026 19:01:19 +0100
Date: Mon, 2 Mar 2026 19:01:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v6 4/5] net: ftgmac100: Support rgmii delay in
 old dts with AST2600
Message-ID: <4a3975a5-f002-4c32-b45f-0f04edbfd25f@lunn.ch>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
 <20260302-rgmii_delay_2600-v6-4-68319a4c4110@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-rgmii_delay_2600-v6-4-68319a4c4110@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_100139_400747_DC1E1E03 
X-CRM114-Status: UNSURE (   7.21  )
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

>  static int ftgmac100_set_ast2600_rgmii_delay(struct ftgmac100 *priv,
> -					     u32 rgmii_tx_delay,
> -					     u32 rgmii_rx_delay,
> -					     phy_interface_t phy_intf)
> +					     s32 rgmii_tx_delay,
> +					     s32 rgmii_rx_delay,

You introduced these parameters in the previous patch. Please get the
types correct from the start.

	Andrew

