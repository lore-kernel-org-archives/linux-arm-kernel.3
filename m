Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D7DC61DDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZghLiv0Pjb4l8sTB8mgLNzMQsPB8RsKU6NVqN9xPBQk=; b=W38T8FJyKN4CfWjTr8v2NfOq+d
	0/HW995M+ECecI1f1zIm4e8/BCESKAByZsgWmbtr30w0ZHW0YXVm4xypMB4wGSsfilnQV371jCT7N
	rUrDa6AkK2X8AzbhjW+zehX6KIPsRw2qZGbsZ3tfXYkuDOFvsdToaAH8LIHxpnUOdaqnqbW/aFYRC
	Sxm5/JBcv7ZGS1VE9ZtuEhK/U4KIVTKKxzcJJhiWnLA93pyrX8Eh4/1YlmZ/ZnNrgOF2CT7qfLbdg
	heCjHKOQcLqx4MUNnBhEAeAMHqfdohIK/8OSycHoDCKsphl5QcqRPxpRuHvZUNkzAJOMPtRwnZfJX
	rXxCLoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtiwk-0000000Fvlw-2t0J;
	Sat, 21 Feb 2026 09:06:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtiwj-0000000Fvlp-2uKM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:06:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71D3C6001D;
	Sat, 21 Feb 2026 09:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1756EC4CEF7;
	Sat, 21 Feb 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771664800;
	bh=ht0he+pF2jvd7uZMAKcPSSsCUbxjK15Du6469AfkVP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EkJw7Y0U10DAs0c1rqn+MgwzRTgBZBdOtg+sgmoDday8CWujdT1JNUUBSOTcFLnQk
	 OAe4Me3ZS3CER8l+1IR0/7yWqurR52DFFYT2kQv4LLYZQ3xpygS9TEusvFnV501TC2
	 IOPwQP57KEO/cZXQzvdSrDjOHuNBFPSCkCrWgMcsPAixL+Nf3vjCxReRhTEuFjC7ef
	 3VymCQyDhCNyImX39GhQpxJQgQavXOQQptmMo4XDNWBv0UKkCNEcbd0Dg5rgixmv2n
	 X5Rrq0MOuUgF/bQtEpQVErB+6/Cc1hRVmihNhGowj9Y9IFXUj/wnAlrzYQrIMjkmZA
	 S4+UD9m0l8ZCg==
Message-ID: <571e56ba-83c0-4d0a-8893-5a86789c22bb@kernel.org>
Date: Sat, 21 Feb 2026 10:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] RAS: add DeviceTree firmware-first CPER provider
To: Ahmed Tiba <ahmed.tiba@arm.com>, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org
Cc: Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
 robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-11-347fa2d7351b@arm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-11-347fa2d7351b@arm.com>
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

On 20/02/2026 14:42, Ahmed Tiba wrote:
> +	rc = ghes_ffh_init_ack(pdev, ctx);
> +	if (rc)
> +		return rc;
> +
> +	rc = ghes_ffh_init_pool();
> +	if (rc)
> +		return rc;
> +
> +	ctx->estatus = devm_kzalloc(&pdev->dev, ctx->status_len, GFP_KERNEL);
> +	if (!ctx->estatus)
> +		return -ENOMEM;
> +
> +	ctx->generic = devm_kzalloc(&pdev->dev, sizeof(*ctx->generic), GFP_KERNEL);
> +	if (!ctx->generic)
> +		return -ENOMEM;
> +
> +	ctx->generic->header.type = ACPI_HEST_TYPE_GENERIC_ERROR;
> +	ctx->generic->header.source_id =
> +		atomic_inc_return(&ghes_ffh_source_ids);
> +	ctx->generic->notify.type = ctx->sync ?
> +		ACPI_HEST_NOTIFY_SEA : ACPI_HEST_NOTIFY_EXTERNAL;
> +	ctx->generic->error_block_length = ctx->status_len;
> +
> +	ctx->irq = platform_get_irq_optional(pdev, 0);

Please read the kerneldoc - wrong check in if.

> +	if (ctx->irq <= 0) {
> +		if (ctx->irq == -EPROBE_DEFER)
> +			return ctx->irq;
> +		dev_err(&pdev->dev, "interrupt is required (%d)\n", ctx->irq);
> +		return -EINVAL;
> +	}
> +
> +	rc = devm_request_threaded_irq(&pdev->dev, ctx->irq,
> +				       NULL, ghes_ffh_irq,
> +				       IRQF_ONESHOT,
> +				       dev_name(&pdev->dev), ctx);
> +	if (rc)
> +		return rc;
> +
> +	platform_set_drvdata(pdev, ctx);
> +	dev_info(&pdev->dev, "Firmware-first CPER status provider (interrupt)\n");

This does not look like useful printk message. Drivers should be silent
on success:
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

> +	return 0;
> +}
> +
> +static void ghes_ffh_remove(struct platform_device *pdev)
> +{
> +}
> +
> +static const struct of_device_id ghes_ffh_of_match[] = {
> +	{ .compatible = "arm,ras-ffh" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ghes_ffh_of_match);
> +
> +static struct platform_driver ghes_ffh_driver = {
> +	.driver = {
> +		.name = "esource-dt",
> +		.of_match_table = ghes_ffh_of_match,
> +	},
> +	.probe = ghes_ffh_probe,
> +	.remove = ghes_ffh_remove,
> +};
> +
> +module_platform_driver(ghes_ffh_driver);
> +
> +MODULE_AUTHOR("Ahmed Tiba <ahmed.tiba@arm.com>");
> +MODULE_DESCRIPTION("Firmware-first CPER provider for DeviceTree platforms");
> +MODULE_LICENSE("GPL");
Best regards,
Krzysztof

