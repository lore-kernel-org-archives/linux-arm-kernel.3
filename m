Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DD8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+VSPD28TfRDmVd100m2sowp0pegmPTa+/H6mPRZWuE=; b=T85ZoLZ5ElLUVueYqFEGxepXgk
	KykFiabFrRq2R6+hLEGTfkGy1sMmNRsWp24tsCscTRrq+8y4vCqKXeQFowRPymnMuXas4uLqYO9Y6
	TtHt41pB4l0VBhGqCkDJSvGlCFwX/9GikdaZb9bObp9Ns1caXn3l/ORlt8E4xBGPJ6lHqgE5F6I8N
	afZooL8m5qU1dA2qQDyLRylmfipngmrkXlXfzJD0wNtX3ej+jfhRifbYikIcRMJxX4/d7wTAdTpuA
	/mwGrFReasS0MpOeI2pEE1mNOaxNxc7ZD7f2mXpz/3EgAF/p4rVJrsGZ8byHwmJxqXhPjBohzhNhz
	ceyaEIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv8j-0000000Ccpz-0PQo;
	Thu, 09 Jan 2025 16:12:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv7W-0000000Ccap-04NK;
	Thu, 09 Jan 2025 16:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m+VSPD28TfRDmVd100m2sowp0pegmPTa+/H6mPRZWuE=; b=3enGU/Uzg1m3dnVEok1h2JgQ9T
	2tR84bYfIEmU/WUPcqhmHmlKFx21W9c/gzlnY1JfOsScjOHUSWQnD48GGS6rR3feveeqG6rFhx3yH
	9GH4R340aOQAqTxsUwBPEZFLsBobt2NGNPQ2++dZTR5Othiais6yplXT/nWsTEI0lxOw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVv7N-002wi2-Tl; Thu, 09 Jan 2025 17:10:45 +0100
Date: Thu, 9 Jan 2025 17:10:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW
 configuration
Message-ID: <2f02964f-d143-4340-8284-790b5aa2901e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-4-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-4-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081054_054691_4AB22478 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> +/* Below macro is for 1528 Byte Frame support, to Allow even with
> + * Redundancy tag
> + */
> +#define PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC	(VLAN_ETH_FRAME_LEN + \
> +							ETH_FCS_LEN + 6)

Is 6 for the redundancy tag? Is the redundancy tag defined somewhere?
Could this 6 be replaced by a #define, which is maybe a sizeof()?

> +	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
> +		 (!eth0_node || !eth1_node) ? "single" : "dual");
> +

Is that really true? Is it not in dual mode, but only one interface is
in use? I also wounder at the value of spamming the log like this.

	Andrew

