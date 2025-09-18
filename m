Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD5ECAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62sFa6+r+yufK0w62YT8VZhAhdtvQALavIM3MYvS1VM=; b=xaCUvew8cgKVFRd3T8zjuakurK
	eGGkS2mf2gKy6D8YMh17A+7Y2G+bk+YPZdUkuSGvnwkJFbiQla8bnKbYx0YwsFS20hwS4OlSDtu7h
	aVEzQuWQmMSiWPksLPLMAJx/iJIb9bCpKkqpFis8DrXPMe+oTxqIsHzU0IM+c51BqhbDYHz7vWDQL
	e03u19biBytm3gQM46zpiiWIlA2gpoW6ymCEe4K1dplqhGcs3obrVpiCuUZdgrQCDmeovkVj8oUUW
	MfY92Fnc9cH/Bvo8KdZ+KGVyPhRWDKoiFUMEVSJwDlW7mcMk7lQmtstJtzTuUkbBI2j36gkDuLu9m
	8xXVmjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCxJ-0000000HEo2-1USm;
	Thu, 18 Sep 2025 11:37:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCxG-0000000HEnX-0jDx;
	Thu, 18 Sep 2025 11:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758195455;
	bh=knOqDMmCuYGf36S0XJkfDDNgqTE1JBx5Dzln83jT4MQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXkpFoO6Jxar0bWX+EQ4QLJhk81Du0l8SBBjrEAJeXv5ryrQBJZA1hcimz0grfgiv
	 +AmxfEmFyu6tuCK/TrTRWdBrBfrb2dRQ1qEZpM+Sj7DCfl7h4XkzA1unZDFvb2rCu8
	 0nJN3Ce92B2MqSPDhU+Zjs+kRYH0gMO/h4lphzKexgfwo0BesSmtnmjEkB2SObR+No
	 wm83pKSOrLeLad7DUJsv/+rJOdOsmOmHCMqMgJiJxRw4gFo+8L2HWzg+bpnoeTjlyn
	 f28tlbN8VQqJCHQQKZU6U0g3sCQPb1JwBUvC4tQqPllmQAms/StwHsZ+SzJTtvdRyK
	 n5uEKA7R527lA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 512F617E00B0;
	Thu, 18 Sep 2025 13:37:35 +0200 (CEST)
Message-ID: <b32f4afd-5683-4eec-8da7-a21a9a4950c1@collabora.com>
Date: Thu, 18 Sep 2025 13:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] Add mt8196 SMMU support
To: Xueqi Zhang <xueqi.zhang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 Ning li <ning.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_043738_369399_135F6A7F 
X-CRM114-Status: GOOD (  12.38  )
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

Il 16/06/25 04:56, Xueqi Zhang ha scritto:
> This patchset add mt8196 SMMU support.
> 1. Mediatek SMMU interrupt is low level active rather than the
> standard edge. Process Mediatek SMMU wrapper interrupt and dump
> detailed information when a translation fault occurs.
> 2. In some projects, Mediatek also have EL2 driver, so put the pm
> operation in TFA(EL3), then all the kernel and EL2 could control
> the pm. Thus implement rpm get/put function which send smc call to
> TFA to get/put SMMU power.
> 
> Xueqi Zhang (8):
>    dt-bindings: iommu: mediatek: Add mt8196 support
>    iommu/arm-smmu-v3: Add SMMU implementation
>    iommu/arm-smmu-v3: Add implementation for MT8196 MM SMMU
>    iommu/arm-smmu-v3: Add implementation for MT8196 APU SMMU
>    iommu/arm-smmu-v3: Add IRQ handle for smmu impl
>    iommu/arm-smmu-v3: mediatek: Add wrapper handle for IRQ
>    iommu/arm-smmu-v3: Invoke rpm operation before accessing the hw
>    iommu/arm-smmu-v3: mediatek: Implement rpm get/put function
> 
>   .../bindings/iommu/arm,smmu-v3.yaml           |  24 +-
>   drivers/iommu/arm/Kconfig                     |   7 +
>   drivers/iommu/arm/arm-smmu-v3/Makefile        |   3 +-
>   .../iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c  |  16 +
>   .../arm/arm-smmu-v3/arm-smmu-v3-mediatek.c    | 536 ++++++++++++++++++
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  96 +++-
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 +
>   7 files changed, 691 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
>   create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
> 

Xueqi, any followup on this series?

All of the multimedia blocks (including display) become unusable without an IOMMU
on MT8196, MT6991 and newer.

Regards,
Angelo

