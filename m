Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F55D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LYx8D2nnDemgXO9g6TLvymKor13ip90yPxjnDbRoRs=; b=v1CH6U2VOQmSjaDtJJxAl1Uo8I
	od6Bkbr+IGUJi4kxRE3G2nufH4PV9NUiN+HzwVJ6YQdotyaEVqp7PloHxe7c8mF6wAvn83BWUMcuv
	Ml5+bDlLV9PRPZyN9oPWWQMYfv/Ypm6OQGx6/dtLva2BE3sDliLY3DsDVcNC1wZc/Fg6zdiuwOcUt
	b+pL54NnlXYs5wAtbFF3r0b4DaGO2n2ccvWOz0V3pToAiSIBCe5F8oy+9td3iEO2MCdhu0sY1dFtk
	H+3FJJiqt8wADBxvfxsMqvaS0Y2Q1t+m8WFNw36vZN8gtSoGBI0PNbSmSll8fJCDzklIZaj2iJwuY
	0dslNeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWxT-0000000GAoV-1s1f;
	Thu, 27 Nov 2025 08:02:31 +0000
Received: from mail-m1973187.qiye.163.com ([220.197.31.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWxP-0000000GAno-1ZuW;
	Thu, 27 Nov 2025 08:02:30 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b1921d28;
	Thu, 27 Nov 2025 16:02:21 +0800 (GMT+08:00)
Message-ID: <324ba201-8cfb-4a7c-87c8-366f657ffd8a@rock-chips.com>
Date: Thu, 27 Nov 2025 16:02:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iommu: rockchip: Add support for
 multiple interface clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251126083345.88-1-kernel@airkyi.com>
 <20251126083345.88-2-kernel@airkyi.com>
 <20251127-enigmatic-faithful-viper-baefa2@kuoka>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251127-enigmatic-faithful-viper-baefa2@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ac455afef03abkunm152125166ae01b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5CSlZMHR1CGhhCTE0ZQxpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Vl7ExnL0xwkuLXb9VOoyo6qNANWdAmo/wYjgMpjdol9LR0oDRuJIwvUB+uCSp3LmuwKg8GUhDBBFhdwxkt5Ndf2jTHRZsjhN/+N8p3l5sbNwtWGCwWc8tecJo5tKGPPmsCnMSyjCX65Uqrnik2BFx57hgN9yLvkLNU4wCozEvyY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1LYx8D2nnDemgXO9g6TLvymKor13ip90yPxjnDbRoRs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_000228_720294_ADB857EA 
X-CRM114-Status: GOOD (  10.49  )
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

On 11/27/2025 3:49 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 04:33:44PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The iommu found on RK3576 NPU/RKVDEC may contains more than one
>> interface clock.
> 
> So you need to restrict this per each variant. See writign schema doc in
> DT dir.

Oh, I will rewrite it in v2. Thank you.


> 
> Best regards,
> Krzysztof
> 
> 
> 

-- 
Best, 
Chaoyi

