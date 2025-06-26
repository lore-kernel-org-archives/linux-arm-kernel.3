Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A7CC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xlL4lUo8fCtLtikH0sJY+Wnj9S5eYppMzMjkNqbPFa4=; b=ugzfyZhAPZfZVS
	Pd7Il8SzAOOcvMPhUJsQVueEa6y7sFdPld7nmJDSDndQXfaqtvOQbiYNxLdJHJ0bLmOPFojJ5VfkM
	HR+xVBU+ZOiGRQnZ2ne4CAu6SyP2MP/2dwbEAaT/DchkYkFYDArTv89qCsbxkcXqlvrILO4gg4KWf
	NSEISODyxeXhQC+UXhlHWvOjGyvX5vjGW+u9Xj7CYDWqAdts4vX3cn4m5YVQ9vw/AEof5r1RKfokQ
	U+6uNnTXGtihhx+niXmqnS6M7L8SJEMSf59k0PtnOEjp+cqcToNcNF67Bcxw6Ee7o/S202A29EJXv
	jtJGblV9+LlyIsDmhQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvYQ-0000000D0QS-1nJ5;
	Thu, 26 Jun 2025 22:58:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtZx-0000000CmXq-1XBd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C259445702;
	Thu, 26 Jun 2025 20:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFCCC4CEEB;
	Thu, 26 Jun 2025 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971136;
	bh=VmwWCYokdlC8jOCvqCBe2YFOkmeSeW51FKReJ7zNPCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=o8mwf/sY/ugHaVLtQcqpEx6Y9kqIp90rg2s1JYalvTwKDEEq/ypjpg1I+vPqxkNx9
	 HBiFigB1f2evT4WOS1D1FAOZ8wlp57AvJ8Xc39WnyWidZ32kBf7Xp2Mfr5QBo1ltK4
	 xlqGCNWZoUKUk9843ZdB6I2bflgcuzwbsArZBXIJrnFaFK8GWrOVb8Uk/RqYRqV5NJ
	 dtnHS2CaOfE+lkqIrytzBVaK3/Kwkj70tmOQD7FMgNpQAbTyyvFzUPq+ZLXltpDiX1
	 KlWP25g78Wh7Hv9R+SlMOsBcwuOOzmcQbee4nSq/Ot64SdfuJkZa6bxtAYd5Bn1yWp
	 JyJBRrBHWyvQQ==
Date: Thu, 26 Jun 2025 15:52:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: PCI: dwc: Add one more reference
 clock
Message-ID: <20250626205215.GA1639554@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626073804.3113757-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_135217_420939_CB25E605 
X-CRM114-Status: GOOD (  17.52  )
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

s/to be onhalf the reference clock/for a reference clock/

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

Maybe:

  Some dwc wrappers (like i.MX95 PCIes) have two reference clock
  inputs, one from an internal PLL, the other from an off-chip crystal
  oscillator. If present, 'extref' refers to a reference clock from
  an external oscillator.

> +          const: extref
>          - description:
>              Clock for the PHY registers interface. Originally this is
>              a PHY-viewport-based interface, but some platform may have
> -- 
> 2.37.1
> 

