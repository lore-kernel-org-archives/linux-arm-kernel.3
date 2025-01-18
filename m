Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70233C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgymUVRSBHAT5n1A6mF9r09/oxik6GQDakHWOLIxV1g=; b=TU/htw0+0AvvmkvV2ehZGP4iAc
	DlddEdKi9Ry3c9sJ8HzWuXqMmzzPzpQWTh3sMnUwQ1MISxkijetTLXSL6D5NPS0zPlhIByPK3y4ky
	LEZCdngFi1CDLlGtax33B+g68wFjDiOX43Y8X0LHW8GgBdxhhhMeWz5UGavsoVTd19UQshoDcf84n
	GN0f+NhMAJEnd62SZES7IoFBVPAqAsHottCyxvVZNApwc8ColvhqezrQvZypY0lWV7FknRyyeP65T
	iZUPbPBRGqk91Lo4obLItIAJBbtbSG22PZtR7yXQtU2pcITUeKPwIm7gOFlpxqWf71Uo4Ice7UuzU
	AIoVQi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBEB-00000002edi-3JZi;
	Sat, 18 Jan 2025 15:59:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBCu-00000002eIT-3fSS;
	Sat, 18 Jan 2025 15:57:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E894E5C0227;
	Sat, 18 Jan 2025 15:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BA1C4CED1;
	Sat, 18 Jan 2025 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737215875;
	bh=4ytK8SbKL809jw9xNqlRWkFifpu1ya8ZAlMac3qmV78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClB7zK/6vDCgsqk05W7936O/L3vfJb8BPrLGIPQD1qKAfhKbVvMxP/V5HtdADgz6K
	 lV9wINjVJkqL1dOda3R+RooYCmmULpiacrl/pRU7S7CK20DgAcoak9WqOxvTPDlJts
	 fA9RaCDmQaKw0ldtKzs0LZVpMr9Qb0jms8MJgbQgS7FCSevr3o+QR2XbLZvYazNpBn
	 99r2rV+m7NsajzGiuvhnZjanpVY6BwmK4ixAQZoEs6TQy3NLiesw6X9CtnkalceQ4c
	 lss0mEMz75naor3b3WlWOLh5BoPbREk9U8la3VWvI7o1D33CDVa24U7SgVl3NLqbtF
	 pl50ISnZffTtQ==
Date: Sat, 18 Jan 2025 16:57:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: airoha: Add the pbus-csr node for
 EN7581 SoC
Message-ID: <20250118-sturgeon-of-incredible-endeavor-73a815@krzk-bin>
References: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
 <20250115-en7581-pcie-pbus-csr-v1-1-40d8fcb9360f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-en7581-pcie-pbus-csr-v1-1-40d8fcb9360f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_075756_958300_BA7163BC 
X-CRM114-Status: GOOD (  17.36  )
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

On Wed, Jan 15, 2025 at 06:32:30PM +0100, Lorenzo Bianconi wrote:
> This patch adds the pbus-csr document bindings for EN7581 SoC.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> The airoha pbus-csr block provides a configuration interface for the
> PBUS controller used to detect if a given address is on PCIE0, PCIE1 or
> PCIE2.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/arm/airoha,en7581-pbus-csr.yaml       | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..80b237e195cd3607645efe3fda1eb6152134481c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/airoha,en7581-pbus-csr.yaml#

arm is only top level bindings and ARM stuff. This is soc.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha Pbus CSR Controller for EN7581 SoC
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The airoha pbus-csr block provides a configuration interface for the PBUS
> +  controller used to detect if a given address is on PCIE0, PCIE1 or PCIE2.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - airoha,en7581-pbus-csr

Does not fit standard syscon bindings?

Best regards,
Krzysztof


