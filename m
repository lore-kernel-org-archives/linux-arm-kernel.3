Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E5ACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gmC105l7E1Db//MoijXLGpq6IMh2wT4wub8GyCThZ4=; b=U9lCIkLdABHS/yFoSYOpcUBI70
	0q2zS+0g6i3pS9VtcnpCe+aVK3whALCpnETtwb4U4C3nd7TbDEOVkfl05FwoHZTIweKfRBZb+MxD/
	Q53+1WTczL8nLN6BI7Ioe1n8QMQcBCGy/l9WW5P7yJNQtcdg8nTKVXPPgqpvQbIdhoazN+xLJs8t2
	bz24Lu28aK3G2LoF75ApKROac32sqcsy23cKpK/I4KT+rPUCU2Jr34nl7fwFgYFDoGJ0tlIJO5pvT
	CnKXJJyxYzQ3j8uQqgbSZ8zte+iwMRwQFSFGg/nX6Qu2klsWIDH6F92DRQjj2zwf1Jexq921VsZ9Z
	3fSwc/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6TX-0000000GreR-3oDf;
	Mon, 17 Nov 2025 21:09:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6TW-0000000Grdy-02VA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BA8740C1B;
	Mon, 17 Nov 2025 21:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43548C2BCB8;
	Mon, 17 Nov 2025 21:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763413765;
	bh=v2TilITkDJ2tL/jDdt/62ng7+B27BobzbCQT9r0dXfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXL+7FrdEV6yxxSYUFmr0AfsRnRWEYsHOhHygW0gdgzKY8vBpISSFg1ZrrskbLaqD
	 PmL4jLGu2rgdUDj/VoS2npQM+95FsS3OpUasQJFCkqrivJKxfTohSkS4l7l7lKLR+F
	 ghTWjod7PnP3ecHjfnxwEEFpjVZ1aNjBhfWN7zdAfdcXQ1WS0ulgGLEaF+N+NIeg9A
	 lGzI59z+RWYnQfiGGobEFKOI0D1l0Z9Ta2PMeCgliJkjRZto/9holuIC/6yEJPlmOR
	 P2YE6p933CwqY0aJKEj/+k909FoQPqBcSbN5w7rrUlKQkx+vd5ucWdTJT6ZBQ8JCal
	 NLXX7PfBjaC8A==
Date: Mon, 17 Nov 2025 21:09:14 +0000
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
	pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
	praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
	mohan@couthit.com
Subject: Re: [PATCH net-next v5 3/3] net: ti: icssm-prueth: Adds support for
 ICSSM RSTP switch
Message-ID: <aRuO-ib0us1JCrxc@horms.kernel.org>
References: <20251113101229.675141-1-parvathi@couthit.com>
 <20251113101229.675141-4-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113101229.675141-4-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_130926_066046_61FCEFEC 
X-CRM114-Status: GOOD (  13.51  )
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

On Thu, Nov 13, 2025 at 03:40:23PM +0530, Parvathi Pudi wrote:

...

> @@ -1012,17 +1074,77 @@ static int icssm_emac_ndo_stop(struct net_device *ndev)
>  	hrtimer_cancel(&emac->tx_hrtimer);
>  
>  	/* stop the PRU */
> -	rproc_shutdown(emac->pru);
> +	if (!PRUETH_IS_EMAC(prueth))
> +		icssm_prueth_sw_shutdown_prus(emac, ndev);
> +	else
> +		rproc_shutdown(emac->pru);
> +
> +	/* free table memory of the switch */
> +	if (PRUETH_IS_SWITCH(emac->prueth))
> +		icssm_prueth_sw_free_fdb_table(prueth);

The conditional block above appears to open-code icssm_prueth_free_memory()
which is also called below. I don't think this this duplication causes
any harm, as it looks like the second, indirect, call to
icssm_prueth_sw_free_fdb_table() will be a noop. But it does seem
unnecessary.

>  
>  	/* free rx interrupts */
>  	free_irq(emac->rx_irq, ndev);
>  
> +	/* free memory related to sw */
> +	icssm_prueth_free_memory(emac->prueth);
> +
> +	if (!prueth->emac_configured)
> +		icss_iep_exit(prueth->iep);
> +
>  	if (netif_msg_drv(emac))
>  		dev_notice(&ndev->dev, "stopped\n");
>  
>  	return 0;
>  }

...

