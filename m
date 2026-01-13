Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E37D29DC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 03:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLlZk5JLSHjXxq4/+unFmqq6XhZxTOn9ntEjqGDpUTM=; b=G17f6KXCWLBhyA5z8nsbyGisux
	UGSKHIMc+qOKwOHYvZBBBnvEKqle1ej45SPPJU3vELspU6QLWfxxKY2WCUSVu1FuFfBmCIRZbANK5
	lf6JB2ywh+oRRcRuM/ANjqFyvWtZMpc9QWghmYrUVOiR36vJk00iRq2+K3fFbi5Hq4cC8s+BLOXYH
	WNwDe7IztRAhb0ifUZVzVSRlJe1SBVfjoHwTcvX1afa2tYDaEI0sFl3YElgk830eNdFlVxMnpx/n2
	QP5SaL6RAlqO7MR2XS+LbBglCREbpWJWIKLgDXTi8woPxD8hCkCJSgs9mRX74GYQUGLlg3W5y7z9q
	qfxetBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVLi-00000006VGm-2vOJ;
	Tue, 13 Jan 2026 03:45:42 +0000
Received: from mail-m4920.qiye.163.com ([45.254.49.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVLf-00000006VGG-3LnA;
	Tue, 13 Jan 2026 03:45:41 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 306affc4c;
	Tue, 13 Jan 2026 11:45:35 +0800 (GMT+08:00)
Message-ID: <b901011c-d062-4a4f-8a2e-9f918eab3838@rock-chips.com>
Date: Tue, 13 Jan 2026 11:45:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jonas Karlman <jonas@kwiboo.se>,
 Hsun Lai <i@chainsx.cn>, John Clark <inindev@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260112022823.91-1-kernel@airkyi.com>
 <20260112022823.91-2-kernel@airkyi.com>
 <20260112-lively-hallowed-beetle-fc15b2@quoll>
 <1515a445-576a-4833-a604-c31062f7d3fa@rock-chips.com>
 <b4eb4ab6-6fde-4c01-8069-470545ffdac4@kernel.org>
 <568b9e25-bf96-4e78-9af0-4791cbb90a56@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <568b9e25-bf96-4e78-9af0-4791cbb90a56@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bb575818903abkunm0fc5f439c0aac
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkoaHlZPGEoaHRlPH0tPGRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ICLXnlUCKdw0l4C5PwjkIWI+IVk7r4/+WwkYTgaVw86rZ636qn6GnsMAlH3m9KDe331gcSkS3TklrGhw8/QrO0k6/hTC3s1bGoI9x213B9d26cr4/F/RDXu76m2tvVwDtwq+Qyw1eBwnYz+/a3EN9/JjCw818hD+5H3XmHoPYvc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=RLlZk5JLSHjXxq4/+unFmqq6XhZxTOn9ntEjqGDpUTM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_194540_027104_125E3EC5 
X-CRM114-Status: GOOD (  13.94  )
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

On 1/13/2026 11:27 AM, Chaoyi Chen wrote:
> Hi Krzysztof,
> 
> On 1/12/2026 10:28 PM, Krzysztof Kozlowski wrote:
>> On 12/01/2026 09:59, Chaoyi Chen wrote:
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>> +    usb {
>>>>> +        dr_mode = "host";
>>
>> One more thing - drop above line.
>>
> 
> Will fix in next version.
> 
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        hub: hub@1 {
>>>>> +            compatible = "usb1a86,8091";
>>>>> +            reg = <1>;
>>>>> +            reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
>>>>
>>>> Are you sure?
>>>
>>> I guess what you're concerned about here is the polarity? 
>>> If that's the case, then there's no problem.
>>
>> Yes, I was wondering whether polarity is set correctly.
> 
> Yes, it is active-low, so during normal operation it should be set to high.
> 

Sorry, I didn't consider the driver situation. 
I will fix it in the next version.

-- 
Best, 
Chaoyi

