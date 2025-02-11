Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C5EC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLyb+sxmlUWI3PPRd+G753tkjaglzT6ouXpQ3N3NRPQ=; b=ZGoKOwzyZoEBg2lhJ63Q7Ps9rF
	/sGRd9n49yz1e5xgUWJoNOgLfW2sVuEBGzcr4q0o04PlAV60BYQlKcho9GBlcOkz1GsIRPgyaSMpH
	4Wd8NhY6Kp+GJuvLKMOYDiwVdYlkpBNYJa76SmqZyfR1PIa0TQ11NeaKxvwhKGm89uwyswhG2nHye
	LGWbo9mGpMPBuwk/j1LisHMi9R1dQAQshMhBW3GKpD1FgOw5xSg1m7TgfachJoOeUTvLKNzKQVl92
	h37HpWlZlV1LM07aelImWVINIw55Pues11AX3xNM3i7qnLbhcFEe914O4++lklziPQsawEq9MsmqC
	EdyYSWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqOz-00000003yCb-16nF;
	Tue, 11 Feb 2025 13:34:13 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqJa-00000003wpl-2o3Z;
	Tue, 11 Feb 2025 13:28:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7c3d44ae1so29004666b.2;
        Tue, 11 Feb 2025 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739280517; x=1739885317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLyb+sxmlUWI3PPRd+G753tkjaglzT6ouXpQ3N3NRPQ=;
        b=RNVcWypkVO6TaMEDwWWkxPrmH6QLM1F6J51E6axUaSwrq7A8KUbYO7pNjt63eiSjoD
         GGAQChXhffwIkgT1gSUf9g4k7h6wLc2TfCS5Iy047VjW8+c8Jnpu6fxvAvuo5T16v73G
         A1R8NTVfP2pJpwHIafkcpVwwJ4FuKjbNhjSSJ/YKSiOoAGX7DsfFTTw8hjZZe4qL/cfe
         sbFz8B78UyGCSWm2lJ3ZVQU9vT6/B8CYTW4+fuARBR8U+Ll3i01928eO8HwPEGr4w9rH
         yi9+r4ljv35V5qYJcVAJuLmUflA7IRg+gIaLJ6pQgYjgV/KSAhaxu2hLdobXSRDbEXjL
         I+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280517; x=1739885317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLyb+sxmlUWI3PPRd+G753tkjaglzT6ouXpQ3N3NRPQ=;
        b=WHS7mAsfIcpC7Pxa0F0W6GVdpnvlXwhgBrJHdUwS85cMH4lLp9gF7M9vnTX47snBf3
         dUgi3c5adY6poKGuWhIOesT2QoUC3X9+CfDLyTrtQniFuM7bFY+bC5AFZMB3ooPfU8O6
         dfWclh2JKCIDoNhXOS8uXRh/H57nTSKwHVy8GEtDpJEbvAgFR5RF4We9nRxEQBtv6B9R
         qmxxMmjx/pDBFFcR7695I4W1t55Sb0OuA2366ai0/0Hr2u6CYSXHnmfK0e/JKb5BYtWM
         QT6tAxSuXlVO3DIhPaT1QdmyPpmsZ/K+jvz7j6dJpv1Gy1NvgtNn8MirXP+O4c28K2GO
         De9w==
X-Forwarded-Encrypted: i=1; AJvYcCX0EShYIbmlnsKe/oSy2ggC5Vsm2MvJhYluKpf9R1io7F62u3xVd84rTilWWCiccj46maahfVdZtQU+oReACaur@lists.infradead.org, AJvYcCXHKeXFg/MQDTsB6ukSxL3QvzRqPwgecBuZNVjt9An/N63ebBtO6yTVVPQSFGAIjmO3pxE8Gcp+F9kAzp0J6sM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwikpM7stoVI0UHnPvtz921pNSdSNCN3NDUuJTptxOmBzthP3Cq
	6oU1V2l6CX1dxCf3JdX48K/LErxTj8VtP3fqAvMWgSUMEEcx5vTD
X-Gm-Gg: ASbGncuKm8NIG4Bc3sXEs2i8JbQ8a3nTVf5dpgEAZeTn/MnYUzZNU+AQqRMLskBRDQc
	+0S7EGWEj+l/w2OIkwj2A5id63Da7Equjt060kgI+NyHojnvfL0NRi9icVuYR7rFwn2n4oZDy+/
	vESlalCJYkxvyrWocUxBb8cHS+LsTCa0Q9Aa3LziLcmy/NtCcOhnagS91yCikOqV88EMNrFt7+L
	ZzYfJJEYlXMUaEbH+EetIRouN/N+Re/30mUP2RQz/z82+eXY+6xPvKCs1U3EvH+LI5ixqEqne+P
	+xg=
X-Google-Smtp-Source: AGHT+IEI3sHUVuDg9ehqKY+KygjpcwX0rbXlLEswHpVnNf7eTh4qQELv+eql57rgOrrbLVr2hu6FNg==
X-Received: by 2002:a17:907:7d87:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-ab7e0e6e245mr105887066b.5.1739280516517;
        Tue, 11 Feb 2025 05:28:36 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7dca728fcsm147341966b.166.2025.02.11.05.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:28:35 -0800 (PST)
Date: Tue, 11 Feb 2025 15:28:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
Message-ID: <20250211132832.aiy6ocvqppoqkd65@skbuf>
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209111034.241571-6-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_052838_712827_C40AA28E 
X-CRM114-Status: GOOD (  13.88  )
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

On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>  		return;
>  
> -	vg = br_vlan_group(br);
> +	if (p)
> +		vg = nbp_vlan_group(p);
> +	else
> +		vg = br_vlan_group(br);
>  
>  	if (idx >= 0 &&
>  	    ctx->vlan[idx].proto == br->vlan_proto) {

I think the original usage of br_vlan_group() here was incorrect, and so
is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
and nbp_vlan_group_rcu().

The lockdep annotation is important, otherwise I get this with CONFIG_PROVE_LOCKING=y:
[ 1140.931869] =============================
[ 1140.935996] WARNING: suspicious RCU usage
[ 1140.940094] 6.14.0-rc1-00224-gda8926a49ba1-dirty #2666 Not tainted
[ 1140.946371] -----------------------------
[ 1140.950520] net/bridge/br_private.h:1604 suspicious rcu_dereference_protected() usage!
[ 1140.958622]
[ 1140.958622] other info that might help us debug this:
[ 1140.958622]
[ 1140.966752]
[ 1140.966752] rcu_scheduler_active = 2, debug_locks = 1
[ 1140.973435] 2 locks held by swapper/0/0:
[ 1140.977521]  #0: ffffd9f646c333b0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x4/0x40
[ 1140.986404]  #1: ffffd9f646c333b0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x4/0x48
[ 1140.995170]
[ 1140.995170] stack backtrace:
[ 1140.999636] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.14.0-rc1-00224-gda8926a49ba1-dirty #2666
[ 1140.999650] Hardware name: LS1028A RDB Board (DT)
[ 1140.999656] Call trace:
[ 1140.999660]  show_stack+0x24/0x38 (C)
[ 1140.999683]  dump_stack_lvl+0x40/0xa0
[ 1140.999698]  dump_stack+0x18/0x24
[ 1140.999711]  lockdep_rcu_suspicious+0x174/0x218
[ 1140.999723]  br_vlan_fill_forward_path_pvid+0x90/0x150
[ 1140.999735]  br_fill_forward_path+0x54/0x1b0
[ 1140.999751]  dev_fill_bridge_path+0x9c/0x188
[ 1140.999766]  nft_dev_fill_bridge_path+0x2ac/0x418
[ 1140.999785]  nft_flow_offload_bridge_init+0x188/0x1c8
[ 1140.999801]  nft_flow_offload_eval+0x18c/0x300
[ 1140.999816]  nft_do_chain+0x1c8/0x538
[ 1140.999831]  nft_do_chain_bridge+0x15c/0x210
[ 1140.999846]  nf_hook_slow+0x80/0x130
[ 1140.999862]  NF_HOOK+0xd8/0x1d0
[ 1140.999871]  __br_forward+0x138/0x1a0
[ 1140.999880]  br_forward+0xd8/0x160
[ 1140.999889]  br_handle_frame_finish+0x3bc/0x5a8
[ 1140.999900]  br_nf_pre_routing_finish+0x538/0x608
[ 1140.999917]  NF_HOOK+0x254/0x298
[ 1140.999933]  br_nf_pre_routing+0x3e8/0x428
[ 1140.999949]  br_handle_frame+0x264/0x490
[ 1140.999959]  __netif_receive_skb_core+0x13c/0x1128
[ 1140.999975]  __netif_receive_skb_list_core+0xd4/0x1e8
[ 1140.999989]  netif_receive_skb_list_internal+0x224/0x338
[ 1141.000000]  napi_complete_done+0xb4/0x1d8
[ 1141.000012]  gro_cell_poll+0x94/0xb8
[ 1141.000025]  __napi_poll+0x58/0x258
[ 1141.000040]  net_rx_action+0x1f4/0x3e0
[ 1141.000055]  handle_softirqs+0x184/0x458
[ 1141.000070]  __do_softirq+0x20/0x2c
[ 1141.000079]  ____do_softirq+0x1c/0x30
[ 1141.000095]  call_on_irq_stack+0x24/0x58
[ 1141.000111]  do_softirq_own_stack+0x28/0x40
[ 1141.000127]  __irq_exit_rcu+0xd4/0x1a0
[ 1141.000139]  irq_exit_rcu+0x1c/0x40
[ 1141.000152]  el1_interrupt+0x8c/0xc0
[ 1141.000170]  el1h_64_irq_handler+0x18/0x28
[ 1141.000186]  el1h_64_irq+0x6c/0x70
[ 1141.000195]  arch_local_irq_enable+0x8/0x10 (P)
[ 1141.000213]  cpuidle_enter+0x44/0x68
[ 1141.000228]  do_idle+0x1e8/0x280
[ 1141.000238]  cpu_startup_entry+0x40/0x50
[ 1141.000248]  rest_init+0x1c4/0x1d0
[ 1141.000260]  start_kernel+0x324/0x3e8
[ 1141.000272]  __primary_switched+0x88/0x98
[ 1141.197568] ------------[ cut here ]------------

