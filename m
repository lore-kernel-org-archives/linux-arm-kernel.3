Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9301C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+syQltWy2iShpV3VhhxV37TML7DelsfUgKCvN307fw=; b=4bV3FPHvKCLv6kWmt+FcmwW5Lj
	dK50zWhjhXAdH3XRrSIUyZDbPpzRNjCXribq0Gncu3yO5Mp0nPy1DQPoZjNznQdyvxoyNzX95Xjya
	pHKmcAC9g9PzxhjxHVtjl36RvW0T9v7w6gaBN4Bho2Z+mblFWvnCYkeK5wbjrmMQ8Z6Jy+fl0/wLu
	DvbFTmfxwOTueL/CDBNli8jZQIzNx0PL+G09lXWyo5TYVsouU5WVcfXhodYlOLb+r7smJ1jU+ZjU5
	uNFYoAfdFrePuwBHHesrLI07y97iW9e+AsdXxKmOpn8RP2s6lbytBwemGzK7YDZrDq75wfystzBvQ
	YnV8CLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrbt-00000004Btr-06rJ;
	Tue, 11 Feb 2025 14:51:37 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrTy-00000004AQ1-1DoA;
	Tue, 11 Feb 2025 14:43:27 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso915199266b.1;
        Tue, 11 Feb 2025 06:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739285004; x=1739889804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+syQltWy2iShpV3VhhxV37TML7DelsfUgKCvN307fw=;
        b=ASOV0WvqV7F7We5gcCJH5RP1Bf3K6nsGykvXj4Znt6bGmE2EVB/NHgvOulOB6Zy+ad
         3Oak7utHPeDZG5XhfrFoUsLJAYseEvnAGY9SDKsXFoVpp3yscMK3Khsrbm61wCSuoS0n
         q7BFLFOY1587zPEyvRnzXtEr0liGXHdSKnXlBcTCtIUrXu1bZBY5oRrYp427uHstByTr
         25XAnv/1ERIXEetYWmObKa6z2AkysQtUFj1wCP4QSzTGqKu9AqbGvSXiHMrVbq8DQQxV
         xXkLtHMXLdbG2mi2/Bcz2O9mkO9pNfQcVp9SNVIizFpZrv2YryFbLbwsR9eHRCrmKyEv
         iPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285004; x=1739889804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+syQltWy2iShpV3VhhxV37TML7DelsfUgKCvN307fw=;
        b=BpwdDPzJnP2gonkurqc4dCBBUlookvnbBshQ1JnNcK5ZNJQQj5nYdh8PP4xdZyclx+
         vaeUylx9fZ/AgPnyu4P08MVRSLcqqx6BU4xe9sBuiP4B1jtD3btGRjAXTo02rVbFw2Sq
         dH7KQc+iRwyvHGMZIEJ6CG+WteXkppMPDR7pR5my4NOgHUabgCbjFnOswzDyihWvYxuG
         nGOtFbshLUsiBTacdZFak8W+m8Y5xjnVMbWLQDAXyfxcpUCgrWrdlZ5NZErsWiwed8/z
         4qknkf3U989Hblo0HUmJxtkNVXpVFuUUQlZuvCsrp5rqg9Wwa1jH1kmM6QsYX2k4EYfe
         5qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDwPBxOp6PXU/yDTVcyFmo16fn6s/59eR0XWrcgj7OUvnpL+W0H4Dq+hZ3ZRZ2+8vURkvimThf+FAygGClL2U5@lists.infradead.org, AJvYcCUgP17ermzIuBuaJ8qsel9yBZ5DFqTDJ2vjpu2pSZdI//NoNmhT6rlhRHjwoW0HCU3JM6QHH5mRTR3tSv4r2gk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhQn0UOuG3kdCZK7EJBXVkvtfBG6hN6U+Nc9OeydDmr3cBn8tf
	ha6zaCiwfD0jcw9AwNsBd3MJzVSCfH6FH7hIi2OdJxezm/XACOLB
X-Gm-Gg: ASbGncvMLBlqahamqDFEnvZos6tviJijHCNk+p7yMNyhOcxtA+vjnPdeFtatHvbnKGW
	3otcNNc8/fFLMJVb8HkBX2BQ+Z/w7rN+bGyu9EVy3eaMBom1R5dHCSGVeuEzxUff2GSvdrxvqqh
	P/Xr4Ti0BoI92hjOgkL64BjC2lQoLh/pwqk8/AGEAPbzRRBii5V0gUpRmMmS3z+p3IARucrEyDw
	GEIJ8KkUbS39hMpZigxDpq6JuAH1qRP2XBQYJ3/m9marh65FUYGmerPStb15pgzrnMBz5JU/8WT
	i677hfXQLLOPLbXPzTCmZzS/NzgZ6KJlIeSyNLf6IGVO+r4NOLgeQ9R4RPtOrj9BUBZZWSZz/4p
	ezb/p4BGBQU4Is5iY+gq0lvekxzc0ou/l/Jhplh2KTKRf/avphWogiRkOBtbufJrksw==
X-Google-Smtp-Source: AGHT+IF9jmcJFJFbEK49xdcz+FAYc5JFQf9JpzthNkFP4VwxwCFQdCkq660UzRh31VnMKEshFSn0QQ==
X-Received: by 2002:a17:907:6e86:b0:aa6:9eac:4b8e with SMTP id a640c23a62f3a-ab789bfc7d9mr2013030966b.41.1739285004009;
        Tue, 11 Feb 2025 06:43:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c4a50e73sm394025366b.36.2025.02.11.06.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:43:23 -0800 (PST)
Message-ID: <9ae3548a-844e-4449-9c00-5dd79e804922@gmail.com>
Date: Tue, 11 Feb 2025 15:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Language: en-US
From: Eric Woudstra <ericwouds@gmail.com>
In-Reply-To: <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_064326_336344_356369D8 
X-CRM114-Status: GOOD (  15.51  )
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



On 2/11/25 2:28 PM, Vladimir Oltean wrote:
> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>  		return;
>>  
>> -	vg = br_vlan_group(br);
>> +	if (p)
>> +		vg = nbp_vlan_group(p);
>> +	else
>> +		vg = br_vlan_group(br);
>>  
>>  	if (idx >= 0 &&
>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
> 
> I think the original usage of br_vlan_group() here was incorrect, and so
> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
> and nbp_vlan_group_rcu().
> 
> The lockdep annotation is important, otherwise I get this with CONFIG_PROVE_LOCKING=y:
> [ 1140.931869] =============================
> [ 1140.935996] WARNING: suspicious RCU usage
> [ 1140.940094] 6.14.0-rc1-00224-gda8926a49ba1-dirty #2666 Not tainted
> [ 1140.946371] -----------------------------
> [ 1140.950520] net/bridge/br_private.h:1604 suspicious rcu_dereference_protected() usage!
> [ 1140.958622]
> [ 1140.958622] other info that might help us debug this:
> [ 1140.958622]
> [ 1140.966752]
> [ 1140.966752] rcu_scheduler_active = 2, debug_locks = 1
> [ 1140.973435] 2 locks held by swapper/0/0:
> [ 1140.977521]  #0: ffffd9f646c333b0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x4/0x40
> [ 1140.986404]  #1: ffffd9f646c333b0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x4/0x48
> [ 1140.995170]
> [ 1140.995170] stack backtrace:
> [ 1140.999636] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.14.0-rc1-00224-gda8926a49ba1-dirty #2666
> [ 1140.999650] Hardware name: LS1028A RDB Board (DT)
> [ 1140.999656] Call trace:
> [ 1140.999660]  show_stack+0x24/0x38 (C)
> [ 1140.999683]  dump_stack_lvl+0x40/0xa0
> [ 1140.999698]  dump_stack+0x18/0x24
> [ 1140.999711]  lockdep_rcu_suspicious+0x174/0x218
> [ 1140.999723]  br_vlan_fill_forward_path_pvid+0x90/0x150
> [ 1140.999735]  br_fill_forward_path+0x54/0x1b0
> [ 1140.999751]  dev_fill_bridge_path+0x9c/0x188
> [ 1140.999766]  nft_dev_fill_bridge_path+0x2ac/0x418
> [ 1140.999785]  nft_flow_offload_bridge_init+0x188/0x1c8
> [ 1140.999801]  nft_flow_offload_eval+0x18c/0x300
> [ 1140.999816]  nft_do_chain+0x1c8/0x538
> [ 1140.999831]  nft_do_chain_bridge+0x15c/0x210
> [ 1140.999846]  nf_hook_slow+0x80/0x130
> [ 1140.999862]  NF_HOOK+0xd8/0x1d0
> [ 1140.999871]  __br_forward+0x138/0x1a0
> [ 1140.999880]  br_forward+0xd8/0x160
> [ 1140.999889]  br_handle_frame_finish+0x3bc/0x5a8
> [ 1140.999900]  br_nf_pre_routing_finish+0x538/0x608
> [ 1140.999917]  NF_HOOK+0x254/0x298
> [ 1140.999933]  br_nf_pre_routing+0x3e8/0x428
> [ 1140.999949]  br_handle_frame+0x264/0x490
> [ 1140.999959]  __netif_receive_skb_core+0x13c/0x1128
> [ 1140.999975]  __netif_receive_skb_list_core+0xd4/0x1e8
> [ 1140.999989]  netif_receive_skb_list_internal+0x224/0x338
> [ 1141.000000]  napi_complete_done+0xb4/0x1d8
> [ 1141.000012]  gro_cell_poll+0x94/0xb8
> [ 1141.000025]  __napi_poll+0x58/0x258
> [ 1141.000040]  net_rx_action+0x1f4/0x3e0
> [ 1141.000055]  handle_softirqs+0x184/0x458
> [ 1141.000070]  __do_softirq+0x20/0x2c
> [ 1141.000079]  ____do_softirq+0x1c/0x30
> [ 1141.000095]  call_on_irq_stack+0x24/0x58
> [ 1141.000111]  do_softirq_own_stack+0x28/0x40
> [ 1141.000127]  __irq_exit_rcu+0xd4/0x1a0
> [ 1141.000139]  irq_exit_rcu+0x1c/0x40
> [ 1141.000152]  el1_interrupt+0x8c/0xc0
> [ 1141.000170]  el1h_64_irq_handler+0x18/0x28
> [ 1141.000186]  el1h_64_irq+0x6c/0x70
> [ 1141.000195]  arch_local_irq_enable+0x8/0x10 (P)
> [ 1141.000213]  cpuidle_enter+0x44/0x68
> [ 1141.000228]  do_idle+0x1e8/0x280
> [ 1141.000238]  cpu_startup_entry+0x40/0x50
> [ 1141.000248]  rest_init+0x1c4/0x1d0
> [ 1141.000260]  start_kernel+0x324/0x3e8
> [ 1141.000272]  __primary_switched+0x88/0x98
> [ 1141.197568] ------------[ cut here ]------------

Thanks. I will correct both in v7.


