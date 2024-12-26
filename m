Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29A3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 23:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t99ZNISmLQ45fCC1j76G0a2Q/ZwLXftc8Rz5i9suVS4=; b=ZZMKsifdayGKJSXTG+scVcrjP1
	oHqPa9itAqXsR5DTa/+C5O1uch2xas9ZiWJb9v32jFbpxlcc+4yzt+mjopGo69Fn1x1wJxcoutzEG
	OxnrLlGE+q5nrUK6IltYv7w9Ls5x+D1dQ2DOznAYwSV0vzm7ZdOGhBkDaUQKTuDC5nJ+dDiiKWokc
	FPlLcFQyTT/x6/U1G8gIwv/g9ozvxitCqAVuTaiIjhsQiyqolzE+4OsH+RuhOC4Mi42GedNKood2m
	HNXgk5IQDELfRT4xUSnn1jp8onIaZzWVh6GmdB7nAvu0ALIMe5ddfi9DxK7Kc/RQxK2PQXZFlx+gk
	D0rUikpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQxV4-0000000Gexq-1elv;
	Thu, 26 Dec 2024 23:42:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQxTs-0000000GepL-2J2b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 23:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96A405C6048;
	Thu, 26 Dec 2024 23:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822B7C4CED1;
	Thu, 26 Dec 2024 23:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735256486;
	bh=Bwm4QLEVfk/HoEAKgZa0GS2tzYvtGxLw1NdG693YD0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwW+6ZCvCaLMp0hmR9IXMFlv+VVQuv8lMBwW4taUgxYXohkl3UX5MPkIykroKIMr4
	 H9BeXyZES6n6q4Y8I6Be/UCPLxQvQXyxnCr4X13lYhKyR3ET80LJIkjZz+LVy+63Kw
	 B4TdJcpW+C4vNzJAxAZ0NT4SRfhlf5o0+ShyqmmJHxyqjJxqV590gE/NHrbRV+TKdz
	 Zg8EzD6E6xhZOirvLkODnXiI5YWGoxxpZyEXjqyHOJgXyRF0zc14bEjNh863ybzl8c
	 3tKaQ7Sv3ZcjGttJ3z3FZgYvEmcTERYRWWanzDYBz9KxzxgoTLkA2+RXVnm1ijUS5s
	 W5PMovmCA75gQ==
Date: Fri, 27 Dec 2024 00:41:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
Message-ID: <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
References: <20241211102337.37956-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211102337.37956-1-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_154128_640585_1EA916A5 
X-CRM114-Status: GOOD (  11.32  )
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

Hi Bartosz,

...

>  struct davinci_i2c_dev {
>  	struct device           *dev;
>  	void __iomem		*base;
> @@ -132,13 +133,10 @@ struct davinci_i2c_dev {
>  #ifdef CONFIG_CPU_FREQ
>  	struct notifier_block	freq_transition;
>  #endif
> -	struct davinci_i2c_platform_data *pdata;
> -};
> -
> -/* default platform data to use if not supplied in the platform_device */
> -static struct davinci_i2c_platform_data davinci_i2c_platform_data_default = {
> -	.bus_freq	= 100,
> -	.bus_delay	= 0,

what happened to bus_delay?

...

> +	/* standard bus frequency (kHz) */
> +	unsigned int		bus_freq;
> +	/* Chip has a ICPFUNC register */
> +	bool			has_pfunc;
>  };

> -static struct i2c_bus_recovery_info davinci_i2c_gpio_recovery_info = {
> -	.recover_bus = i2c_generic_scl_recovery,
> -	.prepare_recovery = davinci_i2c_prepare_recovery,
> -	.unprepare_recovery = davinci_i2c_unprepare_recovery,
> -};
> -

what happened to the gpio_recovery_info?

Andi

