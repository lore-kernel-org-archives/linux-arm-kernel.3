Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD54D58CAF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EbMLVh2mP9UlWkOltGcR8z6D+f9IzuZsVniMSXE/w4=; b=hWN7uW5/QYpFH4THW5Nvdn9+qL
	oBp4Cb7D1MzK1bBDxA8cY1nS/dAAJiU4gkyJcA0C8G/d42ux3p9JhyxmCiM55vh+YU9+jEYft9P11
	zQkPLZFLa3ykyvHR0eBuUinVjsG7NIL68fuGFR/ZDBkZGub+QYpg1wKMXWNA1R1DY616YIicW7gEH
	ij2rEXoxxLknjsb8iSXAZFStDAcVT0hxpr2/M1Do/oBF/alVPO6qxHlHyjW1yy1g8M5zLS6Dlpskb
	VZCEEFrGoFZYo1b6y08mYNGAldyyIsCSApGJaNHDIU6Qgf/mOZR7xsCnL4uv9vdg/9Q19henc2byS
	I1eOndMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Rvr-0000000Fjzx-2YzF;
	Sun, 22 Mar 2026 23:10:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Rvp-0000000Fjzl-3cHs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 23:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2057060008;
	Sun, 22 Mar 2026 23:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6E2C19424;
	Sun, 22 Mar 2026 23:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774221004;
	bh=uU/gc7NH6waZjUqKluW+RwGApT2GspyV96WOVgY/dUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRITkAg4e52ie5vkQ91//aE+MGP8xDDqT77uMOuDKDad3W6DVicVxCKPuz5dBiD43
	 z8LFZdzUNoEU7O5EWCyDBSCmBcEakvs7nz08D0mTb1ohxTR2/qinjmJ9Tn11VzBhtS
	 jvGGeio0HZmZvuAijXR5hSkTINtY6LlFWRsZrhQT1wUcn/XXpoP50UeDXeF0B6ZdQe
	 Azl64EnW6zlF5B0C2fkZVBtsvCbSBhdJbBYgfD6YGCybKIyJLZptLrlbmg7BX/qP3m
	 27u+Uh+6h7HHHYOeZtzALs9tAlnHk+0wUI5EC+gc8iWhF+aYl9P3Z/Ml6ejaUbZ49E
	 KNxP1rt1QA9Fg==
Date: Sun, 22 Mar 2026 18:10:03 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Message-ID: <20260322231003.GA69234-robh@kernel.org>
References: <20260313083443.2391254-1-hongxing.zhu@nxp.com>
 <20260313083443.2391254-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313083443.2391254-3-hongxing.zhu@nxp.com>
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

On Fri, Mar 13, 2026 at 04:34:40PM +0800, Richard Zhu wrote:
> Add i.MX94 and i.MX943 PCIe compatible strings and fallback to
> i.MX95 PCIe compatible string.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie-ep.yaml       | 20 +++++++++----
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 28 ++++++++++++-------
>  2 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> index 0b3526de1d62..b3b1ece6681e 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> @@ -18,12 +18,20 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mm-pcie-ep
> -      - fsl,imx8mq-pcie-ep
> -      - fsl,imx8mp-pcie-ep
> -      - fsl,imx8q-pcie-ep
> -      - fsl,imx95-pcie-ep
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mm-pcie-ep
> +          - fsl,imx8mp-pcie-ep
> +          - fsl,imx8mq-pcie-ep
> +          - fsl,imx8q-pcie-ep

> +          - fsl,imx94-pcie-ep
> +          - fsl,imx943-pcie-ep

These should be dropped if they are compatible with imx95.

> +          - fsl,imx95-pcie-ep
> +      - items:
> +          - enum:
> +              - fsl,imx94-pcie-ep
> +              - fsl,imx943-pcie-ep
> +          - const: fsl,imx95-pcie-ep
>  
>    clocks:
>      minItems: 3
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 21dda8066014..fd5f7ff9c4a4 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -21,16 +21,24 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx6q-pcie
> -      - fsl,imx6sx-pcie
> -      - fsl,imx6qp-pcie
> -      - fsl,imx7d-pcie
> -      - fsl,imx8mq-pcie
> -      - fsl,imx8mm-pcie
> -      - fsl,imx8mp-pcie
> -      - fsl,imx95-pcie
> -      - fsl,imx8q-pcie
> +    oneOf:
> +      - enum:
> +          - fsl,imx6q-pcie
> +          - fsl,imx6sx-pcie
> +          - fsl,imx6qp-pcie
> +          - fsl,imx7d-pcie
> +          - fsl,imx8mm-pcie
> +          - fsl,imx8mp-pcie
> +          - fsl,imx8mq-pcie
> +          - fsl,imx8q-pcie
> +          - fsl,imx94-pcie
> +          - fsl,imx943-pcie
> +          - fsl,imx95-pcie
> +      - items:
> +          - enum:
> +              - fsl,imx94-pcie
> +              - fsl,imx943-pcie
> +          - const: fsl,imx95-pcie
>  
>    clocks:
>      minItems: 3
> -- 
> 2.37.1
> 

