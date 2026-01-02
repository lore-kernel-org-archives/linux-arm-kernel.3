Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A340FA373C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acLrKn5H9orqfm/jVfdKC32zmty9H79cyXEzPRWYxZY=; b=iIhDxLRZbkBruZUcmOoT8z0/Gq
	XxsPd8xqxyanjjzv0ddM/uadxWp8sQ8VVdWSnjrYrkIk6v3WRNeL2Z4KWs/g3oqjAYWkIyjs2FjB+
	k3eSPVDA9f4hcSJrOMqFKAq2GsDIUS9uZoBSoaSYRkyRGWx2hcugyL2K+k5MRuYDLJ9KyyrhlNjRx
	KTd52AqQLy0JYEtY0JrcT+w9O9pCogA68QJUnAUCpVuCQsSssrAsVO+OhEaNe8OfmCrcl1wVf8pFO
	8dy75/Z/CLX9adcsiTWTAHBsa7Vi4UJWuHLKNXpNsHG0ZIGihw4cCffkVTgzDgaALEaZMQKPKuQ2F
	oZiPYejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeIr-00000008CQE-1WEd;
	Fri, 02 Jan 2026 12:30:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeIq-00000008CPq-0emc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BF3660017;
	Fri,  2 Jan 2026 12:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63499C116B1;
	Fri,  2 Jan 2026 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767357046;
	bh=rJC7m9lCc0+e15A46s9W1trAfNGWVYAMEpv2sDUKGls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXcDe7ukpMXFefbqc0Z3d62d5YYkzVeN0TzkD5ZIZGDgs5pFD/IrzYh7y9vQDoh1L
	 WSRyJ/4cVMr5FlxAZICg/8R94pCpZyi4leFXH4POj33333fZUgVL/BWbLiXylyjkGr
	 /DeBbxyMXc4/AexY9pLRlYhcxsK02oyjtdxgEmmbZTpFsDdUkmlVVaVPw49vBNFLlz
	 fm5Sznj6ZgEB4KeDOkDW7jnmEP/1uMDOpkjRMaPl4bj3tlQHnyApfrSIN06Qy+y6v4
	 JlXqkZJZtlCnawt9OtCiNVhh9wgz7WbB2IRmiybYJLwU3ofsWnafembysWmL3dEg56
	 NeEaTfXn+U63w==
Date: Fri, 2 Jan 2026 13:30:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: Add bindings for HSM core
 on TI K3 SoCs
Message-ID: <20260102-shrewd-unnatural-lynx-b7d214@quoll>
References: <20251231165102.950644-1-b-padhi@ti.com>
 <20251231165102.950644-2-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231165102.950644-2-b-padhi@ti.com>
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

On Wed, Dec 31, 2025 at 10:21:00PM +0530, Beleswar Padhi wrote:
> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
> core in the Wakeup Voltage Domain which could be used to run secure
> services like Authentication. Add the device tree bindings document for
> this HSM M4F core.
> 
> The added example illustrates the DT node for the HSM core present on K3
> J722S SoC.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>  .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
> new file mode 100644
> index 0000000000000..f61e4046843af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml

Filename must match the compatible. Are you sure you are following
internal TI guidelines? Did you read them?

> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,k3-hsm-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI K3 HSM M4F processor subsystems
> +
> +maintainers:
> +  - Beleswar Padhi <b-padhi@ti.com>
> +
> +description: |
> +  Some K3 family SoCs have a HSM (High Security Module) M4F core in the
> +  Wakeup Voltage Domain which could be used to run secure services like
> +  Authentication. Some of those are J721S2, J784S4, J722S, AM62X.
> +
> +$ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,hsm-m4fss
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Why do you need these two properties?

> +
> +  reg:

reg is always the second property. Please read DTS coding style.

> +    items:
> +      - description: SRAM0_0 internal memory region
> +      - description: SRAM0_1 internal memory region
> +      - description: SRAM1 internal memory region
> +
> +  reg-names:
> +    items:
> +      - const: sram0_0
> +      - const: sram0_1
> +      - const: sram1
> +
> +  resets:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +    description: Name of firmware to load for the HSM core

Drop description. Can it be anything else than name of the firmware to
load?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - resets
> +  - firmware-name
> +  - ti,sci
> +  - ti,sci-dev-id
> +  - ti,sci-proc-ids
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        remoteproc@43c00000 {
> +            compatible = "ti,hsm-m4fss";
> +            reg = <0x00 0x43c00000 0x00 0x20000>,
> +                  <0x00 0x43c20000 0x00 0x10000>,
> +                  <0x00 0x43c30000 0x00 0x10000>;
> +            reg-names = "sram0_0", "sram0_1", "sram1";
> +            resets = <&k3_reset 225 1>;
> +            firmware-name = "hsm.bin";

Make the binding complete. All properties must be listed.

> +            ti,sci = <&sms>;
> +            ti,sci-dev-id = <225>;
> +            ti,sci-proc-ids = <0x80 0xff>;
> +         };

Messed indentation.

> +    };
> -- 
> 2.34.1
> 

