Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D358CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raGRLi7KUiHui4EIC3GAiX5YcJdKLWe9zemHQCJZ3iM=; b=hVxxAD5+NTmpPeplFru1vX994V
	sq27SmeV5+HAKmTustadR8A2+50/eTGCNUGjDa7nbhEA4VE0gV6ZeklIM1YAgEBowUYUoZxwJzrOk
	Lz8s4X0Cq8TpZmEUEtSq1cjR8EsNHRa8eO8kb1W8hiDYfEkemauREOHvXAV4YKU03zYPWBA+965Jn
	7e2lIc+ATr/xrTinLvkEWQOPusL9F33mOra2ihTUzN3JS10e5fGArtKR7bCcniPhyof5ZbC+ZwNO0
	fqNeB/0LUwBG7i6wZWKNmCkWPS7u4i+ED4oKNHkHOpmWACZGahR6DIbazVEHdiMtWPQQQY9lRCSh7
	Pstx3kKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcSR-00000003D1j-3Apr;
	Fri, 19 Sep 2025 14:51:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcSP-00000003D15-2zc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:51:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0905B60194;
	Fri, 19 Sep 2025 14:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99218C4CEF0;
	Fri, 19 Sep 2025 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758293488;
	bh=ltSbKh4n47FzGRqG8/CEVAcFRLma3NAxjpUJcx3cn0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVYAu8fd2IftIHC95aUjjJiEO0whJ69qIM7P7FPm66q/1KYPBQZcRi+FQnrndtgO2
	 bVpjt/Usk9yzCb9XU208L1bGvJEzZlx0yUYq8iyZNZIST/ARjUfNfSTKCHbW33xyL8
	 Pn9VVgK0KUZr1uCxcTcSXz0H2J8JR4jVwaA9NCGHBHfJhzzVuykUUXGPCqM+x1TXNz
	 E6qWOxQ8BfccX49o2P8koeGXZU32rRUplPa3YZclRuSwXkH1p5W+85e/gfb2NJ4O/9
	 NA3VHk7zSBFOqO6G43f74qadqFJNYKBjn4u2OXR4IeVMfuC5kPK23SFq53iIK/NdoI
	 8/uu0CSg55RLQ==
Date: Fri, 19 Sep 2025 09:51:27 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20250919145127.GA852815-robh@kernel.org>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
 <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>
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

On Thu, Sep 18, 2025 at 06:23:26PM +0200, Christophe Leroy wrote:
> Convert QE QPIO devicetree binding to DT schema.

Why is this in linux-next when it still needs review? Anything in 
linux-next already gets removed from my review queue (patchwork), so 
you're lucky I'm looking at it. It's also not tested probably for the 
same reason that b4 couldn't figure out how to apply the series.

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v6: Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.
> ---
>  .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 49 +++++++++++++++++++
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +---------
>  2 files changed, 50 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..0dd9c0e6ca39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#

Did you test this? No, because this is wrong and the tools will tell you 
so I don't have to.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,chip-qe-pario-bank

You have to list out every <chip>. Lots of examples in the tree, but 
like this:

oneOf:
  - items:
      - enum:
          - fsl,mpc8360-qe-pario-bank
          - fsl,mpc8569-qe-pario-bank
      - const: fsl,mpc8323-qe-pario-bank
  - const: fsl,mpc8323-qe-pario-bank


> +      - const: fsl,mpc8323-qe-pario-bank
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio-controller@1400 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    gpio-controller@1460 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1460 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };

We don't need 2 examples of the same thing.


