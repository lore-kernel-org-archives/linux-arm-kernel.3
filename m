Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FE8CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzw9FejnpyFh7MFE/dC5YMBRCsqKbDLXhffDYVV5g3o=; b=xIL/AS6eWa+aKmOc3kKrketdnI
	SHp4/qGCfdj8SYOYwGiHWB2jPAcFM8WmSPDoMLvcoUr49ayY5MJGtbK1ozTItbvzpi1wEi0kEgOXe
	SPiTB2zU0PfveTaETENKAtJVmF/Dn3ZBua8B7FnuDUama6Dgl4mp0qD+bPSUNVxW/P2iSpc+pq+3b
	sRG1qh7JyNoc6zESiNem3IP+STfMmYEbSQqLQ+31I/zMcc7T9YSH5ZYkeHqghDXs8y8aZ3XuEKdbi
	oYXTW5XD9nF2dd2DgjqEZIfF33kDuPRnrGgqsHOiLD1SokHSGB402zl7v9e+61KiWgG7TAjtlexek
	/ryzB7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxJ-0000000HISO-1G19;
	Thu, 15 Oct 2026 09:40:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxD-0000000HIQu-1GTr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:40:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A87B06020C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0A01F000CE;
	Thu, 15 Oct 2026 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057250;
	bh=vzw9FejnpyFh7MFE/dC5YMBRCsqKbDLXhffDYVV5g3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=abqlvtCDzshAKBuJsy7zJBd21J9FJFuuX5aBV2aSG+9Lumfv8GgYc96sh+8odRVGE
	 lParLUcTy1xHhq/SVvrYhM9o27pfiW0QgKoZCqmYYMi4aLp/gQDaa7V7f0iofLJId2
	 0YbRBhvcK97wg4fPBbLWEM5poERajGvf87jOwha9TKn3dyZ2iL/7h2FkC9bJ4MXsIP
	 TMOkuiWZ8RVn/VzYw/d7hn6Tbf1X+/SQ9niHO23Kvy5ghvVnCeeeUNHkJe36W6BvX3
	 h/KFLiFvzVmPbKik5bvdeJ5zTEl0XHXRxRnTZ8veTpwgGgO0d/QTLlPROKoCUXYD7W
	 Z54zvOcUZNdrA==
Date: Thu, 15 Oct 2026 11:40:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: altera: deprecate
 intel,socfpga-agilex72
Message-ID: <20261015-premium-earthworm-of-sufficiency-9bd00e@quoll>
References: <20261014125709.2106261-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014125709.2106261-1-dinguyen@kernel.org>
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

On Wed, Oct 14, 2026 at 07:57:08AM -0500, Dinh Nguyen wrote:
> The Altera SoCFGPA Agilex72 platform will be rebranded as the Agilex27. Thus
> the following bindings "intel,socfpga-agilex72" and "intel,socfpga-agilex72-socdk"
> should no longer be used going forward, so we will deprecate them.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> 
> Replace those deprecated bindings with "altr,socfpga-agilex27" and
> "altr,socfpga-agilex27-socdk" bindings for the SoCFPGA Agilex27 platform.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> index 5fce1161210e7..c87d7725f920e 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -99,6 +99,12 @@ properties:
>                - intel,socfpga-agilex-socdk-emmc
>            - const: intel,socfpga-agilex
>  
> +      - description: Agilex27 boards
> +        items:
> +          - enum:
> +              - altr,socfpga-agilex27-socdk
> +          - const: altr,socfpga-agilex27
> +
>        - description: Agilex3 boards
>          items:
>            - enum:
> @@ -123,6 +129,7 @@ properties:
>            - enum:
>                - intel,socfpga-agilex72-socdk
>            - const: intel,socfpga-agilex72
> +        deprecated: true
>

No. We DO NOT rename or deprecate compatibles because company decided to
rebrand something.


Best regards,
Krzysztof


