Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01489C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/dmRjNaxR4bUKICdciJ3/O6i60HJ+RLAK+qtyiADvw=; b=uKih9cZsgnDKJXtKkpRZAC7CmH
	Is/YsShEUtEpVpJXqY5bAwTE4y5FKmqFYdC140ZbIdCh3mjkkcb8ZLNv3oQmIXl33fuapAvJSw2AH
	hiq5RaSXy7JP0GTxw6wYczWXaDBmmRovQgdrtOohkPjyFVdmxHPtw1GZnEUZ9Dlghdx6AYeL9sdT1
	TZe4QQNqKEL5aIizcM29BQY8Dt2qS02nBfvGfdmGSJ5czNaudJnpDhTBNIF7UndF1T9FqhHOGWps7
	JYs3cXPpKEIobQ0RNZa970Kiw1oSGryItqwVdfEeEUwHZp6yn6jNLMt3+6Ki6eTVhVQhGtO6Wd137
	uBGlbnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXuu-00000000nH5-2xJo;
	Mon, 10 Feb 2025 17:49:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXm6-00000000lO3-1reC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10C95A41C6A;
	Mon, 10 Feb 2025 17:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5156DC4CED1;
	Mon, 10 Feb 2025 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739209249;
	bh=ydEKPUtT2Hh+NWUt2uwX2rQW8L4szP3hzQemITBPgnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hnxHUAAe67Yj8Cbt08VyRO3ucIdqST5NAitoqMEySOrUNaRLobnabZEmWZkM30dUx
	 1fFY2ND/RmOy97XnKvlEE6UaRV2CmI3jY9aA6P1eMzP3b+Mzne+iVj/3iyc35EKxlG
	 UrjeVO472XDha7ED74e8tnTH+QOkArxzPoXGJNl5XLJEQK62qJB2U23FH6iqmvSE1s
	 QY04pDZrripwXNqhras+OxrASODwRHaN0Iv6zQzwth7B3m555+JY0PfLWKn4cXVLHe
	 BaoZ/lKqmFUtXv1c0KIBvfcUi/PRd6exINKR98G9l9uaOxWOrswCiKufaL9Fk7Htgq
	 6VmwaWyzHl+uw==
Message-ID: <7373c956-216a-43a6-939c-4a9be5564c57@kernel.org>
Date: Mon, 10 Feb 2025 18:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: chips-media: wave6: Add Wave6 codec driver
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
 lafley.kim@chipsnmedia.com
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-5-nas.chung@chipsnmedia.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250210090725.4580-5-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_094050_633840_ADAABDA3 
X-CRM114-Status: GOOD (  14.42  )
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

On 10/02/2025 10:07, Nas Chung wrote:
> +
> +	dev->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +	if (IS_ERR_OR_NULL(dev->debugfs))
> +		dev->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	if (dev->res->codec_types & WAVE6_IS_DEC) {
> +		ret = wave6_vpu_dec_register_device(dev);
> +		if (ret) {
> +			dev_err(&pdev->dev, "wave6_vpu_dec_register_device fail: %d\n", ret);
> +			goto err_temp_vbuf_free;
> +		}
> +	}
> +	if (dev->res->codec_types & WAVE6_IS_ENC) {
> +		ret = wave6_vpu_enc_register_device(dev);
> +		if (ret) {
> +			dev_err(&pdev->dev, "wave6_vpu_enc_register_device fail: %d\n", ret);
> +			goto err_dec_unreg;
> +		}
> +	}
> +
> +	if (dev->ctrl && wave6_vpu_ctrl_support_follower(dev->ctrl)) {
> +		wave6_vpu_activate(dev);
> +		ret = pm_runtime_resume_and_get(dev->dev);
> +		if (ret)
> +			goto err_enc_unreg;
> +	}
> +
> +	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
> +		dev->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
> +		dev->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
> +
> +	return 0;
> +
> +err_enc_unreg:
> +	if (dev->res->codec_types & WAVE6_IS_ENC)
> +		wave6_vpu_enc_unregister_device(dev);
> +err_dec_unreg:
> +	if (dev->res->codec_types & WAVE6_IS_DEC)
> +		wave6_vpu_dec_unregister_device(dev);
> +err_temp_vbuf_free:
> +	wave6_free_dma(&dev->temp_vbuf);
> +err_kfifo_free:
> +	kfifo_free(&dev->irq_status);
> +err_m2m_dev_release:
> +	wave6_vpu_release_m2m_dev(dev);
> +err_v4l2_unregister:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +
> +	return ret;
> +}
> +
> +static void wave6_vpu_remove(struct platform_device *pdev)
> +{
> +	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
> +
> +	if (dev->ctrl && wave6_vpu_ctrl_support_follower(dev->ctrl)) {
> +		if (!pm_runtime_suspended(&pdev->dev))
> +			pm_runtime_put_sync(&pdev->dev);
> +	}
> +	pm_runtime_disable(&pdev->dev);
> +
> +	wave6_vpu_enc_unregister_device(dev);
> +	wave6_vpu_dec_unregister_device(dev);
> +	wave6_free_dma(&dev->temp_vbuf);
> +	kfifo_free(&dev->irq_status);
> +	wave6_vpu_release_m2m_dev(dev);
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +}
> +
> +#ifdef CONFIG_PM
> +static int wave6_vpu_runtime_suspend(struct device *dev)
> +{
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	if (!vpu_dev)
> +		return -ENODEV;
> +
> +	dprintk(dev, "runtime suspend\n");

Drop

> +	if (vpu_dev->ctrl && vpu_dev->active)
> +		wave6_vpu_ctrl_put_sync(vpu_dev->ctrl, &vpu_dev->entity);
> +	if (vpu_dev->num_clks)
> +		clk_bulk_disable_unprepare(vpu_dev->num_clks, vpu_dev->clks);
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_runtime_resume(struct device *dev)
> +{
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	if (!vpu_dev)
> +		return -ENODEV;
> +
> +	dprintk(dev, "runtime resume\n");

Drop

> +	if (vpu_dev->num_clks) {
> +		ret = clk_bulk_prepare_enable(vpu_dev->num_clks, vpu_dev->clks);
> +		if (ret) {
> +			dev_err(dev, "failed to enable clocks: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (vpu_dev->ctrl && vpu_dev->active) {
> +		ret = wave6_vpu_ctrl_resume_and_get(vpu_dev->ctrl, &vpu_dev->entity);
> +		if (ret && vpu_dev->num_clks)
> +			clk_bulk_disable_unprepare(vpu_dev->num_clks, vpu_dev->clks);
> +	} else {
> +		wave6_vpu_check_state(vpu_dev);
> +	}
> +
> +	return ret;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int wave6_vpu_suspend(struct device *dev)
> +{
> +	int ret;
> +
> +	dprintk(dev, "suspend\n");

Drop. Don't re-implement existing tracing.

> +	wave6_vpu_pause(dev, 0);
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		wave6_vpu_pause(dev, 1);
> +
> +	return ret;
> +}
> +
> +static int wave6_vpu_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	dprintk(dev, "resume\n");

Drop, useless.

> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	wave6_vpu_pause(dev, 1);
> +	return 0;
> +}
> +#endif
> +static const struct dev_pm_ops wave6_vpu_pm_ops = {
> +	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend, wave6_vpu_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_suspend, wave6_vpu_resume)
> +};
> +
> +static const struct of_device_id wave6_dt_ids[] = {
> +	{ .compatible = "nxp,imx95-wave633c", .data = &wave633c_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, wave6_dt_ids);
> +
> +static struct platform_driver wave6_vpu_driver = {
> +	.driver = {
> +		.name = VPU_PLATFORM_DEVICE_NAME,
> +		.of_match_table = of_match_ptr(wave6_dt_ids),


Drop of_match_ptr, you have here warnings.


Best regards,
Krzysztof

