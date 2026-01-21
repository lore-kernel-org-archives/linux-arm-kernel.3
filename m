Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E6C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td401GcfLkeVVEeLUu/ej+zy14d3wB6gTovHrvhNvuI=; b=J3yiTK1ruezEngkkkU0DyaaIzp
	q9Do1KOYsvg9pqKMIhP1wIya88u6M73YTbtIkyY5gfICklsX2J9c40lZwsBM8ENcGXzCNKMBsgK88
	+GzFYXWxaE90onMJXJayJh2UCiKOkPswk5zMkwuK5NXLJeuTnfbn5lLLvy34BvOpYksL6Q/RqcvS3
	LnMrbzrSPU6oGkfk9xEEzAQM9Pv0MnbRfRL7WPWQWvEGRbZTOVcMz9Cki2e88lIxn1Y4baPmHzhBn
	JFT4VCZb7w01XNCabMFrq8OUy6AiFyHFvcEAh1NVvL2XQe0bPTfTall2Haqelpy/o6GXXjYSbhMgZ
	sgCR9Msg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibFZ-00000005oPr-1ESk;
	Wed, 21 Jan 2026 16:40:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibFX-00000005oPI-0TJy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:40:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E09F402EB;
	Wed, 21 Jan 2026 16:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530E4C4CEF1;
	Wed, 21 Jan 2026 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769013603;
	bh=9IgrqPWxeBy8ibhvm0nRZ1r4OdMUq85UFWTGCaiFkAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdWWnFg5SZx40hORZDjNZklpWgFV40COfA895217GAJwzVSsHmDtErDO/S5in/xuj
	 cul5fbOj5OfrTfrqhedqcSZqHXjvCSZyqmrsQn3FCKOpI8HK5AUdc7yZYL+bfzImzf
	 Z5XNmW/uk6h162PxR3F/vLxNMiAN7YdYr6FiY4zp3Xo7UNbUJfbB0aBr2a5Yu2Ka7E
	 DHwVIxfIn0YOd4cNbN7P5TbIOTBcax/keROPGzAzJPjdYVZLST4VLzYChKHBfjoEHa
	 IohI0WNZVaqkPyPhbw3rrN1ffnSqhqsZfToN0hw8VpQXKG4Bk3hDySKStWMfK1mk8F
	 F8liWL6hhCn7g==
Date: Wed, 21 Jan 2026 10:40:02 -0600
From: Rob Herring <robh@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, frank.li@nxp.com,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO
 in Root Port node
Message-ID: <20260121164002.GA3427694-robh@kernel.org>
References: <20260119100235.1173839-1-sherry.sun@nxp.com>
 <20260119100235.1173839-2-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119100235.1173839-2-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084007_189167_D9EE8235 
X-CRM114-Status: GOOD (  18.16  )
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

On Mon, Jan 19, 2026 at 06:02:26PM +0800, Sherry Sun wrote:
> Update the fsl,imx6q-pcie.yaml to include the reset-gpios property in
> the Root Port node.
> 
> There is already 'reset-gpios' property defined for PERST# in
> pci-bus-common.yaml, so use that property instead of 'reset-gpio' in
> this file, for backward compatibility, do not remove the existing
> property in the bridge node, but mark them as 'deprecated' instead.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 12a01f7a5744..74156b42e7a2 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -59,9 +59,12 @@ properties:
>        - const: dma
>  
>    reset-gpio:
> +    deprecated: true
>      description: Should specify the GPIO for controlling the PCI bus device
>        reset signal. It's not polarity aware and defaults to active-low reset
>        sequence (L=reset state, H=operation state) (optional required).
> +      This property is deprecated, instead of referencing this property from the
> +      host bridge node, use the reset-gpios property from the root port node.
>  
>    reset-gpio-active-high:

Probably this needs to be deprecated too?

>      description: If present then the reset sequence using the GPIO

