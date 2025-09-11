Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73FFCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37t0QPtyu/XvIalXZWt6PWI4bvROoJUZ3WeQvV5JNsU=; b=M/KLS72fSZkEVuyDW5EM2w/C23
	ObiRBmFvNdJVnrKL0S8Ou8+p4dROqgJ9Ra+U9ekk98jofnC4Nml6hMjDsIg8KeN1c/sdCTXDbd3Kl
	pLbKFBWFQjUeR4PcbTmD8DxDuQqI+rEO5UPLx//DSQgz+8CSbcC5jKQCQ+4zuDgDu+8/+GzMS/pIZ
	FnklYewOg/Y2paeoXUYl6fDy7zdBIcrSN+LbbqxXUGsA2NLsblQTwmyperenkUKlcVUhhLsU5C2v3
	z8qNiBICGBIENy8e0PAnTBFUMx6MJKXlt+rHAAjbgVwguLvy+6WrOpwTS8EyeVexxYWAJl/Ni34pv
	5ROaJhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiOm-00000003avk-3mBT;
	Thu, 11 Sep 2025 14:35:44 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiOk-00000003at2-13pm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:35:43 +0000
Message-ID: <0dc424bf-c19b-4eeb-82db-88bff4f85d46@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757601328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37t0QPtyu/XvIalXZWt6PWI4bvROoJUZ3WeQvV5JNsU=;
	b=oaC8OiDIhGEaAAekyBYHmzL+501l+czft7xmdUJGAyUMLfPFEsD/2qKIsZwmQR2JWpta6v
	5WYqyYOZD8HjDasYlBQkI3L3l3iVDmF4rWUPqBeUaiG+TwnPF+TNxjruTdEI1TlxXKGa5Z
	VDt6kjHfL6UPggzWsyCfCkcAfMrzwB4=
Date: Thu, 11 Sep 2025 10:35:22 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/2] net: xilinx: axienet: Add inline comment for
 stats_lock mutex definition
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com
References: <20250911072815.3119843-1-suraj.gupta2@amd.com>
 <20250911072815.3119843-3-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250911072815.3119843-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_073542_445372_9681B274 
X-CRM114-Status: GOOD (  13.27  )
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
> Add inline comment to document the purpose of the stats_lock mutex in
> the axienet_local structure. This mutex protects the hw_stats_seqcount
> sequence counter used for hardware statistics synchronization.
> 
> Fixes checkpatch warning:
> CHECK: struct mutex definition without comment
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> index 5ff742103beb..99b9c27bbd60 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -598,7 +598,7 @@ struct axienet_local {
>  
>  	u64 hw_stat_base[STAT_COUNT];
>  	u32 hw_last_counter[STAT_COUNT];
> -	seqcount_mutex_t hw_stats_seqcount;
> +	seqcount_mutex_t hw_stats_seqcount; /* Lock for hardware statistics */
>  	struct mutex stats_lock;
>  	struct delayed_work stats_work;
>  	bool reset_in_progress;

NAK. This is already documented in the kernel-doc comment.

