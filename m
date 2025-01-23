Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31778C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 17:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8m9xRoXO8qO8XqSfSEsQnhK07zXdgSA6NiBY4fDmK4=; b=11AMpSRV7x2AUqu7lkzk4yIRJC
	BVy0IPnODiq+qzADKqyEUKMIffsjBDjLKoVDsLwXAJYqqfayFMoYOGZr/H30OW9gNNw+htRtzT1jl
	hqjjWH+rUlMpx6xybgyz3XD1QMsPuO7iPwYApE3p32HYvRU6+5iUSupuFKiqN93mfBnFrr0p2etWZ
	16Pa7d4epXyvtQqPv4QZAqxohxaMI09763JGZT9Nviz2shJYxGZMUCXUY9Rvq4+T6AhQ8AH51ouIu
	t+SBhdMUl4wGdjrdT3rSK+xeOvML7tvuuCPO53jAX1OqymWihIjV/n93VVbyWTVsKhSzux+Fb2v/U
	W9LbAyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0z0-0000000Cwoe-3kVE;
	Thu, 23 Jan 2025 17:27:10 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0xa-0000000CwWO-3dhu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 17:25:44 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id DA42E1140201;
	Thu, 23 Jan 2025 12:25:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 23 Jan 2025 12:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737653140; x=1737739540; bh=k8m9xRoXO8qO8XqSfSEsQnhK07zXdgSA6Ni
	BY4fDmK4=; b=UNo25tJwNvq55hoKi4JZyWAOukNp8MvMH+iorVe5L5BUtzJpbWH
	WOgPg2idCOTbkZcaXMF2izFUNYgiUA226zegEY7nETeejoKK+GH4cPAHHv4+gaA2
	No75GzYsuQyJacbZ/eYKXTwsUp5TYVoBOqXy8fhIJRXV5XVcH0Pal2S4UxsEDI2y
	PiK4Z9B92Tr+O3VgNSW0x8IFzZwQqCDZSY/GmAMWjjp5lTbe8jfaOnEgLf29kSyi
	Zmn2Hsh1zynROQ0y+Xlq/WdjgYnxETOKDfFXFn47SlRtalgbMBFHUm6OAn4jc8gv
	6Y2A2ye8gvT1v9retfkZ+EYsHMj6Fa9pqsA==
X-ME-Sender: <xms:lHuSZ6Q3Y5mhqk8SqvLGEFZoc7L4C4Vq4ocMRY2ZtCGtclnoY4C5SA>
    <xme:lHuSZ_wkYj6yUvP4QaNCshFicFLEFVSJ38U4fHhzWFl_c5Y8FXlT2RCouTYHUppcV
    3sfLnqHFNasTZI>
X-ME-Received: <xmr:lHuSZ31_tFSo7XicJ0ebl7IM7PwV516qOGVdK7wpFbTNrS10D7tTqtr_-VRZ4XWdqF-L8PSDJvqpJ3GxWhzKC7OevWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrd
    horhhgqeenucggtffrrghtthgvrhhnpedvudefveekheeugeeftddvveefgfduieefudei
    fefgleekheegleegjeejgeeghfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehiughoshgthhesihguohhstghhrdhorhhgpdhnsggprhgtphht
    thhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhdqmhgrlhhlrgguih
    esthhirdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegurghnihhshhgrnhifrghrsehtihdrtghomhdprhgtphhtthhopehprggsvg
    hnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfido
    nhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:lHuSZ2AChG0X3LVUB2gLV-R46xtnlu9S7wKocCq7aBn071w8mSkmwg>
    <xmx:lHuSZzgHG-hOKyO9omZOfwtUNN30N8LBhwuTr08mKQZLsVHT4pvW4w>
    <xmx:lHuSZyr_hNQ478wEmCyozRK9lNuBXL9sCYjy_DkCidWjo73QJKas7w>
    <xmx:lHuSZ2jyNRP5R1jMWTP1nA7sQvc3TNA1p8s5fyyd7DwYXnIEhNNREw>
    <xmx:lHuSZyTkibneaWB543QSYzPQcrGBqLywyZCYoS_k1Xe33pUkaDUTZJac>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 12:25:39 -0500 (EST)
Date: Thu, 23 Jan 2025 19:25:36 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, robh@kernel.org,
	matthias.schiffer@ew.tq-group.com, dan.carpenter@linaro.org,
	rdunlap@infradead.org, diogo.ivo@siemens.com,
	schnelle@linux.ibm.com, glaroque@baylibre.com,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net 3/3] net: ti: icssg-prueth: Add AF_XDP support
Message-ID: <Z5J7kGFU_ZgneFAF@shredder>
References: <20250122124951.3072410-1-m-malladi@ti.com>
 <20250122124951.3072410-4-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122124951.3072410-4-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_092542_970355_4F93D94B 
X-CRM114-Status: GOOD (  13.58  )
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

s/AF_XDP/XDP/ ?

On Wed, Jan 22, 2025 at 06:19:51PM +0530, Meghana Malladi wrote:
> From: Roger Quadros <rogerq@kernel.org>
> 
> Add native XDP support. We do not support zero copy yet.

There are various XDP features (e.g., NETDEV_XDP_ACT_BASIC) to tell the
stack what the driver supports. I don't see any of them being set here.

> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

[...]

> +static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, int *xdp_state)
>  {
>  	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
>  	u32 buf_dma_len, pkt_len, port_id = 0;
> @@ -560,10 +732,12 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>  	struct page *page, *new_page;
>  	struct page_pool *pool;
>  	struct sk_buff *skb;
> +	struct xdp_buff xdp;
>  	u32 *psdata;
>  	void *pa;
>  	int ret;
>  
> +	*xdp_state = 0;
>  	pool = rx_chn->pg_pool;
>  	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_id, &desc_dma);
>  	if (ret) {
> @@ -602,8 +776,17 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>  		goto requeue;
>  	}
>  
> -	/* prepare skb and send to n/w stack */
>  	pa = page_address(page);
> +	if (emac->xdp_prog) {
> +		xdp_init_buff(&xdp, PAGE_SIZE, &rx_chn->xdp_rxq);
> +		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
> +
> +		*xdp_state = emac_run_xdp(emac, &xdp, page);
> +		if (*xdp_state != ICSSG_XDP_PASS)
> +			goto requeue;
> +	}
> +
> +	/* prepare skb and send to n/w stack */
>  	skb = build_skb(pa, prueth_rxbuf_total_len(pkt_len));
>  	if (!skb) {
>  		ndev->stats.rx_dropped++;

XDP program could have changed the packet length, but driver seems to be
building the skb using original length read from the descriptor.
Consider using xdp_build_skb_from_buff()

