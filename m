Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32220E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaCUqwH4fAaTwmg1MIBn0GvMF/tWRg5PsAqu+nqAElk=; b=3OZkeZRyOV2EtYrBbj2jNEFNG5
	RuzPpv2TqOFMlru4Ckje10aSskcy1YH+1aHuTNncBLXgNmD/LWZBjGeMD49RkcqTYIM/OhEZgCn8s
	C8WTYphDQW/SO0a7qKC0NHwx4ZdBFVBZKv59dGugqNSi3zcjqdQhQvRXe5YFccxBpBJTbN+ml6gjE
	SnmfvtTg3khaLJoh21P63lZDP1YNsWgXzrTS9pCob+06/OBs9EyVsl1bo8QaKxIB6fAnX9Zz/2yJe
	LfE/rs/Epf6kYXDmgDfOL6TGVyj7ksCcxAjH/5hZJZKDY78PmlQ/YQnD6RG7e4na6R9RTCWgEN7kP
	dHtbrrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIMH-0000000EGbe-40XT;
	Wed, 11 Dec 2024 08:46:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIKW-0000000EGK9-1QNp;
	Wed, 11 Dec 2024 08:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3AF6A5C4924;
	Wed, 11 Dec 2024 08:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F15C4CEE0;
	Wed, 11 Dec 2024 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733906663;
	bh=GLkOt75fCIRCWsQeYD1HBKrYQgxn/OmeXMZSEtLUtNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EX7ODOA6EHdMYUAO3zSqgP2+U0X6TOA1o++8ZjZZ+wA0YKm5Nd5gOazjmkxIHt/YH
	 0mkDb5Zy6zwhW3FOaarjyPqlHYtMw9BTCHzIt7S/r8BznKpFObzvLuX8WdpVk6rulm
	 ZBZP9KRNPkrG6CeJ4dG6DNr7KKZtli1VXkx1+2Czy5LL1DfrGrEgZYs+7brCwfItky
	 QVpkJKStgHZ7rCCkeV1CrI2OHWIBVLSxXSFUEMWeyt92UneJAWY+UMsJsWGUnKz1i1
	 8FuuU8C8+yb5he1IUY+CfwkCjlgEWNAA4SqQQPxE8RlgkrZcdcYY+S7JtdS8Eix59U
	 3ONoJAGGJHUfg==
Message-ID: <7b79d4b5-ba91-41a0-90d1-c64bcab53cec@kernel.org>
Date: Wed, 11 Dec 2024 09:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 04/25] virt: geniezone: Add GenieZone hypervisor
 driver
To: Liju-clr Chen <liju-clr.chen@mediatek.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yingshiuan Pan <Yingshiuan.Pan@mediatek.com>,
 Ze-yu Wang <Ze-yu.Wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <PeiLun.Suei@mediatek.com>,
 Chi-shen Yeh <Chi-shen.Yeh@mediatek.com>,
 Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
References: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
 <20241114100802.4116-5-liju-clr.chen@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241114100802.4116-5-liju-clr.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_004424_469969_FB20FB14 
X-CRM114-Status: GOOD (  15.53  )
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

On 14/11/2024 11:07, Liju-clr Chen wrote:
> +
> +static int gzvm_dev_open(struct inode *inode, struct file *file)
> +{
> +	/*
> +	 * Reference count to prevent this module is unload without destroying
> +	 * VM

So you re-implemented suppress-bind attrs... no, drop.

> +	 */
> +	try_module_get(THIS_MODULE);
> +	return 0;
> +}
> +
> +static int gzvm_dev_release(struct inode *inode, struct file *file)
> +{
> +	module_put(THIS_MODULE);
> +	return 0;
> +}
> +
> +static const struct file_operations gzvm_chardev_ops = {
> +	.llseek		= noop_llseek,
> +	.open		= gzvm_dev_open,
> +	.release	= gzvm_dev_release,
> +};
> +
> +static struct miscdevice gzvm_dev = {
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name = KBUILD_MODNAME,
> +	.fops = &gzvm_chardev_ops,
> +};
> +
> +static int gzvm_drv_probe(struct platform_device *pdev)
> +{
> +	if (gzvm_arch_probe(gzvm_drv.drv_version, &gzvm_drv.hyp_version) != 0) {
> +		dev_err(&pdev->dev, "Not found available conduit\n");

So you can autodetect your hypervisor? Why your soc info drivers cannot
instantiate this device thus removing any need for fake DT node (fake
because no resources and used only to satisfy Linux driver instantiation)?


> +		return -ENODEV;
> +	}
> +
> +	pr_debug("Found GenieZone hypervisor version %u.%u.%llu\n",
> +		 gzvm_drv.hyp_version.major, gzvm_drv.hyp_version.minor,
> +		 gzvm_drv.hyp_version.sub);
> +
> +	return misc_register(&gzvm_dev);
> +}
> +
> +static void gzvm_drv_remove(struct platform_device *pdev)
> +{
> +	misc_deregister(&gzvm_dev);
> +}
> +
> +static const struct of_device_id gzvm_of_match[] = {
> +	{ .compatible = "mediatek,geniezone" },
> +	{/* sentinel */},
> +};
> +
> +static struct platform_driver gzvm_driver = {
> +	.probe = gzvm_drv_probe,
> +	.remove = gzvm_drv_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = gzvm_of_match,
> +	},
> +};
> +
> +module_platform_driver(gzvm_driver);
> +
> +MODULE_DEVICE_TABLE(of, gzvm_of_match);

This is immediately after next to ID table. Never in different place, so
I wonder from which obscure code did you copy it and what other issues
like that we can find...

> +MODULE_AUTHOR("MediaTek");
> +MODULE_DESCRIPTION("GenieZone interface for VMM");
> +MODULE_LICENSE("GPL");
Best regards,
Krzysztof

