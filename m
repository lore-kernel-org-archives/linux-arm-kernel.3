Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69A7C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vb9RNpQ9nn8CaEP5Dac/qXM6STSUoM5kUgGizmVamZ0=; b=qIMf4jg7x2wToo6c44OlirYkQ2
	msdok73IL4laZ3ZWiUbqrTHMUqOsjThSgxuUTi8rGH2WKQDo0l0PWJZ+gMUsOYMxm7w1jx2pFV0Mg
	0kJgVUTfF1UXV4bViZnBcJSFrKppUFtrxwCB2YsyAVq3jG9vBPX975G6mT8XR7Lu7UW81hhtDzifs
	zO1o8zQDtJ3iUE+rSr8k0Xx83gs9jdSIqZWcD5eVsgUHN3uhdB6F/g9oKGf7OoZY2oNZKmBsrJEtd
	Lrhomjiu+NZZhYMcvWJ75vDWrIm3BK3QyjdbScG6ytnl6g7XbxhpRwui3BVDicZtPFP+DttSGUUfC
	4KZ81I5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL2B-00000003HzB-2384;
	Fri, 09 May 2025 10:32:51 +0000
Received: from mail-m15579.qiye.163.com ([101.71.155.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDK5m-000000037Ra-3pfT;
	Fri, 09 May 2025 09:32:32 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1481670b2;
	Fri, 9 May 2025 17:32:13 +0800 (GMT+08:00)
Message-ID: <2f4e031c-25d1-4e2b-ad03-36e27d3d364d@rock-chips.com>
Date: Fri, 9 May 2025 17:32:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250509070247.868-1-kernel@airkyi.com>
 <20250509070247.868-3-kernel@airkyi.com>
 <ccf4b15a-8399-4a7f-ae40-d01d0975921c@kernel.org>
 <5a4f6229-1450-4c96-bfac-5257f66b2ddf@rock-chips.com>
 <5c0a3b62-cf4f-46ec-b0e2-7d78ac499cb5@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <5c0a3b62-cf4f-46ec-b0e2-7d78ac499cb5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh8dHlYZS05KH0IfGB4eSkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96b4635efa03abkunm1481670b2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6MDo5QjJJMwEWAQ4uCy8o
	LzUKCVZVSlVKTE9NTENISk9LSk5KVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElLQzcG
DKIM-Signature: a=rsa-sha256;
	b=ASkDftnQLy66Ocju57vFIMbVp4bL9Dv2+YDTqq6ZomPhnJVLuM1V09jRMVOrMp+aqV2pPtZi4F57RYg2yNz1Be3J39EYdsQqqYk2nCSEEkFxf1VkVi6aRMtx92JJ1EFm1H8O7dDah9SLZk76tyxBqhFvgv+rY5m3gWYXBh6Tqn8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vb9RNpQ9nn8CaEP5Dac/qXM6STSUoM5kUgGizmVamZ0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_023231_451202_C0587A0C 
X-CRM114-Status: GOOD (  15.26  )
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

Hi Krzysztof,

On 2025/5/9 17:21, Krzysztof Kozlowski wrote:
> On 09/05/2025 09:34, Chaoyi Chen wrote:
>> Hi Krzysztof,
>>
>> On 2025/5/9 15:11, Krzysztof Kozlowski wrote:
>>> On 09/05/2025 09:02, Chaoyi Chen wrote:
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core-clk
>>>> +      - const: pclk
>>>> +      - const: spdif
>>>> +      - const: grf
>>>> +
>>>> +  extcon:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    description:
>>>> +      Phandle to the extcon device providing the cable state for the DP PHY.
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  phys:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> Just phandle. If this is an array (but why?), you need maxItems for
>>> outer and inner dimensions.
> Uh, sorry, that was supposed to be under extcon.

Oh, this also applies to extcon. Each extcon is used to indicate the 
status of the PHY.


>
>> I think it could be phandle or phandle-array. Since the RK3399 DP has
> Here it is obviously not needed, that's a dtschema type.

Do you mean that there is no need to explicitly specify something like 
"$ref: /schemas/types.yaml#/definitions/phandle" ?



>
>> two PHYs, if we put in two PHYs here, the driver will pick one PHY port
>> that is already plugged into the DP for output. If we fill in only one
>> PHY here, then output is only allowed on the corresponding PHY.
>>
>> Will add restrictions and add more descriptions in v3.
>>
>>
>>>> +    description:
>>>> +      Phandle to the PHY device for DP output.
> You need to list the items with description iinstead.

Okay, will fix in v3.


>
>
>
> Best regards,
> Krzysztof
>
>

