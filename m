Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1BCC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2XQLV4aLD43qPZMOaiCyb5XHhJ7aGDzpCR9qbH50xw=; b=rOIjaQBvfeNhsl6o7RdDmx3XfI
	WGxWLKPaDTX3ViWqzOisuilKe8o6Rdek53kmcMXRYZ/Qm+TwYxf/mfErSV+KshXEeWB6zvPoPWs3w
	ZVDGb2xlh8XuyM4j6r6xjkxBF2l0ndewpYONkJNcuhwNtqUD6StH/vNWYDvMQIm+sZHPq1YUb/3XD
	c8OpijXIRSUpT+477fMoum59NkRLGOheWg1QaW3m9ltnU8YiO0ciGTNGGXaYZphDEohsD1q54o1ec
	68M3q9y/iF2bfx0OZ6vqM3E3ROu4/zdK6VnNlucWXiiZ5CLcMMmvMAEGwEonjt0P/f2O7VkAqJhFK
	Hi1+07XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QjC-00000000wKr-2cD8;
	Fri, 25 Apr 2025 21:36:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QS7-00000000uWn-2G4Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D78B4ABAF;
	Fri, 25 Apr 2025 21:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D428BC4CEE4;
	Fri, 25 Apr 2025 21:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745615959;
	bh=b9bm/p8zSpCIfixDbHrqSOd8EYP29vfm3KZGTV072So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RD9ko8Xif61xELtnsNDb/QNzYZzYZ49tUz/ommuRJVDqjIQb4hd0l1OEANf+99VnX
	 CvRlZ4XFslnHOoKOZqfoh3Skplj2QGOjyucPY2u8iKj6yNvCoUDZfqf36d6swDpx1A
	 xEAd4wMOm9xtaVOYP5YC0RfFp9V+n6LbzE4i3URXxQJEtLYCDXTz/czEExCg0zIeMa
	 2Dmdbt7H2NP/U3n+ivhCektD/CFSnEHJ0/shaAlDYPw6CJhnqrRogb8EwHLPaJIWHM
	 aDzhVEC7rubrd1FbCZ8rvsdyHJBzliLZSr9U55CLP9ihuiBMa+8nwPOEsFjWO9+T52
	 AmsCAvTaEeziA==
Date: Fri, 25 Apr 2025 16:19:17 -0500
From: Rob Herring <robh@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v6 01/11] dt-bindings: net: ti: Adds DUAL-EMAC
 mode support on PRU-ICSS2 for AM57xx, AM43xx and AM33xx SOCs
Message-ID: <20250425211917.GA3108205-robh@kernel.org>
References: <20250423060707.145166-1-parvathi@couthit.com>
 <20250423060707.145166-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423060707.145166-2-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_141919_613033_7143A6B7 
X-CRM114-Status: GOOD (  22.69  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 23, 2025 at 11:36:57AM +0530, Parvathi Pudi wrote:
> Documentation update for the newly added "pruss2_eth" device tree
> node and its dependencies along with compatibility for PRU-ICSS
> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> 
> Co-developed-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>  .../devicetree/bindings/net/ti,icss-iep.yaml  |  10 +-
>  .../bindings/net/ti,icssm-prueth.yaml         | 233 ++++++++++++++++++
>  .../bindings/net/ti,pruss-ecap.yaml           |  32 +++
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 +
>  4 files changed, 281 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> index e36e3a622904..ea2659d90a52 100644
> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> @@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral (IEP) module
>  
>  maintainers:
>    - Md Danish Anwar <danishanwar@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
>  
>  properties:
>    compatible:
> @@ -17,9 +19,11 @@ properties:
>                - ti,am642-icss-iep
>                - ti,j721e-icss-iep
>            - const: ti,am654-icss-iep
> -
> -      - const: ti,am654-icss-iep
> -
> +      - enum:
> +          - ti,am654-icss-iep
> +          - ti,am5728-icss-iep
> +          - ti,am4376-icss-iep
> +          - ti,am3356-icss-iep
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> new file mode 100644
> index 000000000000..d42aea70eb76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> @@ -0,0 +1,233 @@
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
> +      - ti,am4376-prueth   # for AM43x SoC family
> +      - ti,am3359-prueth   # for AM33x SoC family
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

regmap is a Linuxism. Say what functionality you need from this block.

> +
> +  ti,iep:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
> +
> +  ti,ecap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Enhanced Capture (eCAP) event for ICSS
> +
> +  interrupts:
> +    items:
> +      - description: High priority Rx Interrupt specifier.
> +      - description: Low priority Rx Interrupt specifier.
> +
> +  interrupt-names:
> +    items:
> +      - const: rx_hp
> +      - const: rx_lp
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
> +      ^ethernet-port@[0-1]$:
> +        type: object
> +        description: ICSSM PRUETH external ports
> +        $ref: ethernet-controller.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            items:
> +              - enum: [0, 1]
> +            description: ICSSM PRUETH port number
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
> +        required:
> +          - reg
> +
> +    anyOf:
> +      - required:
> +          - ethernet-port@0
> +      - required:
> +          - ethernet-port@1
> +
> +required:
> +  - compatible
> +  - sram
> +  - ti,mii-rt
> +  - ti,iep
> +  - ti,ecap
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

Drop unused labels.

> +      compatible = "ti,am57-prueth";
> +      ti,prus = <&pru2_0>, <&pru2_1>;
> +      sram = <&ocmcram1>;
> +      ti,mii-rt = <&pruss2_mii_rt>;
> +      ti,iep = <&pruss2_iep>;
> +      ti,ecap = <&pruss2_ecap>;
> +      interrupts = <20 2 2>, <21 3 3>;
> +      interrupt-names = "rx_hp", "rx_lp";
> +      interrupt-parent = <&pruss2_intc>;
> +
> +      ethernet-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pruss2_emac0: ethernet-port@0 {
> +          reg = <0>;
> +          phy-handle = <&pruss2_eth0_phy>;
> +          phy-mode = "mii";
> +          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +
> +        pruss2_emac1: ethernet-port@1 {
> +          reg = <1>;
> +          phy-handle = <&pruss2_eth1_phy>;
> +          phy-mode = "mii";
> +          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +      };
> +    };
> +  - |
> +    /* Dual-MAC Ethernet application node on PRU-ICSS1 */
> +    pruss1_eth: pruss1-eth {
> +      compatible = "ti,am4376-prueth";
> +      ti,prus = <&pru1_0>, <&pru1_1>;
> +      sram = <&ocmcram>;
> +      ti,mii-rt = <&pruss1_mii_rt>;
> +      ti,iep = <&pruss1_iep>;
> +      ti,ecap = <&pruss1_ecap>;
> +      interrupts = <20 2 2>, <21 3 3>;
> +      interrupt-names = "rx_hp", "rx_lp";
> +      interrupt-parent = <&pruss1_intc>;
> +
> +      pinctrl-0 = <&pruss1_eth_default>;
> +      pinctrl-names = "default";
> +
> +      ethernet-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pruss1_emac0: ethernet-port@0 {
> +          reg = <0>;
> +          phy-handle = <&pruss1_eth0_phy>;
> +          phy-mode = "mii";
> +          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +          interrupt-names = "rx", "emac_ptp_tx",
> +                                          "hsr_ptp_tx";
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +
> +        pruss1_emac1: ethernet-port@1 {
> +          reg = <1>;
> +          phy-handle = <&pruss1_eth1_phy>;
> +          phy-mode = "mii";
> +          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
> +          interrupt-names = "rx", "emac_ptp_tx",
> +                                          "hsr_ptp_tx";
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +      };
> +    };
> +  - |
> +    /* Dual-MAC Ethernet application node on PRU-ICSS */
> +    pruss_eth: pruss-eth {

Really need 3 examples?

> +      compatible = "ti,am3359-prueth";
> +      ti,prus = <&pru0>, <&pru1>;
> +      sram = <&ocmcram>;
> +      ti,mii-rt = <&pruss_mii_rt>;
> +      ti,iep = <&pruss_iep>;
> +      ti,ecap = <&pruss_ecap>;
> +      interrupts = <20 2 2>, <21 3 3>;
> +      interrupt-names = "rx_hp", "rx_lp";
> +      interrupt-parent = <&pruss_intc>;
> +
> +      pinctrl-0 = <&pruss_eth_default>;
> +      pinctrl-names = "default";
> +
> +      ethernet-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pruss_emac0: ethernet-port@0 {
> +          reg = <0>;
> +          phy-handle = <&pruss_eth0_phy>;
> +          phy-mode = "mii";
> +          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +          interrupt-names = "rx", "emac_ptp_tx",
> +                                          "hsr_ptp_tx";
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +
> +        pruss_emac1: ethernet-port@1 {
> +          reg = <1>;
> +          phy-handle = <&pruss_eth1_phy>;
> +          phy-mode = "mii";
> +          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
> +          interrupt-names = "rx", "emac_ptp_tx",
> +                                          "hsr_ptp_tx";
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> new file mode 100644
> index 000000000000..42f217099b2e
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
> +    pruss2_ecap: ecap@30000 {
> +        compatible = "ti,pruss-ecap";
> +        reg = <0x30000 0x60>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> index 927b3200e29e..594f54264a8c 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> @@ -251,6 +251,15 @@ patternProperties:
>  
>      type: object
>  
> +  ecap@[a-f0-9]+$:
> +    description:
> +      PRU-ICSS has a Enhanced Capture (eCAP) event module which can generate
> +      and capture periodic timer based events which will be used for features
> +      like RX Pacing to rise interrupt when the timer event has occurred.
> +      Each PRU-ICSS instance has one eCAP modeule irrespective of SOCs.
> +
> +    type: object

This should either have a ref to ti,pruss-ecap.yaml or should just move 
reg and compatible here since it is only 2 properties.

> +
>    mii-rt@[a-f0-9]+$:
>      description: |
>        Real-Time Ethernet to support multiple industrial communication protocols.
> -- 
> 2.34.1
> 

