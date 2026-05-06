Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984FFCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2cwGeHNcmJAvrQlCzpYY2M9z9bo0h/nw65Xl5jCTQI=; b=p9PEXorjNoQaj+XIWVCIS37Fnc
	oigmUS+aZfu5+WYp7Pc0FOz5uVgGn9PHUrhDj67VzNkTdo8HoznOvc4balpHpsBrx/70dbnKNW0sn
	3htp2R4CIfv46HMDf7gjU92hgGlkN4jiFPdmRhzyGyvKX4LXIg/1r7nvRxvnYqipSja9MfrV0PzgM
	66uwZQAO0MCPgeetHJFd4vmmmgELmvBiul6a40EF8F7X16JxqFc9KXV7wifOr7rdhu5/rbstnig/D
	tT3dUlrGlW4A08VbClsGUrGVVU18Jh8ChQgDXDsUYMLCUWmnpFH51RrL+930burqdkNBfCjXj21b7
	W+EOGKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXvg-00000000DcK-2sbI;
	Wed, 06 May 2026 08:48:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXvf-00000000DbX-1LID
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:48:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 252251A25;
	Wed,  6 May 2026 01:48:20 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D9C63F836;
	Wed,  6 May 2026 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778057305; bh=wrb8clZHgzuT7wnWp03Lc8ni6ePYR/XDW2BT0jrafHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJsX3oJscwUJepHOsPZ3ynrLiBLn+T7I6Mc7PTjhGEj3JpgrdwU1lPyv0Ecn+R7K+
	 4nHxkBhWl5vY3K/OeWMNLghyqCgDoBUcNDW9ZywX8pmQIfh/+wFcXiKGKyaX0Z2W2I
	 8WGNEfzptfk+txOWwvtvb0e8l4slKkWVzJ+hDl0o=
Date: Wed, 6 May 2026 09:48:22 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 04/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <20260506084822.GC3778514@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422132203.977549-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_014827_400421_31D731BD 
X-CRM114-Status: GOOD (  14.64  )
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

On Wed, Apr 22, 2026 at 02:21:54PM +0100, Yeoreum Yun wrote:

[...]

> @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>  
>  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>  		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> +		/* always clear status and pending bits on restart if using single-shot */
> +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));

I am not confident what is the right way to handle the pending bit.
I looked a bit Arm ARM but still no clue. In particular, I suspect it
may need to be handled when disabling the trace in etm4_disable_hw().

Let's make it clear with some internal check.

> @@ -1829,8 +1829,8 @@ static ssize_t sshot_ctrl_store(struct device *dev,
>  	raw_spin_lock(&drvdata->spinlock);
>  	idx = config->ss_idx;
>  	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
> +	/* must clear bit 31 and 30 in related status register on programming */
> +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);

Similarly, the question is: if it is in a pending state, how can we
ensure the state machine works properly with the new settings?

>  	raw_spin_unlock(&drvdata->spinlock);
>  	return size;
>  }

> @@ -1879,8 +1879,8 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
>  	raw_spin_lock(&drvdata->spinlock);
>  	idx = config->ss_idx;
>  	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
> +	/* must clear bit 31 and 30 in related status register on programming */
> +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);

Ditto.

Thanks,
Leo

