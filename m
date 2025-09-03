Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F33CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKFS3y5daOqWaKHPU+LGGnIxAUZ7p5yYYNJ7KEL39IE=; b=jCkOFgjnp5k5desEotZQPuG0Iz
	OyyyZfD0nvUagNVxTw6/jdBNLJyKFTdlhto04kh532qYdNc0P4o8aOPC5tkTFbTMIN9f4xrHhXOjE
	hr9qOvkhDgWU1s6XVRpknoWeGJ87k2hRdnZ7yqfxh9IkSZ2C4uZrlB5tHbgnnpBSHHMKhqlP7FwRD
	D5rdUWXt0nofTcFByrYDSa+bxpnLFiDRijuOTmL/ZPD1v3h0S0I9dngQ3INrVthZlSs3U81PAT0WJ
	GCS+tmpafdLcRWasNyRALQPzIynGHzKhRMOQpXaaxfcUhgJalZ8s4ERhh2Xe7xLcpmgNP3T2XNPXc
	dCs2NLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utshf-00000007NSp-28ow;
	Wed, 03 Sep 2025 18:59:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto8k-00000006grW-3Kky
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IKFS3y5daOqWaKHPU+LGGnIxAUZ7p5yYYNJ7KEL39IE=; b=PKC7mlYtwmdrYmC9dO0eS6a/1v
	PnXfB4PUclYOsME0dz80pvRIdvUM0urIXWfGBQSbQIQzjczgiDnrkhBvigxhm7SEKwENJis2+wpNp
	eZOiMa3C0pyuvMvz0nVBaAawfzkfQom27j8rZtAF+mksOE4PLxCJa/OUlt/RsI7j3GrQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uto88-0071kq-AO; Wed, 03 Sep 2025 16:06:32 +0200
Date: Wed, 3 Sep 2025 16:06:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Anwar, Md Danish" <a0501179@ti.com>
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 rpmsg-eth subnode
Message-ID: <6e56f36f-70fd-4635-b83f-a221780237ba@lunn.ch>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-3-danishanwar@ti.com>
 <20250903-peculiar-hot-monkey-4e7c36@kuoka>
 <d994594f-7055-47c8-842f-938cf862ffb0@ti.com>
 <f2550076-57b5-46f2-a90a-414e5f2cb8d7@kernel.org>
 <38c054a3-1835-4f91-9f89-fbe90ddba4a9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c054a3-1835-4f91-9f89-fbe90ddba4a9@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070710_830822_FA593CC4 
X-CRM114-Status: GOOD (  20.07  )
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, MD Danish Anwar <danishanwar@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> >>  	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
> >>  	memory-region = <&main_r5fss0_core0_dma_memory_region>,
> >>  			<&main_r5fss0_core0_memory_region>;
> >> +	rpmsg-eth-region = <&main_r5fss0_core0_memory_region_shm>;
> > 
> > You already have here memory-region, so use that one.
> > 
> 
> There is a problem with using memory-region. If I add
> `main_r5fss0_core0_memory_region_shm` to memory region, to get this
> phandle from driver I would have to use
> 	
> 	of_parse_phandle(np, "memory-region", 2)
> 
> Where 2 is the index for this region. But the problem is how would the
> driver know this index. This index can vary for different vendors and
> their rproc device.
> 
> If some other vendor tries to use this driver but their memory-region
> has 3 existing entries. so this this entry will be the 4th one.

Just adding to this, there is nothing really TI specific in this
system. We want the design so that any vendor can use it, just by
adding the needed nodes to their rpmsg node, indicating there is a
compatible implementation on the other end, and an indication of where
the shared memory is.

Logically, it is a different shared memory. memory-region above is for
the rpmsg mechanism itself. A second shared memory is used for the
Ethernet drivers where it can place Ethernet frames. The Ethernet
frames themselves are not transported over rpmsg. The rpmsg is just
used for the control path, not the data path.

	Andrew

