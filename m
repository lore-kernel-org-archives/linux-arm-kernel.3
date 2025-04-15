Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10577C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQavcG7jf9unO3jY1vNKFhAejAs7AO9RIuV2rRFgnIY=; b=vUwNAS10UMjH1M7c1kIGfF1oXU
	gaC6BgJ+yObQlxC2YtVxzlDBeQG5IwljOlUWomEsPUgDHERfLI7oJFBFawnzxZwuH1eT1rIYcSzpa
	cXudJUqZZ0FgUj+yQkW+T6gNYK575Q6TlScwYYKURZ6yudFMOuKJcdESHX2rmaO09YdDB4GZ5OYsJ
	KdoOtIW1Qj7yiZ+3pBCqggMhdb7Ff4aqBKtCEv/n6ql68EV/IUWL8erqGQ3eHKFPZA7mg2kv5eiEV
	NM89IrlXX35pT5A7k8o2Ge7ufYqGXWgyYz8devcQmLkd7EfA0XkOk4fesO+YwZr54fZG8MHNy3il8
	ZCj0y6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4d3X-00000005Efy-1LU4;
	Tue, 15 Apr 2025 09:58:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bo8-000000052Az-0qqC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:38:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17008339;
	Tue, 15 Apr 2025 01:38:14 -0700 (PDT)
Received: from [10.57.68.100] (unknown [10.57.68.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB1983F694;
	Tue, 15 Apr 2025 01:38:12 -0700 (PDT)
Message-ID: <9d73c1e0-d60d-4c3e-91ff-e38cc2cd1b98@arm.com>
Date: Tue, 15 Apr 2025 09:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drivers/thermal/exymos: Remove redundant IS_ERR()
 checks for clk_sec clock
To: Anand Moon <linux.amoon@gmail.com>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-3-linux.amoon@gmail.com>
Content-Language: en-US
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20250410063754.5483-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_013816_299297_2F694BFB 
X-CRM114-Status: GOOD (  16.31  )
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



On 4/10/25 07:37, Anand Moon wrote:
> Remove unnecessary IS_ERR() checks for the clk_sec clock,
> the clk_enable() and clk_disable() functions can handle NULL clock
> pointers, so the additional checks are redundant and have been removed
> to simplify the code.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v5: None
> v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
> v3: improve the commit message.
> ---
>   drivers/thermal/samsung/exynos_tmu.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 3657920de000..ac3b9d2c900c 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>   
>   	mutex_lock(&data->lock);
>   	clk_enable(data->clk);
> -	if (!IS_ERR(data->clk_sec))
> -		clk_enable(data->clk_sec);
> +	clk_enable(data->clk_sec);
>   
>   	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
>   	if (!status) {
> @@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>   		data->tmu_clear_irqs(data);
>   	}
>   
> -	if (!IS_ERR(data->clk_sec))
> -		clk_disable(data->clk_sec);
> +	clk_disable(data->clk_sec);
>   	clk_disable(data->clk);
>   	mutex_unlock(&data->lock);
>   


Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

