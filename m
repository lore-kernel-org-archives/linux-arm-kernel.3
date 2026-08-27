Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEACC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjJ6weS85s22FsCPd+HQktbWCP2SfOGkFBLAdeRpKpo=; b=cTJ8G9nc7S5k5Qn4QZlUg/4pWg
	OqESriwFHlY9u37aW3OEWRg6wfC/N2cKe63aqJRXHY4qAeTT7pPK4fG91ygyiKhzuC4Z/OqorXZxo
	hT9I8Q5xHFmIMxvo0nlZ9S6k+w7QtU3CTfLSnpaU/MPLQwwGCbgI6bL1vPQ4ncTRh8bQ7q4Bgs7IX
	6dKof4x1TcOx8UUKZSortMPPa0OgPgNBeZeaX3UPixoP+OEj3ywEXoV9yKyEM3oOgms+l1PHzbfgx
	o5NJGWR2jr5Qv0//T4wjR01K/pdkHLcPVyADyvh4kF8X9++8HSJpvrBBVubecPI91VZDo7/G6uhAa
	XJ5oHjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjIl-00000004tI8-0oKl;
	Thu, 27 Aug 2026 23:14:31 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjIi-00000004tHg-2bc3;
	Thu, 27 Aug 2026 23:14:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1AA711C5D3;
	Fri, 28 Aug 2026 01:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787872460;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gjJ6weS85s22FsCPd+HQktbWCP2SfOGkFBLAdeRpKpo=;
	b=i7CL2o6SLSrZdwX0d5+AsU2vabHXYQ1NNmnV/xx2ISa23sMUmdIGRb53cNIhJNGVbZsTdx
	WAdF9ERf6Uf1CaoM097RPCbumDaf+d475mXRefKf7E7+X43sCbomSMuwll7k0fkXQffzdB
	SBs+jMee+mA+bafgxAFrGyRltI7WCGMsa1gPCTxJpGarj6jWNq8H4dKdfA97nEK9HNF9m6
	+eoWKLE7AVgdSFiIdQW8feBK8viOr+0M1k4N8Bivc0VUQEMLpewdXAcly+bg2aBeCZgbl9
	h8RkaXiO6LcP9y7SaIxMYoqAi+28TMwMG5q2J5j9uzvv/EIWpD+n0M2ipwuSbA==
Message-ID: <84bd4b0b-69c3-451e-9e0b-690191f52537@nabladev.com>
Date: Fri, 28 Aug 2026 01:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
 <7a16614a-bd1b-462a-be13-4a9c22aa588e@kernel.org>
 <34c48ff1-524f-4d24-b53f-99e7171d08db@nabladev.com>
 <25e10cfe-40dc-45f4-8a92-cd81263420ea@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <25e10cfe-40dc-45f4-8a92-cd81263420ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_161428_879577_CBCFF5A9 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On 8/27/26 11:33 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 16:53, Marek Vasut wrote:
>> On 8/27/26 2:54 PM, Krzysztof Kozlowski wrote:
>>> On 22/08/2026 09:46, Marek Vasut wrote:
>>>> +description:
>>>> +  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
>>>> +  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
>>>> +  connectivity. Both PHYs are the FEMTO-PHY, but their configuration
>>>> +  bits in the system control register are different for each variant.
>>>> +
>>>> +maintainers:
>>>> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>>> +  - Marek Vasut <marex@nabladev.com>
>>>> +  - Pankaj Dev <pankaj.dev@st.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - st,stm32mp25-usb2phy1
>>>> +      - st,stm32mp25-usb2phy2
>>>> +
>>>> +  "#clock-cells":
>>>> +    const: 1
>>>> +
>>>
>>> As pointed out by different patchset built on top of it, this is wrong.
>>
>> What is wrong in this (V3) of the patchset ? I think the ST patches were
>> fixing up V2 and what they were fixing up is already fixed here in V3.
> 
> Probably I got confused... but I had impression the ST patches were
> adding here "reg" property, no?
It is there in V3:

"
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 0
+
+  reg: <------------------ HERE
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
"

