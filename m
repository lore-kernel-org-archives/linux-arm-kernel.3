Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65163C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFD92AR0Y1VLqV44xiN3ErUBbtc4PokGh/PPfeg/c/w=; b=Vg8uOYym5Wa26BC85lpnetBud5
	wl7m+FAcCS2fKtDOpxhwKYA6Rz8vlL2AkZHLeLpu0u7vkkQRQbagB+z4XU87JRaHw2fTHc/gmOBdk
	T+eDvam3kkPCNYKsVujSQ72hd77XyYIYcK+skCHeZGXCJ/WpU1f1bjFztU3pCcof3bG9snlq8aofo
	/6HjcY4+OvMBq/QCJMBlsrDHY0s3Br/R2hD5+R9qgd7Nb1VLVT4vxAXiAhN8usD6DWhFtp3edCNoQ
	1KdN0j2fBmVat53gbnDvIsnEMMYqseigvmey8ryoSqXrT6xptoQDdbenv1d9kxSyyYVf2BSmPM9C7
	qxjqW8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEJY-0000000BIHM-2qgd;
	Tue, 06 May 2025 09:10:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDl7-0000000BBGP-02Fx;
	Tue, 06 May 2025 08:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520475;
	bh=DXcqPBwQKvNKiwIbf3ykHJXzbpclDBX7r/K84ILDxNU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FwumzGi+5gntUjl9VTLHeo9YpRhrQFuDo/7N9XUl4Ji4ZlM+R0JP8i7XEhW9nNc98
	 LMf9g+I2IpNLAdGHe4CnfphAHfZg/6G1OkdKxGEfgnQT0p0ygBU9XisvB3ol6dwizW
	 DJgcDM5ptXRua2KjQyEIYMtMNtbdhRmHjaXkWBHdXgg2oJvf7tT/RwKjoE4qC6jF0O
	 RnnjAqdPvduITh0qLz1dpzWBTrAf+MVqhVwf/BKg3NwgQetgE8JLomv4QmDk0tAl/2
	 FjY6s3d8o8McbGb/ir81Qbj8p9Z773VrcCXIPpMQ8CdIFurN8Jzfn36VfTKCo2ncSP
	 dVMgaJqW7eipw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48EB817E049F;
	Tue,  6 May 2025 10:34:34 +0200 (CEST)
Message-ID: <cb715936-3a44-4002-8d64-565f8d31820c@collabora.com>
Date: Tue, 6 May 2025 10:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: iommu: mediatek: mt8195 Accept up to 5
 interrupts
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
 <20250505-mt8395-dtb-errors-v1-2-9c4714dcdcdb@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250505-mt8395-dtb-errors-v1-2-9c4714dcdcdb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013437_193061_3C32C4D3 
X-CRM114-Status: GOOD (  13.40  )
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

Il 05/05/25 15:23, Julien Massot ha scritto:
> Some Mediatek IOMMU can have up to five interrupts so increase
> the 'maxItems' to 5.
> 
> Fix the following dtb-check error:
> 
> mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts:
> [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
> 
> Fixes: 3b5838d1d82e3 ("arm64: dts: mt8195: Add iommu and smi nodes")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>   Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 75750c64157c868725c087500ac81be4e282c829..035941c2db32170e9a69a5363d8c05ef767bb251 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -97,7 +97,8 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1

Isn't minItems already implicitly 1? :-)

Cheers,
Angelo

> +    maxItems: 5
>   
>     clocks:
>       items:
> 


