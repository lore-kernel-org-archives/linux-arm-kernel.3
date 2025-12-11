Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCEFD41D50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsusnX7QLBsXwdKMdD+T6+nO34YnnbqpO4C1gMWOCKk=; b=qGP02bnk8dmlCtxLxoBb2AZYHh
	DuDO8AR5FjRa9Y9aeIS91nhKpMg7AZluTktptUBepRBPBMS+SdWARim6oJ0aepJ1lYxVg0Qa5Ps7U
	0K8MLLTO5HCuK1Dnf3UX0BHjWTmBB8GEb8nFQJxDRGjelXSX68v4JAIAg2LL4BkYaG1j1FvqpTRk9
	ghIpGxKJdaOA03dsUcPzyW9DSrBV7uYkQOG40UGgsGTUKbJcKIODlAH80y4rjDl3NGKQd/AWUc+0a
	4/cCfit9XoJ/216b9teXrdLSJI/ciBR6Gw/ut6WHNli5PO9KQ+BDDdJgWU1qCmhlAlXHGI7QREg/L
	S2ZTGVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTiSi-0000000Glf6-1Bdl;
	Thu, 11 Dec 2025 15:20:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTiSh-0000000Gleq-1DLs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 15:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A6D16014C;
	Thu, 11 Dec 2025 15:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AD0C4CEF7;
	Thu, 11 Dec 2025 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765466410;
	bh=VaM+9vzK2D/v6EV/xnarx6FEHiWTCoSFGNq5qtloDG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FApSG2NpKCwR8i3dANFkJay5kdFyHDOx0bZcNKtnul6EnjIXqODIVOXS0qtO0ab7C
	 /s9nSEuIfqZ6YDmhwjUw0HXGIzkrjB1rHG6Yc5ubkg/qPbfFA52L8h/VWjmnVZupX/
	 fiWh3Kdxpw0FX71lSuMS+f2+4i0mopi/gU1narc4pdzdmMj/im4HBA2OwZTBvB+bGO
	 nwuuLd0aT+R4sQyrLKE5WPJyGIEeKfQUuCrdbmUdfUi05IaHFZzMCZShnO4K+emFWg
	 jsa79mPcBGgPA1fWKE3kvgIX3o0ULx6bv/IEDXLR7WHEfea3l754xTVaMQXMxFflkz
	 xNRAUGylziFGQ==
Date: Thu, 11 Dec 2025 09:20:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: bhelgaas@google.com, s.hauer@pengutronix.de,
	Frank Li <Frank.Li@nxp.com>, linux-pci@vger.kernel.org,
	mani@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	frank.li@nxp.com, kwilczynski@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v10 2/4] dt-bindings: PCI: pci-imx6: Add external
 reference clock input
Message-ID: <176546640668.1250530.16683675929770601103.robh@kernel.org>
References: <20251211064821.2707001-1-hongxing.zhu@nxp.com>
 <20251211064821.2707001-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211064821.2707001-3-hongxing.zhu@nxp.com>
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


On Thu, 11 Dec 2025 14:48:19 +0800, Richard Zhu wrote:
> i.MX95 PCIes have two reference clock inputs: one from internal PLL.
> It's wired inside chip and present as "ref" clock. It's not an optional
> clock. The other from off chip crystal oscillator. The "extref" clock
> refers to a reference clock from an external crystal oscillator through
> the CLKIN_N/P pair PADs. It is an optional clock, relied on the board
> design.
> 
> Add additional optional external reference clock input for i.MX95 PCIes.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


