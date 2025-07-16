Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B0DC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrxXHEUDDfMlhaTPOpuIjodC9k5yqVTmawiR/OSDs6A=; b=KBRxeDuO6ysX52BSiUALbeIoOY
	E7sORV01vZDy5Elyp2lmJ1XQzup2+qpZOwdlqJmaaniKpRJ5sqneYzvvPxyyMVCBU73ZKFoB8ApJI
	z6TiO+F8XcABCN2iCQl8IyoJRIn5KxqMwzm8l0/4udM0+iLRKjN+jT60/P4PQkFc82twjf9WpaBI3
	lCxIpqOiTWGMRiwnWj46BYp66BShxSDZhF2BRDXDdC8JoSjGNoXJ04JXDwrIQdAzrjwkFvHMeCuNl
	J+ja3mZ9GYpamhdrAlfE56Jiie97B1HZCNymI631r0Cf/Y3MKsAilDLhCNfOkl9C4grcXu715Free
	gqsVljgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2rT-00000007sBB-03Pr;
	Wed, 16 Jul 2025 14:11:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2oy-00000007rvc-3WUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CC405C5F79;
	Wed, 16 Jul 2025 14:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CD1C4CEE7;
	Wed, 16 Jul 2025 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752674959;
	bh=wRoG1SA5cQDEQUbD+BeqOCdpMvHnqL8ubHtD4uhAfmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=syE+r3sVJRyeMirB3BxlHoUKGdcwIn/tgwaZVLkT8lnOfgJhBmAkTn6/3dhThpqY/
	 pd5WZjZKkrtVsOgvhFownz1juJndJ/exCDgrOCpJPDgnAHE/KgVxw3XmXNcd5i3dgw
	 9911OS5dHqzOdZoOWuzCMroXUyeXi6HC1+YSlJ2JcIFPprQqp91eoJA6XmPyidbBZ4
	 +of9FywlWrG7XHEbmuDMuwVQhzaMhYvqWc/NgjJWFV7msxhiooreOYP9b4v5m/7RZK
	 Ho446m7sbjzG2HsxRqPa50J8ljrml6YgdlbGqPw7ZX68Sxl8gbDfsEWsaXjTkNLnkT
	 I0n7oterzb2cg==
Message-ID: <b8149d7d-65ca-47c1-9338-45a0db614e77@kernel.org>
Date: Wed, 16 Jul 2025 16:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux@armlinux.org.uk, ardb@kernel.org, ebiggers@kernel.org,
 geert+renesas@glider.be, claudiu.beznea@tuxon.dev, bparrot@ti.com,
 andre.draszik@linaro.org, kuninori.morimoto.gx@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, heikki.krogerus@linux.intel.com,
 kory.maincent@bootlin.com, florian.fainelli@broadcom.com, lumag@kernel.org,
 dale@farnsworth.org, sbellary@baylibre.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dagriego@biglakesoftware.com,
 u-kumar1@ti.com
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-5-y-abhilashchandra@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250716111912.235157-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_070920_964411_A972A9D3 
X-CRM114-Status: GOOD (  16.33  )
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

On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:

> +static int vip_probe_complete(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct regmap *syscon_pol = NULL;
> +	u32 syscon_pol_offset = 0;
> +	struct vip_port *port;
> +	struct vip_dev *dev;
> +	struct device_node *parent = pdev->dev.of_node;
> +	struct fwnode_handle *ep = NULL;
> +	int ret, slice_id, port_id, p;
> +
> +	if (parent && of_property_read_bool(parent, "ti,vip-clk-polarity")) {
> +		syscon_pol = syscon_regmap_lookup_by_phandle(parent,
> +							     "ti,vip-clk-polarity");
> +		if (IS_ERR(syscon_pol)) {
> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity regmap\n");
> +			return PTR_ERR(syscon_pol);

Syntax is return dev_err_probe. If this is not probe path, then this has
to be fixed.

> +		}
> +
> +		if (of_property_read_u32_index(parent, "ti,vip-clk-polarity",
> +					       1, &syscon_pol_offset)) {
> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity offset\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
> +		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
> +							    p, 0);
> +		if (!ep)
> +			continue;
> +
> +		switch (p) {
> +		case 0:
> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTA;
> +			break;
> +		case 1:
> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTA;
> +			break;
> +		case 2:
> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTB;
> +			break;
> +		case 3:
> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTB;
> +			break;
> +		default:
> +			dev_err(&pdev->dev, "Unknown port reg=<%d>\n", p);
> +			continue;
> +		}
> +
> +		ret = alloc_port(shared->devs[slice_id], port_id);
> +		if (ret < 0)
> +			continue;
> +
> +		dev = shared->devs[slice_id];
> +		dev->syscon_pol = syscon_pol;
> +		dev->syscon_pol_offset = syscon_pol_offset;
> +		port = dev->ports[port_id];
> +
> +		vip_register_subdev_notif(port, ep);
> +		fwnode_handle_put(ep);
> +	}
> +	return 0;
> +}
> +
> +static int vip_probe_slice(struct platform_device *pdev, int slice, int instance_id)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct vip_dev *dev;
> +	struct vip_parser_data *parser;
> +	u32 vin_id;
> +	int ret;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->instance_id = instance_id;
> +	vin_id = 1 + ((dev->instance_id - 1) * 2) + slice;
> +	snprintf(dev->name, sizeof(dev->name), "vin%d", vin_id);
> +
> +	dev->irq = platform_get_irq(pdev, slice);
> +	if (dev->irq < 0)
> +		return dev->irq;
> +
> +	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
> +			       0, dev->name, dev);
> +	if (ret < 0)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&dev->slock);
> +	mutex_init(&dev->mutex);
> +
> +	dev->slice_id = slice;
> +	dev->pdev = pdev;
> +	dev->res = shared->res;
> +	dev->base = shared->base;
> +	dev->v4l2_dev = &shared->v4l2_dev;
> +
> +	dev->shared = shared;
> +	shared->devs[slice] = dev;
> +
> +	vip_top_reset(dev);
> +	vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
> +
> +	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
> +	if (!parser)
> +		return PTR_ERR(parser);
> +
> +	parser->res = platform_get_resource_byname(pdev,
> +						   IORESOURCE_MEM,
> +						   (slice == 0) ?
> +						   "parser0" :
> +						   "parser1");
> +	parser->base = devm_ioremap_resource(&pdev->dev, parser->res);
> +	if (IS_ERR(parser->base))
> +		return PTR_ERR(parser->base);
> +
> +	parser->pdev = pdev;
> +	dev->parser = parser;
> +
> +	dev->sc_assigned = VIP_NOT_ASSIGNED;
> +	dev->sc = sc_create(pdev, (slice == 0) ? "sc0" : "sc1");
> +	if (IS_ERR(dev->sc))
> +		return PTR_ERR(dev->sc);
> +
> +	dev->csc_assigned = VIP_NOT_ASSIGNED;
> +	dev->csc = csc_create(pdev, (slice == 0) ? "csc0" : "csc1");
> +	if (IS_ERR(dev->sc))
> +		return PTR_ERR(dev->sc);
> +
> +	return 0;
> +}
> +
> +static int vip_probe(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared;
> +	struct pinctrl *pinctrl;
> +	int ret, slice = VIP_SLICE1;
> +	int instance_id;
> +	u32 tmp, pid;
> +	const char *label;
> +
> +	if (!of_property_read_string(pdev->dev.of_node, "label", &label)) {
> +		if (strcmp(label, "vip1") == 0)
> +			instance_id = 1;
> +		else if (strcmp(label, "vip2") == 0)
> +			instance_id = 2;
> +		else if (strcmp(label, "vip3") == 0)


Heh, nice try. You cannot encode instance ID as different property (and
instance ID is not allowed, see writing bindings in next).

And how does it work with label called "krzk"? Your binding said that
"krzk" is a perfectly correct label.

You need to think about such cases.


> +			instance_id = 3;

And past here you use uninitialized instance_id, because you did not
consider "krzk".



Best regards,
Krzysztof

