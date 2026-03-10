Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5116FCC9D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkXr9cZtzH4QTJyLguKThh5oqEKXCuLZQ/jnS9+FWIA=; b=O5ZG1TeKjTO6xRQSyItd8tes3v
	W0J8dN4SFSkozqwurSZYRqqMX2v5OZd7PC7lYVCAXh/o/4PN+p8PXVc4vlqX2pMAjDu0ImLHVGPeU
	j1/H8EO7kQBz/2YA9qte00Vpotvs00hNGDbhtcr7ddjhGNYuFNIe5aczfRP8Nv7OeZ1emsbV/iJYG
	9Lm23iUWMT+m6hd0FTwcGrxBCsrLYlxCgOeoYd9XzGLIqJvqPb0+QLoClnwkbWOmWX+Ks2njznzV1
	LzTjQxe3DjAEDsom6gEz9Qj89EvQvBD8K62o0Y3q5aJHuQFZb6D+jwqE6iatCIKHdpoUc7901jRLh
	y7mLuJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzs0X-00000008twe-2I3i;
	Tue, 10 Mar 2026 08:00:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzs0V-00000008tw4-0o3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 08:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 742F141A8D;
	Tue, 10 Mar 2026 07:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A4AC19423;
	Tue, 10 Mar 2026 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773129598;
	bh=jkpjgvC2FbGCGFeMOvnQrLTSu+pQoksP+d5G2FrdBPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+0IQUgTsjChB/7j/QS1pOad+Co+VyFYYLCNyUSZ2dJLAh+vWOliodhxbekJzFXFP
	 CX9YlqvuxbHvlPdjro6RdIgCPMHKjUyzy37qwCTEghwEWKyHcRjNYuIritW3FtZ/y/
	 IpDTivXQeG4AGG+/o3AX9ipA/5yYMXk9UiI5KDybe6vI2PZuW81lIOokyOJk2avRg8
	 0IYF1VNselYgOqfLtRJUPqU35TpINaTLtNTDXALmTdviiz4aIK4uttD7hZFwlouXTV
	 aYDppvcm/JDxH8ZJTORUI329E0p+16Y5pWR3XqwHDzWOYXeu67r/SmSVLKJ4+jnMTy
	 yEbHrFbCD6r3w==
Date: Tue, 10 Mar 2026 08:59:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: PCI: pci-imx6: Fix build warning
 after adding extref clock
Message-ID: <20260310-prudent-exuberant-monkey-a4953a@quoll>
References: <20260309084431.3015463-1-hongxing.zhu@nxp.com>
 <20260309084431.3015463-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309084431.3015463-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005959_275198_D537E456 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 09, 2026 at 04:44:28PM +0800, Richard Zhu wrote:
> Fix dtbs_check build warnings by updating the maxItems property for
> clocks in fsl,imx6q-pcie-common.yaml and completing the clock
> descriptions in fsl,imx6q-pcie.yaml.
> 
> The warnings occur because the clock arrays exceed the previously
> defined maximum length:
> 
> imx943-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref', 'extref'] is too long
> imx943-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): clocks: [[5, 74], [5, 41], [5, 40], [5, 75], [46, 0], [47]] is too long
> 
> Fixes: 1352f58d7c8d ("dt-bindings: PCI: pci-imx6: Add external reference clock input")

This was three months ago. Can you finally start testing DTS the moment
you send bindings patches?

It is not a one time issue - I see multiple buggy patches posted by NXP
which are never validated with DTS and then months later turns out
bindings were wrong.

Many of them are posted and immediately trigger build errors reported by
LKP.

Are you going to finally test patches BEFORE you post them?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


