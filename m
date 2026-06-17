Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1ACCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMycG1ndqRl0cGcAck43prqsHHxJI4FoJfuvDdddzAI=; b=r3xe32eI8tyoIplYX7jnGyr2OX
	Y14toLyOH6Q0XsymOS9HXntHZjjMEssKSFZVwncROiRp7c1y1KPDTOA572eY+7lBN+RzkFCniqkOB
	IAioggtIglazEbQ72M1o3jD6lD6aWzpyvH0ohPpHGyA/sHR2sGEHTkJIGucr3TAlD4j3rh/5GfprE
	wMacb/WrioTjGWt36X8XVRR3qwH847C3ZltnAqNk7Dq7SW59Y6h7K71o7WT6vFppC8AUBk/P6y6RO
	78XzG28gG/fy4KEBi4yPurOD7P8nYB+8/gWylCflDZd56O8U0sKvtb0dR30+NovXgF/6v/tYgH0E6
	ZEcsvOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnpT-0000000HB2n-13Rd;
	Wed, 17 Jun 2026 10:49:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnpS-0000000HB2c-138x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:49:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B6AD600AA;
	Wed, 17 Jun 2026 10:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4A71F000E9;
	Wed, 17 Jun 2026 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781693344;
	bh=qMycG1ndqRl0cGcAck43prqsHHxJI4FoJfuvDdddzAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gNoh+3xrSW7aPhGluYFukYTIjASftnhZSltISCZsyqQqyizG+fvkuCeiIwSYnJz2e
	 JlwzBiStKKLaRwRZOPlss4wKLbkakM/djwoT5q09fKnJAaL9JpgYyMnzs2L19MWIu2
	 BkQmOsDqbl7JgH7qQ8szQOr0IKzoCQ97oy25Q5AtZiJA+1WeOwlVDozta8cBb/xPyi
	 uEXfhBUWqsv6xH2nTrNpfecrxDQpE1Y1rkDleHHMRsKzoFN/JnmHfeIfd7yKwn4za5
	 qG5F8O6sFVlLKUpMHY9lqM5brSR0CRkewrbD5cBrWq3QlwcJz4C7BiTAte9MgRsBUB
	 h/cbpNMcRoj8w==
Date: Wed, 17 Jun 2026 12:49:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Message-ID: <20260617-prodigious-private-inchworm-beae1e@quoll>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
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

On Tue, Jun 16, 2026 at 01:52:16PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Some SoCs like the i.MX9 family allow full access to the fuses only
> through the secure enclave firmware API. Add a property to reference
> the secure enclave node and let the driver use the API.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index a8076d0e2737..14a6429f4a4c 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -53,6 +53,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  secure-enclave:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to the secure enclave node

Two things here:
1. Here you describe what for is that phandle, how it is used by the
hardware. Currently the description repeats the property name and type,
so not much useful.

2. If you access OTP via firmware, then this is completely different
interface than MMIO, thus:
A. reg is not appropriate
B. Device is very different thus it has different compatible and I even
claim should be in different binding. Devices having completely
different SW interface should not be in the same binding, at least
usually.

If any of above is not accurate, then your commit msg should answer why
and give some background.

Best regards,
Krzysztof


