Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5045C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI69ri/EaV+tRdPKe/oBg6h4lvOGu3Vkj944fBiFCGc=; b=ARrDQz+h1dwl0aFmC2sGwxIqGf
	8m5+bfr8sFe7qcqQNj36dhztuRvObWw35R/dzvQP4YNa6QVA5At2GBUmW9at5oEXeZxA5u6hwWm03
	kZlAiLiCQf1A3k7NE/1Z5oYJ4sXhacZ6zO4Aw44ryOAWTx9WBTFmkjYP0ccwnS0Zbeok9YEhUxm7a
	PkgJbOAqPPBNLNhAAyRVKp0Y1pveDeUxE/N/dfum270S2lOPutPJlJFpU8NOrmRv7mgxkU3lgPj1C
	rb37yw6bHgziwqYcXLy3WqW5ZnmcbNHc9yu8KHMbYn6/pUoY3YBC3o2+cmAxhHSWebA9Pfa598WYC
	Jko4hRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJFg-0000000BMa4-3nym;
	Thu, 03 Jul 2025 12:41:20 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIEm-0000000BAyv-3UD4;
	Thu, 03 Jul 2025 11:36:21 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uXIES-000000004sT-1IDF;
	Thu, 03 Jul 2025 11:36:00 +0000
Date: Thu, 3 Jul 2025 12:35:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, frank-w@public-files.de,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 01/14] dt-bindings: net: mediatek,net: allow irq names
Message-ID: <aGZrHMnpMMzNkIjF@makrotopia.org>
References: <20250628165451.85884-1-linux@fw-web.de>
 <20250628165451.85884-2-linux@fw-web.de>
 <20250701-wisteria-walrus-of-perfection-bdfbec@krzk-bin>
 <9AF787EF-A184-4492-A6F1-50B069D780E7@public-files.de>
 <158755b2-7b1c-4b1c-8577-b00acbfadbdc@kernel.org>
 <b68435e3e44de0532fc1e0c2e7f7bf54@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b68435e3e44de0532fc1e0c2e7f7bf54@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_043620_868326_133B6627 
X-CRM114-Status: GOOD (  36.42  )
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

On Thu, Jul 03, 2025 at 01:01:40PM +0200, Frank Wunderlich (linux) wrote:
> Am 2025-07-02 08:27, schrieb Krzysztof Kozlowski:
> > On 01/07/2025 12:51, Frank Wunderlich wrote:
> > > Am 1. Juli 2025 08:44:02 MESZ schrieb Krzysztof Kozlowski
> > > <krzk@kernel.org>:
> > > > On Sat, Jun 28, 2025 at 06:54:36PM +0200, Frank Wunderlich wrote:
> > > > > From: Frank Wunderlich <frank-w@public-files.de>
> > > > > 
> > > > > In preparation for MT7988 and RSS/LRO allow the interrupt-names
> > > > 
> > > > Why? What preparation, what is the purpose of adding the names,
> > > > what do
> > > > they solve?
> > > 
> > > Devicetree handled by the mtk_eth_soc driver have
> > > a wild mix of shared and non-shared irq definitions
> > > accessed by index (shared use index 0,
> > > non-shared
> > > using 1+2). Some soc have only 3 FE irqs (like mt7622).
> > > 
> > > This makes it unclear which irq is used for what
> > > on which SoC. Adding names for irq cleans this a bit
> > > in device tree and driver.
> > 
> > It's implied ABI now, even if the binding did not express that. But
> > interrupt-names are not necessary to express that at all. Look at other
> > bindings: we express the list by describing the items:
> > items:
> >   - description: foo
> >   - ... bar
> 
> ok, so i need to define descriptions for all interrupts instead of only
> increasing the count. Ok, was not clear to me.
> 
> so something like this:
> 
> item0: on SoCs with shared IRQ (mt762[18]) used for RX+TX, on other free to
> be used
> item1: on non-shared SoCs used for TX
> item2: on non-shared SoCs used for RX (except RSS/LRO is used)
> item3: reserved / currently unused
> item4-7: IRQs for RSS/LRO

These descriptions match the current *software* use of those interrupts,
however, DT should describe the hardware and esp. item0 up to item3 could
be used in different ways in the future (by programming MTK_FE_INT_GRP
register differently).

I think using interrupt-names fe0...fe3 and pdma0...pdma3 is still the
best option, so the driver can request the interrupts by name which is
much more readable in the driver code and SoC's dtsi than relying on a
specific order.

> > 
> > There were only 4 before and you do not explain why all devices get 8.
> > You mentioned that MT7988 has 8 but now make 8 for all other variants!
> > 
> > Why you are not answering this question?
> 
> The original binding excluded the 4 RSS/LRO IRQs as this is an optional
> feature not
> yet available in driver. It is needed to get the full speed on the 10G
> interfaces.
> MT7988 is the first SoC which has 10G MACs. Older Socs like mt7986 and
> mt7981 can also
> support RSS/LRO to reduce cpu load. But here we will run into the "new
> kernel - old
> devicetree" issue, if we try to upstream this. Maybe we do not add this
> because these
> only have 2.5G MACs.

It might be important to note that

MT7621, MT7628: 1 IRQ
MT7622, MT7623: 3 IRQs (only two used by the driver for now)
MT7981, MT7986: 4 IRQs (only two used by the driver for now)

While older SoCs MT7981 and MT7986 have limited support for *either LRO
or RSS* in hardware, only MT7988 got 4 frame-engine IRQs like MT7981 and
MT7986 and an additional 4 IRQs for the 4 RX DMA rings on top of that,
so a total of 8, and can do both RSS and LRO.

