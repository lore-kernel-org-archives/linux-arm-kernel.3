Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28450C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeGffK5l6rF1akeH/3ismnma1iKsWQq9ohQp7z4ZZGQ=; b=jfA+cKlV5dOxhlUMYZDSbwRT6W
	Xe/SMHLrCEKP44dpSaQ4+9OgbrdDyiDmbGtl+EHgu3gJX0OxRv/6SIxKDTexjKjNIHvmH/ZzmMzGJ
	UpCKlwKaMcLCpr2wHCCQdkP2suieQmFD6Hnr4D9HaWivReIazjuXIvkGnltC8QXNGm6+20JhcFZ6E
	xvnypeCz7lh1tUWAuJb6TXNvoDvOFI5bDv5wfgjQEMYwimlaot8rQg812NZMtyxptctau9ri2pGqC
	hK6IsH03t+B9o+RRhL5gceO15ocAdXbpHXnNGJeYuaxGh2XAV0ayQ+RrZbSoLh2xnQvfu+UaplT4/
	lX9EpCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkfc-0000000151J-2zRZ;
	Fri, 02 May 2025 07:18:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkd5-000000014ig-3lQa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 07:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FAB74A839;
	Fri,  2 May 2025 07:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA457C4CEE4;
	Fri,  2 May 2025 07:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746170174;
	bh=2ogR7mfOhi8SAd6iUoSl0ROEi0IAYvwqSFk3KRePUPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqFVcs+m7CD22XXjLVFYTwWYYNfjvquVL6Xm+Qe5tdQ8rKzT+HRRM1HJEJUTVkzl8
	 YtzzrLxmj+D+KKSNCinTu+utxmemTZej0K2+MDFm0BDGsWZ/qkqWX9d3TMsal2k7Gx
	 YPs5Er8oQ3EbhPLmtdVVzNQgFewOqoSIvrJBoRVOqbT7zlvdfp64oOY0rcyAvU2UTO
	 NcB7wDURJ+Wgg79KooIqI6zfzzIvmkeZpZS8bjXuIvqMhvoqgAKKhRswVMOeZ2Ft26
	 f2GufgW8o+Ts0IFQByjedILDPEVwrmBJG+YN1BVkQPwcRunKeiObJnoGG8oZNisLlw
	 c6v2FQeoL3SJA==
Message-ID: <0608a65d-f657-4ef3-aeea-7b2664aa7625@kernel.org>
Date: Fri, 2 May 2025 09:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/4] Bug fixes from XDP patch series
To: Meghana Malladi <m-malladi@ti.com>, dan.carpenter@linaro.org,
 john.fastabend@gmail.com, daniel@iogearbox.net, ast@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 danishanwar@ti.com
References: <20250428120459.244525-1-m-malladi@ti.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20250428120459.244525-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_001615_960163_BF669C95 
X-CRM114-Status: UNSURE (   9.55  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 28/04/2025 14.04, Meghana Malladi wrote:
> This patch series fixes the bugs introduced while adding
> xdp support in the icssg driver, and were reproduced while
> running xdp-trafficgen to generate xdp traffic on icssg interfaces.
> 

This patchset clearly hurts performance by introducing a lot of locking.

Can you please report what the performance regressions this is introducing?


> Meghana Malladi (4):
>    net: ti: icssg-prueth: Set XDP feature flags for ndev
>    net: ti: icssg-prueth: Report BQL before sending XDP packets
>    net: ti: icssg-prueth: Fix race condition for traffic from different
>      network sockets
>    net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue
>      access
> 
>   drivers/net/ethernet/ti/icssg/icssg_common.c | 22 ++++++++++++++++++--
>   drivers/net/ethernet/ti/icssg/icssg_prueth.c | 16 ++++++++------
>   drivers/net/ethernet/ti/icssg/icssg_prueth.h |  1 +
>   3 files changed, 31 insertions(+), 8 deletions(-)
> 
> 
> base-commit: cc17b4b9c332cc654b248619c1d8ca40d80d1155

