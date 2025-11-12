Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FADDCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8QXK5IyhwqaMijL3hkVhWCaA8zE6wM5nnYVCkVnNy8=; b=UkesLt95mn3b+LyLLto3J+nGts
	hpcdE0UlXHnzijSW6bw8ghcbe9hea1qxBQYqAAakURyghmdQHRSscB2ZuiXB9PmGUMb+di2FEjria
	z+LxWQwNnVLWREVr02ueKStRQNNGH/dnAojRaT50EmYXTU4ioNVHCI3BEws3Yj5MUxK0PCZvrUYRH
	QINTXZkvrX6OWWBdBbsFNr5wwTKqqeCL10XgcYn4b36r9OazOz92J5EXPChblu2+Ske1CuWB+79j6
	PxFnfAzGJDjO72KEjWenUUeo5TrAZ2U5jEqCzzsf1WATWvAh/lGvbUZSHlNdid7MQOg8Wrv+7xYho
	2+9gYxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6HO-00000008MVa-316N;
	Wed, 12 Nov 2025 08:32:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6HN-00000008MVN-1dSL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D7556022A;
	Wed, 12 Nov 2025 08:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99523C4CEF8;
	Wed, 12 Nov 2025 08:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762936356;
	bh=HLgjcXexC7pF9CiIspXb6LGzy7iOI12i9DXTENjQK1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0FshDGYRzjn07iHUHbVMBW8fPmDhBKmWCPzT00v75yPduJYGW2UmC2/VKp9vxj+7
	 MnCplljpJw87Koy57fVoNRxcUGDoxMdUrXq2eIPT3n3Xqf/R9PBn5JQ0OM85yZBo8i
	 9/EXi274/+HFzeskwFpZGIsDTbCg0iZWrNb+Gzzo8rTeuBMI/PGPn0+7QDMolXxGiy
	 5dq0Mg/RA9jpB+No8NXN3jgCRg44e8sS/qBeu6E/+NjYI5QD+8DaI4gbLYCsXpl56z
	 cHRpZRRNhIIIMv7kebKpg6Z6IxLEm7HJu2hy3xXrhThe6GwyTK2uAMh/+m1Q004QjA
	 1g58dONx5oGKg==
Date: Wed, 12 Nov 2025 09:32:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
References: <20251111130624.3069704-1-royluo@google.com>
 <20251111130624.3069704-2-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111130624.3069704-2-royluo@google.com>
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

On Tue, Nov 11, 2025 at 01:06:23PM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation.
> 
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
> this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> new file mode 100644
> index 000000000000..bfaf6cbdfec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description:
> +  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
> +  features Dual-Role Device single port with hibernation add-on.
> +
> +properties:
> +  compatible:
> +    const: google,gs5-dwc3

Doug just said SoC is lga, not gs5, so you need both to align on that.
Actually not only you both, but whoever else is upstreaming from Google.

It is not the community who should synchronize and organize way how
Google works on their own stuff. Google should organize how Google works
on your Google's stuff.

Best regards,
Krzysztof


