Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCEECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uDgRhEd1cMoQ+4VuHNdQNIeoyBkNyx/KnK2q2EZqck=; b=Ztw2V1MPP/gAduCxaZ4nYgAwsS
	5DZa7HHyh3358loZilIK3OlvJ+iaSwE8yUoIeBcfr2TiXzkrtv3DcJjDxfka5Exp0Xv0AK+V60+Oo
	/ChG6wKbRA1E3FEIr5V3NWxeLOJHbXpqmFVIcDw0UNo4yoTbRf3pOViSkcPIdJsvqTqHJQ/4FfF+f
	bdAgo7/TJCDbkrtbMASAJdE/xNZjddGdJFNm8gTGWAN/j91CqqQeF7B15RBITk8pb6ynvmiA0exwK
	HD3ewKfe59/Pht9B38hAE/CPwe+ZvzP4R4Jgg5vfqqnv17IdEzDwI80zNsX8RM6AKKlwOv5Ew3dyz
	kbny/pIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGcJ-00000004fdN-3fHU;
	Sat, 16 Aug 2025 13:06:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGIg-00000004dRF-10bU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBA1F4425A;
	Sat, 16 Aug 2025 12:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE38C4CEEF;
	Sat, 16 Aug 2025 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755348380;
	bh=YIGRcpBKVSSbM4vhzjYUZ4rzj2zEpXTZdKsxWCTrydc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QxnvmtVaUoGix95WDvdsuYeNUJl3WU2vXIC4UUkmEeSa39NseZlB70eHFx9XjhDcl
	 8wQdHjS5JGap/bWMaBu/Fe4ANhKQ0F71KMHia/5ROCjFbS2XOT95s+QSIJVMh1R1H5
	 0j6mgAmQ/giXKY2jSaOyaWMgEHdgfVIeG3jwKM7qOCOTLxWp6Dqq0LB2wUyvI+OzFp
	 KZgEEVBSLnETkxjQB229uVD7NAcLxMV8hFNlQdx1Tn3+qLZqLSEYtklDlqRvBlhtgS
	 LKVBYAonxROCiEP2CaQ2RymY4XUZHz27rcFS64n7v9rhYeKqKc5DnKdxOSGftlts1I
	 5Wttb4V69sZhQ==
Message-ID: <620292ee-46c7-4b9c-9047-86f8c771384a@kernel.org>
Date: Sat, 16 Aug 2025 14:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Apple SMC RTC
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
 <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org>
 <074fcd4c-0da8-42c4-a567-64fa7e173894@kernel.org>
 <20250814211928.GA3922106-robh@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250814211928.GA3922106-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_054622_305926_ABF6F6A6 
X-CRM114-Status: GOOD (  12.64  )
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

On 14.08.25 23:19, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 08:14:51AM +0200, Krzysztof Kozlowski wrote:
>> On 12/08/2025 20:25, Sven Peter wrote:
>>> +maintainers:
>>> +  - Sven Peter <sven@kernel.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: apple,smc-rtc
>>> +
>>
>> No resources except nvmem? This should be folded into the parent. Don't
>> create device node to instantiate drivers.
> 
> Well, the reboot node has nvmem entries too, so probably better to keep
> this as child node.
> 
> Is there more functionality planned/needed here (for the mfd)? If so,
> please send it all at once. One child node at a time makes DT
> maintainers grumpy.

I'd very much like to avoid that!

There's one more driver (hwmon) that needs another child node and two 
more sub-devices that don't need any or expose any resources (hid for 
the power button and power/supply for batteries). I've talked to James
(who wrote hwmon) and he's going to submit the hwmon series together 
with at least rtc (and hid) so that you can see all additional bindings 
at once.


Thanks,


Sven


