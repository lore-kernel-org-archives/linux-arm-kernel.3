Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEF1CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TWAttW+jzTYSOQF5ruJVHSwvGCQ9V/PrVQgOjz6jAA=; b=TjX9R38TJCndKvbI10GiQJTQXk
	RM7U3nIfucZ7sblUktafKY1QGk624WR7ARUJweLaH6OhyJURiyO9UyBeoaBbUg0kzO6SHd44THSfq
	lJ2x8y6BcZRJL4tfbIJaBDKpxCNspohiqrKkZDeGsehUaC26T6WZQrT3PsuUWvyAF2lvQy8rUE6pn
	tfP5chlHAcuam34itUGtMyrRTZvrJY/7pkTbuKKwNRSUhK4ZOujSrJw9ZSj20X00dBDvJVaZ+cKOz
	btA+ThIoHVTF5pKLWIh2O9PLLmV95633tuspjKpb6KVEnN5kFXxsIijifbrC6pzpd2w59xrEV0owi
	bu7ku2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcMX-00000006P8X-3v0W;
	Mon, 19 Oct 2026 01:40:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcMW-00000006P8F-0o71
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 01:40:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5B4E40DC7;
	Mon, 19 Oct 2026 01:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933E41F000C4;
	Mon, 19 Oct 2026 01:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792374027;
	bh=0TWAttW+jzTYSOQF5ruJVHSwvGCQ9V/PrVQgOjz6jAA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ScmAcf6hDusWU128UigGUFFVGfqtCcrGpaK5wgPjoYptHoc6y/GfAOEM+nmO7Qc1o
	 jU+ttxVdhgy0VCWiiJgArTayHzQTH4YpjE4ilrwGZ45e2ohoigP9sXNdDLU27XitoB
	 /n4qHXXgy08pUSY0L0HIwf8kYf0YAk86J1EtuvVnis4kX4DrYMjKD8oQnsmn3rDold
	 6eM8oKz6pfNa+6883aOwEb0ha/OJoWjvmn6F7XDvVkcjb+AfAGOZ4OF2eE7gV9ShwU
	 DKvccDH25Zio88Tq1TGd/K9GfzWhhEyoAy0/Dq+Ergz79QEFAE8BPAo/TEmhzl3lzs
	 W2WfJBIrxOyMw==
Date: Mon, 19 Oct 2026 02:40:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
Message-ID: <20261019024022.19b7bd4b@jic23-hlaptop>
In-Reply-To: <ar9elr1_tuFhJi1r@ashevche-desk.local>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
	<20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
	<ar9elr1_tuFhJi1r@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 2 Oct 2026 10:34:46 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Oct 01, 2026 at 04:09:13AM +0100, Alexey Klimov wrote:
> > The Exynos850 ADC controller located inside the CMGP block differs from
> > other Exynos ADC controllers, mainly in its register layout.
> > Specifically, the data register sits at offset 0x08.
> > 
> > Abstract the read_value() operation in driver data exynos_adc_data to
> > support SoC-dependent data register read callbacks.
> > Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
> > It also requires its own hardware initialization and exit routines.
> > Add them as well.  
> 
> Split this to at least two patches:
> - add .read_value() callback and switch existing users
> - add new user
> 
Agreed. Other than that looks fine to me.

Thanks,

Jonathan



