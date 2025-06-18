Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50593C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhOu2WOovZFJopI8NTqZFH2s5yCX44oMRWyIb5LE7wg=; b=JsGz3YE4IQD2Jiyap+dxuj6DOy
	HqJPJpzcZSDkeBmsM/1OrB/8/V4yMJqz1unVz6chEqNvZLlPvTWBSSAXurCZLVO6Ko5NNuzSVVMXd
	t3k+3dkoWAl/3P8g87GY95JsWWZXzel5BUPpPEEILdhRdbaXzQdE5MDw1nubHPKluqM5UwTlVpmCw
	qhhRhPXi3l2luvnYOenkpejovkHPOa9O3MCnz2JuMlMkyRkVwnIxwS7ycbdSAodv6yQc+bpb01jm5
	xVklLn2ZneZOjyICXdgsdczQlje5WNpU+lw3ZX1lFaMba3oI8DfXfRz9xBXGinyaL1Fo2+NTBnxfd
	0rQS27Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmQh-00000009Bst-04Sd;
	Wed, 18 Jun 2025 06:37:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmLU-00000009BFn-2aMY;
	Wed, 18 Jun 2025 06:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750228346;
	bh=y10M8imfJ9o9x4GicbvPGTG3FTDU5rk/ab+BdMuexKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T34ktW0oHpuFm0dNOITwZ4sMW7CMFEoqqP5DDtdOZrPLpha+3GfXyd02Cli/vadBU
	 LlWPVtA6T+zvqc73KzuhZ/CnssL5rl721ZEmYcCqUTsL6O7BE/Z1rDLNKY7u6pKSDs
	 yPsimWcGx4Blwgtu5smzFikqknZWd7TgPR08HJT6kQJSudRYAbQEitAJvfV+6nJCIP
	 Fk3YMS5kFx6OZd8Ra1zChjmdjdyC+6KirckL/a0YjlfTO90bjUj6evempYqSQw3pf3
	 Rvhjqv6TwLKI8xV6X97d9vFRM2ErqWaKIMVpL+lClT8Ei9Z2efKav1ncp9VY49nAQo
	 aWLfOCHHBszqQ==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C91F817E0863;
	Wed, 18 Jun 2025 08:32:25 +0200 (CEST)
Message-ID: <8ba2f458-4a66-44f6-8528-4654cfe379ff@collabora.com>
Date: Wed, 18 Jun 2025 08:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
 <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_233228_806759_F5764DD9 
X-CRM114-Status: GOOD (  19.42  )
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

Hi Neil,

Thanks for your comments!

On 6/17/25 11:31, neil.armstrong@linaro.org wrote:
> On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
>> Add the variant and allow for the additional reset.
> 
> No names for the new resets on the RK3588 ?

I left the names away because TBH I don't see the value in them (in that
case).

Downstream uses reset-names = "srst_csiphy0", "srst_p_csiphy0"; and
there is no better description. One could guess that the second reset
corresponds to "apb" but this is just guessing and we would still have
to guess/find a proper name for the first reset.

Amazingly the mainline driver does not seem to do anything with the
resets (unless I overlooked some implicit magic). Downstream does a
simple reset_control_{assert,deassert} before configuring the PHY. Now
if the different resets are handled in bulk mode, does it really make
sense to address each reset individually?

Best regards,
Michael

> 
> Neil
> 
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>   .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++
>> ++++++++--
>>   1 file changed, 55 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-
>> dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-
>> dphy.yaml
>> index 5ac994b3c0aa..6755738b13ee 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> @@ -21,6 +21,7 @@ properties:
>>         - rockchip,rk3326-csi-dphy
>>         - rockchip,rk3368-csi-dphy
>>         - rockchip,rk3568-csi-dphy
>> +      - rockchip,rk3588-csi-dphy
>>       reg:
>>       maxItems: 1
>> @@ -39,18 +40,49 @@ properties:
>>       maxItems: 1
>>       resets:
>> -    items:
>> -      - description: exclusive PHY reset line
>> +    minItems: 1
>> +    maxItems: 2
>>       reset-names:
>> -    items:
>> -      - const: apb
>> +    minItems: 1
>> +    maxItems: 2
>>       rockchip,grf:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description:
>>         Some additional phy settings are access through GRF regs.
>>   +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,px30-csi-dphy
>> +              - rockchip,rk1808-csi-dphy
>> +              - rockchip,rk3326-csi-dphy
>> +              - rockchip,rk3368-csi-dphy
>> +              - rockchip,rk3568-csi-dphy
>> +    then:
>> +      properties:
>> +        resets:
>> +          items:
>> +            - description: exclusive PHY reset line
>> +
>> +        reset-names:
>> +          items:
>> +            - const: apb
>> +
>> +      required:
>> +        - reset-names
>> +    else:
>> +      properties:
>> +        resets:
>> +          minItems: 2
>> +
>> +        reset-names:
>> +          minItems: 2
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -59,7 +91,6 @@ required:
>>     - '#phy-cells'
>>     - power-domains
>>     - resets
>> -  - reset-names
>>     - rockchip,grf
>>     additionalProperties: false
>> @@ -78,3 +109,22 @@ examples:
>>           reset-names = "apb";
>>           rockchip,grf = <&grf>;
>>       };
>> +  - |
>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi_dphy0: phy@fedc0000 {
>> +            compatible = "rockchip,rk3588-csi-dphy";
>> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
>> +            clocks = <&cru PCLK_CSIPHY0>;
>> +            clock-names = "pclk";
>> +            #phy-cells = <0>;
>> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
>> +            rockchip,grf = <&csidphy0_grf>;
>> +            status = "disabled";
>> +        };
>> +    };
>>
> 


