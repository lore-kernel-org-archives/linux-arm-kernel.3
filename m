Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBDAC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+9Kjb6M2paWB6X8qBh+f8YwuVDqN2g5yDo3RtaMXrM=; b=Zkt2QT13dYRLZxNUhXkEdcUfAe
	p9aNoN3caL3p6cusaV1nVkOoTpQ51GqB++EZMRtUN0nt9of2zCMRX41vO3MGcslxzf+MNYtlgfx8c
	NFCwDE5xL00HQQreEGArUGALSO8s1HfkN0C5c6j+f5sfKl60PdBTKCWINKlLVWhP93z3uRpNiyQVY
	qVpMJsk+z+xmk60v2W4235H6UUwwbmX/kUgO5KhpiZk9bV8Rg2YDuC4Tc00LWDvbW1lxrH45kphFb
	irYQv5M/ginYNp1OzziN5GqxMbvhUY2fBWsxQ/WpXRAFbJQ32wFqGx8dRETpJt0yApFIHKMcoScbI
	wuy5Fy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhvs-0000000EkM2-34Vn;
	Fri, 04 Jul 2025 15:02:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhlT-0000000Ej2o-2oOS;
	Fri, 04 Jul 2025 14:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E3FB467A9;
	Fri,  4 Jul 2025 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13947C4CEE3;
	Fri,  4 Jul 2025 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751640707;
	bh=x/SPuDR5dCceYdymmi7HSKx5gSWYnMZYMNh8Fp3FPHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G10m6TVaSOe5n19bVJaivBNn8I8b5BMUm2+9r9UtGG82YpPiKKQiCtsZChJA30efn
	 2cdpuvcLynYts1WeYRcDQmqB80zlFXgHpnWTTviBy+imm4OdnoRJ37+2G+qweiFD3e
	 X8Zr1Xeo6lDPF9zpSUFaKz6yCiV1PzDyvqhk/3qGPhHdXCqYZj8jx9Vi0DFa3TmnOj
	 0JBVVxBBYRFnqxfdphu7hixIqrSUmmMO5J/Fu5AqaUT4NLsWjQFmn/Pggi7dBFHH8G
	 lOwKD4JLYwyKOzwq6ihN3MiOw505ZNX6Yg6IR3FRw4qNSHaWZ9ZhZzzrROepCafCjc
	 cYkTVz/A6G7+Q==
Date: Fri, 4 Jul 2025 15:51:42 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/6] net: airoha: npu: Add more wlan NPU
 callbacks
Message-ID: <20250704145142.GA41770@horms.kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
 <20250702-airoha-en7581-wlan-offlaod-v1-2-803009700b38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-2-803009700b38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_075147_731345_E6446401 
X-CRM114-Status: GOOD (  15.00  )
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

On Wed, Jul 02, 2025 at 12:23:31AM +0200, Lorenzo Bianconi wrote:
> Introduce more NPU wlan callbacks used by wlan driver (MT76) to initialize
> NPU module register for offloading wireless-wired offloading.
> This is a preliminary patch to enable wlan flowtable offload for EN7581
> SoC with MT76 driver.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

> diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
> index 242f0d15b2f7c262daaf7bb78ee386ccc8a0433d..9fdec469e7b0e7caa5d988dfd78578d860a0e66d 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.h
> +++ b/drivers/net/ethernet/airoha/airoha_npu.h
> @@ -30,6 +30,27 @@ struct airoha_npu {
>  					    u32 entry_size, u32 hash,
>  					    bool ppe2);
>  		int (*wlan_init_reserved_memory)(struct airoha_npu *npu);
> +		int (*wlan_set_txrx_reg_addr)(struct airoha_npu *npu,
> +					      int ifindex, u32 dir,
> +					      u32 in_counter_addr,
> +					      u32 out_status_addr,
> +					      u32 out_counter_addr);
> +		int (*wlan_set_pcie_port_type)(struct airoha_npu *npu,
> +					       int ifindex, u32 port_type);
> +		int (*wlan_set_pcie_addr)(struct airoha_npu *npu, int ifindex,
> +					  u32 addr);
> +		int (*wlan_set_desc)(struct airoha_npu *npu, int ifindex,
> +				     u32 desc);
> +		int (*wlan_set_tx_ring_pcie_addr)(struct airoha_npu *npu,
> +						  int ifindex, u32 addr);
> +		int (*wlan_get_rx_desc_base)(struct airoha_npu *npu,
> +					     int ifindex, u32 *data);
> +		int (*wlan_set_tx_buf_space_base)(struct airoha_npu *npu,
> +						  int ifindex, u32 addr);
> +		int (*wlan_set_rx_ring_for_txdone)(struct airoha_npu *npu,
> +						   int ifindex, u32 addr);
> +		u32 (*wlan_get_queue_addr)(struct airoha_npu *npu, int qid,
> +					   bool xmit);

Hi Lorenzo,

It seems that the implementation in this patch of
most (all?) of the callbacks are trivial wrapper around
airoha_npu_wlan_send_msg(). Which provide a named callback to callers.

It seems to me that a different approach would be to provide a
wlan_send_msg() callback (name could be different, of course),
and have callers pass the _wlan_send_msg(). Which for one thing,
seems far less verbose in this driver.

Could you comment on these different approaches?

...

