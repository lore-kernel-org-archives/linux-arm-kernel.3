Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32FE606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zu4Re+QZ;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DAKStuDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=beajLhwN9CSsow59nJHWmE9Zgynru7ufzr34F18gXYA=; b=zu4Re+QZ8dVfONqIDTDLLUCXfZ
	dlR4hvYUNpwCJTITI/GGgb3wbPB5Vs0hO0XIOxMkUGVnC8MS6TsbXG8FYdTHtIDozrSiROmPncPYb
	oSjDBwIg2uPn8Hvw24gYkxIy5Vwo2+5UhYvu0SGE9W6UNRBVaGJXaEHV7nqw1S3idpeqLb6m3Fwjw
	gqlOq6E5fOrpCdMVuUB6GenfYVo1NTUT9iEoGuKkNE13WJNEiVd5Mn71iDyunAtF6+sM3YLfyfvJg
	TamOe67XxG6CcJM+bR8ynvYye4DslhGDR4BCZE3ouGD+J0ivzdRTWeBrEWGZazUZ2U6/EMuZ3slVl
	GfJIiZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiIM-0000000B9wD-2NLL;
	Fri, 30 Oct 2026 08:49:06 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiIE-0000000B9sl-2ygZ;
	Fri, 30 Oct 2026 08:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350139; x=1824886139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pp2u62TqO8sxtCU4vUBVQ9y/ebXI4VwDVRUtwi24cCE=;
  b=DAKStuDkPuqqF28jM4KER8YPB7rn7eyohDuBNKgjpjILN/00FouyOs+k
   ++p1qeaoZucjJW99CnXoEV1Ur6Z9trrYm6qexBDVYUWhXtTjOmd93YUpn
   VZJAYqBJE3k7WnTvbn2D1EHJ+4Q8KWQRzR6sadxHTxAXZh8nJ9ATSBdBk
   99nthJMFKmdtr9Ck8tqOJ4psn54JxmHwCI9Z9Jx14QWbDgfd0wRoF1AFS
   nWK+HVFfwT1REQGCBX6aIwY+jg4yW/oxqcFqAgyA5LPPeeUt6j/hn/zsJ
   VB1cbOwwqT4Q5l4McLEjNFsVwSvhpzLxVv9JTrnHlKdQir1rBNK071J+W
   w==;
X-CSE-ConnectionGUID: td4UPC0uSk6GXG2p7eqiRQ==
X-CSE-MsgGUID: lYbssPXoQPiOLrP1tirqcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2123151"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2123151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:48:58 -0700
X-CSE-ConnectionGUID: /NkdBB7hTVKoteKXAmZV+g==
X-CSE-MsgGUID: viDSKn0rS4+qJWHrqsN2bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5265516"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2026 01:48:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2DA6199; Fri, 30 Oct 2026 09:48:54 +0100 (CET)
Date: Fri, 30 Oct 2026 09:48:54 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Message-ID: <20261030084854.GQ158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_014858_762045_588A36D4 
X-CRM114-Status: GOOD (  21.26  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:25:37PM +0800, Chunfeng Yun wrote:
> There is a dedicated wakeup irq on nvidia n1/n2 SoCs.

Okay but why it is needed? Can you add this to the commit message?

And why you did not add it already in the first commit that added the
platform driver there anyway?

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/plat.c  | 16 ++++++++++++++++
>  include/linux/thunderbolt.h |  1 +
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
> index 85a00cd391d4..8d83b484d942 100644
> --- a/drivers/thunderbolt/plat.c
> +++ b/drivers/thunderbolt/plat.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/slab.h>
>  
>  #include "nhi.h"
> @@ -46,6 +47,15 @@ static int nhi_plat_init_irq(struct tb_nhi *nhi)
>  	if (ret)
>  		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
>  
> +	if (nhi->wake_irq) {
> +		ret = dev_pm_set_dedicated_wake_irq(nhi->dev, nhi->wake_irq);
> +		if (ret) {
> +			dev_err_probe(nhi->dev, ret, "set wake irq %d failed\n", nhi->wake_irq);
> +			return ret;
> +		}
> +		dev_info(nhi->dev, "wake irq %d\n", nhi->wake_irq);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -53,6 +63,7 @@ static void nhi_plat_exit(struct tb_nhi *nhi)
>  {
>  	devm_free_irq(nhi->dev, nhi->irq, nhi);
>  	flush_work(&nhi->interrupt_work);
> +	dev_pm_clear_wake_irq(nhi->dev);
>  
>  	pm_runtime_put_noidle(nhi->dev);
>  	pm_runtime_disable(nhi->dev);
> @@ -85,6 +96,11 @@ static int nhi_plat_probe(struct platform_device *pdev)
>  	if (nhi->irq < 0)
>  		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
>  
> +	/* ignore error */
> +	nhi->wake_irq = platform_get_irq_optional(pdev, 1);
> +	if (nhi->wake_irq < 0)
> +		nhi->wake_irq = 0;
> +
>  	return nhi_probe(nhi);
>  }
>  
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 212c8fea6571..06b90d452ee2 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -533,6 +533,7 @@ struct tb_nhi {
>  	bool going_away;
>  	bool iommu_dma_protection;
>  	int irq;
> +	int wake_irq;
>  	struct work_struct interrupt_work;
>  	u32 hop_count;
>  	unsigned long quirks;
> -- 
> 2.43.0

