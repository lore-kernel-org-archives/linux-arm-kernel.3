Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673C7D42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8RVbuhAuOOtVqajKeZzm/yu5GoEbl0NV7GTa3C3K8I=; b=YqNdrx1iXMDG4n+JFmi9iH8VwS
	/FHgsCq5egE+A4PK7eUztKX879H3zgMH17umLFKjALrnijsoEs243Ws5IVyzQbF6chDdZVjTJsiue
	qyhYsnKI+d2mbZVPMpUYqQ8rMDR2uHQcreF9M62G1vX428VJ47ZZ7t/VvFxbKRwDCc9uB0TPm2YcI
	XoXfI8+gIhRJwqJzXK6KPKPcKB+9ir/GYSSIpssEJIr0xLVfo5BSfL3/O1SntJJME5zuSG5N4pX5s
	b9cWH83EBgQDrfYqfT911CM38ML43xMPQZRWnymDr9hCUrQbiA5nVBDCflBaPEbzYftZz8qJVPaET
	11nt+Flg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvcE-00000004YgT-1Y44;
	Tue, 12 Nov 2024 18:27:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvaM-00000004YIz-3Rbr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B87B0A4212A;
	Tue, 12 Nov 2024 18:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E44C4CED6;
	Tue, 12 Nov 2024 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731435953;
	bh=yrKfGOXX98/cELtVgxzNSD4kt98nETX3Dt/9ZDr29SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CoDagJq8V8BhywiH9SWUK9yNn+wPEqeK4ep/tpSx9d4zgCLn4J2J/KOTGBGKSCyjR
	 RaGXkCY7VTGOe0uJeNJw5YAa49bnrjfEXxkQA7hND6OCiNGeYyXTpi+iFo2Xhu29O+
	 lL/pMvTJXMKzka+Yyg2UhibCZBinnXLlNQamr+ljIF4zrPM4GNJRk+09omulpyVsAV
	 dBgV4M9obIbNtfBnxYps/ByfZyxA6KjakZ/aB6wql2w+5Sh45yUjEX5foogA+gEv+W
	 TFse51KJP5S+RATFTHiIKIPToMPonHImABDcJmVqiR7itg79pmiX+yd9MFwoTWj1kn
	 eM5fQ+cOrvoZg==
Date: Tue, 12 Nov 2024 12:25:51 -0600
From: Rob Herring <robh@kernel.org>
To: mjchen <mjchen0829@gmail.com>
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <20241112182551.GA1394330-robh@kernel.org>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
 <20241112053059.3361-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_102555_026071_376143D3 
X-CRM114-Status: GOOD (  21.33  )
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

On Tue, Nov 12, 2024 at 05:30:58AM +0000, mjchen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: mjchen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..71debafc3890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Keypad
> +
> +maintainers:
> +  - Ming-jen Chen <mjchen0829@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-kpi
> +
> +  debounce-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
> +    description: |
> +      Key debounce period select, specified in terms of keypad IP clock cycles.
> +      Valid values include 0 (no debounce) and specific clock cycle values:
> +      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.

No need to list the values twice.

We already have a bunch of debounce time properties. Don't add more. If 
you have the clock frequency, then you can use the existing 
"debounce-delay-ms" and convert to register values.

> +
> +  nuvoton,key-scan-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set the time it takes to scan each key in the keypad, in clock cycles of the IP.
> +      This parameter controls how frequently the keypad is scanned, adjusting the response time.
> +      The valid range is from 1 to 256 clock cycles.
> +    minimum: 1
> +    maximum: 256
> +
> +  nuvoton,key-scan-time-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set a divider that adjusts the scan time for each key.
> +      This value scales the time it takes to scan each key
> +      by multiplying the key-scan-time by the specified factor.
> +      For example, if you set key-scan-time to 64 cycles and configure key-scan-time-div to 2,
> +      the scan time for each key will be increased to 128 cycles (64 cycles * 2). time.
> +    minimum: 1
> +    maximum: 256

Again, we have existing properties such as scan-interval, 
scan-interval-ms, and scan-delay. How is this different? 

With a single property in time units, you can solve for how many clock 
cycles.


> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +  - debounce-period
> +  - nuvoton,key-scan-time
> +  - nuvoton,key-scan-time-div
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {
> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;
> +      interrupts = <79>;
> +      clocks = <&clk>;

> +      keypad,num-rows = <2>;
> +      keypad,num-columns = <2>;

Surely these should be required?

> +
> +      linux,keymap = <
> +         MATRIX_KEY(0, 0, KEY_ENTER)
> +         MATRIX_KEY(0, 1, KEY_ENTER)
> +         MATRIX_KEY(1, 0, KEY_SPACE)
> +         MATRIX_KEY(1, 1, KEY_Z)
> +      >;
> +
> +      debounce-period = <8>;
> +      nuvoton,key-scan-time = <1>;
> +      nuvoton,key-scan-time-div = <24>;
> +    };
> -- 
> 2.25.1
> 

