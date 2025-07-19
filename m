Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D94CC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK4c0rUlx95T0U6eI6I8iJ44bP+y6GY/L1GyhEsd4uI=; b=qOB4iP+8Dt13LNviVlJkwGxNso
	AH8i6YmZfow4cnQRcRdiY3HBoLVd4FmefV58P9Ehcw2jyn9cUV/UZqoIQNY9+6sJGJNYNkUO8RGTR
	feLzL2UtYKS+qnhLyoeI7OGXBXQpXFwET/HUEejIyrtye31pUD5GNAfnSFUlIzI7st5BN7vn9ZUTq
	NyR0Rrbw33mpbq0b9zuHkOCmqpes8WpyzS904yPlZgDRvymnNKyW8YQmOpy0oeFGS3emzeFH51sHy
	hDIpcjIi/Vxw0RGBaMd6MNnzYIqFLuE7RRq2FkJR847OPS98dlZ8Z8VmgrCtTiRBlXRQLW8GdU1+F
	n5nhCpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7TI-0000000EITs-0Ehr;
	Sat, 19 Jul 2025 13:19:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7AK-0000000EH4j-0BYT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 12:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A514A530F2;
	Sat, 19 Jul 2025 12:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA0CC4CEE3;
	Sat, 19 Jul 2025 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752929986;
	bh=Jc9LnpqRoxmgeWH+iMEHKogtW1KyENPU7ieXc3P23Vo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gg0Tr47KgwUD6zd6eCkB12oPjZP7JAyA/YCnQWRSB3Pup6L+a4hyBtXxW6k/rodae
	 FXnDZejl08/gqQcwXhOg2xYXMpXaN85FXNFeInsFbKz7VQ88TUUZwfJvUZwkRuz9CD
	 V7Zv7F27l8RF1RRbLTNG3JiGuqFOjm5LKQ/gEtXcVTZ6tq2YCAT1R479CQp8hAChTT
	 D3yjNua5jR4ZFxUD9xDz208zX9oeoVmi9nEgADyKkrAHtI4S9KcTsNycfJN9xv/bXE
	 qybGuDllg+AiZ0OuNAmWQoRoHUk1I6p4YoNvS5ehBOQGQHhE5YLTqq/jnXg0dhKW3N
	 /pRhxG0FGKTmw==
Message-ID: <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
Date: Sat, 19 Jul 2025 14:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] gpio: Add new gpio-macsmc driver for Apple Macs
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Hector Martin <marcan@marcan.st>, Neal Gompa <neal@gompa.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-pm@vger.kernel.org, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Conor Dooley <conor+dt@kernel.org>,
 Janne Grunau <j@jannau.net>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055948_156557_DD295568 
X-CRM114-Status: GOOD (  15.56  )
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

Hi Linus, Bartosz,

top posting on purpose: are you fine if Lee takes this commit with the 
rest through his mfd tree?


Thanks,


Sven



On 10.06.25 17:29, Sven Peter wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
> 
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
> 
> To our knowledge, only Apple Silicon Macs implement this SMC feature.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>   MAINTAINERS                |   1 +
>   drivers/gpio/Kconfig       |  10 ++
>   drivers/gpio/Makefile      |   1 +
>   drivers/gpio/gpio-macsmc.c | 292 +++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 304 insertions(+)

[...]

