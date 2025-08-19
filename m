Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921CDCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tl7aulnRN5FhYPpTxG+SmjpKIE2lFG8vUraDbN6PIzY=; b=OUHA+J5XCEQc2mqrgNF4/T6+F3
	QxRBSWhoxXZUO1eRdYy+Y1pZcLmMfSORJwHMnzB5AlPkVnomMf9HKbkMBDdB8fOIFcSIXENoorVVt
	zPMBKg2YHLVhuoKg6EgFr5gvCtu9CCX6PC71ESLAp0zKZJovi/ZAaC9P4bC/T3LGGcis1VY0UK2AK
	CEPSBRAM1wY8Lw0BFndYiPzt2hl/2DsT0itb/x3gCFWQyyJW9YwQdtkHEE9nDjH5Yi3FZduENWIzj
	74tnoQrW8mxJComRwHXuTNXEvfkU/RMdHjmVIekGVo37IQ2HFaBKl5CVHUsckDn/37qdZye1bGCAG
	hzlKsimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMZ8-0000000AcaH-2JBm;
	Tue, 19 Aug 2025 13:39:55 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHkk-00000009obR-0QQz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:31:35 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c5jV61chLz9srJ;
	Tue, 19 Aug 2025 10:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755592286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tl7aulnRN5FhYPpTxG+SmjpKIE2lFG8vUraDbN6PIzY=;
	b=l5pun4+Ua5NTJZAV1YIp2FsOds2mcCjcYgWrr/LZJeZQyl4xg959qSmyYoi7MATbnEpo6c
	mNtPXA0fM0nrBPZKJUaaPGLLrDfkbAeCiMpkGaeFo172xDHnhmjgBMoBD3RQ7JMaY/FA3c
	gT1XTUqwccImYjWLqaNp6u908YO28OYaj9bybt8PcjBH0YxBIZT173Kmg2w8uxZmyjdlG7
	BD2KqFFzwBYiq4RaqS3XWft5IU4F8sC94PVKUEcdf61hG+FH/KEQWfjQjoO43md7vMWNso
	Ha1KbIfexEfXoVOv9aYtRF/IKYPp9JCEGoqTaGoU+D1qvTPWVMyF3WTihKHeWw==
Date: Tue, 19 Aug 2025 10:31:19 +0200
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v18 5/7] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
Message-ID: <20250819103119.42a64541@wsk>
In-Reply-To: <20250815183359.352a0ecb@kernel.org>
References: <20250813070755.1523898-1-lukasz.majewski@mailbox.org>
	<20250813070755.1523898-6-lukasz.majewski@mailbox.org>
	<20250815183359.352a0ecb@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: b305455ec3b5e15fab4
X-MBO-RS-META: komf8jsgranox9twdw3rim746cyyc699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_013134_333217_38277EC9 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Jakub,

> On Wed, 13 Aug 2025 09:07:53 +0200 Lukasz Majewski wrote:
> > +		page =3D fep->page[bdp - fep->rx_bd_base];
> > +		/* Process the incoming frame */
> > +		pkt_len =3D bdp->cbd_datlen;
> > +
> > +		dma_sync_single_for_cpu(&fep->pdev->dev,
> > bdp->cbd_bufaddr,
> > +					pkt_len, DMA_FROM_DEVICE);
> > +		net_prefetch(page_address(page));
> > +		data =3D page_address(page);
> > +
> > +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> > +			swap_buffer(data, pkt_len);
> > +
> > +		eth_hdr =3D (struct ethhdr *)data;
> > +		mtip_atable_get_entry_port_number(fep,
> > eth_hdr->h_source,
> > +						  &rx_port);
> > +		if (rx_port =3D=3D MTIP_PORT_FORWARDING_INIT)
> > +			mtip_atable_dynamicms_learn_migration(fep,
> > +
> > mtip_get_time(),
> > +
> > eth_hdr->h_source,
> > +
> > &rx_port); +
> > +		if ((rx_port =3D=3D 1 || rx_port =3D=3D 2) &&
> > fep->ndev[rx_port - 1])
> > +			pndev =3D fep->ndev[rx_port - 1];
> > +		else
> > +			pndev =3D dev;
> > +
> > +		*port =3D rx_port;
> > +
> > +		/* This does 16 byte alignment, exactly what we
> > need.
> > +		 * The packet length includes FCS, but we don't
> > want to
> > +		 * include that when passing upstream as it messes
> > up
> > +		 * bridging applications.
> > +		 */
> > +		skb =3D netdev_alloc_skb(pndev, pkt_len +
> > NET_IP_ALIGN);
> > +		if (unlikely(!skb)) {
> > +			dev_dbg(&fep->pdev->dev,
> > +				"%s: Memory squeeze, dropping
> > packet.\n",
> > +				pndev->name);
> > +			page_pool_recycle_direct(fep->page_pool,
> > page);
> > +			pndev->stats.rx_dropped++;
> > +			return -ENOMEM;
> > +		}
> > +
> > +		skb_reserve(skb, NET_IP_ALIGN);
> > +		skb_put(skb, pkt_len);      /* Make room */
> > +		skb_copy_to_linear_data(skb, data, pkt_len);
> > +		skb->protocol =3D eth_type_trans(skb, pndev);
> > +		skb->offload_fwd_mark =3D fep->br_offload;
> > +		napi_gro_receive(&fep->napi, skb); =20
>=20
> The rx buffer circulation is very odd.

The fec_main.c uses page_pool_alloc_pages() to allocate RX page from
the pool.

At the RX function the __build_skb(data, ...) is called to create skb.

Last step with the RX function is to call skb_mark_for_recycle(skb),
which sets skb->pp_recycle =3D 1.

And yes, in the MTIP I do copy the data to the newly created skb in RX
function (anyway, I need to swap bytes in the buffer).=20

It seems like extra copy is performed in the RX function.

> You seem to pre-allocate
> buffers for the full ring from a page_pool. And then copy the data
> out of those pages.

Yes, correct.

> The normal process is that after packet is
> received a new page is allocated to give to HW, and old is attached
> to an skb, and sent up the stack.

Ok.

>=20
> Also you are releasing the page to be recycled without clearing it
> from the ring. I think you'd free it again on shutdown, so it's a
> double-free.

No, the page is persistent. It will be removed when the driver is
closed and memory for pages and descriptors is released.

--=20
Best regards,

=C5=81ukasz Majewski

