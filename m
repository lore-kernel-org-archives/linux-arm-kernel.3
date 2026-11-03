Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B7606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yzB4WQUs;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=qkfKMdYn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2tQek1qiZL4Js2GpnQFztu1faM+c6GSagpIcxNr7m9g=; b=yzB4WQUsv4TJ8Z
	C0Pa+jrNbs/ZvanP+VamdcHVsMzfK0iBJzHhIV2/ArRYLjvRbLthjQBmwFOL3Cx41h7MEOyprtd7h
	oqbwNeSWPvSomj/CpU8lZoY58rw5sQ1+7MQNFm7+H7GahG8uM/xzBU2BYbvfw5URfxl6SH3zwgg5w
	KSiFdAu85X54k4v0KjmPN5BDeELVhsEUeI7Rba0qqGfNOi25yOytDSy7hKNmpB4fefSPQgBwUPIK7
	6cWbYDWMJ3pQXAgfFm9YtPkhe0kREqLBYxRjt95/Efji4bsGjyKfvpXymEkEUeYAJK6y47tnp3ePR
	aamO0szSLQCxlDTbbvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO8cN-00000001Iv6-266j;
	Tue, 03 Nov 2026 07:07:39 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO8cK-00000001Ium-3PH3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:07:37 +0000
Received: from [192.168.1.10] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7A57D20B7166;
	Mon,  2 Nov 2026 23:07:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7A57D20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793689640;
	bh=2tQek1qiZL4Js2GpnQFztu1faM+c6GSagpIcxNr7m9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qkfKMdYn8BRvJp96+mIGOJodjPZo3QsLvaXaw0dXTIn9JjgXjWi0M9nKW9YQUP/7E
	 BT/KjK7OBsK18zBgSiniHBuKfANsYwwSLjbiZFjokV2R/o5Apl8vwyLVrS6i1gWmEM
	 0htMk9PnxumShIpq8GGOgt1lmI9EHfFxyVZoHOwQ=
Message-ID: <4f330292-0fda-472b-8302-75ed5f6725eb@linux.microsoft.com>
Date: Tue, 3 Nov 2026 12:37:29 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] iio: adc: versal-sysmon: disable interrupts on
 shutdown
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 amitrkcian2002@gmail.com
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
 <20261102122112.1723130-4-amit.kumar-mahapatra@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261102122112.1723130-4-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_230736_904335_248ED42A 
X-CRM114-Status: GOOD (  29.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

Hi Amit,

On 02-11-2026 17:51, Amit Kumar Mahapatra wrote:
> Interrupt teardown is registered with devm_add_action_or_reset(), so
> sysmon_disable_interrupts() runs when the driver is unbound but not when
> the system shuts down: device_shutdown() invokes only the driver's
> .shutdown callback, which this driver does not implement.
> 
> The device is therefore left with its alarm interrupts enabled in
> hardware once Linux has stopped servicing them.
> 
> Add a .shutdown callback performing the same teardown, so the device is
> quiesced before control is handed on. The helper lives in the core
> module, so it is exported for the platform front-end. It skips a
> device described without an interrupt, which never set up interrupt
> handling.
> 
> Disabling the interrupts at shutdown is safe to have and not a must have
> requirement for shutdown.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>   drivers/iio/adc/versal-sysmon-core.c | 19 +++++++++++++++++++
>   drivers/iio/adc/versal-sysmon.c      |  6 ++++++
>   drivers/iio/adc/versal-sysmon.h      |  1 +
>   3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versal-sysmon-core.c
> index 6595d07038c1..d39aaba9a8b6 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
> @@ -1000,6 +1000,8 @@ int devm_versal_sysmon_core_probe(struct device *dev, struct regmap *regmap)
>   	if (!indio_dev)
>   		return -ENOMEM;
>   
> +	dev_set_drvdata(dev, indio_dev);
> +
>   	sysmon = iio_priv(indio_dev);
>   	sysmon->regmap = regmap;
>   	sysmon->temp_oversampling = 1;
> @@ -1050,6 +1052,23 @@ int devm_versal_sysmon_core_probe(struct device *dev, struct regmap *regmap)
>   }
>   EXPORT_SYMBOL_NS_GPL(devm_versal_sysmon_core_probe, "VERSAL_SYSMON");
>   
> +/**
> + * versal_sysmon_shutdown() - Disable SysMon interrupts on system shutdown
> + * @dev: SysMon device
> + *
> + * Interrupt teardown is a devm action, which runs on driver unbind but not
> + * on system shutdown, so disable the interrupts here as well.
> + */
> +void versal_sysmon_shutdown(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct sysmon *sysmon = iio_priv(indio_dev);
> +
> +	if (sysmon->irq > 0)
> +		sysmon_disable_interrupts(sysmon);
> +}
> +EXPORT_SYMBOL_NS_GPL(versal_sysmon_shutdown, "VERSAL_SYSMON");
> +
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("AMD Versal SysMon Core Driver");
>   MODULE_AUTHOR("Salih Erim <salih.erim@amd.com>");
> diff --git a/drivers/iio/adc/versal-sysmon.c b/drivers/iio/adc/versal-sysmon.c
> index 529d0486c9f9..4d5e3d14cf15 100644
> --- a/drivers/iio/adc/versal-sysmon.c
> +++ b/drivers/iio/adc/versal-sysmon.c
> @@ -71,6 +71,11 @@ static int sysmon_platform_probe(struct platform_device *pdev)
>   	return devm_versal_sysmon_core_probe(dev, regmap);
>   }
>   
> +static void sysmon_platform_shutdown(struct platform_device *pdev)
> +{
> +	versal_sysmon_shutdown(&pdev->dev);
> +}
> +
>   static const struct of_device_id sysmon_of_match_table[] = {
>   	{ .compatible = "xlnx,versal-sysmon" },
>   	{ }
> @@ -79,6 +84,7 @@ MODULE_DEVICE_TABLE(of, sysmon_of_match_table);
>   
>   static struct platform_driver sysmon_platform_driver = {
>   	.probe = sysmon_platform_probe,
> +	.shutdown = sysmon_platform_shutdown,
>   	.driver = {
>   		.name = "versal-sysmon",
>   		.of_match_table = sysmon_of_match_table,
> diff --git a/drivers/iio/adc/versal-sysmon.h b/drivers/iio/adc/versal-sysmon.h
> index a1ac3289719c..a21dacc13471 100644
> --- a/drivers/iio/adc/versal-sysmon.h
> +++ b/drivers/iio/adc/versal-sysmon.h
> @@ -122,5 +122,6 @@ struct sysmon {
>   };
>   
>   int devm_versal_sysmon_core_probe(struct device *dev, struct regmap *regmap);
> +void versal_sysmon_shutdown(struct device *dev);
>   
>   #endif /* _VERSAL_SYSMON_H_ */

Change looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Regards,
Prasanna Kumar

