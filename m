Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB7CCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiOu1IAtMWVZ3Zu+61tfRyG8PAt08FQ6Q13l4Sc8Scw=; b=IaVVuQivSYlpzAw67nC5ezNdrX
	I7jc+Hpd9R8WzzBLkC1ZnBmLVTZQDsyb+nWKpJ7Dq23u68afsraA2BJNDz9GhiW0gWOfs696j4dT4
	NuaWIwVBDgW23odQJ+OuvRcdscsfhQQ+JUj1dFA1Ru8tsUoKLfAd+ZT8YwleXIUjJAwkzCte3lYnw
	aOtEZZ2IgVcKb9CBlyHUTPBMZOnfawBBZNufI9VwrekbJa0chW9WceEv/SDzeBfcjBAjs5tJltKas
	riQwysYvmC5KsafvpT5VEAgfXwinChb0F57wzVcWydeZdumJlkodMo/dTLCmaAUGFGUSrcK4KfXcH
	X/++djXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAh-0000000HIyb-48jE;
	Tue, 02 Sep 2025 12:31:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utO2a-0000000GcHc-09z3;
	Tue, 02 Sep 2025 10:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756808101;
	bh=7r0uYfWtBElvzR2QYMpdph3AQUnSm2BAWZWbcWhwkgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HsTeJJPy8nskxOEnWjhWT23hBDAhRZZC8BBmLa9+pYVZHN/1ephldEEputMinatHc
	 8rhjPY/35EFw8KdZww8/CmeWOnDrqoELM4vGKhw0n2+fOwRZnteOQS9b86OEYVSKPh
	 M78G/SargYwFcz8nzA9RJ8OY9FN4DF2bRez1O5t4QsM9/lCXuiyQNUXgu5gGJA8PC0
	 7REujSKJS1o6pu7ugGg32yi3a6MqTYaNf8CnhVgAJYOwjeTA1hJjm9g1QcFYbw8c4Y
	 Hi4xdn2xFl1kfA2MWOPOacriYYoMb/TPJyDY2rOU3zFnGRvXVQFP0fgfGUibMhk5nD
	 gNO1gS409ySuA==
Received: from [IPV6:2a05:1141:1fb:db00:ba27:6983:e3a5:2a47] (unknown [IPv6:2a05:1141:1fb:db00:ba27:6983:e3a5:2a47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 251BD17E0456;
	Tue,  2 Sep 2025 12:15:00 +0200 (CEST)
Message-ID: <b0cad1e8-8b02-4039-b1d2-b9056fd51318@collabora.com>
Date: Tue, 2 Sep 2025 12:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3588 variant
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Collabora Kernel Team <kernel@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
 <20250616-rk3588-csi-dphy-v3-3-a5ccd5f1f438@collabora.com>
 <20250902-piquant-secret-moose-06c4b6@kuoka>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20250902-piquant-secret-moose-06c4b6@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_031504_249771_0DFB2DEA 
X-CRM114-Status: GOOD (  20.79  )
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

Thanks for your comments.

On 9/2/25 09:55, Krzysztof Kozlowski wrote:
> On Mon, Sep 01, 2025 at 10:47:44PM +0200, Michael Riesch wrote:
>> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
>> Add the variant and allow for the additional reset.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 50 +++++++++++++++++++++-
>>  1 file changed, 49 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> index 9ad72518e6da..e37c9fd74788 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> @@ -21,6 +21,7 @@ properties:
>>        - rockchip,rk3326-csi-dphy
>>        - rockchip,rk3368-csi-dphy
>>        - rockchip,rk3568-csi-dphy
>> +      - rockchip,rk3588-csi-dphy
>>  
>>    reg:
>>      maxItems: 1
>> @@ -40,11 +41,15 @@ properties:
>>  
>>    resets:
>>      items:
>> -      - description: exclusive PHY reset line
>> +      - description: APB reset line
>> +      - description: PHY reset line
> 
> That's changing the order, before first was the phy....

See reset-names below...

> 
>> +    minItems: 1
>>  
>>    reset-names:
>>      items:
>>        - const: apb
>> +      - const: phy
> 
> Although here first was apb? Quite confusing.

Confusing indeed. IMHO the description "exclusive PHY reset line" is
misleading. In the existing device trees there are hints that this is an
APB related reset. These are only hints, of course, but they are the
best info we have.

I can add a remark that we are fixing the misleading description while
at it.

> 
> Anyway "phy" reset for "phy" is pretty non-informative, please give some
> useful name.

As far as the additional reset is concerned, I do not have any info at
all what it is related to. Therefore, it is hard to give a useful name.
Also, to be frank, I have no intention to haggle around with Rockchip
support to find out a more meaningful name (I tried to do that in the
past, only to find that the time spent on that is almost definitely wasted).

Similar PHY blocks are using "phy" or "pipe" or simply "reset" as names,
so I went for that.

Any suggestions are warmly welcome. "aux"? "reset2"? ...?

Best regards,
Michael

> 
>> +    minItems: 1
> 
> Best regards,
> Krzysztof
> 


