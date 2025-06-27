Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658DDC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 06:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBN2/79tgoA7qJDErBT0inLsZWn979FMxeNl5JQxcJQ=; b=ttXyR9JNyQsnbecJLdt7kpOhOR
	hJSWe0rC5zzxP96cxHnxp+Tsn2rly2C4wTpweMQHq+s6dScDRM426PGGFosMcvQw93E/q51Ca5khC
	FiMmS05Zl3ynEKQM0kNznUxEBFNDZswPQLxIBeft+cRsUPsLa4wLGHV9Jh+Fymu0vDZU2ztoSd3S2
	620eEhTHsZ4FjT/+OTIR10GzyAw6FAa01lZKnLAjOXK6lOPpN8t+BcM5tjuLLwXLykpbTbOorGVnt
	O3cR5J82swweewzoR5+XqRx964O7pXCXrbTcJJXFu96aQzxwIF8eL1VMofmccUFctXwh9IVc2PMiJ
	jz+/T7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV31o-0000000Dkoy-0os3;
	Fri, 27 Jun 2025 06:57:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2z4-0000000DkEm-37cn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 06:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40D075C6AE4;
	Fri, 27 Jun 2025 06:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1128CC4CEE3;
	Fri, 27 Jun 2025 06:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007289;
	bh=JfCgW9HbTpeOku1zvHWwMxVzRgAAq76SRmjvxE7JOHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKoDSdFGJkCNvhF3Xu1UasZIiLobiK8/6c9da6j/VV9fKBmwFDWN77p/WbpQQfSkn
	 rnb+e8dpEm/mvMYW+NZjEr0bFfD1KWXiQ6y7R3yRMmCMH4s1L7XAAqq7lcigB+6J5c
	 N5QQMeXpFoIc3IEImjtpc2/PzTRx34UsY6kdQlUmkYR7QfbRA+mR2PjHFjsrqjr2zs
	 SYVurFWT7N5AtwZdqR/ETq5i13glR8pPLkxRJ1hoXtun39if5eU5Jwy2fvwEv9aEA2
	 W5Ua5/LSVUXsOUeYSC2KZKaGdvYGN3+e34GW0UBC1p2fOlyd3Oj9eEgY0qXHimvt+B
	 KU1/tGB99Mdaw==
Date: Fri, 27 Jun 2025 08:54:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: PCI: dwc: Add one more reference
 clock
Message-ID: <20250627-sensible-pigeon-of-reading-b021a3@krzk-bin>
References: <20250626073804.3113757-1-hongxing.zhu@nxp.com>
 <20250626073804.3113757-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626073804.3113757-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_235450_823766_E0E64ACD 
X-CRM114-Status: GOOD (  16.14  )
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

On Thu, Jun 26, 2025 at 03:38:02PM +0800, Richard Zhu wrote:
> Add one more reference clock "extref" to be onhalf the reference clock
> that comes from external crystal oscillator.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> index 34594972d8db..ee09e0d3bbab 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> @@ -105,6 +105,12 @@ properties:
>              define it with this name (for instance pipe, core and aux can
>              be connected to a single source of the periodic signal).
>            const: ref
> +        - description:
> +            Some dwc wrappers (like i.MX95 PCIes) have two reference clock
> +            inputs, one from internal PLL, the other from off chip crystal
> +            oscillator. Use extref clock name to be onhalf of the reference
> +            clock comes form external crystal oscillator.

How internal PLL can be represented as 'ref' clock? Internal means it is
not outside, so impossible to represent.

Where is the DTS so we can look at big picture?


Best regards,
Krzysztof


