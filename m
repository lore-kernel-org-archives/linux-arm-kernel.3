Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4163CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCVIHwjK4UqwI7KSpGYiL5BOkDS0j1bQeNpENVLWHa8=; b=Z7a2HM3v0/9ZJaL5cf4JfkkRc7
	+XNoLmXUXGj9sVxe2J3R95nuvwCWvf1EHmPA1Kn3WVENi8/FPNoC+cPLBMBrqp424BOOGpt0FhRnx
	IB1lRYVxEiHY0WngrPZKdNngr2xsD/Q1oyLsPU84nHwcPyS4l5GNszTdKALbeIwrHGggsIKER0A7Z
	WzHQdCxZX16svwP4VQ2wQXJmkmC7cFz4XaPjzTu/bVJGmoAUJmaEtaNx5imPfjiE8+SURjzEKdwvG
	4PpEDTT0Tq8aYzPWEHTlD4ipUQ+W2FAcTy3ulqYjMzZ7yJWqhAhXVaHUlU927OmsCwzE75bQESuTy
	WB+O5Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYxN-0000000HE4Y-0WSZ;
	Tue, 30 Jun 2026 13:56:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYxM-0000000HE4N-1bLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:56:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2602B411B1;
	Tue, 30 Jun 2026 13:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D341F000E9;
	Tue, 30 Jun 2026 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827816;
	bh=VCVIHwjK4UqwI7KSpGYiL5BOkDS0j1bQeNpENVLWHa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bOy32PpToUElrUII5Et6U7A8yTaghJGFbiM/2zkeg3aVNy1kPzegpJJqxKFdQ1n74
	 5ATG7ED0GDJ/QqZ4kCTgoBRoSpVj5Nlv/TiAcCulkyMWN6Bwp2Af7NFUqjWe5vCRAQ
	 zISeLSljja4K30bS3aLcyJS2988UftE7vNBA/CzrA1BUjQQkgI4HCIEBppT4E5gEcs
	 0ZR3gFth+2hWkG1sUDsNZzqwouupEkKLazhA6GHKfJIQ9XKh/uhpCaRaUDa6ZNoOoI
	 WBrJS1Py8NBvImIOhcuJZssTXXIwsH9qIxOMfurTalWoUaqCDRgSPihSL6zygv4ihM
	 aWecZ/Hm323+g==
Date: Tue, 30 Jun 2026 08:56:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: linux-arm-kernel@lists.infradead.org, kwilczynski@kernel.org,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
	mani@kernel.org, l.stach@pengutronix.de, kernel@pengutronix.de,
	krzk+dt@kernel.org, bhelgaas@google.com, frank.li@nxp.com,
	s.hauer@pengutronix.de, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>, lpieralisi@kernel.org,
	festevam@gmail.com, conor+dt@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: imx6q-pcie: Add optional
 intr/aer/pme interrupts for i.MX95
Message-ID: <178282781473.2986139.17262303228131453675.robh@kernel.org>
References: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
 <20260618092100.3669556-2-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618092100.3669556-2-hongxing.zhu@oss.nxp.com>
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


On Thu, 18 Jun 2026 17:20:58 +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> The i.MX95 PCIe controller introduces three additional dedicated hardware
> interrupt lines for specific events:
> - intr: general controller events
> - aer: Advanced Error Reporting events
> - pme: Power Management Events
> 
> These interrupts are optional on i.MX95. PCIe basic functionality
> (enumeration, configuration, and data transfer) works correctly without
> them, as the controller can operate using only the existing msi interrupt.
> 
> Earlier i.MX PCIe variants (imx6q, imx6sx, imx6qp, imx7d, imx8mm, imx8mp,
> imx8mq, imx8q) do not have these three dedicated interrupt lines.
> 
> Update the binding to allow up to 5 interrupts for i.MX95, while
> restricting earlier variants to a maximum of 2 interrupts using
> conditional constraints (if/then schema). This ensures the schema
> accurately reflects the hardware capabilities of each SoC variant.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


