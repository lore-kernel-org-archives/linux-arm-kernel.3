Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90195C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4ehdOpzG3rPT6AGrEw+vVrqxugddJkP2hU9YmSDZpw=; b=OKtM3/iFrx1lEJRHYX/2sW/hKz
	zJbQ1eOWRgr3ng+DsYfhMHYPonEEXWIaKLqClx5pxTji0eyyOONWpik85DVmJjYkh3Yqb65hrrSOP
	iiF3aEaRxikJlfVNyM5MGXc1euPXIo+hzA2dDzWgycM8tuW5MR+X4BBF0MGgXeUkIUKQiWtOwXsoo
	KOtsJp9g3WrRUfrRYn0iXfSkN7y9RHjugZvtWmDrenXPidR0p3UWdc2k7FlFfYAUw3cW4R7ehDjTQ
	PnP6YTKoGnlf3bLaOkXtZZyD+qc45jXm6lMSKQAG1MxPeTZJfHFPFrgO7bOVM2da2ZtI3m4yTCHLY
	UeibCPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFIa-0000000AfVu-0Yxj;
	Thu, 03 Jul 2025 08:28:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFAh-0000000AeKv-33Qy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 08:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/4ehdOpzG3rPT6AGrEw+vVrqxugddJkP2hU9YmSDZpw=; b=wBDk1hXEhVm54H6DRSIHM1CyLT
	VKMzBhKuOCJGU83rblwdomASK9nrS1GmD62Buss7WMQw9qQid2X/KV6EpWKO2dU5WeajZbLOGv5RU
	Q5Ry7hgXkmCLGWxs8EPgkdB7QfTz+FHjjr8wo6neDeTOhfgwWs8lvUz9CPLuftJpeVss=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXFAT-0004f0-NH; Thu, 03 Jul 2025 10:19:41 +0200
Date: Thu, 3 Jul 2025 10:19:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH RFT net-next 02/10] net: stmmac: Add support for
 Allwinner A523 GMAC200
Message-ID: <c464d56b-dfd2-4e8c-a77a-4a0d05588768@lunn.ch>
References: <20250701165756.258356-1-wens@kernel.org>
 <20250701165756.258356-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701165756.258356-3-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_011955_764260_84264E4A 
X-CRM114-Status: UNSURE (   6.39  )
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

> +	if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {

Please use the standard properties rx-internal-delay-ps and
tx-internal-delay-ps.

Please also ensure that if the property is missing, the default is
0ps.

	Andrew

