Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281BFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTAxuGuX2HjIb+J0nINSN6pIxAxGSTuzZRb6v1F8YcU=; b=Pw+98Ze03cg9wBYXldhjBX6hMb
	HUeY8VrG3SdiaYz/R5KqjcVc7i184cfmkcZqWRBgdmu45Qt8m2mx8JwiAcMDm5QNs2N7w/LuLgUIg
	fNyuL4WLApuVFHyf0JqXYqt8VEkWcK5DkVNGfL3vt62jmWg84MgU2sMLDyrSpcRxXXnFu4vsm7nDD
	wy60ygz3TGMuB4m0f/yU2zitEkXq9Xunf9gmgZPkHnqNN0fkhjsEO/34pDCadZof2X1wEcjEz26Vh
	0ReMugeQ5/neDyc8HZOy9rdc8HJNzbl6f2TfvA9Kq9S76iIVhH1fRO6VvoN+zqwJiZUwilOAtv4w+
	C0oHOD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAbQ-0000000EaNL-1BCR;
	Fri, 10 Jan 2025 08:42:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAaC-0000000EaDU-1MuL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:41:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so978384f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736498490; x=1737103290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTAxuGuX2HjIb+J0nINSN6pIxAxGSTuzZRb6v1F8YcU=;
        b=rJSur7iPaOin4FfVF3AgHcGDzsElS8N0094W8PfUwP8MMVfa4CgTq3NHc/iCXsu/qF
         pgYZw0yF2OILAwOu4GXeS030PFhbY8d6Tcu+kAXcKdrk7gZYgmA6a7lIt+7o7t5x3N5Y
         J5mfS7eI+PTfCpB84sdaTZIys1AABjhEA/s+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736498490; x=1737103290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTAxuGuX2HjIb+J0nINSN6pIxAxGSTuzZRb6v1F8YcU=;
        b=nwZgMj8NXfXuGaYEWcuTO9NSRXKjIKFG55aEnsLOx3b8xJioWbzUXznLft3DwkZnCO
         T32DVbkzOrQIZZvRZdoqVMM9UYQ0YBkDN63vUFmMoXrzpu88L+YhvZSxMmldgTCltHUw
         nn7IgNNJP6wJ6MdXhZ3l7a/CbhE2XMS1RnNhLGAkWVxhZeQyZsQ9tLvQKhSPBTqKGGna
         30/0n7zm5P6bR1z0RuFnDAzDh2LXPwolSXNJ4OK8Gdo+WeDFDEoj8QoQ/glWVjmgw7By
         vvlH1bSzrYvD/BitJEhwR+RfaHN5PEN/vO3UDQYK9jSgX2VWLfy3+mx22Gz0t+WctNGz
         jTkw==
X-Gm-Message-State: AOJu0YzaQvr6PVZrg9WHXflj24eo04oxAgMJOQBtn6Dts90OlI32eFXk
	Yq6YDX4Zxei+KeZ0ayryPdo7MJBcwFxsTkMHaF6nw2pBNpPzRHJpMOrz6VDgXmw=
X-Gm-Gg: ASbGnct89bvbpzS+WKVlEHqkwP1Z3YdDC0cwNw9X/LQs1Z6KN5etAK7H1B1Eza8ovOb
	BMQYtPwpXfLq4JBh/8HWZlTrEbH1v7aLSb6AhyrN3SxTrWgYEMAbEyOeYiogNCcmnRabuoXDByu
	KFwMvuLA7aPD9Iob79lqTOpdEg8MMp0+G7+7yJDHIGQOxnpE/eL4XinJ1+bi6DydNJTJeEJ2ZQV
	TPrBXCsCznISH07daca7kmdxz5PHHTA1lCGraXTM8cYRXuVhxhVtMbZ8ZLt4SK+UnzQJ1mveYvZ
	/oTY6BWZeRQKCB0J8xLlP5KAI1BTtLwJHjHBUQNm570Ffd6pnOxFO6btQqpbYpWlFfQAwWDPJT3
	+mOxMG1CeuK73jaxv
X-Google-Smtp-Source: AGHT+IHdAZINf3kifHqwtZwu3U7P3daEmJ6BNIfnwadkS9VZOq9RloQ0s4HchXw0ErbNx4rkN2q6NA==
X-Received: by 2002:a5d:64eb:0:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-38a87312d2emr8481678f8f.32.1736498490553;
        Fri, 10 Jan 2025 00:41:30 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd11ddfdsm68561515e9.1.2025.01.10.00.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:41:30 -0800 (PST)
Message-ID: <d788bec1-f0e1-4fbd-8d4b-480d811de990@smile.fr>
Date: Fri, 10 Jan 2025 09:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
To: Andrew Davis <afd@ti.com>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
 <90f47fae-a493-471d-8fe6-e7df741161be@ti.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <90f47fae-a493-471d-8fe6-e7df741161be@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_004132_364842_4E79C4B3 
X-CRM114-Status: GOOD (  19.53  )
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

Hello Andrew, All,

Le 09/01/2025 à 16:58, Andrew Davis a écrit :
> On 1/9/25 4:26 AM, Romain Naour wrote:
>> From: Romain Naour <romain.naour@skf.com>
>>
>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
>> provide refclk through PCIe_REFCLK pins.
>>
>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
>> module's PAD IO Buffers.
>>
>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>> ---

[...]

>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/
>> boot/dts/ti/k3-j721e-beagleboneai64.dts
>> index fb899c99753e..741ad2ba6fdb 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> @@ -859,6 +859,11 @@ &pcie1_rc {
>>       num-lanes = <2>;
>>       max-link-speed = <3>;
>>       reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
>> +    /*
>> +     * There is no on-board or external reference clock generators,
>> +     * use refclk from the ACSPCIE module's PAD IO Buffers.
>> +     */
>> +    ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
>>   };
>>     &ufs_wrapper {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/
>> ti/k3-j721e-main.dtsi
>> index af3d730154ac..32a232a90100 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -5,6 +5,7 @@
>>    * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>>    */
>>   #include <dt-bindings/phy/phy.h>
>> +#include <dt-bindings/phy/phy-cadence.h>
>>   #include <dt-bindings/phy/phy-ti.h>
>>   #include <dt-bindings/mux/mux.h>
>>   @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>>               reg = <0x4140 0x18>;
>>               #clock-cells = <1>;
>>           };
>> +
>> +        acspcie0_proxy_ctrl: syscon@18090 {
>> +            compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
>> +            reg = <0x18090 0x4>;
>> +        };
> 
> You'll still need to add to the J721e system controller binding or this
> will throw a DT check warning, something like this:
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-
> controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-
> controller.yaml
> index 378e9cc5fac2a..3323f3bc976e0 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -68,6 +68,12 @@ patternProperties:
>      description:
>        The node corresponding to SoC chip identification.
>  
> +  "^acspcie-ctrl@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mfd/syscon.yaml#
> +    description:
> +      This is the ASPCIe control region.
> +
>  required:
>    - compatible
>    - reg

Thanks!

To fix the warning I had to use "^syscon@[0-9a-f]+$" instead.
During the review, "syscon@" was recommended instead of "acspcie-ctrl@" [1]

  acspcie0_proxy_ctrl: syscon@18090 {

[1]
https://lore.kernel.org/linux-devicetree/5e2d2174-44a7-4143-8562-4dcdb5ad6c94@kernel.org/

Best regards,
Romain


> 
>>       };
>>         main_ehrpwm0: pwm@3000000 {
>> @@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
>>           max-link-speed = <3>;
>>           num-lanes = <2>;
>>           power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
>> -        clocks = <&k3_clks 240 1>;
>> -        clock-names = "fck";
>> +        clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
>> +        clock-names = "fck", "pcie_refclk";
>>           #address-cells = <3>;
>>           #size-cells = <2>;
>>           bus-range = <0x0 0xff>;


