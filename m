Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EB3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTwIAS54HyK0U3sCMGhI/13/MCHUEcwCjHUWTamFYWU=; b=rJewCT2XNzx5jxesPts1Jyt6H2
	zjp205Vm0uXBSMmc1NffA2CZpO7TPSwiPuE3q78W3bY6IVza4J9DFkPqvo0KXuK0dThQVEFQX5R8A
	rejv5qcIXzajqSu24YzAxsXerTwu8zlPsDOhiPht3mHOXnI6K4BS6/iZKZKixY6O4Jg6i2NKD28TW
	foF8ykinzlW3igJvCvWAVT5HncPZdMn/V+sl7CBYKIVNOls1Y1KOQ3tvgZf7Rlxc20H2/7XU4m26X
	Y19ep9BS5yDRPX+4taKQmfG8i/2yv4ZgptwGcwhzSS4IDti/YWhTHKUyLT+byy/9LRcNf706ro+m9
	jTUhJYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirOD-0000000EBNW-41iA;
	Fri, 14 Feb 2025 08:49:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirMm-0000000EB2L-2LUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EE275C4ACD;
	Fri, 14 Feb 2025 08:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F0FC4CED1;
	Fri, 14 Feb 2025 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739522887;
	bh=G2g+YE94HijZmiKvrLiQZ/MFM5yojKDRXo2gEydfZGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1VNyCwiviaCgE+fu8UovoX6ra2HOhZt4n+5DCe67vOG344OeSHfO2fRIxS61iKuj
	 vBk4kYQanZHi6f6uwhQd20ZiDhe1H4wAkbGOy8Mun+GMdLY4kqa4YkfSc6T6/rgLF0
	 GDuQFffLnIL+TWaGVhJpuZMAIZHOoXrE5Ut3oicG5NqirjzJgChXvFtvkrApfWKhAp
	 01deLpc1rkV+d5rYxxhBFub5jV4R9L30pG1iYxc+P+CLmAHXRoWRFezwBX/GRrDpuh
	 +6UMIrXecJDSI9DIGkYpu/0tXtICXld/GYkFSPO4c4H4/2kmd0eAQe6IVDYR+rUpID
	 zs3CVoi7NLrww==
Date: Fri, 14 Feb 2025 09:48:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, salee@marvell.com, gakula@marvell.com
Subject: Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add syscon device
 compatible
Message-ID: <20250214-arcane-raspberry-hornet-f22d93@krzk-bin>
References: <20250214065833.530276-1-dingwei@marvell.com>
 <20250214065833.530276-3-dingwei@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214065833.530276-3-dingwei@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_004808_653243_AE276752 
X-CRM114-Status: GOOD (  12.13  )
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

On Thu, Feb 13, 2025 at 10:58:30PM -0800, Wilson Ding wrote:
>  #define SOCFPGA_NR_BANKS	8
> @@ -171,26 +221,51 @@ static int reset_simple_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> -	membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -	if (IS_ERR(membase))
> -		return PTR_ERR(membase);
> +	if (devdata && devdata->syscon_dev) {
> +		data->regmap = syscon_node_to_regmap(pdev->dev.parent->of_node);
> +		if (IS_ERR(data->regmap))
> +			return PTR_ERR(data->regmap);
>  
> -	spin_lock_init(&data->lock);
> -	data->membase = membase;
> -	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = resource_size(res) * BITS_PER_BYTE;
> -	data->rcdev.ops = &reset_simple_ops;
> -	data->rcdev.of_node = dev->of_node;
> +		if (device_property_read_u32(&pdev->dev, "offset",

Where is this binding documented? This is patch #1, so something anywy
is wrong here (see submitting patches for bindings).

> +					     &data->reg_offset))
> +			data->reg_offset = devdata->reg_offset;
>  
> -	if (devdata) {
> -		reg_offset = devdata->reg_offset;
> -		if (devdata->nr_resets)
> -			data->rcdev.nr_resets = devdata->nr_resets;
> +		if (devdata->nr_resets == 0) {
> +			dev_err(dev, "no reset line\n");
> +			return -EINVAL;
> +		}

Best regards,
Krzysztof


