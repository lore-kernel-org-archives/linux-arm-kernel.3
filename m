Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E71ECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p538qKo+pjoTpLikHSyeUXUw46Nfvt7EfwAkvp7jwko=; b=cw/jlV8rCbVUPsJ1eqrsNRouvy
	ubk/Lk8Lu/wMZTuum977PaChfhexrCHLIOtBKaberVV4lBNiaaRnxvG2Frn5cxkk9elvFUL+7TVrF
	NjtZ+1gfiW52CX2uB7Z0+1jZMB9xtqIkHpcDHp+D7HANuO0mc0SLZ/D9wSZXUQ+JrXMG9Vd22v2FY
	D0JsguanuTiBvUbnvG8RwXBEYIpvd4EyTVhy2Q/gXAYAL66vAq5GXIF89qQtLSyr2A3pwe2SkDeMV
	m31ctKE6oakZJ4d0fcS3mI36CbgXmxmzDs0/P+Lcqh4EHi+JLcn7na27r3wvMwbjHQy+tXl2yfEbe
	Ga2Ln+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMzS-0000000Dz3O-04SD;
	Mon, 27 Oct 2025 13:10:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMzQ-0000000Dz2i-22p1;
	Mon, 27 Oct 2025 13:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BD9B604DC;
	Mon, 27 Oct 2025 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0529EC4CEFF;
	Mon, 27 Oct 2025 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761570623;
	bh=oQmm+wvIDMShfnALqPD7wwl33FnC85XhswN//H+pbp8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X13+xhplCXsjWqBnlnhDbz7hYz8xE65UGoHPkd9Cw9FeJrxoQXWliigGkMgKlyWCr
	 QgJ9yT27/M0MyZXxKsNQXu5kPaNUsRsR8VSj9aDK6MojBBdsMTIM11CYPOfyc2276z
	 QDCE++RfBO3YmJdfGE/piBTkPEzRAFin62hLHwQbcOG1MK5tTdeSCrtnZ5ibGTKyNp
	 jQOxNWQ6LVdOek8fAm2IGmIRx7JUhAbEfxrx+HNzev6IXdnVuMA575STmCVwBfTWAS
	 x/wgIITxB7SYCSQurqKtSyLhTNevnl06tr1rhq0WwpzQN287sP/HyrXnfCq85zoFBH
	 WB3rqqH16ZB2g==
Message-ID: <a2ec6794-1131-421e-848b-3fddd39191e2@kernel.org>
Date: Mon, 27 Oct 2025 14:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] decoder: Add V4L2 stateless H.264 decoder driver
To: zhentao.guo@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
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
In-Reply-To: <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
Content-Type: text/plain; charset=UTF-8
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

On 27/10/2025 06:42, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> This patch introduces initial driver support for Amlogic's new

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> video acceleration hardware architecture, designed for video
> stream decoding. The driver is designed to support the
> V4L2 M2M stateless decoder API. In phase 1, it supports H.264
> bitstreams decoding.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>

...


> +
> +static int aml_vdec_drv_probe(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev;
> +	struct video_device *vfd_dec;
> +	struct aml_vdec_hw *hw;
> +	int ret = 0;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->plat_dev = pdev;
> +	mutex_init(&dev->dev_mutex);
> +
> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "v4l2_device_register err\n");
> +
> +	vfd_dec = video_device_alloc();
> +	if (!vfd_dec) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
> +		ret = -ENOMEM;
> +		goto err_device_alloc;
> +	}
> +	*vfd_dec = dec_dev;
> +	vfd_dec->v4l2_dev = &dev->v4l2_dev;
> +	vfd_dec->lock = &dev->dev_mutex;
> +	video_set_drvdata(vfd_dec, dev);
> +	dev->vfd = vfd_dec;
> +	platform_set_drvdata(pdev, dev);
> +
> +	hw = kzalloc(sizeof(*hw), GFP_KERNEL);

Why aren't you using devm interfaces?

> +	if (!hw) {
> +		ret = -ENOMEM;
> +		goto err_dec_mem_init;
> +	}
> +	dev->dec_hw = hw;
> +
> +	dev->pvdec_data = of_device_get_match_data(&pdev->dev);
> +	ret = dev->pvdec_data->req_hw_resource(dev);
> +	if (ret < 0)
> +		goto err_hw_init;
> +
> +	dev->m2m_dev_dec = v4l2_m2m_init(&aml_vdec_m2m_ops);
> +	if (IS_ERR((__force void *)dev->m2m_dev_dec)) {

Huh? Why the cast?

> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
> +		ret = PTR_ERR((__force void *)dev->m2m_dev_dec);
> +		goto err_hw_init;
> +	}
> +
> +	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device");
> +		goto err_vid_dev_register;
> +	}
> +
> +	v4l2_info(&dev->v4l2_dev, "Registered %s as /dev/%s\n",
> +		  vfd_dec->name, video_device_node_name(vfd_dec));

This does not look like useful printk message. Drivers should be silent
on success:
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

> +
> +	dev->mdev.dev = &pdev->dev;
> +	strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
> +	media_device_init(&dev->mdev);
> +	dev->mdev.ops = &aml_m2m_media_ops;
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +
> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
> +		goto error_m2m_mc_register;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register media device");
> +		goto err_media_dev_register;
> +	}
> +	vdec_enable(dev->dec_hw);
> +	return 0;
> +
> +err_media_dev_register:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +error_m2m_mc_register:
> +	media_device_cleanup(&dev->mdev);
> +err_vid_dev_register:
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +err_hw_init:
> +	kfree(hw);
> +	dev->dec_hw = NULL;
> +err_dec_mem_init:
> +	video_device_release(vfd_dec);
> +err_device_alloc:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	return ret;
> +}
> +
> +static void aml_vdec_drv_remove(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
> +
> +	vdec_disable(dev->dec_hw);
> +
> +	if (media_devnode_is_registered(dev->mdev.devnode)) {
> +		media_device_unregister(&dev->mdev);
> +		media_device_cleanup(&dev->mdev);
> +	}
> +
> +	if (dev->m2m_dev_dec)
> +		v4l2_m2m_release(dev->m2m_dev_dec);
> +	if (dev->vfd)
> +		video_unregister_device(dev->vfd);
> +	if (dev->dec_hw)
> +		dev->pvdec_data->destroy_hw_resource(dev);
> +
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +
> +	pr_debug("aml v4l2 decoder driver remove\n");


This does not look like useful printk message. Drivers should be silent
on success:
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

> +}
> +
> +static const struct of_device_id aml_vdec_match[] = {
> +	{.compatible = "amlogic,s4-vcodec-dec", .data = &aml_vdec_s4_pdata},
> +	{},
> +};
> +
> +static struct platform_driver aml_vcodec_dec_driver = {
> +	.probe    = aml_vdec_drv_probe,
> +	.remove    = aml_vdec_drv_remove,
> +	.driver    = {
> +		.name    = AML_VDEC_DRV_NAME,
> +		.of_match_table = aml_vdec_match,
> +	},
> +};
> +
> +static int __init aml_vdec_init(void)
> +{
> +	pr_debug("aml v4l2 decoder module init\n");
> +
> +	if (platform_driver_register(&aml_vcodec_dec_driver)) {
> +		pr_err("failed to register aml v4l2 decoder\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit aml_vdec_exit(void)
> +{
> +	pr_debug("aml v4l2 decoder module exit\n");
> +	platform_driver_unregister(&aml_vcodec_dec_driver);

No, drop entire init/exit. This is some really odd code, probably
copy-paste from poor downstream. Please look at upstream drivers - do
you see anything like that anywhere?

> +}
> +
> +module_init(aml_vdec_init);
> +module_exit(aml_vdec_exit);
> +

Best regards,
Krzysztof

