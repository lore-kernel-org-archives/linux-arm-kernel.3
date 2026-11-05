Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA092606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PpszZ0G7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnAFR8Az
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mGc2vAFhLjrhjQgo4ZedaQEUC/gPM0pIwb1vV2XkbM0=; b=PpszZ0G7GDIBM0
	yOBKHoPzZ9yX7MbAnKEZ1TRzdzlYAzz1Bx3miJAhNDALUGsyQ2BvG5amOhYOtXKboVFZwHZBK2Ok7
	KWC1qYcQOXk0MPU1I/xsqN62gYDGY/58+cHtwLgMZoHM12P0FLb2axFo2U2dSAOIyX4w1RX7ZXL9v
	6VI1/5KtPe2aV29TK2E9G6rizdHB/L2zn3zzjltVNoLlZYTx+v1jX3iQn58Ln4vGe3/WLBlKCng7u
	12pydpazd0gSinePEwqK16lzeqSsg8w0ROEXTLAzMLJvoBdpl0UVykBSO2npcNt7lODSnPdqKC37G
	tfnaq1s2Jdrc2HDJwuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl86-00000007L3N-2BoE;
	Thu, 05 Nov 2026 00:14:58 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl83-00000007L2y-2QNV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 00:14:57 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2420278eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 16:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837694; x=1794442494; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGc2vAFhLjrhjQgo4ZedaQEUC/gPM0pIwb1vV2XkbM0=;
        b=SnAFR8AzFZ1gaIQhoSQ6GGWfKeogWJbD+Hm6StuuS46r37qi6sZuQKIihC0RJMTHlE
         0NXAcpX+Wn02SRELLEUpUCJaakoeUNSC7yqJap4TcrzHtWKs0BG6OfDSPFGR4ySn+3Ds
         HtTFH0SJ4okzN1F/q6K9Wqq5rbmOkoYa+VYVytBt7MfLX94Kj+fdDmWcQgA/mVxXRoOK
         R1rPAXR2MfveuKzKi4TXKxksuUb2+qWBevxA0RkcNwEGwDa33cvEWTkpOWBWDbdYzDen
         JuqFglrx2D4QW38g410YOc+CFLBu7AQSjIyrl4RNEchelfNK1sDIlOpEPhnRPQf7Gs2o
         WczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837694; x=1794442494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGc2vAFhLjrhjQgo4ZedaQEUC/gPM0pIwb1vV2XkbM0=;
        b=lJSdueXOmf0M0NpyTdtKuq6cXA/HV/40K+70uLN4YtECM4ijoi87HHF66CuIZc5uqW
         JfZDJNO/CWTCLY9EbSbL0aFwxHMjvP4pBjWiEFSu/h5lfXNpWxagnCEk4s5kSU/xXhoU
         voS74kz1G24PjsScwZ0vN6xr3qpnSathHIDBkpe3xm+8RhIx71VOJTVWMshMDYJ/E5wz
         0De/ZfBxTKZP0P9a5sBizUXQ26/T8qPT+irmuPrxm+G5xZfkMStijIs9W6+Lmth+6gSG
         xFXjMuhGX5kR/ufxrxNMOV9bClGI9RRHOn6eqz4woczDPGT4/yZjmeS4HSwbFtT5OXl9
         IROA==
X-Forwarded-Encrypted: i=1; AKwUvBxdcuFwp+7S44p6Fn7w278XjqeQhHjDrBzvlkXFk4Bvi8HkeBgt+LkIt5wNgXLtBD1/Ds7Ujri0bVityoweizXQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9DwtOeNPiNmsOaWfASSm4Y92u2Mrt70pN4Ymz4MEDDuJO3kfux
	/G2s1k359NwDFgL6ZeWPFbVtYqxdyk5q8z3FezyLchsYKjjLIUUfmM62
X-Gm-Gg: AYBFou1U7NitrbGs1n7XHmmOT8BzPFAF2E+fgws0HfnNaPWXLy/fDoxL5TblzivlzWR
	cFNUhEOYNwmcDit8tRUZ+4EQFrwT9YFD4ggsql+rHmDXjiHorw0Weef/Z51JU/c6gAchtqt/hdv
	/4UqJq5p86btS2ovwTFQF/cGiGXR1kcCqEJ8UfKpK2IWd0Mw1c98BtYgemPaSQjrAlUZXqNhfNA
	uY9698sJ4m4LuCmZj6sHMe5/uGsXUk1rqINmczBpc8xc38p9qV8eHjwACxudfKpVckPZrz6LRAk
	JFEPyimjYBIH9t3ievBeGHnZoj1CDMzCgMF6w6zsunisHuOekeswteU4KdVQ49eSwU+qsgSemFH
	OE/FHm9Stg1TXi8REtKLct5TPBSt3EvDCL4EMuq0BCE3B6FSYeU0O06J9qsd29pzTmvZTKgxfFX
	CULkaEPyMDtPgV/bj3joAK7UW73bno7ngKq9ctsHW4MHkL6ZXnr5TvkIQ4i1ytpn7nw3gGB4w1E
	pOU8ijAve3bRamgc0i0XF3d2IGCuqZnJ19y1IZ+h4uPHv8eFN6xuyyKfYggvCm3YOj7QSweF6Ls
	wkMpeCJaMPDKXJrU9njuI6+V8nKa6UzK6Rn6TlUhKv+RfTBE+e7TAJQ+YGP3ZwlwvIVu6eQHdIU
	ArXk=
X-Received: by 2002:a05:7300:c00f:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-36a4ea91fd1mr23802841eec.9.1793837694081;
        Wed, 04 Nov 2026 16:14:54 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39972d4sm18304920eec.26.2026.11.04.16.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:14:53 -0800 (PST)
Message-ID: <0093d120-b966-4ece-be57-55a4751e17be@gmail.com>
Date: Thu, 5 Nov 2026 08:14:41 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-2-shanchun1218@gmail.com>
 <20261104-vole-of-legendary-plenty-811cf1@quoll>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <20261104-vole-of-legendary-plenty-811cf1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_161455_662119_DABC19F9 
X-CRM114-Status: GOOD (  21.41  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Dear Krzysztof,

Thanks for your review.

On 11/4/2026 10:03 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 10:22:01AM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
> 
> Looks like valid Sashiko review, so only few nits, not a full review:
> 
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 +++++++++++
>>   include/dt-bindings/dma/ma35d1-pdma.h         | 113 ++++++++++++++++++
>>   2 files changed, 185 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>>   create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h
>>
>> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> new file mode 100644
>> index 000000000000..cd752571242c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 PDMA controller
>> +
>> +description:
>> +  This describes the devicetree bindings for four Peripheral DMA engines to perform
> 
> Do not describe what the binding document is describe. Just describe
> that directly, so explain the hardware. Look at other examples.
I will fix it.
> 
>> +  memory-to-memory, memory-to-peripheral, or peripheral-to-memory data transfer
>> +  capable of supporting 10 channels, implemented in Nuvoton MA35D1 SoCs.
>> +
>> +maintainers:
>> +  - Shan-Chun Hung <shanchun1218@gmail.com>
>> +
>> +allOf:
>> +  - $ref: dma-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-pdma
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#dma-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the channel number. The second cell is the
>> +      peripheral request source (REQSRC) selection, which defines which
>> +      peripheral is connected to that PDMA channel.
>> +
>> +  dma-channels:
>> +    const: 10
> 
> Why isn't this implied by the compatible? Drop.
I will remove it.
> 
>> +
>> +additionalProperties: false
> 
> This goes after required block.
I will fix it.>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#dma-cells"
>> +  - dma-channels
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        dma-controller@40080000 {
>> +            compatible = "nuvoton,ma35d1-pdma";
>> +            reg = <0x0 0x40080000 0x0 0x2000>;
>> +            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk PDMA0_GATE>;
>> +            #dma-cells = <2>;
>> +            dma-channels = <10>;
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/include/dt-bindings/dma/ma35d1-pdma.h b/include/dt-bindings/dma/ma35d1-pdma.h
>> new file mode 100644
>> index 000000000000..0ddc99d29661
>> --- /dev/null
>> +++ b/include/dt-bindings/dma/ma35d1-pdma.h
> 
> Filename must match the binding filename.
I will fix it>
>> @@ -0,0 +1,113 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_DMA_MA35D1_PDMA_H__
>> +#define __DT_BINDINGS_DMA_MA35D1_PDMA_H__
>> +
>> +#define MA35D1_PDMA_MEM			0
> 
> 
> Hole
> 
>> +#define MA35D1_PDMA_UART0_TX		4
>> +#define MA35D1_PDMA_UART0_RX		5
>> +#define MA35D1_PDMA_UART1_TX		6
>> +#define MA35D1_PDMA_UART1_RX		7
>> +#define MA35D1_PDMA_UART2_TX		8
>> +#define MA35D1_PDMA_UART2_RX		9
>> +#define MA35D1_PDMA_UART3_TX		10
>> +#define MA35D1_PDMA_UART3_RX		11
>> +#define MA35D1_PDMA_UART4_TX		12
>> +#define MA35D1_PDMA_UART4_RX		13
>> +#define MA35D1_PDMA_UART5_TX		14
>> +#define MA35D1_PDMA_UART5_RX		15
>> +#define MA35D1_PDMA_UART6_TX		16
>> +#define MA35D1_PDMA_UART6_RX		17
>> +#define MA35D1_PDMA_UART7_TX		18
>> +#define MA35D1_PDMA_UART7_RX		19
>> +#define MA35D1_PDMA_UART8_TX		20
>> +#define MA35D1_PDMA_UART8_RX		21
>> +#define MA35D1_PDMA_UART9_TX		22
>> +#define MA35D1_PDMA_UART9_RX		23
>> +#define MA35D1_PDMA_UART10_TX		24
>> +#define MA35D1_PDMA_UART10_RX		25
>> +#define MA35D1_PDMA_UART11_TX		26
>> +#define MA35D1_PDMA_UART11_RX		27
>> +#define MA35D1_PDMA_UART12_TX		28
>> +#define MA35D1_PDMA_UART12_RX		29
>> +#define MA35D1_PDMA_UART13_TX		30
>> +#define MA35D1_PDMA_UART13_RX		31
>> +#define MA35D1_PDMA_UART14_TX		32
>> +#define MA35D1_PDMA_UART14_RX		33
>> +#define MA35D1_PDMA_UART15_TX		34
>> +#define MA35D1_PDMA_UART15_RX		35
>> +#define MA35D1_PDMA_UART16_TX		36
>> +#define MA35D1_PDMA_UART16_RX		37
>> +#define MA35D1_PDMA_QSPI0_TX		54
> 
> You should not have holes in the ABI or this is not DT ABI, so drop or
> move out entire file from bindings.
I will fix it.>
> Best regards,
> Krzysztof

Best Regards,
Shan-Chun

