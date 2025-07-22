Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D04C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JePg0kAczwlnK+BZalOpLBOvbT8/24A2hITUzXd1d3M=; b=gl3ftpGp5Z3vjV9Ib5Bmw5IMIB
	0zt0dYzJaXSNGuziZsNsk2QQAzmbO3q+XLpNiif9ndZksLQDFJMENBbdf4MTHjbh5WIpRO1iXqA5s
	rL5UgMwQ2FiILgEOsD5W+7TevWdSUb5uANRXfbVhGwPD8YpDo0nM1eDoDPWfdK3HdU3mbtTYDKqOO
	FelPAtnFHsiBOtsz/iwYgk7vZjR5wQqfO0Acd49UMV4+p1GqbqO/1hwG7el6/gb99JJ4nmb+B6uYA
	3QQF9BBj7pZiMgC71FnZZy29VZYdYgaT1Fz7jf0mtcfYO4ENpJSuVYH08DIPOsC6uuGfJyf2VLAO+
	w2uZZW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAuf-00000002FVm-0bQC;
	Tue, 22 Jul 2025 11:12:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAqa-00000002Ehj-2Oya
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 11:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B19DD600AC;
	Tue, 22 Jul 2025 11:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8896CC4CEEB;
	Tue, 22 Jul 2025 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753182467;
	bh=/14uXHwAwgSzAFwwMlCyP9/kFWZdtLnT4aQT+J/gJeM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gW45WRJ6520Gtzde2MTNJNG/WTRctoEQS/jOoYMh5KKIZkAcxGIJT6aa/TV3WyHmK
	 X2fXDNM6iwYTuSZkQndh1aBuyrg14w4hVGkLtvP29O/SdOILBp3UT6OlD704hPR0o5
	 9NyImMd6XXmkcJ96Sb6OSxMTgbV1LMoBtKFdslSQv5LYY0JuWzW/RHdM1wS2AW2gQZ
	 DLgtz0SytHpEebb6LhMrlbB8bFi3V0Q2A+3ZvlPa2pkU/CHXywOobI4ZsuhV/DgAcH
	 aICP06t3ew7J6TupHEJEdFnMCHNCV8RGaSqvN8vj3xg878T2+9dGxJwYuagZt53cwa
	 mazM7CaZESpsg==
Message-ID: <07ac9244-c4cb-441e-83c1-20dfd01b2fe7@kernel.org>
Date: Tue, 22 Jul 2025 13:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v1 0/3] spidev: introduce trivial abb sensor
 device
To: hs@denx.de, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrei Lalaev <andrey.lalaev@gmail.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250719063355.73111-1-hs@denx.de>
 <175311337130.327079.7374455187420344577.b4-ty@kernel.org>
 <d677ecd9-42d6-43fe-8fe1-a5afd4d270e2@kernel.org>
 <8a8106ea-83d3-e02a-9ae7-ea4a66e4c248@denx.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <8a8106ea-83d3-e02a-9ae7-ea4a66e4c248@denx.de>
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

On 22/07/2025 06:05, Heiko Schocher wrote:
> Hello Krzysztof,
> 
> On 21.07.25 18:24, Krzysztof Kozlowski wrote:
>> On 21/07/2025 17:56, Mark Brown wrote:
>>> On Sat, 19 Jul 2025 08:33:51 +0200, Heiko Schocher wrote:
>>>> This series introduces the changes needed for trivial spi
>>>> based sensors from ABB, currently operated from userspace.
>>>>
>>>> The last patch adds the spidevices to the DTS files, already
>>>> in mainline.
>>>>
>>>> make dtbs_check showed no errors/warnings for the dts files
>>>>
>>>> [...]
>>>
>>> Applied to
>>>
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
>>>
>>> Thanks!
>>>
>>> [1/3] dt-bindings: trivial-devices: Document ABB sensors
>>>        commit: aad2f87cbcab56b322109d26d7b11842a09df91f
>>> [2/3] spi: spidev: Add an entry for the ABB spi sensors
>>>        commit: d60f7cab7c04944a79af16caa43c141e780a59c6
>>>
>>
>>
>> That's unexpected, Mark. Patches received two objections/comments and I
>> don't think discussion was resolved.
>>
>> ABB is huge company, probably making hundreds or more of sensors. The
>> patchset basically claims that all of them work with spidev. It does not
>> providing any model names or details, so it seems really incomplete to
>> call them trivial devices.
> 
> I do not know how many different sensors they have, nor if that department can
> speak for the whole company...

Considering how big company is, they could have 1 or 1000 sensors.

> 
> What I have as information is:
> https://lore.kernel.org/linux-spi/2477dc64-92a0-9dc9-d168-56646d0d796e@denx.de/
> 
> and I get no more information about them currently. May I should
> add some sort of trivial into compatible name? Something like
> 
> "abb,spi-trivial-sensor"
> or
> "abb,spidev-trivial-sensor"

No, you need model numbers.

> 
> which makes it clearer, that only ABB trivial sensor, controlled through spidev
> driver, is connected here?

No, what is trivial? Which one is trivial and which one is not? How one
judges that one sensor should go here and other should not?


Best regards,
Krzysztof

