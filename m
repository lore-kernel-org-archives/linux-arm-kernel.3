Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9FCCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sJ+im9XneAdaKz9xDefvDnY5ZJQNie8g4V5BehOAq3o=; b=4HiX7BIuuWfLYY
	MbHRPyYwb+vbLdzzNSrrLcTFZd4HRDatfkxrmAodHuLryAmkHGeN8PxIrM6Egjif2Z1ciqHufEmuI
	/siXDvoAUNwNvvIEV71ATRxBEUhcUy/rlhrIFF4xTi9KfQlyW7B6TPKwtzQ4/6wJwdh7lgNsJDNxv
	Rm2LWOW7X6QOGtqPARM0qF7UIC4DBZN6/tNDhZCoWJeocvV1S4UL2QqmhVDRQLmVvaHsjZyTsL46a
	jsO4PWh7LMEZgcZ3RKcMmRJ7keefdlkeYt1DjCyD1mQZrFOXwyIpdDlYZMxHorUFFxJmYQM2T4EFZ
	8GbqQ7D67zO61YYRhPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Ol-0000000FB7l-1SYj;
	Wed, 17 Sep 2025 22:13:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Oj-0000000FB7P-1LE1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A18C540989;
	Wed, 17 Sep 2025 22:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C506C4CEE7;
	Wed, 17 Sep 2025 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758147188;
	bh=nRhOXcIKGpSGtX2j3Z7sQdDPzcHkUdRka8dIo7+u2MM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BaKTMrT1udkFpO61y+Hb4PIDaqrTRP5+K4vQcHhu3ukTFmGGuFhiyBJFYJrcVQOb9
	 Yp+FgtddGxOhXyXQ479M/AYNZAjCbF7W3oTzy0AOE7LQIGXEV+GEmcWss7f11dqTde
	 JNK2/5fySEjH8S3B5iDRzx79wWjGU+JjbX1/h0WdEColE08kYHmT+nU2pIluwYB1rA
	 T9p/acvm2s8Slk8W+oRgopfbQSJ05X8ixNAO+H8hVoF+SwQ8ZtxZMh8WOcFsE375Xf
	 0IjqXKbOYV9D5j9+YmPhWEDZCPnelCPCPIGlzcyKHXk2KJ7XQMJREtdO/irULVANoL
	 d9uVDvLmgJAFQ==
Date: Wed, 17 Sep 2025 17:13:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: PCI: dwc: Add one more reference
 clock
Message-ID: <20250917221306.GA1878395@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917045238.1048484-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_151309_386302_6C93515E 
X-CRM114-Status: GOOD (  17.49  )
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

In the subject, can you replace "one more" with something specific?
E.g., maybe "Add external reference clock input" or similar?

On Wed, Sep 17, 2025 at 12:52:36PM +0800, Richard Zhu wrote:
> Add one more reference clock "extref" for a reference clock that comes
> from external crystal oscillator.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> index 34594972d8db..0134a759185e 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> @@ -105,6 +105,12 @@ properties:
>              define it with this name (for instance pipe, core and aux can
>              be connected to a single source of the periodic signal).
>            const: ref
> +        - description:
> +            Some dwc wrappers (like i.MX95 PCIes) have two reference clock
> +            inputs, one from an internal PLL, the other from an off-chip crystal
> +            oscillator. If present, 'extref' refers to a reference clock from
> +            an external oscillator.
> +          const: extref
>          - description:
>              Clock for the PHY registers interface. Originally this is
>              a PHY-viewport-based interface, but some platform may have
> -- 
> 2.37.1
> 

