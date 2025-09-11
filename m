Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E52CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXjkB0t5I8EFqUaQRQVUcc6w6ST88EZ7TlVvOqu4u8w=; b=NGOSoGp3zTr8FG+UU1sYAbJ70z
	P8pKLIDuHro7L1ulFimZgIdRkWM5G59Ke4/oXNsfPcO8lu5J5JeRxdRRaSkevHJxOkdGsCOH8ozQB
	GUxWmD4kQ8ytK26aeF4i0BNPGsw7BmeNXUflTqGqVpR0XSkPXFr49fdVqFh04qF6I942yYRE6BLAI
	ezn6OjFQEODG9fiwykE4dOnzmBViPU5aprYn23gw3rdzNQ0ZNfApxiRBR0oNgVtmBIObzmuWL40fv
	JdBLpKuMr5W8I9rd7B176l9j6t1fXvm9IKYSmosx+/qZZGOPq+HIRc1gkQxX0OkUCqC9avSgWv0C3
	5i9s67eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiOq-00000003ayC-0mtF;
	Thu, 11 Sep 2025 14:35:48 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiOn-00000003av0-0AoM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:35:46 +0000
Message-ID: <ca3b4343-f538-4db9-90be-fc9aa2854263@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757601341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXjkB0t5I8EFqUaQRQVUcc6w6ST88EZ7TlVvOqu4u8w=;
	b=luusbQobTnOdzoitzZymP78lbIeTEczsiQ+GuglI0b3NFVMvWV8RI40NM0UoKFe5x2ZElJ
	L2Lr1EguHLWVck8EJLOeIcxx8MWsNrw0+EYRaAtBv1bQcZDt8TSAZ6tGSrAdfFRfViy+BI
	aEcLqUfmXWmKMZ9KcGILYzNXB+clV7E=
Date: Thu, 11 Sep 2025 10:35:37 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] net: xilinx: axienet: Fix kernel-doc warning
 for axienet_free_tx_chain return value
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com
References: <20250911072815.3119843-1-suraj.gupta2@amd.com>
 <20250911072815.3119843-2-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250911072815.3119843-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_073545_227741_C757399D 
X-CRM114-Status: GOOD (  16.23  )
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

On 9/11/25 03:28, Suraj Gupta wrote:
> Add proper "Return:" section in axienet_free_tx_chain() description.
> The return value description was present in the function description
> but not in the standardized format.
> Move the return value description from the main description to a separate
> "Return:" section to follow Linux kernel documentation standards.
> 
> Fixes below kernel-doc warning:
> warning: No description found for return value of 'axienet_free_tx_chain'
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index ec6d47dc984a..0cf776153508 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -773,7 +773,8 @@ static int axienet_device_reset(struct net_device *ndev)
>   *
>   * Would either be called after a successful transmit operation, or after
>   * there was an error when setting up the chain.
> - * Returns the number of packets handled.
> + *
> + * Return: The number of packets handled.
>   */
>  static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
>  				 int nr_bds, bool force, u32 *sizep, int budget)

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

