Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605D0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 14:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBTLdCdSGzt+2sHpsaW7G2H3B7HPbX7C3qZ2SCMCGjA=; b=QWtKrk1aJHwDfjgEIGSKwHXyLD
	AEvwg1I3Vgz2xJ6VQXod3jmaW7yNB7cLT6Ly5bQu2eXKrdYohKH5OCrDmAWhJ0c8+OOFCt8/WcnxX
	wYVdug524L0NHAlg4T+6LKYjCPrpiXMnaGWwx7rcsxMUBqFVV1i1zz6uD94D3Pph9+jnhWpzAuq7P
	KXAbNzZVGTtvPLfixJI7TpMopt27QhagPWR4/PKKtbhdqkDL30YTZPqLqJevBJb022boniAP3yjTe
	G5xq9DFXyxVUUMiKApu/uMcWppiv7SRYFH0avuV1gBr5wUNOoyx8XhM/slMiCa5e9PmiGJ8TKd5zY
	ba4IQycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5QT-00000006DT7-0BS3;
	Tue, 25 Mar 2025 14:38:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5OT-00000006DAI-3Z1U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9EC2A4A73F;
	Tue, 25 Mar 2025 14:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A087EC4CEED;
	Tue, 25 Mar 2025 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742913400;
	bh=OkCNuhli9F0X/SYOAJxHbH4RtGXOzGf5zz0JWbYVExA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PDyzXXR8W2pF74kMe7vbbSG4Nd3bQ8CDSWy88+KMoQpDtkdCW2YCCw28Gyk5ebJw5
	 Bg9OQIKIYVK8H/BPZFMruowiy107cgvru60Ds7AJXZCj3CnRODF1KMqtfUtwS6cdJg
	 vFk/+1Fz7D5PTXs9RlSuBXx0/ATdxA5+KqoWWvNGVHG/smvyYVS0DwyeE7WyVr1BW6
	 R89/rADEBv/9icUANXmxGNXyIQ2/wujfosO8pix/2rcaUvtcUH9o68QozcVGrV3zyE
	 kzRf0I72qiZxtMXuiXnHZslgcBSRrOu710Xa7YmY8Knx2OZdr606gdRKkyKd39OsKo
	 hQTohERKmHDog==
Message-ID: <b4820116-c6c0-4fb1-ac7e-c602cf3b9da8@kernel.org>
Date: Tue, 25 Mar 2025 15:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 davem@davemloft.net, Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20250325115736.1732721-1-lukma@denx.de>
 <20250325115736.1732721-6-lukma@denx.de>
 <32d93a90-3601-4094-8054-2737a57acbc7@kernel.org>
 <20250325142810.0aa07912@wsk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250325142810.0aa07912@wsk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_073642_026679_0DB39C36 
X-CRM114-Status: GOOD (  35.98  )
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

On 25/03/2025 14:28, Lukasz Majewski wrote:
> Hi Krzysztof,
> 
>> On 25/03/2025 12:57, Lukasz Majewski wrote:
>>> This patch series provides support for More Than IP L2 switch
>>> embedded in the imx287 SoC.
>>>
>>> This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
>>> which can be used for offloading the network traffic.
>>>
>>> It can be used interchangeable with current FEC driver - to be more
>>> specific: one can use either of it, depending on the requirements.
>>>
>>> The biggest difference is the usage of DMA - when FEC is used,
>>> separate DMAs are available for each ENET-MAC block.
>>> However, with switch enabled - only the DMA0 is used to
>>> send/receive data.
>>>
>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>> ---
>>>  drivers/net/ethernet/freescale/Kconfig        |    1 +
>>>  drivers/net/ethernet/freescale/Makefile       |    1 +
>>>  drivers/net/ethernet/freescale/mtipsw/Kconfig |   10 +
>>>  .../net/ethernet/freescale/mtipsw/Makefile    |    6 +
>>>  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 2108
>>> +++++++++++++++++ .../net/ethernet/freescale/mtipsw/mtipl2sw.h  |
>>> 784 ++++++ .../ethernet/freescale/mtipsw/mtipl2sw_br.c   |  113 +
>>>  .../ethernet/freescale/mtipsw/mtipl2sw_mgnt.c |  434 ++++
>>>  8 files changed, 3457 insertions(+)
>>>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/Kconfig
>>>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/Makefile
>>>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
>>>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
>>>  create mode 100644
>>> drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c create mode
>>> 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c
>>>
>>> diff --git a/drivers/net/ethernet/freescale/Kconfig
>>> b/drivers/net/ethernet/freescale/Kconfig index
>>> a2d7300925a8..056a11c3a74e 100644 ---
>>> a/drivers/net/ethernet/freescale/Kconfig +++
>>> b/drivers/net/ethernet/freescale/Kconfig @@ -60,6 +60,7 @@ config
>>> FEC_MPC52xx_MDIO 
>>>  source "drivers/net/ethernet/freescale/fs_enet/Kconfig"
>>>  source "drivers/net/ethernet/freescale/fman/Kconfig"
>>> +source "drivers/net/ethernet/freescale/mtipsw/Kconfig"
>>>  
>>>  config FSL_PQ_MDIO
>>>  	tristate "Freescale PQ MDIO"
>>> diff --git a/drivers/net/ethernet/freescale/Makefile
>>> b/drivers/net/ethernet/freescale/Makefile index
>>> de7b31842233..0e6cacb0948a 100644 ---
>>> a/drivers/net/ethernet/freescale/Makefile +++
>>> b/drivers/net/ethernet/freescale/Makefile @@ -25,3 +25,4 @@
>>> obj-$(CONFIG_FSL_DPAA_ETH) += dpaa/ obj-$(CONFIG_FSL_DPAA2_ETH) +=
>>> dpaa2/ 
>>>  obj-y += enetc/
>>> +obj-y += mtipsw/
>>> diff --git a/drivers/net/ethernet/freescale/mtipsw/Kconfig
>>> b/drivers/net/ethernet/freescale/mtipsw/Kconfig new file mode 100644
>>> index 000000000000..5cc9b758bad4
>>> --- /dev/null
>>> +++ b/drivers/net/ethernet/freescale/mtipsw/Kconfig
>>> @@ -0,0 +1,10 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +config FEC_MTIP_L2SW
>>> +	tristate "MoreThanIP L2 switch support to FEC driver"
>>> +	depends on OF
>>> +	depends on NET_SWITCHDEV
>>> +	depends on BRIDGE
>>> +	depends on ARCH_MXS || ARCH_MXC  
>>
>> Missing compile test
> 
> Could you be more specific?
> 
> I'm compiling and testing this driver for the last week... (6.6 LTS +
> net-next).

You miss dependency on compile test.

> 
>>
>>> +	help
>>> +		This enables support for the MoreThan IP L2 switch
>>> on i.MX
>>> +		SoCs (e.g. iMX28, vf610).  
>>
>> Wrong indentation. Look at other Kconfig files.
> 
> The indentation from Kconfig from FEC:
> 
> <tab>help
> <tab><2 spaces>FOO BAR....

That's correct, but you do not use it :/

> 
> also causes the checkpatch on net-next to generated WARNING.
> 
>>
>>> diff --git a/drivers/net/ethernet/freescale/mtipsw/Makefile
>>> b/drivers/net/ethernet/freescale/mtipsw/Makefile new file mode
>>> 100644 index 000000000000..e87e06d6870a
>>> --- /dev/null
>>> +++ b/drivers/net/ethernet/freescale/mtipsw/Makefile
>>> @@ -0,0 +1,6 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +#
>>> +# Makefile for the L2 switch from MTIP embedded in NXP SoCs  
>>
>> Drop, obvious.
> 
> Ok.
> 
>>
>>
>> ...
>>
>>> +
>>> +static int mtip_parse_of(struct switch_enet_private *fep,
>>> +			 struct device_node *np)
>>> +{
>>> +	struct device_node *port, *p;
>>> +	unsigned int port_num;
>>> +	int ret;
>>> +
>>> +	p = of_find_node_by_name(np, "ethernet-ports");
>>> +
>>> +	for_each_available_child_of_node(p, port) {
>>> +		if (of_property_read_u32(port, "reg", &port_num))
>>> +			continue;
>>> +
>>> +		fep->n_ports = port_num;
>>> +		of_get_mac_address(port, &fep->mac[port_num -
>>> 1][0]); +
>>> +		ret = of_property_read_string(port, "label",
>>> +
>>> &fep->ndev_name[port_num - 1]);
>>> +		if (ret < 0) {
>>> +			pr_err("%s: Cannot get ethernet port name
>>> (%d)!\n",
>>> +			       __func__, ret);
>>> +			goto of_get_err;  
>>
>> Just use scoped loop.
> 
> I've used for_each_available_child_of_node(p, port) {} to iterate
> through children.
> 
> Is it wrong?

No, it is not, just can be simpler with scoped variant.

...

>>
>>> +	if (!fep)
>>> +		return -ENOMEM;
>>> +
>>> +	pdev->id_entry = &pdev_id;
>>> +
>>> +	dev_info = (struct fec_devinfo
>>> *)pdev->id_entry->driver_data;
>>> +	if (dev_info)
>>> +		fep->quirks = dev_info->quirks;
>>> +
>>> +	fep->pdev = pdev;
>>> +	platform_set_drvdata(pdev, fep);
>>> +
>>> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	fep->enet_addr = devm_ioremap_resource(&pdev->dev, r);  
>>
>> Use proper wrapper.
> 
> I've followed following pattern:
> https://elixir.bootlin.com/linux/v6.13.7/source/lib/devres.c#L180

which is correct example of that usage, but most drivers were converted
to different usage. Probably cocci also has rule for that.

>>> +
>>> +static const struct of_device_id mtipl2_of_match[] = {
>>> +	{ .compatible = "fsl,imx287-mtip-switch", },
>>> +	{ /* sentinel */ }
>>> +};
>>> +
>>> +static struct platform_driver mtipl2plat_driver = {
>>> +	.probe          = mtip_sw_probe,
>>> +	.remove         = mtip_sw_remove,
>>> +	.driver         = {
>>> +		.name   = "mtipl2sw",
>>> +		.owner  = THIS_MODULE,  
>>
>> Oh no, please do not send us 10-12 year old code. This is long, looong
>> time gone. If you copied this pattern,
> 
> I've stated the chronology of this particular driver. It is working
> with recent kernels.

That's not how upstreaming should work with explanation below.
> 
>> then for sure you copied all
>> other issues we fixed during last 10 years, so basically you ask us to
>> re-review the same code we already fixed.

^^^ this one. It does not matter if it works. You can send us working
code with hungarian notation and the argument "it works" is not correct.
It still will be hungarian notation.

> 
> I cannot agree with this statement.
> 
> Even better, the code has passed net-next's checkpatch.pl without
> complaining about the "THIS_MODULE" statement.
> 
It's not part of checkpatch. It's part of coccinelle, which - just like
smatch and sparse - are supposed to report zero or almost zero issues on
new drivers.

Best regards,
Krzysztof

