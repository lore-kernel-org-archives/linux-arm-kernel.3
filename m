Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DFBC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvtL/WoxiC22/4Dyl7YaYrw7Fi/AAFrCAe51OSE9ITg=; b=igCLjtzn2fU3JGP+lm8VA/Ko7K
	M6EEpnPacVVeWqfnXUltHn89l7qiAmpz/Xxfl1I0MdHQMpXFOQ4SFGwsQ36gWwGvW/gaO5S/XorPu
	HMVJz4RCfDicP/PxBAeCRHj6rEGADqs4ws5ay5mhTSSBnYP/tAAW5yWjC9RSrBjDofsMudHtdvEeN
	GzXJ2+ZvesUlZsAQZplBKzccg2jKd7bZuzjm5OYEwum5xFLZvwdHIzgISrQe88VNSt6cgBrnJ7gUR
	h6hHiFJ49pfxBmBLr3N/0ZuhjYR6jnbQkqKFfwsjqmb72CsVuupOaLyC4QpRtNQ8vtHlxE4ztsWvG
	LFYXr8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1o7-00000000POt-1Y7R;
	Thu, 22 May 2025 09:01:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1li-00000000OXs-1Jju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 08:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 210CFA4E7D1;
	Thu, 22 May 2025 08:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43286C4CEE4;
	Thu, 22 May 2025 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747904352;
	bh=F+UaMKsaTaM23XM2k8ATYaf6ORfK+hGHKXw+SidOvP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7/ESCQoDO8xpAYpb+TppNiGZuXD5kGBMkqEXzyjHKG58NZQ51X20EicgGsjmDVWf
	 k4w9RLdbhirJCnP+M0h925cuPMimyMsxAWwOoiOJgNoctuAh0Dhxbt9qERxyNJionC
	 PRiYKhMolbpRhCrnlNpWWy8fRRc8nRJT5ABEjOmKP+buMPt4qLkzijSFAiBXOCqiDP
	 E9QzVu+v82JG7fylZCh6T5qq6Rqf8BPjIBhXB+2qGmJHyUiE6QHSjQDMkCAyyivlbq
	 c9PraU0EWUzPy9MM4Dsr1b4BaQVdzc+qv8QHGxeFFfHW+pXEzxI803IAPDeGvO4LhV
	 wFgOe8d2pMqGg==
Date: Thu, 22 May 2025 09:59:06 +0100
From: Lee Jones <lee@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 05/10] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <20250522085906.GA1199143@google.com>
References: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
 <20250515-smc-6-15-v6-5-c47b1ef4b0ae@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515-smc-6-15-v6-5-c47b1ef4b0ae@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_015914_421467_1929EC6E 
X-CRM114-Status: GOOD (  17.92  )
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

On Thu, 15 May 2025, Sven Peter via B4 Relay wrote:

> From: Sven Peter <sven@svenpeter.dev>
> 
> The System Management Controller (SMC) on Apple Silicon machines is a
> piece of hardware that exposes various functionalities such as
> temperature sensors, voltage/power meters, shutdown/reboot handling,
> GPIOs and more.
> 
> Communication happens via a shared mailbox using the RTKit protocol
> which is also used for other co-processors. The SMC protocol then allows
> reading and writing many different keys which implement the various
> features. The MFD core device handles this protocol and exposes it
> to the sub-devices.
> 
> Some of the sub-devices are potentially also useful on pre-M1 Apple
> machines and support for SMCs on these machines can be added at a later
> time.
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  MAINTAINERS                |   2 +
>  drivers/mfd/Kconfig        |  18 ++
>  drivers/mfd/Makefile       |   1 +
>  drivers/mfd/macsmc.c       | 498 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/macsmc.h | 279 +++++++++++++++++++++++++
>  5 files changed, 798 insertions(+)

Arghhh, so close!

[...]

> +static struct platform_driver apple_smc_driver = {
> +	.driver = {
> +		.name = "mfd-macsmc",

Drop the 'mfd-' part please.

> +		.of_match_table = apple_smc_of_match,
> +	},
> +	.probe = apple_smc_probe,
> +};
> +module_platform_driver(apple_smc_driver);
> +
> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> +MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_DESCRIPTION("Apple SMC driver");

I plan to apply this set after the merge-window.

What else are you waiting on?

-- 
Lee Jones [李琼斯]

