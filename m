Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053A5FC619C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 22:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCX5Ea0Jxf6XlmcYmX/pWhqkbSLp0TFbsAJdTRKXfY0=; b=eS5d0P9Eq63VTUrHMel51682ci
	zNkyr/KFfTtQ0UouUbzvwg+uDXtvOUmS7z4NS88IWfdQTv+nzWhbyMXFh1gBdP1FkR1YNsj46oSz3
	nlWtaluE2U+adAD5eXiJlhvWgc295FFmR9svg8KwSq0Ta5HaR6KPRkFWQevgDHIRBQRY1c4Kh9pV0
	0jSamHhYy6St4DXgxOBpc5md+zTCNnmK4vtsCTVnv5aEjpQ0faQuHlbma590I8oCg3ebOk2z+TYf0
	kVexmayWUAx+4VDskgYaZp+OiFpO/KrYSTTAXNuHKFerXTnCYlO9N4zqfcaPekMMcAKjaQC6hQ1/U
	NLHwPsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9tk-00000009s7t-3JQv;
	Sat, 03 Jan 2026 22:15:00 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9th-00000009s7Q-3SzP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 22:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767478494; bh=+++SixFN2dXkNl6evCsHoVjFXSkSy5ytKxka2Y6aKkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijdVh3Emsq1dNxVLXY3UVu3xAan4Bb93QrXDZ/Ol1rMhj09yF136cxffXRbLrfwjv
	 PXD6wkwTeXejyGWoosTz9GXDOUdeGNQuYiTsdZWvMCZBeUxfveVhaVVJtBBOqByEOu
	 adBi24qVCaAyYertWXII8MTYNhyZSe9lycxWJEfkGfHfGUPG+Q6CXU14pw8EhTOlo6
	 yFnT1k6768+oJelZuOwXtWdM2EpD+Ix3D8YbJl0imr75N1zE2UEudUKOy86T0IjsDH
	 J/ZzpO2ao5+QpUvDZ38aYN/PiRkZYUZHR6HVxOvXC7GhhHdz7Lpt0829KcevmaHHkR
	 55rdvW8/lmB8g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id E6BFC3E9E05;
	Sat,  3 Jan 2026 22:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767478493; bh=+++SixFN2dXkNl6evCsHoVjFXSkSy5ytKxka2Y6aKkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BXB0pKfVHiBD0myRsxR3DCF2NPycISL+FKUsFiqVJ/l2r5+LKCr1rBfq6HPeUw4Wl
	 AJGjnr03LoRpi40K9q3UZvSnhFyGFv7q4MmI3CCTrqZJ5jAFim4uamfNr0f1jDO3PN
	 Beao8NiHT3xPn7YkWUg/bSj35malukkcavBNGOLy1kTmNmjsQT4zzJlyyYl3FwDM4X
	 AiPLr9BcNp0K2icWCSkHkTl/8ZxvVyqzOqPQsWTCsgp1QANPMQ9Rn41U6RmVXW3iH4
	 +3Xo51/LLanpZY5AUFC+b11ByHH32MUwvnm2PNX+SEymc9G9985/Oav/9wbwSYft1k
	 cuQRofugWPpnA==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 891A23E9B45;
	Sat,  3 Jan 2026 22:14:53 +0000 (UTC)
Message-ID: <28841a34-eee6-46fc-97de-27e4b9c0d0bc@mleia.com>
Date: Sun, 4 Jan 2026 00:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: nxp: Add a simple NXP LPC32xx socinfo driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260101235647.2411062-1-vz@mleia.com>
 <20260101235647.2411062-3-vz@mleia.com>
 <accb4ab1-07fa-4e33-a74c-2c588ca415ac@kernel.org>
 <eb9ef21a-c0b4-4c8d-b1b1-6c76f45c53aa@mleia.com>
 <1eef3c49-83a7-48d4-96ad-ffb71df2be7a@kernel.org>
 <1a336af6-6c27-4211-9c8c-ede4d091eb17@mleia.com>
 <a77325ae-fc53-4554-a7d8-3bdd841e1065@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <a77325ae-fc53-4554-a7d8-3bdd841e1065@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260103_221453_963060_5C857AA6 
X-CRM114-Status: GOOD (  15.90  )
/bin/ln: failed to access 'reaver_cache/texts/20260103_221453_963060_5C857AA6': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_221453_963060_5C857AA6 
X-CRM114-Status: GOOD (  19.51  )
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

On 1/3/26 14:43, Krzysztof Kozlowski wrote:
> On 02/01/2026 14:21, Vladimir Zapolskiy wrote:
>> On 1/2/26 14:54, Krzysztof Kozlowski wrote:
>>> On 02/01/2026 13:36, Vladimir Zapolskiy wrote:
>>>> On 1/2/26 11:58, Krzysztof Kozlowski wrote:
>>>>> On 02/01/2026 00:56, Vladimir Zapolskiy wrote:
>>>>>> Add NXP LPC32xx specific driver to get unique SoC ID from System Control
>>>>>> Block registers and export it to userspace.
>>>>>>
>>>>>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>>>>>> ---
>>>>>>     drivers/soc/Kconfig           |   1 +
>>>>>>     drivers/soc/Makefile          |   1 +
>>>>>>     drivers/soc/nxp/Kconfig       |  16 +++++
>>>>>>     drivers/soc/nxp/Makefile      |   2 +
>>>>>>     drivers/soc/nxp/lpc32xx-soc.c | 114 ++++++++++++++++++++++++++++++++++
>>>>>>     5 files changed, 134 insertions(+)
>>>>>>     create mode 100644 drivers/soc/nxp/Kconfig
>>>>>>     create mode 100644 drivers/soc/nxp/Makefile
>>>>>>     create mode 100644 drivers/soc/nxp/lpc32xx-soc.c
>>>>>>
>>>>>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>>>>>> index a2d65adffb80..c21b0d2f58fc 100644
>>>>>> --- a/drivers/soc/Kconfig
>>>>>> +++ b/drivers/soc/Kconfig
>>>>>> @@ -18,6 +18,7 @@ source "drivers/soc/loongson/Kconfig"
>>>>>>     source "drivers/soc/mediatek/Kconfig"
>>>>>>     source "drivers/soc/microchip/Kconfig"
>>>>>>     source "drivers/soc/nuvoton/Kconfig"
>>>>>> +source "drivers/soc/nxp/Kconfig"
>>>>>>     source "drivers/soc/pxa/Kconfig"
>>>>>>     source "drivers/soc/qcom/Kconfig"
>>>>>>     source "drivers/soc/renesas/Kconfig"
>>>>>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>>>>>> index 47a3925ff84c..a04c21a8a5a4 100644
>>>>>> --- a/drivers/soc/Makefile
>>>>>> +++ b/drivers/soc/Makefile
>>>>>> @@ -24,6 +24,7 @@ obj-y				+= loongson/
>>>>>>     obj-y				+= mediatek/
>>>>>>     obj-y				+= microchip/
>>>>>>     obj-y				+= nuvoton/
>>>>>> +obj-y				+= nxp/
>>>>>>     obj-y				+= pxa/
>>>>>>     obj-y				+= qcom/
>>>>>>     obj-y				+= renesas/
>>>>>
>>>>> Missing maintainers entry.
>>>>>
>>>>>
>>>>>> +
>>>>>> +static int lpc32xx_soc_probe(struct platform_device *pdev)
>>>>>> +{
>>>>>> +	struct soc_device_attribute *soc_dev_attr;
>>>>>> +	struct device *dev = &pdev->dev;
>>>>>> +	struct soc_device *soc_dev;
>>>>>> +	struct regmap *scb;
>>>>>> +	u32 serial_id[4];
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
>>>>>> +	if (!soc_dev_attr)
>>>>>> +		return -ENOMEM;
>>>>>> +
>>>>>> +	soc_dev_attr->family = "NXP LPC32xx";
>>>>>> +
>>>>>> +	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	scb = syscon_regmap_lookup_by_compatible("nxp,lpc3220-scb");
>>>>>
>>>>> This is undocumented ABI.
>>>>
>>>> What is the expected level of documentation for syscon?
>>>
>>> git grep nxp,lpc3220-scb
>>>
>>> gives me 0 results.
>>>
>>> Documentation is supposed to be in this patchset. If it is not, you have
>>> changelog part to explain dependencies and unusual things.
>>
>> The documentation is under review, as a DT maintainer you are in To: list
>> and should have it in the mailbox, for anyone's convenience the dependency
>> is mentioned in the cover letter to this changeset also.
> 
> There is nothing about dependency and nothing about binding in the cover
> letter, so no - this is not explained nowhere and must have been explained.
> 

If you do not find the asked information, then let me repeat my question, what
dependency or information does this changeset miss? What "undocumented ABI"
you'd expect to resolve?

Intentionally the driver works without a present "nxp,lpc3220-scb" compatible
device tree node, anyway, since it's mentioned in the driver, such a device
tree node is described over the link to another changeset.

-- 
Best wishes,
Vladimir

