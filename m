Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA651C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHC8P5x/6xk3Fuo53y+bHpuX0kXmpUk0ZynVH7jet5I=; b=XKSpO9qlqkNd6yRXC+/bRzCnoR
	XEXKl7IQgMtme6mm5U46e8xGDFq60ddPSa+iG7v6iJRYh760pob2CKiaLKJg/r0LLRWv32e0muQwA
	bJaLUFh7+q+RsRdl9wXlu+wj8TeIxxDus0YImo8cgcSrAFrjKCLwtjiYypLbRoknPuhpFCdR2xYh9
	7E21x3pHm9kOUyrQDMJLg3o26KVo9zdAqMaexZ/zUUPcQsaXdVyv8USKdfAk5B2PY4+dUw3U000Uw
	NEo/cxSPJwJ+Ej6heR6uM74tFlR3kgZsnYUnNAmg2Vd5Ctuf0GcCkdi3to4M2y6yYeRm1VI55aG6n
	oDvuiGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxN6-00000008jDq-0PMj;
	Mon, 19 May 2025 10:05:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx50-00000008eQ8-1T22;
	Mon, 19 May 2025 09:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D82E614BF;
	Mon, 19 May 2025 09:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9D2C4CEE4;
	Mon, 19 May 2025 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648001;
	bh=2566Xddhp+2kdnOn/l4udtTcEt2bYPi0/sg2riddGRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b90oko50aXGaf1Q8ETiIK2dYmNDCXFGts/uAJN1PMybJmWkn+tEt5qu6UwkZNY9PO
	 RCPTvvIpK1w0Nn77RbVAp+NLUGpR+H57bNzmK4dqAiNX0jxGRFSghAw8mJlzQW6fDu
	 UVPYBGttHNPYcMibYBKQjW1dgIFTndIYQKGb5LsyNJ4xPi8Dfeoe8llhH4x3gDW+hN
	 Nu4r6h8xUGaaqt7Rt1HTW3TRzY2TWB2XM38Tej4XXqfkL+Bep21P85mBoJ0MgRB7Gl
	 tFSot9VQaCXAWjkFIQ/8DEi4oZOmdeGkRYJ2i6wGUW3XDqhrLiKSe84x0R2G3nkpEd
	 hnTLobvTlgfiQ==
Date: Mon, 19 May 2025 10:46:37 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/3] net: airoha: Add FLOW_CLS_STATS callback
 support
Message-ID: <20250519094637.GE365796@horms.kernel.org>
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
 <20250516-airoha-en7581-flowstats-v2-2-06d5fbf28984@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-airoha-en7581-flowstats-v2-2-06d5fbf28984@kernel.org>
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

On Fri, May 16, 2025 at 10:00:00AM +0200, Lorenzo Bianconi wrote:

...

> @@ -1027,6 +1255,15 @@ int airoha_ppe_init(struct airoha_eth *eth)
>  	if (!ppe->foe_flow)
>  		return -ENOMEM;
>  
> +	foe_size = PPE_STATS_NUM_ENTRIES * sizeof(*ppe->foe_stats);
> +	if (foe_size) {

Hi Lorenzo,

It's unclear to me how foe_size can be zero.

> +		ppe->foe_stats = dmam_alloc_coherent(eth->dev, foe_size,
> +						     &ppe->foe_stats_dma,
> +						     GFP_KERNEL);
> +		if (!ppe->foe_stats)
> +			return -ENOMEM;
> +	}
> +
>  	err = rhashtable_init(&eth->flow_table, &airoha_flow_table_params);
>  	if (err)
>  		return err;

...

