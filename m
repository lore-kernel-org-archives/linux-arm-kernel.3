Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 18:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/bPTGdNu/VCIF/C1HlSGIkuh1JalLVyfWkJt4YnQhM=; b=FYQAIoZBc8aMA4aA8vK868NZva
	5J04zxliGQzY0UjM52q/I8pkKKNENAKs1ZL57yX+wlNfY51zfnYr5jPkOudJhXahXYKOBfbtAT5np
	I81sn78ytdh7eeemVf3SXRAEbDxN8MTnh2AS6kJ0SnNrFmJ/RLv82SkY2LyA54wvldlqzijPxQzXb
	z2GDxEcAW9iuas77WXoWqWfmlcmxfVEwTOhdaXAO+s44Cb4rhGHeK59ScHVtD+0iVoMgBNmyLSyvV
	d2dD/fRVu4Wg+m5PE1ZBwEqpjdpz6DKbl+D1GygMi6ohZceS3loFfHi9Oefk8fnqrziT921XafQFa
	gmcMwi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiysS-00000007gBN-0DXY;
	Sun, 12 Jul 2026 18:26:08 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiysP-00000007gAS-0Bso
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 18:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783880763;
 bh=j/bPTGdNu/VCIF/C1HlSGIkuh1JalLVyfWkJt4YnQhM=;
 b=Ze5aHuMK/G7G0wZ0A0p7OMuWTowH1H0CU8/S7X6ri5xLbN516DRwC0lsxxN1A3wFykx/MEaqM
 Mqjrij6QFjAm0EmLBE4qyNk/rkzXl4n2ka4mg5tTNr8HxXIAiamabJvVYU7/EU1G+aEmpX40X2p
 Ro2+/DJRe3GRNLEmjEbgHmMhhr+6e6n4mJtLenXriXCqOYcXYq30nY5RKtF0o9amSWOE2FOOOkQ
 38ECxIMmw3hXhJ+vUpm+VTB4a+8tWLcAS9jNh6Nqe10FXaDDZzxTwxslTaYNVHB7Jzz5oWUwYEo
 4/dPlLcFo2+ZtrkaPcrL7cIQawId1ua4fVM6GEyiLaUw==
X-Forward-Email-ID: 6a53dc3854fefa5949cb32c4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <854bc3d0-2fb2-4e2b-ad08-0f5ee225d977@kwiboo.se>
Date: Sun, 12 Jul 2026 20:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <ce54c773-22cf-43d2-b831-1ea5355359ca@kwiboo.se>
 <CAPSPb=vyKK3ngm+d+nN7KM20ZyA10Hg5cb8EarRF6SE4hLOWFg@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAPSPb=vyKK3ngm+d+nN7KM20ZyA10Hg5cb8EarRF6SE4hLOWFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_112605_113827_D27DF95D 
X-CRM114-Status: GOOD (  19.36  )
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

Hi Joachim,

On 7/12/2026 8:00 PM, Joachim Eastwood wrote:
> Hi Jonas,
> 
> On Sat, 11 Jul 2026 at 01:36, Jonas Karlman <jonas@kwiboo.se> wrote:
>>
>> Hi Joachim,
>>
>> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
>>> This patch series add support for the NanoPi M6. This board is very
>>> similar to the NanoPi R6C and R6S boards which are already supported.
>>>
>>> Main differences:
>>> * M.2 M-key slot with PCIe (Also present on R6C)
>>> * M.2 E-key slot with PCIe and USB (from hub)
>>> * 1 additional USB 2.0 port from an on-board USB hub
>>> * RT5616 audio CODEC
>>>
>>> Patch 2 and 3 moves a bit code around. Please let me know if those two
>>> should be squashed together.
>>> Next few patches adds some missing bits the common nanopi dtsi file.
>>> While the final patch adds support for NanoPi M6. Support for M6 has
>>> been split into two files one dtsi and one dts file. This is to make
>>> it easier to add support to the new M6V2 board at a later stage.
>>
>> In my personal opinion I think it would make more sense to sort
>> patches in following order:
>> - adding/fixing missing bits to the common nanopi-r6 dtsi
>> - extract M6/R6 common parts from nanopi-r6 dtsi to nanopi dtsi,
>>   nanopi-r6 dtsi includes the nanopi dtsi and no changes to dts files
>> - final parts that adds the M6 board
>>
>> Should probably make it a little bit easier to cherry-pick and bisect.
> 
> If the additions/missing bits needs to backported I agree.

There are consumers of DTs outside of Linux, e.g. U-Boot, that may
need/want to cherry-pick patches/fixes, so such ordering should likely
help for such use-cases.

> I'll cook up a patch set with the order you suggest. Thanks for the feedback.

Sounds good, thanks!

Regards,
Jonas

> 
> 
> best regards,
> Joachim Eastwood


