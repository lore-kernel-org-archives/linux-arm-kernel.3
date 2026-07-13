Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzuuxmp72NuhJEhbTzDtqUQgRFFTEExkan/H+uaUpHI=; b=cnhMNiS72hpztcoprtABzsTCL2
	tTbu7QcSfSKHyzDWTMEzS/JSGg5FO8bAQPBjf3NL9zf+oxzKMzmFa0Ade/+tNu8SM6voVP+UOEmX1
	0o/qUHELpZeOcUvLfd2SWkl9ZHHv7TFr8mmCyZNUr+dud1vz44t4jEUxJToL7bota7L/Ye/QXC23Q
	F+tTQsc89QvwAgzUYTT6ZwFWkiqLXLWw1TWLMR9ZDtjvJhENd4b2qGwxHmbAaMkgOIpWjWXthnj/J
	bLJI9ZTWu2ruuIPbPOXZoqinXQMBxKpfpUWlYxA6/alBMjMECmeteL/GY0L2rcg6ZkcrIwiOC9y3X
	OSMsCYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBlU-00000008XZA-2DR9;
	Mon, 13 Jul 2026 08:11:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBlR-00000008XXb-3Z7g;
	Mon, 13 Jul 2026 08:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783930302;
	bh=nekH3c8fOVjXzri9HMJDZCZ+Cs7MULnXoNr/TShtOno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zons0NaZRFePVu2AFie0jHRJDaSl8nVZRnppWW3K5rXuujeJq89RNEwiLr+W4Ez1n
	 XqNQ9w7ETzBiN4jiaaKGFgK2J05DcFbj1EsTEnklxVGNSnDxjIwODNoCiu5eeib+eP
	 iBEnixp/SEl43F90hI/BEJoKIiKEk2YrZjiPEKZMHcH9c/Ts2Rv5AQD6hIbA1vRRDY
	 AKeCIlt+n9ubbCUY9L1rCtwStMnkfmU8+2OsMTAqcG+ZZIY6mebedYjlWgaDwHygf1
	 1rrT+Qq0g2UhQleHWRQI7hCZT8ZruH9g6YS35nhGmJuV99XAluti273G0joQA26vBQ
	 XbymhUnq3Ec7g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C6B317E07AA;
	Mon, 13 Jul 2026 10:11:42 +0200 (CEST)
Message-ID: <c11705b1-fc46-440b-a27e-0cc38f3b2d69@collabora.com>
Date: Mon, 13 Jul 2026 10:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] AUXADC driver for the MediaTek mt6323 PMIC
To: Jonathan Cameron <jic23@kernel.org>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
 <f2d5801c-1d12-4a61-ac23-aa24dfd0ee5c@collabora.com>
 <20260710005424.5c559b5a@jic23-huawei>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260710005424.5c559b5a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_011146_045099_EB548C5B 
X-CRM114-Status: GOOD (  11.95  )
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

On 7/10/26 01:54, Jonathan Cameron wrote:
> On Thu, 9 Jul 2026 13:33:46 +0200
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 7/9/26 12:52, Roman Vivchar via B4 Relay wrote:
>>> This series adds support for the 15-bit AUXADC hardware block found on
>>> the MediaTek mt6323 PMIC.
>>>
>>> The previous version of the series for all AUXADC, EFUSE and thermal
>>> drivers was split after Krzysztof's comment [1].
>>>
>>> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
>>> mt6323.
>>>
>>> [1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6
>>>
>>> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
>>> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>>
>> Whole series is
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Cheers,
>> Angelo
> 
> As noted on discussion of previous version. I picked up the IIO side of things already
> so I'm assuming nothing else for me to do here.  Shout if not!
> 

You're assuming right. I should've replied with R-b only to the last two patches as
it's too late for this on IIO - it's fine! :-)

Cheers,
Angelo

> Thanks,
> 
> Jonathan
> 

