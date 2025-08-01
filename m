Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79483C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 04:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cazfz037LmHclW8XHXBHFZq0vEjND40W4TWSxFvy07E=; b=qL77NBrKcNLQuw
	E2WkqPs1s4TakxGbD+lJeQ108eNS+cQOuIuQxf0lBpMYS9Sn1AYTIghMtQwumwzWAE+yMv/sN8H73
	Uw16XCpWK8YWOe820vD4mOOs9FJqzs5B9ZXG+chawmPO5vFmCC0w21h9jXJxsnIHHGjztwz0puqej
	9DKm677YkJdDMjs8CasXm/xplUGuUnEfnjFQ1mpMlneGzt5cXshdCVgEKgbgnxG9ZfB/MYBiZSZia
	15IK9qgiJreDmXMfiCB9reO6FmFe4pAm+hEdH4TpUgN7/DbNQGVqKfZK6cAO0KbiNNEDv+ASZPbR7
	dtcmZm7XJ5Iq64PWuNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhjH-00000004yvP-14M9;
	Fri, 01 Aug 2025 04:50:51 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhheF-00000004yRh-1EGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 04:45:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F28EA1038C126;
	Fri,  1 Aug 2025 06:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1754023534;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cazfz037LmHclW8XHXBHFZq0vEjND40W4TWSxFvy07E=;
	b=gz+Z5D+i9YMV7qtc9jV2wB6l2n5mM6a5kkQ8N5Nrm4TkChr51IhcMCajFKXKFKQIDQsjt4
	ShW3SLCe9XFh86uBmcTWkbHL2WbZATD/fRJZArT33UNgyIIrrdu4BBXN/LgGL0EgOfgJKe
	kpEJ1HUwHN3gjuI/8WQAdhOM6WfrmJD3mlm/T+2Wss+jq3N+L3LfjcIxIipHcGxUU/MI2m
	r1YZkcuFOuap5h6DZ3ytvYUiNMClLZyFlPKjbZO5LgT7qxUlivfIemKy9HNtBkvFhAx3cc
	0IBrCFR61MfOwW9lvrYnv978S00+JLzejurw223yvP9RyOXsg3NBCeigGls2Sw==
Message-ID: <0c6dcc6f-e09c-266d-f65a-12d18244a2c6@denx.de>
Date: Fri, 1 Aug 2025 06:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: (subset) [PATCH v1 0/3] spidev: introduce trivial abb sensor
 device
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrei Lalaev <andrey.lalaev@gmail.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
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
 <2e9c96c6-6dfb-4232-a9ab-a3e78b718fc2@roeck-us.net>
 <20250722112013.0000597e@huawei.com>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <20250722112013.0000597e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_214540_438975_A5CBA0DD 
X-CRM114-Status: GOOD (  23.02  )
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
Reply-To: hs@denx.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Jonathan,

On 22.07.25 12:20, Jonathan Cameron wrote:
> On Mon, 21 Jul 2025 21:58:10 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 7/21/25 21:05, Heiko Schocher wrote:
>>> Hello Krzysztof,
>>>
>>> On 21.07.25 18:24, Krzysztof Kozlowski wrote:
>>>> On 21/07/2025 17:56, Mark Brown wrote:
>>>>> On Sat, 19 Jul 2025 08:33:51 +0200, Heiko Schocher wrote:
>>>>>> This series introduces the changes needed for trivial spi
>>>>>> based sensors from ABB, currently operated from userspace.
>>>>>>
>>>>>> The last patch adds the spidevices to the DTS files, already
>>>>>> in mainline.
>>>>>>
>>>>>> make dtbs_check showed no errors/warnings for the dts files
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Applied to
>>>>>
>>>>>      https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
>>>>>
>>>>> Thanks!
>>>>>
>>>>> [1/3] dt-bindings: trivial-devices: Document ABB sensors
>>>>>         commit: aad2f87cbcab56b322109d26d7b11842a09df91f
>>>>> [2/3] spi: spidev: Add an entry for the ABB spi sensors
>>>>>         commit: d60f7cab7c04944a79af16caa43c141e780a59c6
>>>>>   
>>>>
>>>>
>>>> That's unexpected, Mark. Patches received two objections/comments and I
>>>> don't think discussion was resolved.
>>>>
>>>> ABB is huge company, probably making hundreds or more of sensors. The
>>>> patchset basically claims that all of them work with spidev. It does not
>>>> providing any model names or details, so it seems really incomplete to
>>>> call them trivial devices.
>>>
>>> I do not know how many different sensors they have, nor if that department can
>>> speak for the whole company...
>>>
>>> What I have as information is:
>>> https://lore.kernel.org/linux-spi/2477dc64-92a0-9dc9-d168-56646d0d796e@denx.de/
>>>
>>> and I get no more information about them currently. May I should
>>> add some sort of trivial into compatible name? Something like
>>>
>>> "abb,spi-trivial-sensor"
>>> or
>>> "abb,spidev-trivial-sensor"
>>>
>>> which makes it clearer, that only ABB trivial sensor, controlled through spidev
>>> driver, is connected here?
>>>    
>>
>> FWIW, I always thought that devicetree is not supposed to contain such generic
>> information. Is it even appropriate to list something like this in devicetree
>> in the first place ?
>>
>> If so, what prevents anyone from submitting hundreds of
>> "<company>,spidev-trivial-<device-type>" entries, using the same line of argument ?
> 
> Agreed.  These should have separate compatibles based on what any OS etc
> might want to bind to them.  Just because their model in Linux is spidev etc
> that shouldn't mean a generic ID is appropriate.
> 
> Can we at least have some examples to motivate the discussion?

I am sorry, I get no more information about the sensors... even I do
not know the count of variants. What I can say is, that this sensors
measure gases, and are only used "internal" on the aristainetos3 carriers.

So a proposal would be:

# ABB gas sensor on aristainetos3 carriers
compatible "abb,aristainetos-gas-sensor"

bye,
Heiko
> Jonathan
> 
>>
>> Guenter
>>

-- 
DENX Software Engineering GmbH, Managing Director: Johanna Denk, Tabea Lutz
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

