Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609AACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43iIkeP3IBvlyqQjDT/xIhsEmGqSndDjZxKjgeLqAdc=; b=ld4w7bqUE9LQBZP4eofKi3W1D2
	VGjcLe1DZrS/jB1U7hskG55iUDE4xH35/B3uJyHpRC15ADFkDGCD8v+Ibwj9f9swvwMr5QLgHNh84
	niIoppmAXDC9nQL0k5wiNNl76nGYv8z87ZW2ETq/w/E96OEcpHN8SYnt9ieky7obDmg51gQIJEqWG
	D1rY2T0K34PbyFGf3Msq4nRstWStSlbPilHqOieNcxjtoaRHSFAzpW6GboF+Tp75e3BHz8ouWU/E9
	3UVk2a/yJFHWIRktSv1pWYVGzjir21suWw7y7cXu8bxexHcLWgX0448XuW44HkaASpp5BG85oQf7v
	KTYje3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLc4-0000000Ch5N-22u7;
	Mon, 11 May 2026 08:03:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLc2-0000000Ch4G-1GTJ;
	Mon, 11 May 2026 08:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778486614;
	bh=OOD9ejGOq1GD23MKZbk3wWbT69dIL2i532BvtjlqEA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f/doleWfbDXAM+7D0dCxYoFGCSg3KnthDXDoMsGPNoO3k35eOH4dooG6z9nefPe4m
	 86J4pMorgiQXIkBkd21pAlpC2AeiUWpjcf0stP7przS5L5MLautRM62dNU9EbOoPn/
	 SoTri/wqpYBMsDiBvaKFSw2RZrAFAnP7bwk8ZIEjqlVXYrmIZECyBbiK62sbV4yo84
	 YDUTGNXVu+HFsVE3vwfEaToC6nxAlb5euL0wtj2mpqmagLim1Nrhyleipt57V5yvag
	 UNwpGmlc9xOgcDCR8P1sRCuOfaN6TmGPjcJm5J9rl/2qT/cA+9kFKfGFPdv9zu+ixJ
	 ZftEEEt9NS3Bg==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 44E1E17E1004;
	Mon, 11 May 2026 10:03:34 +0200 (CEST)
Message-ID: <57c8310f-c972-40b2-96ed-90358d96b2ac@collabora.com>
Date: Mon, 11 May 2026 10:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/5] Add support for Verisilicon IOMMU used by media
 codec blocks
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: will@kernel.org, robin.murphy@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
 <33nsz23rcstwznq6dnsuibndbwtoc767evshltj35kgysdg63r@fxhwobu53cww>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <33nsz23rcstwznq6dnsuibndbwtoc767evshltj35kgysdg63r@fxhwobu53cww>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_010338_523533_0A4135B7 
X-CRM114-Status: GOOD (  10.24  )
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


Le 11/05/2026 à 10:01, Jörg Rödel a écrit :
> On Wed, Apr 15, 2026 at 09:23:36AM +0200, Benjamin Gaignard wrote:
>> Benjamin Gaignard (5):
>>    dt-bindings: vendor-prefixes: Add Verisilicon
>>    dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
>>    iommu: Add verisilicon IOMMU driver
>>    arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
>>    arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
>>
>>   .../bindings/iommu/verisilicon,iommu.yaml     |  71 ++
>>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>   MAINTAINERS                                   |   8 +
>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
>>   arch/arm64/configs/defconfig                  |   1 +
>>   drivers/iommu/Kconfig                         |  11 +
>>   drivers/iommu/Makefile                        |   1 +
>>   drivers/iommu/vsi-iommu.c                     | 796 ++++++++++++++++++
>>   8 files changed, 901 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>   create mode 100644 drivers/iommu/vsi-iommu.c
> Applied to the new verisilicon branch.

Thanks a lot.

Regards,
Benjamin


