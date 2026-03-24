Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F3F532E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkAPB9tpxHoZvHVAlxdeetnmlI7GkOzZO8Qb4pFq860=; b=r1tCy1Cm/HMYYR1pE59jm0TMYk
	Ykz4HuuWjG2REvSR+K6zREXcycRI0jH8XxPDT7NyhuMOEnrg7drnltUe0q4tbZp+y2Dqyb98+1d2+
	AQUYh0exh+TJE9j3hyG/mHsxeN5+insN94RxLUA0N281AJYXjNHeT4bywyhOvw6IWr6HHchb+gR2f
	5GAqaDS9dC5WLq4K20/3b3ctwIaBWMyEyHgkOxk/AW7evVXMUlFLrihz3gMq2RmIUuBWyLoGUY4B9
	M+8TQXkCMjRNN/xHkgdvFZyAjoLLHi7xm2HtyvV1VXOc3fAGQo5opR86tq9MLvp6ymH9Foi52CaXA
	GOvq/2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vrH-00000000rNm-287G;
	Tue, 24 Mar 2026 07:07:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vrF-00000000rNI-3UWj;
	Tue, 24 Mar 2026 07:07:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D672A600AC;
	Tue, 24 Mar 2026 07:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF82C19424;
	Tue, 24 Mar 2026 07:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774336040;
	bh=A/r+FfTIdYd7bf32ZtnrhZhkNo/CNskrUBFMjphTyAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VsBpJFqJ1R+U+EjUVBYjnD1kfUopDa0s5nt9AO0t971Mz8l1KTqo4dVM+xEqy1twh
	 WMAw7HPZ7TbPbYDcdv41auX+guyrGGFgG9600eMd/8lRBnTl9etI4Qu+UIhxISXWrv
	 MHa0EkhRyFQqu8hEGOR9+iwqZ6zIdQGSuxHnAers1pSTTdT1QUV21G2Fm9Xxd6AVuY
	 7w4R1b2WW2vRhtOBrB8up9WVLnCJcbFu7xeom9UbPrV/1jJjIfpaRpfuyWu4OFmEe8
	 0GVtfjgGgn+DXonH3l+BKuJC6wcqJudFFWhZ6suuCNOKsmBYLrOdlZ99+4K2ogO9dV
	 N5cR4Se6Cn4BA==
Message-ID: <171e30f3-e294-40fb-8731-476fb51d5a3c@kernel.org>
Date: Tue, 24 Mar 2026 08:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] iio: adc: meson-saradc: add support for Meson S4
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jbrunet@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260323013408.429701-1-nick@khadas.com>
 <20260323013408.429701-3-nick@khadas.com>
 <20260323-quizzical-striped-husky-68e24e@quoll>
 <20260323200501.6c116226@jic23-huawei>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260323200501.6c116226@jic23-huawei>
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

On 23/03/2026 21:05, Jonathan Cameron wrote:
> On Mon, 23 Mar 2026 08:54:21 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On Mon, Mar 23, 2026 at 09:34:06AM +0800, Nick Xie wrote:
>>> Add support for the SARADC found on the Amlogic Meson S4 SoC.
>>> According to the documentation and current testing, it is fully
>>> compatible with the G12A parameter set, so we reuse
>>> `meson_sar_adc_g12a_data` for this new compatible string.
>>>
>>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Signed-off-by: Nick Xie <nick@khadas.com>
>>> ---
>>>  drivers/iio/adc/meson_saradc.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
>>> index 47cd350498a0d..3ac48b7842c4f 100644
>>> --- a/drivers/iio/adc/meson_saradc.c
>>> +++ b/drivers/iio/adc/meson_saradc.c
>>> @@ -1313,6 +1313,11 @@ static const struct meson_sar_adc_data meson_sar_adc_g12a_data = {
>>>  	.name = "meson-g12a-saradc",
>>>  };
>>>  
>>> +static const struct meson_sar_adc_data meson_sar_adc_s4_data = {
>>> +	.param = &meson_sar_adc_g12a_param,
>>> +	.name = "meson-s4-saradc",
>>> +};
>>> +
>>>  static const struct of_device_id meson_sar_adc_of_match[] = {
>>>  	{
>>>  		.compatible = "amlogic,meson8-saradc",
>>> @@ -1341,6 +1346,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
>>>  	}, {
>>>  		.compatible = "amlogic,meson-g12a-saradc",
>>>  		.data = &meson_sar_adc_g12a_data,
>>> +	}, {
>>> +		.compatible = "amlogic,meson-s4-saradc",  
>>
>> The point of compatible devices is to not add such entries. Drop.
> It's used for naming in the userspace ABI which is supposed to reflect the part number.

Indeed, I saw this pattern in more places. Does userspace need it? There
is no "compatible" entry shown?

If there is no, then probably this could be automated by taking the name
from compatible after ',', but that would be out of scope for this set,
so here it is fine.


Best regards,
Krzysztof

