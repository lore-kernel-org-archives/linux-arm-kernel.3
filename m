Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1DDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoTWSL9+cAKZ7YpOkzAOTA6eZLGAom+hQ00Qe5oXGxo=; b=TlDTcV4HC2R+1HtxjtepLFTASb
	vYgP9PK791t9Dd+rQdG2Mt8qavX3x3Sac2AaJgHfjcKreVaakxS/ZiDkhG04Wu32RbxzJIGyDOiMx
	aYn88R/rw3NDrJ/jNQHoM7yUn5qF2jRsGkTqJwMC/+VWvrA9rn6AYHa7TNcPsTBoegNZGaZ6dEPnZ
	U9Ige/QaCXt9Daj+eQnMd6js8OrwcLJIjZS8n9gGKgWWdqFgSxOXitZQ3NYPaNOYuYW9+pl9ZgRz6
	4dJ+Ki6f8qJh8bOs8XFdWssF54jT3RtZl4fde562A7L6W6LfSzPFw65SpsaNDi2IONAZroQlbQw4L
	eykPHurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRH0-00000007Wjy-0WbV;
	Wed, 08 Jan 2025 08:18:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRF2-00000007WVg-0943;
	Wed, 08 Jan 2025 08:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53FA15C4B58;
	Wed,  8 Jan 2025 08:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AC8C4CEE0;
	Wed,  8 Jan 2025 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736324199;
	bh=RYpqzehaxcbuCAQe6zrPlG3oflSe5JINhcfNw0oboaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SN9rihRiNeZ6JiTIV9G8AhvKNqTV65xqUUlJ6zm3F6KFLgu21kpDjS7GaMDz/nlj1
	 7AEZWS6jajD7fdAa9NdRFU+z29OUbylvSL9N2/fvCjkH1itEXOr8uovDc/n5pmRRR/
	 pRd6B9NjZhNcQhFeuTU9YRYRgvnbY7LdgOcPQ9eBwJ0GeT8OGD1jLY2QcRTcomk9/b
	 eGJf/tY+XVwTrCLBpR1qGY0M2vDb5DlKLyFkJvyG4EuLPUmXzfhEJvA0GqP1Zb8/Ps
	 6stQQ35xCMsudVnMco5Sv8x8WNMIgXprRSzPzULtFEWsJEFROzMEXEERRovyteLcHh
	 4c5v4d0woNtMQ==
Date: Wed, 8 Jan 2025 09:16:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Simon Xue <xxm@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/7] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Message-ID: <tsxho4vhadrl6tsb2k5e2vxaeuun3k5pdkojzwjruqkof54dyd@gs3wsuxzwu4a>
References: <20250107074911.550057-1-kever.yang@rock-chips.com>
 <20250107074911.550057-3-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107074911.550057-3-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_001640_124172_6B2911C4 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, Jan 07, 2025 at 03:49:06PM +0800, Kever Yang wrote:
> rk3576 is using dwc controller, with msi interrupt directly to gic instead
> of to gic its, so
> - no its support is required and the 'msi-map' is not need anymore,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v4:
> - Fix wrong indentation in dt_binding_check report by Rob
> 
> Changes in v3:
> - Fix dtb check broken on rk3588
> - Update commit message
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../devicetree/bindings/pci/rockchip-dw-pcie-common.yaml      | 4 +++-
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml   | 4 +---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> index cc9adfc7611c..e4fcc2dff413 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> @@ -81,7 +81,9 @@ properties:
>        - const: msg
>        - const: legacy
>        - const: err
> -      - const: dma0
> +      - enum:
> +          - msi
> +          - dma0

Commit msg said new interrupt, but this basically replaces existing DMA0
interrupt. Maybe that's the problem with this common binding and you
just miss constraining in each device binding. If so: fix also them.

Also: your interrupts property does not match this anymore.

Best regards,
Krzysztof


