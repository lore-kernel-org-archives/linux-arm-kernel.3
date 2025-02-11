Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504BDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YC1gXlnNzbB0rlx+w5KGQ+4eRQYEG4qr6e2zWjQjR3g=; b=hyA0A0G/k9F81zkDeMU17PetHC
	d84GzxgMhRRSBnDjR8/z9VwdkSNF2HXd/jMyNusKEcAXn+wKryCWfFJGBjurAraXQshofTtKLFFQL
	qGh4XCfw4ZoNq9iZ9nEBVvZsbhN0nS1cgOyOpN9wu4xME6stTPovMRv50Z7wfuRD24dIgoJgPFqZh
	n9tVGD2gLfOU+Y24fkK2EtxiuHA9FRqJRXn7kDZLmGsyJ1+vKpYXRpehxNS0pB3YlYYWiJNUq8sCE
	Tp7ugj6lAzoMUgDljjQYp7l4OUbG54Z6exHMnhNi82gjaSFG87T8n0cUe1znymcSeTXk4bHX7Ags+
	0JNKR/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thye5-00000005SZ8-31iY;
	Tue, 11 Feb 2025 22:22:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thycf-00000005SHA-22gx;
	Tue, 11 Feb 2025 22:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17D83A40DDB;
	Tue, 11 Feb 2025 22:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9950C4CEDD;
	Tue, 11 Feb 2025 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739312452;
	bh=rm/mPom9O53rzuai9/9yCCN3l8DHv5fmZsGl/Jcd/cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwxGUsru+22EfdRz6VurnP19Mh+6v8rbJsY6pBppKOb6FUwmeRwAVCRLQOpxFj/q/
	 ZUwGB+6X+pcMM2K4GFoimGUA1NnewnIEIFIscilqHBPWKsB0WzClu6Psb3HCz0wskk
	 Hu9E5UVN5RjPBUh7etb+Rxr9goc9FzeA3+3Fn9UjTPeyRG+/5y0sDlaAa5JYVKZFi7
	 b3SBuFrNTGIlkecNVNRCoRbWsMJXNTKthFxOSy3K6HwULlUXQC191OdjYj7yxJxZa9
	 oanPS68QwU1KHMciEW4saxbVJU5oIpUyPmoLjUaqSdpaxCsN1cgKTSYbm7V6SoKy6D
	 IYaIWXLABMnDA==
Date: Tue, 11 Feb 2025 16:20:50 -0600
From: Rob Herring <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	review list <kernel-list@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20250211222050.GA1285038-robh@kernel.org>
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
 <20250206-media-rpi-hevc-dec-v2-3-69353c8805b2@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-3-69353c8805b2@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_142053_667095_F0590325 
X-CRM114-Status: GOOD (  18.02  )
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

On Thu, Feb 06, 2025 at 06:02:36PM +0000, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
> and BCM2712 / Raspberry Pi 5.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/media/raspberrypi,hevc-dec.yaml       | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> new file mode 100644
> index 000000000000..06db7004c765
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi HEVC Decoder
> +
> +maintainers:
> +  - John Cox <john.cox@raspberrypi.com>
> +  - Dom Cobley <dom@raspberrypi.com>
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
> +
> +description:
> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> +  boards respectively.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - raspberrypi,hevc-dec

SoC specific compatible please. If they are 'the same' then 2712 can 
fallback to 2711.

> +
> +  reg:
> +    items:
> +      - description: The HEVC main register region
> +      - description: The Interrupt control register region
> +
> +  reg-names:
> +    items:
> +      - const: hevc
> +      - const: intc
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The HEVC block clock
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    video-codec@7eb10000 {
> +        compatible = "raspberrypi,hevc-dec";
> +        reg = <0x7eb00000 0x10000>, /* HEVC */
> +              <0x7eb10000 0x1000>;  /* INTC */
> +        reg-names = "hevc",
> +                    "intc";
> +
> +        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&clk 0>;
> +    };
> +
> +...
> 
> -- 
> 2.34.1
> 

