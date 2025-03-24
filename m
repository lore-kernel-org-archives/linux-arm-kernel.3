Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFFEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42P5vkq2rBQHuq46spNPH2ovUefzfZ63iBaCaBNXALE=; b=puUG9+L16BkVoADw1Cf+kCt14+
	6FaWwNgiHly9wEhCXEgWWmByU+k/R8IAXrg6hGZt3+ZZNmtaiK7Dj5lOoTxSUIv6mjsXudoTCQOWV
	5iXDbq7rGFQ7YNsIAVm2hkP60WAH3x4CWqo784KLVrGoCIW8k9COdEvhcrdKBwDXYGwlXysBRl4cb
	Dslksx+8LCAdgCJDVoNuI8PBqSth/V7PxNoW6KQxnt1t5xr2HBNHyzIyK5ZkAVK5IffUK+4iDad3s
	ERa1Wl/RKOjpXzaTLpM3lDjFr6dtRHG3a8Z7vIO7XkUXuu+aqVrpkmNbcwnNr4Om7jdIrXGv/MACU
	fxwROqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twj4T-00000003Qig-3GR0;
	Mon, 24 Mar 2025 14:46:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twj2k-00000003QVE-1wKq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 14:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52427A4A133;
	Mon, 24 Mar 2025 14:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B6FC4CEDD;
	Mon, 24 Mar 2025 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742827485;
	bh=aFlNGtyRy9oVmVjrSqn43hcqtvgmECgCXHyXQI+/7CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8sKAZ2+lhd8maxG/iv8jyZ89kySEjKbcQAe99pgprGn+u9AfKdb7808l67lJeaGF
	 Gjjc18B1BmUBZTHiuk1t8mbG/La2dNDlIzNDsaaXCRUOYgZ/Kv5lpd2Z9ISGAq7pm1
	 eii8h3re+b8WUU/h0EVRY9Z7E+LhMANHqIEed6c68mAzKQawRweqa/o90LEEs1gMc4
	 uVafHwBKMoVbzhNRRAGQHyLaoacx+cRydC9JjSPffc/csDUSjd548JJaInj2YBmKs8
	 5xPRVxfL3EoAKNzeTFtRW4LltVmhp9kHiExZPz1zw//DzYWz3JZq3yKYDVzzCJMOYU
	 dUryZbbH63Dsg==
Date: Mon, 24 Mar 2025 09:44:43 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thomas Fossati <thomas.fossati@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: NXP System Timer Module
Message-ID: <20250324144443.GA17721-robh@kernel.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324100008.346009-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_074446_625079_9A5A109F 
X-CRM114-Status: GOOD (  18.10  )
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

On Mon, Mar 24, 2025 at 11:00:05AM +0100, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> new file mode 100644
> index 000000000000..41093892c617
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP System Timer Module (STM)
> +
> +maintainers:
> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
> +
> +description: |

Don't need '|' and wrap at 80 char.

> +  The System Timer Module supports commonly required system and
> +  application software timing functions. STM includes a 32-bit
> +  count-up timer and four 32-bit compare channels with a separate
> +  interrupt source for each channel. The timer is driven by the STM
> +  module clock divided by an 8-bit prescale value.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-stm
> +      - items:
> +          - const: nxp,s32g2-stm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System Timer Module clock

Just 'maxItems: 1'. The description is rather obvious.

> +
> +  clock-names:
> +    items:
> +      - const: stm

No need for *-names when there is only 1 entry.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    stm@4011c000 {

timer@...

> +        compatible = "nxp,s32g2-stm";
> +        reg = <0x4011c000 0x3000>;
> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks 0x3b>;
> +        clock-names = "stm";
> +    };
> -- 
> 2.43.0
> 

