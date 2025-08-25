Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324B2CA0FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7fpQmLGEczuIEc9Ts8TLjt4d9CDgwNS9tmnnXBAOG8=; b=Pm7lxOxUA6a1JTrZmLkyBsKWcT
	l4HwTQVC4+kJglLXgKsMAanRIN6nVMWIOIzJdM02hllgCJtou7ykGuE99z4EOpM6cZ08u5O8Lny9m
	vYQuKuEWd5/id0uK4gbDhPEinIRsNdrTUje6emGNuqqnTJAHOOt6acN69JTdXQ2jWrCaoIF5gPtfy
	RiwoscmsMCnRtW0ex+ihiOPihAIa76Qp2csYqaCiymmB7w5Of5eh5GonBoUYyLCFS6CMdd65CF683
	tmfYfY5NeCZeXQSy1XA0mpgv/gG4nbhKc8ZoPPovETvRSMffacUmXLHjV77HV4QmAV2yN8CjZaLdY
	Vp9NfCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSx9-00000007OtP-3VDJ;
	Mon, 25 Aug 2025 08:53:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqScZ-00000007JZz-0aRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 08:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 639504324A;
	Mon, 25 Aug 2025 08:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833F4C4CEED;
	Mon, 25 Aug 2025 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756110726;
	bh=YtLquqnrZFkL+9TrwMrCafRYQgPgCKY67KeGNrtiSPY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rp2A+/RyJolPR8cWUJlVT1SQ5O2QvNnnBaXZpgc497a4bqRfsfnGKyxRWXVaF2z5h
	 sKfZZFcYCUiY1AQue7/udSAtjsA/YV9MuvSmc2Xod0WF/RKgS8xp/cCXZIZaMvwsTJ
	 iPder646D5Cpcm/lqe30SdiEAH+3vnj2lUa2bfUNCs+B7Qibul7iawHSm3czGpw/7D
	 NnMxGWMXaCUgA0HQ/wgLNUlN/ceKbTio9Ox8LCT0jiH3txBkvCUIzbH8i5Uol8oYhK
	 qr1wlTV4h0/W/maZJdovsHVQSIYrNd3cnXuRq3tKN0qPoP2Zd9uUbkFkU9lTYAcuWb
	 tBQTB0fVzNq0g==
Date: Mon, 25 Aug 2025 09:31:50 +0100
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
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
Message-ID: <20250825093150.3ba23f2a@jic23-huawei>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_013207_220705_D64F7F24 
X-CRM114-Status: GOOD (  14.36  )
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

On Fri, 22 Aug 2025 09:19:48 +0530
Dixit Parmar <dixitparmar19@gmail.com> wrote:

> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> With these patches, all the iio drivers now has uniform handling
> of the -ENOMEM while device_allocation and trigger_allocation
> calls.
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
Series looks fine to me, after the minor tweaks to commit messages
that Andy requested.  However as it touches a lot of drivers
I'd like to leave it on list a little longer.

Thanks,

Jonathan

> ---
> Dixit Parmar (10):
>       iio: accel: Drop unnecessary -ENOMEM messages
>       iio: adc: Drop unnecessary -ENOMEM messages
>       iio: dac: Drop unnecessary -ENOMEM messages
>       iio: health: Drop unnecessary -ENOMEM messages
>       iio: humidity: Drop unnecessary -ENOMEM messages
>       iio: light: Drop unnecessary -ENOMEM messages
>       iio: potentiostat: Drop unnecessary -ENOMEM messages
>       iio: pressure: Drop unnecessary -ENOMEM messages
>       iio: proximity: Drop unnecessary -ENOMEM messages
>       iio: temperature: Drop unnecessary -ENOMEM messages
> 
>  drivers/iio/accel/bma220_spi.c      | 4 +---
>  drivers/iio/accel/dmard06.c         | 4 +---
>  drivers/iio/accel/dmard09.c         | 4 +---
>  drivers/iio/accel/dmard10.c         | 4 +---
>  drivers/iio/accel/mc3230.c          | 4 +---
>  drivers/iio/accel/mma7660.c         | 4 +---
>  drivers/iio/accel/stk8312.c         | 4 +---
>  drivers/iio/accel/stk8ba50.c        | 4 +---
>  drivers/iio/adc/ad7949.c            | 4 +---
>  drivers/iio/adc/bcm_iproc_adc.c     | 4 +---
>  drivers/iio/adc/cpcap-adc.c         | 6 ++----
>  drivers/iio/adc/da9150-gpadc.c      | 5 ++---
>  drivers/iio/adc/dln2-adc.c          | 9 +++------
>  drivers/iio/adc/exynos_adc.c        | 4 +---
>  drivers/iio/adc/imx7d_adc.c         | 4 +---
>  drivers/iio/adc/imx8qxp-adc.c       | 4 +---
>  drivers/iio/adc/mxs-lradc-adc.c     | 4 +---
>  drivers/iio/adc/palmas_gpadc.c      | 4 +---
>  drivers/iio/adc/rn5t618-adc.c       | 4 +---
>  drivers/iio/adc/stm32-dfsdm-adc.c   | 4 +---
>  drivers/iio/adc/stmpe-adc.c         | 4 +---
>  drivers/iio/adc/ti-adc084s021.c     | 4 +---
>  drivers/iio/adc/ti-ads131e08.c      | 8 ++------
>  drivers/iio/adc/ti_am335x_adc.c     | 5 ++---
>  drivers/iio/adc/twl4030-madc.c      | 4 +---
>  drivers/iio/adc/viperboard_adc.c    | 4 +---
>  drivers/iio/dac/ad5380.c            | 4 +---
>  drivers/iio/dac/ad5764.c            | 4 +---
>  drivers/iio/dac/ds4424.c            | 4 +---
>  drivers/iio/dac/ti-dac7311.c        | 4 +---
>  drivers/iio/dac/vf610_dac.c         | 4 +---
>  drivers/iio/health/afe4403.c        | 4 +---
>  drivers/iio/health/afe4404.c        | 4 +---
>  drivers/iio/humidity/am2315.c       | 4 +---
>  drivers/iio/humidity/dht11.c        | 4 +---
>  drivers/iio/light/stk3310.c         | 4 +---
>  drivers/iio/potentiostat/lmp91000.c | 4 +---
>  drivers/iio/pressure/dlhl60d.c      | 4 +---
>  drivers/iio/proximity/ping.c        | 4 +---
>  drivers/iio/proximity/srf04.c       | 4 +---
>  drivers/iio/temperature/mlx90632.c  | 4 +---
>  41 files changed, 47 insertions(+), 130 deletions(-)
> ---
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> change-id: 20250822-enomam_logs-f66642957fb3
> 
> Best regards,


