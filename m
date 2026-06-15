Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBF5CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AztGQmlWKqiomMfQy7VwV1LA90NR9R4FU4YZ8MZTWBc=; b=FCnVhEr2dUX3eBkVM4Gd521gbk
	TEs0FgDvMsgjMANdLXBn6ZZcMGiphND4J5wrAj23I+P9NDixuyHyJ70crVjR8psHPfLq8p7WCvUwa
	woBqrGIV6YmKF+i9TI1eyob+bn4vOodF2VM7Mt1ZePWO2/gBIc2hrwVX52gADn8Cn2w9GiTfe+vlH
	cgSPKHn8wMQh/IszSoh+hUS7tfJb8NNq2KB64jzSOs8WuxPDjRyZbN+6Krf2hIG9cygvUtl4abubm
	eCLaSeumt1ZPSXqU3TjznQX/g9WPrHEhO0//nLEgUWxGnIY84qhO9T1B4qKPOjOUAqgsCYSCPJ63b
	9aRBS/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Pj-0000000EJ69-1eQa;
	Mon, 15 Jun 2026 13:31:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Pc-0000000EJ4w-1YTm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:31:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 94CD3C5146A;
	Mon, 15 Jun 2026 13:31:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67AD660015;
	Mon, 15 Jun 2026 13:31:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3D57106C94F2;
	Mon, 15 Jun 2026 15:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781530290; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AztGQmlWKqiomMfQy7VwV1LA90NR9R4FU4YZ8MZTWBc=;
	b=DQHVEXjMGNQkj6OzgBLI7rDFOF/FNM88+41WUUHPg+BrpSxpFT/14EES1zC3zgPtRppV60
	O/iPBXU1sjhMFIr08FKA2puoS7HgC/bWwTXrmDzUaK3SFJ7tECgzgjpg+p+hGU3l+iTm2z
	zgXUvvlFaH/R7/vmVhczsdW4ctDr6SPdHLCYBxty/3ZOB3ezGRLdk2JSR2hYx3L9bje1hf
	tw/7W857gReWfemIRnofdh0QdG7+BjBOnIpc9ZpisndoW3pcIZk0PjYmEBYOqyQSvQSyqk
	5SpkK1Ff3Z4+YOJBS56jp8YaE91zYpo2Bd/AFirKKZd/rvWYqKTzYd3ur43wtg==
Message-ID: <3bbacda3-4225-4536-a4b4-3aa31a47a3aa@bootlin.com>
Date: Mon, 15 Jun 2026 15:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 02/12] net: phylink: introduce internal
 phylink PCS handling
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-3-ansuelsmth@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260615122950.22281-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_063136_586871_0D4115FD 
X-CRM114-Status: GOOD (  34.96  )
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

Hi Christian,

On 6/15/26 14:29, Christian Marangi wrote:
> Introduce internal handling of PCS for phylink. This is an alternative
> way to .mac_select_pcs that moves the selection logic of the PCS entirely
> to phylink with the usage of the supported_interface value in the PCS
> struct.
> 
> MAC should now provide a callback to fill the available PCS in
> phylink_config in .fill_available_pcs and fill the .num_possible_pcs with
> the number of elements in the array. MAC should also define a new bitmap,
> pcs_interfaces, in phylink_config to define for what interface mode a
> dedicated PCS is required.
> 
> On phylink_create(), an array of PCS pointer is allocated of size
> .num_possible_pcs from phylink_config and .fill_available_pcs from
> phylink_config is called passing as args the just allocated array and
> the number of possible element in it.
> 
> MAC will fill this passed array with all the available PCS.
> 
> This array is then parsed and a linked list of PCS is created based on
> the allocated PCS array filled by MAC via .fill_available_pcs().
> 
> Every PCS in phylink PCS list gets then linked to the phylink instance
> by setting the phylink value in phylink_pcs struct to the phylink instance.
> Also the supported_interface value in phylink struct is updated with
> the new supported_interface from the provided PCS.
> 
> On phylink_destroy(), every PCS in phylink PCS list is unlinked from the
> phylink instance by setting the phylink value in phylink_pcs struct to NULL
> and removed from the PCS list.
> 
> phylink_validate_mac_and_pcs(), phylink_major_config() and
> phylink_inband_caps() are updated to support this new implementation
> with the PCS list stored in phylink.
> 
> They will make use of phylink_validate_pcs_interface() that will loop
> for every PCS in the phylink PCS available list and find one that supports
> the passed interface.
> 
> phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
> where if a supported_interface value is not set for the PCS struct, then
> it's assumed every interface is supported.
> 
> A MAC is required to implement either a .mac_select_pcs or make use of
> the PCS list implementation. Implementing both will result in a fail
> on phylink_create().
> 
> A MAC defining .num_possible_pcs in phylink_config MUST also define a
> .fill_available_pcs or phylink_create() will fail with an negative error.
> 
> phylink value in phylink_pcs struct with this implementation is used to
> track from PCS side when it's attached to a phylink instance. PCS driver
> will make use of this information to correctly detach from a phylink
> instance if needed.
> 
> phylink_pcs_change() is also changed to verify that the PCS that triggered
> a link change is the one that is currently used by the phylink instance.
> 
> The .mac_select_pcs implementation is not changed but it's expected that
> every MAC driver migrates to the new implementation to later deprecate
> and remove .mac_select_pcs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

[...]

> @@ -1872,10 +1993,28 @@ struct phylink *phylink_create(struct phylink_config *config,
>  	mutex_init(&pl->phydev_mutex);
>  	mutex_init(&pl->state_mutex);
>  	INIT_WORK(&pl->resolve, phylink_resolve);
> +	INIT_LIST_HEAD(&pl->pcs_list);
> +
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret = phylink_fill_available_pcs(pl, config);
> +	if (ret < 0) {
> +		kfree(pl);
> +		return ERR_PTR(ret);
> +	}
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink = pl;
>  
>  	phy_interface_copy(pl->supported_interfaces,
>  			   config->supported_interfaces);
>  
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);
> +

I'm not entirely sure about that, we may need to restrict the supported_interfaces
from the MAC.

As an example, take mvpp2. We have 2 PCSs, one for BaseX/SGMII, one for BaseR. But
if we don't have a comphy (generic PHY) device, then we can't use all the
combination of modes our PCSs can provide :

https://elixir.bootlin.com/linux/v7.1-rc7/source/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c#L7074

These aren't external PCS IPs, but from what I understand you'd like to
handle these the same way as purely external PCSs, right ?

I'd say the MAC driver utltimately has the knowledge of all possible interfaces.

The way I see it, it's probably safer to let the MAC give a wide range of interfaces,
and filter that down with what the PCSs can provide (i.e. turn that or into an and,
while handling the case where the pcs supported interfaces is empty).

What do you think ?

Maxime

