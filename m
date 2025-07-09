Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202F0C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOjCg4XbxOkhT8S8sZPEP73rpNtOVJZ5nJWx075Q+eE=; b=a9lpCvfLpI1xmXCrUXONP2x9Er
	pi9JZtIEXHvOP9JzFVcyU7yvAeDLTzWSviyD89NJdpGpL9NOGYSF/fH0pKsXBdBwsO/aIYYV55fcC
	odhtCatnvBX7IHmHzd1gVL5RACzPItfEfk1seRBL5GS5K6umNlJ1vNwn0QJ15Qn4090MVUvymoqWQ
	XfBzQEU2UD7WK4Q8wal1Tgv0hQUUK1znuYUJpVZsjBcnusOKsw6ZZti1GAWQzG/mL/8O/0dGqBCHt
	ATYepQQv8O0FLHxzVuQxH7WrjNwqBc2CWLMB8vg5gBF9bsWdZQDqppmCJ4jLB8ueki+DyNqFvrpR4
	SWmz3xVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa63-00000009dRR-1rlv;
	Wed, 09 Jul 2025 19:04:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWXv-000000098QU-3Nae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xOjCg4XbxOkhT8S8sZPEP73rpNtOVJZ5nJWx075Q+eE=; b=y8wzZTnpsTg0FnFL3ruJPMnfCs
	4SAUf9W1zsjwJ9bwsBAqpEkCDCK441+3WUMr+3M5HjRS4r68s07b7M1DCm5fZoyBxTp4uZ+ORdJlx
	IrKAcri0wEJcSe6UuHU3ZWu9cftE4qz4TnB/+agXCAzn35OfwCx3AL9UFzvN2o1BmIBQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZWXu-000xJZ-3C; Wed, 09 Jul 2025 17:17:18 +0200
Date: Wed, 9 Jul 2025 17:17:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Message-ID: <898af9ea-9b90-4d1f-8e0d-a8e0686d72a7@lunn.ch>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-6-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709112658.1987608-6-ioana.ciornei@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_081719_844988_437732F1 
X-CRM114-Status: GOOD (  12.26  )
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

> A GPIO controller has a maximum of 8 lines (all found in the same
> register). Even within the same controller, the GPIO lines' direction is
> fixed, either output or input, without the possibility to change it.

Since this is an FPGA, not silicon, is the selection of output or
input a syntheses option?

> +static const struct of_device_id qixis_cpld_gpio_of_match[] = {
> +	{
> +		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp2",
> +		.data = &lx2160ardb_sfp2_cfg,
> +	},
> +	{
> +		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp3",
> +		.data = &lx2160ardb_sfp3_cfg,
> +	},
> +	{
> +		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
> +		.data = &ls1046aqds_stat_pres2_cfg,
> +	},

Does the FPGA have an ID register you can read to confirm it is what
you think it is?

Or is the bitstream downloaded at boot by another driver? Can you ask
that driver what bitstream it downloaded?

Given how similar these devices are, it seems like a typ0 could give a
mostly working device which passes testing, so doing some validation
of the compatible against the actual FPGA would be nice.

	Andrew

