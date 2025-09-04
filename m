Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36A8CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+akDx7KPRyZqzor3ZGyKyE0ylTHhg8R5D2yByYE2LEo=; b=z9/Bv1p+KexR3mQkxD5DyEWVAE
	sqFlcfoRmMHC8L0xWZOnUN3rs737Ra3xaXPlRRWkWeH2Hvfpz/HlnfdWy1BPUbC0BBOfm00qmxaO/
	B055WBnQoEouZUH+qVioqwpwCrbeC2jpNbFeltL+DmgZdMywk32+CuIufPe96yReAHeyY6qroRBni
	igXvrY/x4s192XZmzDiUoE35WfKHl7+MXARO3kCMBgitWuOZKUo0zSrPcNqkebym5H/YGDACRSZMd
	GGRSEMdXAlVsFFp+PbHwqDF8PwMCzSpB8uqXQiPAeO6FhU/D2bc+teTgoy1kSdSqpxRz+e6um+G0/
	+5cMRcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7Ck-0000000AtXS-1ILF;
	Thu, 04 Sep 2025 10:28:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu65E-0000000AV5z-0KS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 09:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C109D43730;
	Thu,  4 Sep 2025 09:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF10C4CEF0;
	Thu,  4 Sep 2025 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756977403;
	bh=qJ5SxDn7aebXMIST+p4VUse9TikgWbIjkKE/CdROn9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMSROS6xqn6Hw+QYxGhXMGnvVW7hSeJNC6zcpN7wX9fJfr0sAJcKcygAN1nTLck5X
	 VKzPkCrqHWnYPYGSRq0LjM4BKknCue/yDkRwBeub5fPYREduBEJ0YMgL2kpsDiDMtp
	 vwjQppVfO/iQgeHe+0EoympPMvjfpDsh/b4Owi5SYxLfcvNv4JC5iRFdA73RwoQNTg
	 hUd2m5oyX2BWvBhsgKf6HgTL2b9Ko5DYocnHVTur/M+2Zd3n3mS1EN+BY7lMzfDrQC
	 t/rscC2WYQqaeO8/N0+4t5xkLqy4K6hbqbV9S+LRBb/6OzGDI2JAYz85uxEKQuXzXI
	 i6Ff0ILgWl6Gg==
Date: Thu, 4 Sep 2025 11:16:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] dt-bindings: iio: afe: current-sense-amplifier: Add
 io-channel-cells
Message-ID: <20250904-stereotyped-swine-of-romance-f7185e@kuoka>
References: <20250903113700.3079626-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903113700.3079626-1-primoz.fiser@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_021644_138721_A893E2B6 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, Sep 03, 2025 at 01:36:59PM +0200, Primoz Fiser wrote:
> The current-sense-amplifier is an IIO provider thus can be referenced by
> IIO consumers (via "io-channels" property in consumer device node). Such
> provider is required to describe number of cells used in phandle lookup
> with "io-channel-cells" property, otherwise the following kernel error
> is present:
> 
>   OF: /iio-hwmon: could not get #io-channel-cells for /current-sense
> 
> Also fixes the following dtbs_check warning:
> 
>   current-sense: '#io-channel-cells' does not match any of the regexes:
>   'pinctrl-[0-9]+' from schema $id:
>   http://devicetree.org/schemas/iio/afe/current-sense-amplifier.yaml#

Which DTS has this warning? You did not include Makefile target and
quick look told me there is no such...

> 
> Fixes: fbac26b9ad21 ("dt-bindings:iio:afe:current-sense-amplifier: txt to yaml conversion.")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Best regards,
Krzysztof


