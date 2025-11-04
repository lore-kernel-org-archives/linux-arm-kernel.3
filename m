Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1CCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idHMrjalzGqAPV1VfgktusSm/NyH50rSWJqFE6LBFhk=; b=Qo/9Xw6ae2JsCeLmMUVKaIQFV8
	/e0ycrsJ8YtFSu2MHW8vptlSExcxei6HXPGeLqgmpykUMK9vx3HQOMSS6xF0WpBblzMo+iAEOZG9W
	JgBqWWVZL3LqChXw6OylmrJKIl4iVbXc/1hc+pMAKKKeAXUonk+rMrXSTlfJdIum+vYrPKuQVTv+S
	VHt2RONfc/SY+M+3R94rJGhNERRoaxwMNsRQyU4kmpmOgq83sJGN2H7mWyTSF9wFJ8FCAqLBlwUHR
	jPkASLziTMB/qLR0ttXLtEBRLhfLriJEM+5YuhSGCScwHsaKV9l9DTvjRb1O0+GwVBAzxfDNbB3+C
	FHasGxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG88z-0000000B5Rz-2UwL;
	Tue, 04 Nov 2025 03:55:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG88w-0000000B5Ra-1KDF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=idHMrjalzGqAPV1VfgktusSm/NyH50rSWJqFE6LBFhk=; b=37wmGEZHza0JpMy6KrNjpNoaHh
	awWe9G9SC5NDk6DNekv9Zv6eOExuGGa1WVWVa8OPsi4vh4bjDVdiDTyjiHoXT0dYFerj0gctmkD4+
	KxzK8ZGzu0Sca0JELGXqozQK59V/xldtcrbJ7FashfzrGQ0eVnqpLZxP8hg4j3nSBT9o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vG88d-00CqvP-LY; Tue, 04 Nov 2025 04:55:19 +0100
Date: Tue, 4 Nov 2025 04:55:19 +0100
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
Subject: Re: [PATCH net-next v3 4/4] net: ftgmac100: Add RGMII delay support
 for AST2600
Message-ID: <fc3f159a-0919-46d1-9fd8-8dc263391691@lunn.ch>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-4-e2af2656f7d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-rgmii_delay_2600-v3-4-e2af2656f7d7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_195538_662580_36B6E33B 
X-CRM114-Status: UNSURE (   9.34  )
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

> +	rgmii_tx_delay = DIV_ROUND_CLOSEST(rgmii_tx_delay, rgmii_delay_unit);
> +	if (rgmii_tx_delay >= 32) {
> +		dev_err(&pdev->dev,
> +			"The index %u of TX delay setting is out of range\n",
> +			rgmii_tx_delay);

The index is not really interesting here, it is not something a DT
author uses. It is the delay in ps in the .dts file which is too big.

       Andrew

