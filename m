Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0BFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzGR6nrk4EjsE66y4I6rR7S8NKGrnV5OcC8qdhDFeLM=; b=SRJha3/pJoXwna0feCF27udiMS
	ECbnicY1N6tMEKsx8FTAdOqJdTHmhPUu4Lqdrl4UPQh7Ve3+rcKXb/Hx97W1aFplbTKkDzATJK8NZ
	Jxz9k9bt55RzdeXC/b/vueyH7D/Gz01cvfnPFgLEyBG2YVklLxfndmZwzfy6Zw/9UNqO/DVAStLwF
	ARUuwbZlGBLgEEAKpnAADeN4COAzF0Gwm0XMqiwR41xtDVKvV/22RxRuJoyV0+dmYOxh/nUd92PJc
	SU1URosW9kXZmAJJ2hwm/WsGVygpTyrZnwjkxQ+dOlqjNOUo05hWbh5H5ZusGzK4Ejc2npw8vjnG6
	5hYJW6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUIs-0000000715i-2YR1;
	Tue, 17 Jun 2025 11:16:34 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSmP-00000006n0e-0B0M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:38:58 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bM1z21y9Dz9t8M;
	Tue, 17 Jun 2025 11:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750153134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzGR6nrk4EjsE66y4I6rR7S8NKGrnV5OcC8qdhDFeLM=;
	b=RV7qRW7OY6K7KsfxtHBx/gKc4Sac+D5F0vacdRH9SQ56ThA6ne4pca44HVrpxTGIsFkVLD
	NJMr1Hb4T8IzL1E8hBSFkk0s4n6v8MkoBGzfIGkEVRJ7KsjRbZzrDslobfAyZ4Q8uxCNVu
	gNodnCzCC6yMeHlmtXfzzs02lc//ubN5dguM3Vz39CuvrRZ1fmPGpuGJ7aNArGJp6V/B8r
	s+EXhIXHgt18+7sfDwvHt9jpORKI/RyL2oq6W1Y0Z4HHygwXwt4z8PUEH5082H8+3Ua4fR
	iwFT0e0OefkI/2MQdd9yXAsk/ryUGhXVPAaoAK1nelOP6iJBhPrkUM5DoxUK5A==
Message-ID: <b464bc12-e921-4d98-9462-ec9d13ccb5ce@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750153132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzGR6nrk4EjsE66y4I6rR7S8NKGrnV5OcC8qdhDFeLM=;
	b=neFG4t6fNn7rNWBXPQ8CpW4PJHuuIOLlqXW6sog6uJuFkc5Earg2ohfAUJztVfxy4cogVV
	1p9Y5nQqdql9JfPKKdZVtGePGCpAL4TVFjYNcrVibECg9KKB4tzLJvFNVyRYg4lEfcm8ne
	x6YL5Cu8CgjEXDGmbej6ZFpLCyxQveo2u/pNVrzncN+V09yijmDhiyzm3ONTC5UlKW4tLq
	eK/wAo//gcUVkNlNG4Ak/QbSckjTiHDdRF+Bg1SgHWB7fqpWjGTnvv15ovyWSzXSwbf1HX
	wkYqqp5GIHZozYu+X9M2fzEt7AbdBJMLetuHj3gckoa6IEKQn2tUyapVmoDNXQ==
Date: Tue, 17 Jun 2025 11:38:50 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
 <jgafc7te2zotqwvetudo6c4o4nit6zi3yp4ecg4gka53hrypk5@7ypb5asrc2ct>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <jgafc7te2zotqwvetudo6c4o4nit6zi3yp4ecg4gka53hrypk5@7ypb5asrc2ct>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: q793ek8j3bx5r97i5wtt76o4bgkfpyit
X-MBO-RS-ID: 72afed9b7a82750c7c3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023857_224888_D77A5E2C 
X-CRM114-Status: GOOD (  11.37  )
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

On 6/17/25 10:14 AM, Uwe Kleine-König wrote:

Hi,

[...]

> /* The actual value isn't known, so this is made up. */
> #define RPI_PANEL_V2_FIXED_PERIOD_NS 100000
> 
> 
> static int rpi_panel_v2_pwm_round_waveform_tohw(...)
> {
> 	...
> 
> 	if (wf->duty_length_ns > RPI_PANEL_V2_FIXED_PERIOD_NS)
> 		*wfhw = 100;
> 	else
> 		*wfhw = mul_u64_u64_div_u64(wf->duty_length_ns * 100, RPI_PANEL_V2_FIXED_PERIOD_NS);
> 
> 	return 0;
> }

This fixed period specified in driver has one problem -- what if the 
period is also specified in DT by the consumer, e.g. pwm-backlight pwms 
property, and it does not match RPI_PANEL_V2_FIXED_PERIOD_NS ?

This is easy to solve for this tohw function, but what about the fromhw 
which assigns period_ns ?

>> +static int rpi_panel_v2_pwm_write_waveform(struct pwm_chip *chip,
>> +					   struct pwm_device *pwm,
>> +					   const void *_wfhw)
>> +{
>> +	struct regmap *regmap = pwmchip_get_drvdata(chip);
>> +	const u8 *wfhw = _wfhw;
>>   
>> -	duty = pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
>> -	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
>> +	return regmap_write(regmap, REG_PWM, *wfhw | (*wfhw ? PWM_BL_ENABLE : 0));
> 
> How does the PWM behave without PWM_BL_ENABLE set?
The display stays dark.

