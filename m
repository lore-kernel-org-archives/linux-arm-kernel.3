Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11A8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08zYiGqweuy5tMX2qnQJeKgIvvTFvY7wvOzQ7t/A0KM=; b=BZq0b5vcTbpjqdzPjwn8IndLOH
	29TpFZMOknBmtvQGw9O7wvfPc3HwRsA0JXNdo7Qh3pWxPO8QGihrsN0fAdEafn9BxdjH1W8lb1iuD
	DANDPKAjx4eZ/6eVuNg27rjVPG4z5Ov96i3UAYngSutCyD7bB6Mnrgs+39dQ7GgPj6a7BWupxOtW3
	uUXJBY6Cg988nYUzdTFZ0lLaa1csP0WqSOlLVdLClzauVbV4lV46Dj5EMj8vLWoz9Ww2bS128PBPw
	l6kPIY0iLgX8sVXQpXjuvLw/5Uz856BlBl1dta5xa3I1BrGn9hT9mxEICtUwELuUoanoq52shoU+N
	1eh4l7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcfI-00000004tBY-3CoT;
	Mon, 22 Jun 2026 11:18:08 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcfF-00000004t9d-3dlx;
	Mon, 22 Jun 2026 11:18:07 +0000
Message-ID: <dc285387-b0f9-4f48-a0ba-c544c5af11fb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1782127072;
	bh=HdtF2G1DsaD29ZHA5Zc/J92hjynpjVG3JfparU9m/WE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=fg+m3CxDeoTsbMdqm2wMyM+Wbgj9ubSfZ8BENBPT4sEkGL0IJQbisZ+QP2SKFzzpq
	 3zjM5GUOik+0hVIXsy/39O4ttmgoeIaIqOkVOi4vze+ZBQ+ym/NssY2JStDRxu6bro
	 8kya+zJceqbC+keEof7DdOjBn1R+fApT2BGfb354=
Date: Mon, 22 Jun 2026 13:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v5 1/8] dt-bindings: thermal: amlogic: Add support for T7
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
 <20260424-add-thermal-t7-vim4-v5-1-9040ca36afe2@aliel.fr>
 <2e2a93c7-6bf9-49f2-95ed-f44cf767e9fd@kernel.org>
Content-Language: en-US
In-Reply-To: <2e2a93c7-6bf9-49f2-95ed-f44cf767e9fd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_041806_370956_8699F4E7 
X-CRM114-Status: UNSURE (   7.21  )
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

On 6/22/26 12:02 PM, Krzysztof Kozlowski wrote:
> On 24/04/2026 17:45, Ronald Claveau via B4 Relay wrote:
>> +  - |
>> +    temperature-sensor@20000 {
>> +        compatible = "amlogic,t7-thermal";
>> +        reg = <0x0 0x20000 0x0 0x50>;
>> +        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> 
> 
> This wasn't ever even built! Really, it fails immediately. I will send
> fixes, but quite disappointing that contributor does not test its own code.-
> 

My bad, I thought that `CHECK_DTBS=y` was enough to test
`dt_binding_check` as well. I add it again to my build tests.


-- 
Best regards,
Ronald

