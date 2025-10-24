Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B24CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAmnAjO1nr88md/m88lIz4kguoI+md30Yr9oFyb7DN0=; b=BNMDAts1r4/z11zb4Q0P5UQM96
	PSYaA5DMhheQgnbygx5wK37tN9NBH033OX6+PQrebrd2cSCHTJ9fm+xHo18vVO5mczX2U1252+xpf
	kkYhpxYmWJdTcAHhsVsReysMK4hQdwItI8O7dX6AMueAK8YI33l1IoJ6ZIaKKvadiU56pdr10i4rs
	4glOY9/UYvVmtXBbAi+i7l8uOP8Z9WWl6J6sdZb7ffpkfbcVlzyYe8dM4t8dgTOnNFZdAp1atUhsk
	i/OgWfX/gQ8LX4wLgg4zcn9veGU0RheEiy47iBN+xiJRgCMgjGG9qRlGBTY1PNBkClOWbK82KiGSB
	twQWApQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAjs-00000008IvO-0Dnq;
	Fri, 24 Oct 2025 05:53:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAjo-00000008Ish-24A9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 05:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761285196;
	bh=CX/6xNCkWzoa/34JQHAzp6QuK8mm/NivX3nU1pFQYJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RNO34UjuD8cmIPiDKUA2FqjCJfJeIR+S9mPQsOFXWdl4aWhGvn795QH8kzbKJkJoU
	 B//1D8lqvlSAKaqB/svEhNPUyB74YjpgfXRNgfpt510BthEz3xe0YprHX6CiyK7y7j
	 EkzsbWkFjujZ8VNcIsYdbjH0eYhQHS99N+njLtvszDK+BHOMDn0Z9WnEYvXpA7lE2D
	 8xKY7HpeXZOHYLWFZNgnQ8wBUSlaCMMeE0vUfvLChg+b3Ld0v7PUtD58KrLux+IHGd
	 W/CUtNvn+gO4xn2gtfzj9wRSO1ZHPf/5AnUPt9hOCpTqq5AcdLpwcRFSmHE/rbpWxp
	 4NiHgUd9Xij/g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C461C17E0CA1;
	Fri, 24 Oct 2025 07:53:15 +0200 (CEST)
Message-ID: <1d69e292-f0c6-48de-a70c-ff2223e40fa6@collabora.com>
Date: Fri, 24 Oct 2025 07:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: Fix build-errors
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>
References: <20251023114436.185320-1-ulf.hansson@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251023114436.185320-1-ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_225320_705756_77DF436C 
X-CRM114-Status: GOOD (  11.70  )
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

Il 23/10/25 13:44, Ulf Hansson ha scritto:
> Let's add the missing header to fix the reported build-errors.
> 

Ouch. Sorry about that.


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Fixes: df4e9ec1ed86 ("pmdomain: mediatek: Add support for secure HWCCF infra power on")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510231317.ZZxNaFG0-lkp@intel.com/
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index ac144ab8fce0..164c6b519af3 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2020 Collabora Ltd.
>    */
> +#include <linux/arm-smccc.h>
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/init.h>



