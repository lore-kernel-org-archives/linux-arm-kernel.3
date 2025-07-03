Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF6DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfNOEXFcSstuYTvRxWMhqujfFeYbMs3FCFiKY+D0k9s=; b=4XzvCK6KTwEHaMZG5+P0CpHy9r
	Mf4Apege+kzoEwCj/34lmm76cY0zQEyjrQYHaShLxRTHUnDF9C8uKfrTdVd+pqwD2Uzlo3fRTxlkF
	bTOzEBvB4InW3s0WK2h4/sPT0FYx5YZdRQtwafhWM1zvDCZOWxKfZlns0t+liWHknqgtFMz9RYAKY
	41ViYCKAQqQZK+DUZBs4EI21GBbsFqLyBXBpFMEqP/Vd2oBmoKYssnSEzdHNMOC4OKo97Fo1ruOQN
	E5z571adEof/KddpiTYqmEofbnAVaiWbU3b92KeThGt1uS0CO7J5zxxNnBTaRMRv4XH/DRduKHRKX
	Z3IHEpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJW0-0000000BPgs-3Z1T;
	Thu, 03 Jul 2025 12:58:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIQx-0000000BDJh-1Hg9;
	Thu, 03 Jul 2025 11:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543333;
	bh=A20LFGjNp+gZfOV/c+s4NxwTMpmAgEjZ3epNnBK6ubI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pYmAqzRKKwXxndgRMsp7Ue/kMz/YJIN4bFZKXJxaUMrQGS/f/MO1aa22l3DVpB3is
	 Vk284nYKACgB0LiXWw3JEWGv+5dQFVHDdQMRzmQ8jitoYGGc7W7QMMxGriePUGgMQz
	 fl30PmBCXWuFgu8ULKXUokZhiDDvrXUKvliRf/kuBgw46dbtw7JCZ4bMm9Lo51lRcQ
	 mFmf6uWIW4HawaDXDILRmBNYHoQITYS9Lv7Ejg4v44N2hmhvWQzZGgboKzoP+ple4X
	 BPP4rIoPMxtmW6LHwp5yK9CejrlKQeXwnntJvE0vqJn044Xj9IUlHn03znwAnkAdrs
	 MpozlXGbRJx8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CD5D17E07FF;
	Thu,  3 Jul 2025 13:48:53 +0200 (CEST)
Message-ID: <5ee16a72-01a0-4f2c-9bcb-e4b4b069b2dd@collabora.com>
Date: Thu, 3 Jul 2025 13:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin
 post-processing
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
References: <20250610063431.2955757-1-wenst@chromium.org>
 <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_044855_515706_76A2919B 
X-CRM114-Status: GOOD (  17.09  )
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

Il 01/07/25 11:15, Chen-Yu Tsai ha scritto:
> Hi Angelo,
> 
> On Tue, Jun 10, 2025 at 2:34 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> Hi everyone,
>>
>> This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
>> patches. In v1 [1] the change was made to the driver. Angelo, the platform
>> maintainer believes the change should be made to the DT binding instead
>> [2]. v2 adopts Angelo's argument.
>>
>> Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
>> with no fallback, and MT8188 falls back to MT8186.
>>
>> Patch 2 updates the MT8188 DT to follow the new binding.
>>
>> If possible I would like to see both patches merged through the soc
>> tree once the DT binding maintainers give an ack. This avoids prolonged
>> waiting for the binding changes to land and uncertainty about whether
>> things have fully landed or not.
>>
>>
>> Thanks
>> ChenYu
>>
>> [1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.org/
>> [2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/
>>
>> Chen-Yu Tsai (2):
>>    dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
>>      version
>>    arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
>>      mt8186
> 
> Friendly ping. Please take a look and see if this scheme is to your liking.
> 

For the whole series

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Thanks
> ChenYu
> 
>>   .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
>>   arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
>>   2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> --
>> 2.50.0.rc0.604.gd4ff7b7c86-goog
>>



