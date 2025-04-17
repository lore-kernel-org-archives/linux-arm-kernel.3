Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dk0pKMZHgLqXmfq0hZZxA2/oOZWEQiI7RTNz6E930mE=; b=URcsDYMyMw26ipbhaDZxEPSaQ+
	c4k/ZPdrh9o1lMonEqlkp/jRetZZ3QoZahlNM43BPiLEpP1nPjY2XX6mANsl1rrSZPSKFzDxSy5XG
	/yKylE7rb1iScIHoY9wlidoTlrBSqv/hTLou9QNCGQl/sK1oMQJOjJ9An6Ex8u4hRAHYBwywZHjF7
	FL0gE1zUdqk8jnZ5szh7WISeqVh4KrUktfKiTbDZ9D4gNaMRYDrWizqu1RUA1Y5iv2Q3Xm2IfyYDD
	rXBS7/brSQWE4HnYYzK2TdPqWyLEhpkPM17JfSnENholqlpe+bRqUjDvg0wFdAqB563OHVVobzGMS
	vsoJeqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5S3h-0000000DfCJ-06jr;
	Thu, 17 Apr 2025 16:25:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RT2-0000000DZBi-1EeO;
	Thu, 17 Apr 2025 15:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dk0pKMZHgLqXmfq0hZZxA2/oOZWEQiI7RTNz6E930mE=; b=Oe/vYen1053KI0Y3kOco0V9WqM
	5dMvdFSGjHpOQ4FCWEy4olmw+Fnvb5OMoHK022/WyMdEvr+cgRITJFuTPeH5yd5Bh9ipADnFwPx+K
	QvpbHInALtRwpoqKvyOrEHY5M9xt1+ySKiQz0obs47y5osbg2uL0t4QdSTtjFxtTUvtA531sGbslc
	yWN7dyjBPv1h6BES0E7BI0VNO2Z+JWmC+EpROwbRzwkFHpcYE0RFyv7hD1MQ9C9YoVlwey8xwj7EH
	EtWqMgzuGVE1W1+7bZ9zXlPbGHMUHFh8swHQitcYbA/YSYMtmN+ZpWgTCFC5DDf7iI4N4tLrRyyNT
	gGMCuypw==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5RSz-0000000AKG7-0FyR;
	Thu, 17 Apr 2025 15:47:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u5RNv-000000001vT-3TbA;
	Thu, 17 Apr 2025 15:45:17 +0000
Date: Thu, 17 Apr 2025 16:45:14 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 4/5] net: ethernet: mtk_eth_soc: net: revise
 NETSYSv3 hardware configuration
Message-ID: <aAEiCjdJdsqH6EAU@makrotopia.org>
References: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
 <28929b5bb2bfd45e040a07c0efefb29e57a77513.1744764277.git.daniel@makrotopia.org>
 <20250417081055.1bda2ff6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417081055.1bda2ff6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_164753_230634_DCF429BA 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, Apr 17, 2025 at 08:10:55AM -0700, Jakub Kicinski wrote:
> On Wed, 16 Apr 2025 01:51:42 +0100 Daniel Golle wrote:
> > +		/* PSE should not drop port8, port9 and port13 packets from WDMA Tx */
> > +		mtk_w32(eth, 0x00002300, PSE_DROP_CFG);
> > +
> > +		/* PSE should drop packets to port8, port9 and port13 on WDMA Rx ring full */
> 
> nit: please try to wrap at 80 chars. There's really no need to go over
> on comments. Some of us stick to 80 char terminals. 

Too late now to send another revision...

> > [...]
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> > index 39709649ea8d1..eaa96c8483b70 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> > @@ -151,7 +151,12 @@
> >  #define PSE_FQFC_CFG1		0x100
> >  #define PSE_FQFC_CFG2		0x104
> >  #define PSE_DROP_CFG		0x108
> > -#define PSE_PPE0_DROP		0x110
> > +#define PSE_PPE_DROP(x)		(0x110 + ((x) * 0x4))
> > +
> > +/* PSE Last FreeQ Page Request Control */
> > +#define PSE_DUMY_REQ		0x10C
> 
> This really looks like misspelling of DUMMY, is it really supposed 
> to have one 'M' ?

I also thought that when I first saw that and have told MediaTek engineers
about it, they told me that the register is called like that also in their
datasheet and hence they want the name to be consistent in the driver.

