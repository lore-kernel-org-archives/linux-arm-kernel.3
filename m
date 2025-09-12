Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166A4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/J7XLbz8NegWtic5LkF+n+Z4Y9heXSbG1y59WwsLwI=; b=YzChqQEOAIKCQ+iDx3klw9C9PL
	PQ8HXiV2Ao3AMQ1mdW/eE96ubOLwTg8RNipVCObYbEvx7E0NrDmIuaFB4D5sljMt+PpGAJoY5S7dt
	5DYKABdonXlkRxtlEg5Qqi2oBCF2k7cU0FBuxldBii7LPcQXtxmddbJKj8b0DKOXcpYC8shf0Q0DI
	A9U+SNic4JYuIb3JFeLz748fkuQw928cjSgEW7HHAduD1ghJ8qExy2WnYpE6OkmVD+aWvFvqFeoqX
	nfmXxeDdtL9atA0R3HQ6vM/GW0rQHUdDxdj0k8IpThdHrF95dtmtKaSRPo/GwCBYsPzzkG+7phdsk
	zyimt7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzb3-0000000848P-48DL;
	Fri, 12 Sep 2025 08:57:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzb1-0000000845A-20vF;
	Fri, 12 Sep 2025 08:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757667449;
	bh=ZIYDSt04Y1IRNtggUK5RxE83YKlG/z5W58KhYO8o8as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dx8eZ1GRFH4rmvamm7zkNfQA8c7ZbEL7CoKMHnb1FM1odU3jGAQcvvDU6LvK/yavb
	 QESmSjQ81cxHGMLDBY+He03WwTsn8/GFbH+kdkpeopTRFB1tJbLZMuHvt4EecCkaEn
	 zyBd29qeDnJS/nSkBt33ltxhFBt1blYmQrmgG6mmMLtFMvnbZ13geDBf//Cl3SebBc
	 +gr/UneA+XwL7n/qMMm4GnxjH29WnMLE2rY5gAVwqUQdKpEve3WF6YFXPeT3TwDyEC
	 EnwBu8c3aPtv8ou5BN4b6A0B5K3fJztjXilvoXyQTJuIppH8JxMNn4T9YlBLy2vo/p
	 10BmOVnNGem+w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB18D17E127C;
	Fri, 12 Sep 2025 10:57:28 +0200 (CEST)
Message-ID: <9bb0fb8f-220c-4edb-9896-cc36f669624a@collabora.com>
Date: Fri, 12 Sep 2025 10:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
 <CAGXv+5F=uPnzrpDtPXc2ipwp5AhiEwGdxhuhPtjwWhAxWJMc_Q@mail.gmail.com>
 <6037201a-a13f-4a3d-9377-3f9f91e78773@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6037201a-a13f-4a3d-9377-3f9f91e78773@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015731_689765_2BA7A1EC 
X-CRM114-Status: GOOD (  15.90  )
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

Il 12/09/25 09:11, Matthias Brugger ha scritto:
> 
> 
> On 11/09/2025 07:23, Chen-Yu Tsai wrote:
>> Hi,
>>
>> On Wed, Sep 10, 2025 at 11:04 PM Matthias Brugger
>> <matthias.bgg@gmail.com> wrote:
>>>
>>> Hi Arnd,
>>>
>>> can you please have a look on the following patches.
>>>
>>> Thanks a lot,
>>> Matthias
>>
>> I still have some patches outstanding for some time. Could you perhaps
>> take them as well?
>>
>> [PATCH v2 2/2] arm64: dts: mediatek: mt8188: Change efuse fallback
>> compatible to mt8186
>> https://lore.kernel.org/all/20250610063431.2955757-3-wenst@chromium.org/
> 
> Queued now for a possible 2nd pull request.
> 
>>
>> [PATCH] arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
>> https://lore.kernel.org/all/20250812090135.3310374-1-wenst@chromium.org/
> 
> Queued now for a possible 2nd pull request.
> 
>>
>> [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
>> https://lore.kernel.org/all/20250814092510.211672-1-wenst@chromium.org/
>>
> 
> Queued now for a possible 2nd pull request.
> 

Matthias, since you're managing this pull - can you please grab the patches that
are relevant to our trees from my sanitization series?

https://patchwork.kernel.org/project/linux-mediatek/cover/20250724083914.61351-1-angelogioacchino.delregno@collabora.com/

Thanks,
Angelo

> Thanks for the heads up!
> Matthias
> 
>>
>> Thanks
>> ChenYu
>>
>>> ---
>>> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
>>>
>>>     Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/
>>> tags/v6.17-next-dts64
>>>
>>> for you to fetch changes up to 12a565af705542c4380e95f4e3a505a2c25ad754:
>>>
>>>     dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:16 +0200)
>>>
>>> ----------------------------------------------------------------
>>> mt7988 (bpi r4):
>>> * enable network
>>>
>>> mt7986:
>>> * add dedicated sram node
>>> * add interrupts for RSS to ethernet
>>>
>>> mt7981:
>>> * add thermal sensor and auxadc nodes
>>>
>>> mt8395 (NIO 12L):
>>> * enable UFS
>>> * add gpio keys to the PMIC
>>>
>>> mt8195:
>>> * drop reset for PCIe device
>>>
>>> ----------------------------------------------------------------
>>> Aleksander Jan Bajkowski (1):
>>>         arm64: dts: mediatek: add thermal sensor support on mt7981
>>>
>>> Frank Wunderlich (7):
>>>         arm64: dts: mediatek: mt7986: add sram node
>>>         arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt names
>>>         arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>>>         arm64: dts: mediatek: mt7988: add switch node
>>>         arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
>>>         arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
>>>         arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
>>>
>>> Guoqing Jiang (1):
>>>         arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0
>>>
>>> Julien Massot (2):
>>>         arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
>>>         arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
>>>
>>> Mateusz Koza (2):
>>>         dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
>>>         dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
>>>
>>> Rob Herring (Arm) (1):
>>>         arm64: dts: mediatek: mt8183: Fix out of range pull values
>>>
>>>    .../devicetree/bindings/arm/mediatek.yaml          |   2 +
>>>    arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  31 ++-
>>>    arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  20 +-
>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |  11 +
>>>    .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
>>>    .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 +++++++
>>>    arch/arm64/boot/dts/mediatek/mt7988a.dtsi          | 285 ++++++++++++++++++++-
>>>    arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  14 +-
>>>    arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  14 +-
>>>    arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   3 -
>>>    .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  46 ++++
>>>    11 files changed, 508 insertions(+), 23 deletions(-)
>>>
> 


