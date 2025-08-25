Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D59CCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3UKRVzBRwZahN2/BuzvZw20exQ5+wh08eFNd5uls48=; b=z2WGK6divagyl9mbvgLz4Ls6XK
	Zmz0R3+dJrfKIDJ0TqhxPIj2V88D0EAsLQufFF9pCzAsNFxEf/asfEE6Ft/O+ChkBJW/ku1UQroqm
	miW3JWv0Kj5Xilaxudn3QIOghJXtyQ/NTOsEftUJVUxQvDuQVBN5n1rkNTZ7+nlMMJHsFjbG6ArmV
	RPsdvYb27SxMT3LaXYol/Gp7Vz21L5yXimsxdjEkyBPRS2hbJcGNuVHcJ2LRAhlJ4zj4gdSfBLBfB
	EQkz88Uf+7oqcW5/yog0HItP3/Prl7Q1NQkil1/jrBxeuGZD8D7zEmTI6KjMHzfk+esE+R20B++zp
	ntu/kceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWii-00000007zJv-1xTy;
	Mon, 25 Aug 2025 12:54:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVQ5-00000007lwb-0pM9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 11:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B01DC40B8D;
	Mon, 25 Aug 2025 11:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE62C4CEED;
	Mon, 25 Aug 2025 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756121473;
	bh=OgbR/W4gItCa2yQLXixaqQP3APnO9bdaKfA3LJBQfCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L/bp8JiSSu+DlgC5Jlw27azJqw5qLfIPDzMWuWAVBFPdKWEEDCulvu0L+jZv6fqfs
	 8t/v6LSdy7Eo44fugSbuHh85J3k7JnIBwt4hbQMAAr5kmbgIN+Y1HaadG7wACwCM32
	 Uk01Y6fBU95g41Qx4lOb75wliUbj41wOVpN4415IB84qZot8lJoPgwvH1qqse6qsVv
	 ZSxCqjrUCOwcZFqTFWpBvo4CZqbQhuJBAAkGHz4Fp+7DlHCIqeE+Tj2g9ES2VT5JWw
	 iY8BLMV9Ej4+JIfEV2QrNjEVEdzfAQMicwOeUVuk94uDqkSzX6Bh9HQpcwPQe487Bh
	 iv1JIsfuKy/HQ==
Date: Mon, 25 Aug 2025 12:31:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen
 <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, Crt
 Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 03/10] iio: dac: Drop unnecessary -ENOMEM messages
Message-ID: <20250825123100.43d8c4ff@jic23-huawei>
In-Reply-To: <20250822-enomam_logs-v1-3-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
	<20250822-enomam_logs-v1-3-db87f2974552@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_043125_259430_709FBF65 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, 22 Aug 2025 09:19:51 +0530
Dixit Parmar <dixitparmar19@gmail.com> wrote:

> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  drivers/iio/dac/ad5380.c     | 4 +---
>  drivers/iio/dac/ad5764.c     | 4 +---
>  drivers/iio/dac/ds4424.c     | 4 +---
>  drivers/iio/dac/ti-dac7311.c | 4 +---
>  drivers/iio/dac/vf610_dac.c  | 4 +---
Raced with another series doing a dev_err_probe() conversion and the relevant
lines are gone.

I'll fix up.

Jonathan

