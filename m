Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B5EEC145A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y4nRaJ0cDRowiaWX4Y6f+WEnP9Ew2rMmo9zhpO/GQs=; b=RczA6YMweyS3JCM72NJ19Ezo1i
	9YYq5vk72n5nVSZTcLaYtznw3Y2cZlv1+fpunioG3+G3bGov4RXjdxFv4lGyMI4/PuCi/QXesWzRW
	Nfr7zWiiNc5pZRRpBgJMXUtWBl//tTsjHciQZtDoHel2yKRZQLyOvsLnnWXsyRl5zbyf/ZMsE9MV5
	ooZdKX1Bv0lflXurLNDBVfBmt4M+oaMi6C68UlfX817BdX8cNBdRMGLZP45SFwLq96lNKKmT+UwjS
	Iu1hobRbDFA3IppgDlz22n+14+SX86dfAAvaZYQqNaWg+eYpInReR1D6L/hv42GuuqcH43IiGr0V7
	azeFfziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQY4-0000000FIhR-3uLh;
	Tue, 03 Mar 2026 14:16:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQY2-0000000FIh2-36E8;
	Tue, 03 Mar 2026 14:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A64140130;
	Tue,  3 Mar 2026 14:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779DFC116C6;
	Tue,  3 Mar 2026 14:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772547389;
	bh=PlsY62ALVOzJc1QWsF6hM8CmEKSHbumYLE1qUTIAmyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNbywP6kuOYrB39xGIvBVT428jxDk+LPgMH8piFSVADraj1ysUz0eEWENZ87BjiWA
	 XgyAPNoxnNkGdkNA8yMvEMbzJiD+KCLPmF5DQVBjFpUWdv5OslFaTln1+ns6jAJZn5
	 q+xx5wPcfX1QlxM+tjqQeCgMIfN9VN+N2gxUGSKMkDVAHcEpf6Dr0VdYwUbIPRvEHT
	 UoCcno/g4PfwQxITjC1eeJFG9yWBSrJLEQw9Jr8HRHtxfXNbqg/cbBMJtoiIiKrOBz
	 1OjUPqOYvozceahNPlNXF4W576w25zPK7SAiE880j88HBup3M26Nv7jA0VDIcVJvL3
	 53c0FTL5bxXBQ==
Date: Tue, 3 Mar 2026 14:16:24 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix GDM2 loopback configuration
 for USB serdes
Message-ID: <20260303141624.GD71509@kernel.org>
References: <20260228-airoha-fix-loopback-for-usb-serdes-v1-1-a94be0f897da@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260228-airoha-fix-loopback-for-usb-serdes-v1-1-a94be0f897da@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_061630_798879_5A178ECC 
X-CRM114-Status: GOOD (  22.43  )
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

On Sat, Feb 28, 2026 at 01:20:33PM +0100, Lorenzo Bianconi wrote:
> Flow Control source port mapping for USB serdes needs to be configured
> according to the GDM port nbd parameter. This is a preliminary patch
> since nbd parameter is specific for the given port serdes and needs to
> be read from the DTS (in the current codebase is assigned statically).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

Is this a fix? If so, should it have a fixes tag? And be targeted at net?
Otherwise, perhaps drop the "Fix" from the subject.

Also, I think it would be worth explaining the situation
before and after this patch.

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c  | 10 ++++++----
>  drivers/net/ethernet/airoha/airoha_regs.h |  5 +----
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 3779f93b47bc13ae21d4ae088dece4712dc214e5..37fc2b33d3af8a190a74efc69ed54f163afa6412 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1729,10 +1729,12 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
>  		      SP_CPORT_MASK(val),
>  		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(val)));
>  
> -	if (port->id != AIROHA_GDM3_IDX && airoha_is_7581(eth))
> -		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
> -			      FC_ID_OF_SRC_PORT24_MASK,
> -			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
> +	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
> +		u32 mask = FC_ID_OF_SRC_PORT_MASK(nbq);

AI generated code review flags that the commit message talks about nbd.
But here we have nbq.

> +
> +		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6, mask,
> +			      AIROHA_GDM2_IDX << __ffs(mask));

Perhaps naïvely I would have used FIELD_PREP here.
Maybe that leads to an incorrect result. But if not,
is a shift used here for consistency with the code at
the beginning of this hunk?

> +	}
>  
>  	return 0;
>  }

...

