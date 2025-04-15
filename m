Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F05C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKkA7xdE7j/82zBI8CaIHJQH4CwRoxdobNzma3ReWPA=; b=VYbr1P+akIjNhCw1vOUSl51JLl
	3tEM0lBGU/bFW6vSdaEFjxrILnNzHAxB6dWE+HATgJcF8ovD7aruqMXs1zYqbqtwPVm6BcKA8Yl/y
	CmQrTOCi7r42aZa18I7hlWYrl0XFyuCTdfuGq8KhXcdyT9Mh6rhV0IuFdsi3TghPU0kkEtjYDGfA7
	SyWnuCeWm/n6aujwi1ic5+SW/vHRouvwGBZHuj1PWtfHKpCxmMEpvTwyboBTHqnGnb5UL7ZJZaKud
	OTak8cpexIAFh6fdSXG17ZHnyK6pOLvN+1rY3u2iZc/UgvcfRZW7YZwaYBDgKx/eP52M5BK6npc+W
	TCE+DFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mRq-00000006yAo-1Xio;
	Tue, 15 Apr 2025 19:59:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mQ2-00000006xxD-1T3Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 19:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A91766115F;
	Tue, 15 Apr 2025 19:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A05CC4CEE7;
	Tue, 15 Apr 2025 19:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744747085;
	bh=HMRkle/AiWybWCgX3nSxjTcfvrJVFoMThLVLvEnydHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h09IQpYjSGa61AoVG6uQFOfNU25QiDXtTZT7efpfcpzGvO3nZJdjvoZBcBksTwxTs
	 E3zy0YGBDn2cDz5YfYBnlXe6HzQuAkIdKG0UgZo4oLD+/f5Ti1ONfspH307b65JVAo
	 /F570dLJ7/WjKGgg693TirWeliq+1WsRJgg9WY91ucOF8fGFpjVvc++TWGUU/jjKjS
	 lbLvUtBd8AMjlC8KZc9uv0d6AEebe/k65dci1J8XpQOd86uhlXAPJ0eUd8RUWlZwPf
	 FcUiDrWND4WreM58gGaD3UlSdHqwsIBEIOfwGuZnjeealU/sipyV7A3dWoWCGKPWUb
	 iTUfSVXexX3gg==
Date: Tue, 15 Apr 2025 20:57:56 +0100
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v5 07/11] net: ti: prueth: Adds support for
 network filters for traffic control supported by PRU-ICSS
Message-ID: <20250415195756.GI395307@horms.kernel.org>
References: <20250414113458.1913823-1-parvathi@couthit.com>
 <20250414130237.1915448-8-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414130237.1915448-8-parvathi@couthit.com>
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 14, 2025 at 06:32:33PM +0530, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Driver updates to enable/disable network filters and traffic control
> features supported by the firmware running on PRU-ICSS.
> 
> Control of the following features are now supported:
> 1. Promiscuous mode
> 2. Network Storm prevention
> 3. Multicast filtering and
> 4. VLAN filtering
> 
> Firmware running on PRU-ICSS will go through all these filter checks
> prior to sending the rx packets to the host.
> 
> Ethtool or dev ioctl can be used to enable/disable these features from
> the user space.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c

...

> +static int icssm_emac_configure_clsflower(struct prueth_emac *emac,
> +					  struct flow_cls_offload *cls)
> +{
> +	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
> +	struct netlink_ext_ack *extack = cls->common.extack;
> +	const struct flow_action_entry *act;
> +	int i;
> +
> +	flow_action_for_each(i, act, &rule->action) {
> +		switch (act->id) {
> +		case FLOW_ACTION_POLICE:
> +			return icssm_emac_flower_parse_policer
> +				(emac, extack, cls,
> +				 act->police.rate_bytes_ps);
> +		default:
> +			NL_SET_ERR_MSG_MOD(extack,
> +					   "Action not supported");
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +	return -EOPNOTSUPP;

nit: This line cannot be reached.
     I think you can just remove it.

     Flagged by Smatch.

> +}

...

