Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA5DC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a5VtfQQ8+z5xu+GWLy5IVFKhuXkUB8JwYixZezlBaM=; b=Lffy21rSJRD8BIUKKJxzQefnSe
	mVLImDJC3QE8ThVPMR/hIy2bKJmbo5UK001qP/WvyjHCPBxzKxgCr8SdDEg+OHeHgGXxrXuOo7UsS
	b2T7Bq8n7kvqFIjsDMrCvI0QUmbJDQBnDqDU2BChpjXCZcNV9ktVT6I9YSKNrbqVhY+QX0ariRoUm
	TJJYF5wA9ParZESuJHvZ6kGRWnlsI+Xs/HStFjUqBIRsOV0jOEG+mZq5veLtVkwnywdGRJg9LYH9D
	B29784Dl5Q07K+965IRv/jJSd0B0gi1cNOQT+HUvGF1pD3y64IUgCXQcj/KhYAFRs/RsfNWjHUvUG
	VO7SuWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnWz-00000009KLA-1afb;
	Wed, 18 Jun 2025 07:48:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnUF-00000009JpU-3ZuS;
	Wed, 18 Jun 2025 07:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750232733;
	bh=1JdQ904uDrVw5CrNkcjW/fEGquyhcUzIxxmQVdihypM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TU7G28jrXco5LKBo88MJI++Q+39OFW5Pvy4t6nHJ5tPRAk0w6CKZmVmBE3WTXlXlI
	 PLEo4d3UQc/w9X3mft+gsnDzSFFAIPnsQqnrJ+oikqcfzyKzkXZwoICJ9McYwo1QXk
	 hL0rKRkyOjZlHT0TkrdI6pjN4TvztXLDSM5fNujhhxRkbFglMvIwjINvFtIWmYPwEO
	 +ISZiLO3Rcw88JONnttSfqNs1vZhf9JdUDzBAG0hltjLPquofmSwhsgdX8Laq/kXEs
	 tJihM2MU5HArPpBR4E+H2T+Rg3F6rNasL8DX8i96/IT9QUX8qvv90sJL2fSDz8eVC4
	 3cvpFD+KoynVg==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A548117E0F99;
	Wed, 18 Jun 2025 09:45:32 +0200 (CEST)
Message-ID: <e9db11c2-b02d-4fd5-8927-7b5857089533@collabora.com>
Date: Wed, 18 Jun 2025 09:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
 <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_004536_097836_828FE9D0 
X-CRM114-Status: GOOD (  23.93  )
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

Hi Diederik,

Thanks for your comments!

On 6/17/25 16:12, Diederik de Haas wrote:
> Hi,
> 
> I'm (unfortunately) not seeing any @rock-chips.com recipients ...

Oops, I meant to include at least Kever, but forgot to do it. Will do in v2.

Cc: Kever

> 
> On Tue Jun 17, 2025 at 10:54 AM CEST, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
>> Add the variant and allow for the additional reset.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
>>  1 file changed, 55 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> index 5ac994b3c0aa..6755738b13ee 100644
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
>> @@ -39,18 +40,49 @@ properties:
>>      maxItems: 1
>>  
>>    resets:
>> -    items:
>> -      - description: exclusive PHY reset line
>> +    minItems: 1
>> +    maxItems: 2
>>  
>>    reset-names:
>> -    items:
>> -      - const: apb
>> +    minItems: 1
>> +    maxItems: 2
>>  
>>    rockchip,grf:
>>      $ref: /schemas/types.yaml#/definitions/phandle
>>      description:
>>        Some additional phy settings are access through GRF regs.
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,px30-csi-dphy
>> +              - rockchip,rk1808-csi-dphy
>> +              - rockchip,rk3326-csi-dphy
>> +              - rockchip,rk3368-csi-dphy
>> +              - rockchip,rk3568-csi-dphy
>> +    then:
>> +      properties:
>> +        resets:
>> +          items:
>> +            - description: exclusive PHY reset line
>> +
>> +        reset-names:
>> +          items:
>> +            - const: apb
>> +
>> +      required:
>> +        - reset-names
>> +    else:
>> +      properties:
>> +        resets:
>> +          minItems: 2
>> +
>> +        reset-names:
>> +          minItems: 2
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -59,7 +91,6 @@ required:
>>    - '#phy-cells'
>>    - power-domains
>>    - resets
>> -  - reset-names
>>    - rockchip,grf
>>  
>>  additionalProperties: false
>> @@ -78,3 +109,22 @@ examples:
>>          reset-names = "apb";
>>          rockchip,grf = <&grf>;
>>      };
>> +  - |
>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi_dphy0: phy@fedc0000 {
>> +            compatible = "rockchip,rk3588-csi-dphy";
>> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
>> +            clocks = <&cru PCLK_CSIPHY0>;
>> +            clock-names = "pclk";
>> +            #phy-cells = <0>;
>> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
>> +            rockchip,grf = <&csidphy0_grf>;
>> +            status = "disabled";
>> +        };
>> +    };
> 
> ... which could hopefully tell us what the value is/should be for the
> *required* 'power-domains' property, which is missing in this example.
> IOW: the binding example is invalid according to its own binding.

Huh, indeed. Hm. Why didn't make dt_binding_check warn me about that?!

TRM Part 1, p. 1097 states that HDMI_CSI_DPHY is in the ALIVE(PD_BUS)
power domain. With some creativity one can interpret that the CSI DPHY
is always on anyways. @Kever: Could you please elaborate on that?

> (btw: you can drop the 'csi_dphy0' label)

Will do.

> 
> And hopefully also for rk3568 so we can add it to rk356x-base.dtsi and
> you can add it in patch 5 where it's also missing.

I recall a similar discussion [0]. In the RK3568 the CSIPHY is in the
ALIVE power domain.

Note that the PHY must not be confused with the HOST blocks, which are
the MIPI CSI-2 receivers.

I guess the correct solution is to make power-domains optional. Further
input welcome, though.

Best regards,
Michael

> 
> Grepping for "csi-dphy" in arch/arm*/boot/dts/rockchip returns:
> - px30.dtsi
> - rk356x-base.dtsi
> 
> With this patch set applied, we'd have a 3rd result: rk3588-base.dtsi
> 
> For all the listed compatibles, it's only actually defined in px30.dtsi.
> 
> Cheers (and sorry),
>   Diederik

[0] https://lore.kernel.org/all/D4QNJ85V43NU.YD01E8AB4116@cknow.org/


