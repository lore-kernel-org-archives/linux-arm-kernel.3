Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337EEE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy3NxP/upUPs8aVy5fjSNXKoZrNXULvBiayFhbwRgso=; b=rs1TeWoCZlAj3IJgs5fmtG5/Mw
	odKIc16ByjNGnHlMS7+XujKiAbBIU4hJBN9TOqprLcDNCzMFhbeCFvZPA6GN8NU2wOcYha9LZNipl
	Eg3Vr68dQoXN4c0xqgtmz5MPYjQzn1NiPZEc52awSE6meGr2RFeTwBakGsH+kBjnZ4NFJCeq3sjET
	QeD/7puZoO4xLcRzVgoNXTeXxz82STvSwRiwxANpW6Gno7J1vseWRBGPP28sjoIrydW2Zo8dgzR4M
	SOqdkt9lrH7cuSn77NNpViigDAFr883zCqqCNqVariOi4+BvkM3ZSWTcvRr/wWITtKGNrcSpBZ3Vr
	3jRaqYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHor-0000000GEYG-1B9p;
	Fri, 10 Jan 2025 16:25:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHfk-0000000GBYF-2rhq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDD7D5C47CA;
	Fri, 10 Jan 2025 16:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAC8C4CEE0;
	Fri, 10 Jan 2025 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736525743;
	bh=61C4cwG4OyNQVRbldcgIFgCBU3BMWHzrvwdVoNgwlds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=siVy4JB4/lGt/BaPf5LcqOxLHpIX3VZfWkpqHAMC6wvz1d5XlT7rPDUSkeyB5fWXC
	 CNUa+9cCQP2WwguRTONR2++rkcfcY9unOLzCbD172HT0Br1Zk2kd5ZdTXmNIhH57jt
	 lMClCVdNbjb+scchWFn3R2IO9ak9oJ03YXosYa/z5rG2C7rbJXYTnvw/tJPKcXHr1a
	 h6LMZlvfbJyONCDtnHtbRFJGkSO/typUK3NmLHHDjjkQ8Zcep/MxU8nc8zIKX15bRq
	 T/dyGwq6yshE6DPZDE6JRSh7SgW/lLuIWEuVxsT1pyyfxuIcFrNCKFA9U9WSqbnha5
	 69K8W03ZAGOjQ==
Date: Fri, 10 Jan 2025 10:15:42 -0600
From: Rob Herring <robh@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250110161542.GA2966768-robh@kernel.org>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-2-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_081544_802828_76354DFA 
X-CRM114-Status: GOOD (  23.92  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
> From: Parvathi Pudi <parvathi@couthit.com>
> 
> Documentation update for the newly added "pruss2_eth" device tree
> node and its dependencies along with compatibility for PRU-ICSS
> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   6 +
>  .../bindings/net/ti,icssm-prueth.yaml         | 153 ++++++++++++++++++
>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>  4 files changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> index e36e3a622904..afacdb61a84c 100644
> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> @@ -8,18 +8,24 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral (IEP) module
>  
>  maintainers:
>    - Md Danish Anwar <danishanwar@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
>  
>  properties:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
> +              - ti,am5728-icss-iep
>                - ti,am642-icss-iep
>                - ti,j721e-icss-iep
>            - const: ti,am654-icss-iep
>  
>        - const: ti,am654-icss-iep
>  
> +      - items:
> +          - enum:
> +              - ti,am5728-icss-iep

You can't have both. It's either compatible with ti,am654-icss-iep or it 
isn't.

>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> new file mode 100644
> index 000000000000..34d68619c086
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments ICSSM PRUSS Ethernet
> +
> +maintainers:
> +  - Roger Quadros <rogerq@ti.com>
> +  - Andrew F. Davis <afd@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> +
> +description:
> +  Ethernet based on the Programmable Real-Time Unit and Industrial
> +  Communication Subsystem.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am57-prueth     # for AM57x SoC family
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to OCMC SRAM node
> +
> +  ti,mii-rt:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to MII_RT module's syscon regmap
> +
> +  ti,iep:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
> +
> +  ecap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Enhanced Capture (eCAP) event for ICSS
> +
> +  interrupts:
> +    maxItems: 2
> +    description:
> +      Interrupt specifiers to IRQ.

Provide a description for each entry because I can't decipher the names.

> +
> +  interrupt-names:
> +    items:
> +      - const: rx_lre_hp
> +      - const: rx_lre_lp

The same prefix or suffix on every entry is usually redundant.

> +
> +  ethernet-ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      ^port@[0-1]$:

ethernet-port

> +        type: object
> +        description: ICSSM PRUETH external ports
> +        $ref: ethernet-controller.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            items:
> +              - enum: [0, 1]
> +            description: ICSSG PRUETH port number
> +
> +          interrupts:
> +            maxItems: 3
> +
> +          interrupt-names:
> +            items:
> +              - const: rx
> +              - const: emac_ptp_tx
> +              - const: hsr_ptp_tx
> +
> +          ti,no-half-duplex:
> +            type: boolean
> +            description:
> +              Disable half duplex operation on ICSSM MII port.
> +
> +        required:
> +          - reg

blank line

> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
> +required:
> +  - compatible
> +  - sram
> +  - ti,mii-rt
> +  - ti,iep
> +  - ecap
> +  - ethernet-ports
> +  - interrupts
> +  - interrupt-names
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/ti,pru-consumer.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* Dual-MAC Ethernet application node on PRU-ICSS2 */
> +    pruss2_eth: pruss2-eth {
> +      compatible = "ti,am57-prueth";
> +      ti,prus = <&pru2_0>, <&pru2_1>;
> +      sram = <&ocmcram1>;
> +      ti,mii-rt = <&pruss2_mii_rt>;
> +      ti,iep = <&pruss2_iep>;
> +      ecap = <&pruss2_ecap>;
> +      interrupts = <20 2 2>, <21 3 3>;
> +      interrupt-names = "rx_lre_hp", "rx_lre_lp";
> +      interrupt-parent = <&pruss2_intc>;
> +
> +      ethernet-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pruss2_emac0: port@0 {
> +          reg = <0>;
> +          phy-handle = <&pruss2_eth0_phy>;
> +          phy-mode = "mii";
> +          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
> +          ti,no-half-duplex;
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +
> +        pruss2_emac1: port@1 {
> +          reg = <1>;
> +          phy-handle = <&pruss2_eth1_phy>;
> +          phy-mode = "mii";
> +          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
> +          ti,no-half-duplex;
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> new file mode 100644
> index 000000000000..d42e636bf516
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,pruss-ecap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments PRU-ICSS Enhanced Capture (eCAP) event module
> +
> +maintainers:
> +  - Murali Karicheri <m-karicheri2@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> +
> +properties:
> +  compatible:
> +    const: ti,pruss-ecap
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pruss0_ecap: ecap@30000 {

Drop unused labels.

> +        compatible = "ti,pruss-ecap";
> +        reg = <0x30000 0x60>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> index 927b3200e29e..ddd65bd93aa1 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> @@ -251,6 +251,15 @@ patternProperties:
>  
>      type: object
>  
> +  ecap@[a-f0-9]+$:
> +    description: |

Don't need '|'

> +      PRU-ICSS has a Enhanced Capture (eCAP) event module which can generate
> +      and capture periodic timer based events which will be used for features
> +      like RX Pacing to rise interrupt when the timer event has occurred.
> +      Each PRU-ICSS instance has one eCAP modeule irrespective of SOCs.
> +
> +    type: object
> +
>    mii-rt@[a-f0-9]+$:
>      description: |
>        Real-Time Ethernet to support multiple industrial communication protocols.
> -- 
> 2.34.1
> 

