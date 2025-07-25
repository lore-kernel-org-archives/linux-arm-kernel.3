Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59DEC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 20:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jZ2G/e8wSqV41hhV1gH+U23w75M5PlO/TOztPglGgY=; b=GHEEy6Nm5QJdKOHW4OahMc5L27
	y78Y/kuR3wtUm6UxV8DAhJ9Gvm7+YNUi0OAeD707rKqyjCO9mX97IfciIyT8BdTTRL0VjfWP1LI4G
	V5SXWJ+IjHyw0bfJFSCtrTWa8E/z9C69u64B+dk4kIPu0elKuF/jrM2i/QUmMEkFLrHJ4tdcpoCv3
	b3eqi5jSqnmmky0EISC0+nxnxzw1Hmfuu18BM2qoL0vBbTdqkpYXDSHp1zBiuJ0jD+eY3R0uS3PzG
	gYKEK042KECBxY5HKfIfy/91AXlSabNUhr/Y2LowZAcMWDDXxuKaqHai7dNQPFCptGKsTxcP8/1vx
	yXuLZXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOc0-0000000Ac3K-2TSv;
	Fri, 25 Jul 2025 20:01:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOWs-0000000AbAI-0bTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 19:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EF83601F2;
	Fri, 25 Jul 2025 19:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8D6C4CEE7;
	Fri, 25 Jul 2025 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753473388;
	bh=DTyhXDpELPxUegquRGP0YjMOW25NNz7AxUozPicBFOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=frOkazwWgScxWj9Ie1H1vZoYNmsQNr7dVhn2BbXTTxPSWpKrvU/+y6O5X2wNDNWt4
	 HEPwNTXUslgORw25Yq54t31DH2cIZoLD5jMTB4h9J0wyXOAKSZ+75gSBjY7xqtjrbM
	 RnGiKmGjdjVb1gneLqyooYmr4G6dbx0MXZ7ArwpHI90VRqDQ/wP1CHa58laC3NtSPt
	 licddS8nwRgwU/LmjH+ynwbYagi4Q2fdWiugV0OgCmJwUp5ksOJ3XwhiegE7wpEQZ1
	 JFASNVwmPJCltQ61dJcQ9R+X7JjiJov9W3LdYi8UYoa9JHIm9lXa8i4hAlxIfmFtko
	 SLYYm4CMU0FwQ==
Date: Fri, 25 Jul 2025 14:56:28 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add TQMLS1012AL
Message-ID: <20250725195628.GA1747130-robh@kernel.org>
References: <20250725062454.271191-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725062454.271191-1-alexander.stein@ew.tq-group.com>
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

On Fri, Jul 25, 2025 at 08:24:50AM +0200, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 

The subject could use a 'fsl: '.

> TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v3:
> * Fixed commit message subject
> 
> Changes in v3:
> * None
> 
> Changes in v2:
> * Collected Conor's A-b
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index f494ada0c1966..0beb0040a7d34 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1571,6 +1571,12 @@ properties:
>                - fsl,ls1012a-qds
>            - const: fsl,ls1012a
>  
> +      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
> +        items:
> +          - const: tq,ls1012a-tqmls1012al-mbls1012al
> +          - const: tq,ls1012a-tqmls1012al
> +          - const: fsl,ls1012a
> +
>        - description: LS1021A based Boards
>          items:
>            - enum:
> -- 
> 2.43.0
> 

