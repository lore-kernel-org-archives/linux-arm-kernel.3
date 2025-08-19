Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34633CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYbnyXonmBoqE7BQDIxlejCHskxYyzI/DdkSVXr/uKY=; b=m/X+8GVpNwlQv7OMQZ2EzHB97U
	D7DiuaAnjR549lYHu7avOOpMXwDOMUVd5FjFOVX/pz/ReRjELNSQVSJ5qHrXr1bdLk/m/68YErAOL
	iwRsfiohoA5Q/Cg+/z4qb7ptSiWZ8YP4R9auQpDnPQ7E+HoHJAhHfAME03UY+gfVP7OBoV/7n+aVJ
	JiXMich/Fqq6O4bXjbmj92tl+2UAbb7ez5/IJhlHTcVxafFoJvIof8zqwnmy1XWaVsq3L9KkGjp+6
	0msWosV230xFGWDsHJAEwuI7MO6oJnXsQLHKLYCLSd0HhrUQbHBX2hcahLY1fCIhavZkbrixEaYiJ
	d1CHEsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIJm-00000009tcF-1cKM;
	Tue, 19 Aug 2025 09:07:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHjU-00000009oOS-1Mtz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5E945C5979;
	Tue, 19 Aug 2025 08:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F558C4CEF1;
	Tue, 19 Aug 2025 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755592215;
	bh=Te4KR24g5JjkMDypQM9+bPiHN5Txeoy3EKnAS8A9PSg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nJnBqq+B/PdXH9viS/GMk4WqVJqq9qFcvHBiU9+51wPiv7pVivxoDS1sz8OpK5Dmf
	 zVLVrO+IskEs/LCan2a+U3wm5yzRFPhoE/4twSKu6Ftt2nTQ9HelxEceH5Wride50M
	 1izQC9ofV/Q0M21R74s2F2u/evVE3EYMbNNPvS5vO7WDpB633TXxr1kJYBWx8Fox87
	 jWEK3QgZJNJS1FhWkluwIwVq8QayJ/UCmrhyr0eqO7TKhO3b7O3cTRt1QW8kMczExL
	 20w/HDS1u8z6EmAk1yVqvPNBxbVIptaW+Pod3U6hNkSipPTP4iFwLUbFtMk56nO60b
	 QKAOKCCwAjHrQ==
Date: Tue, 19 Aug 2025 03:30:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: festevam@gmail.com, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, s.hauer@pengutronix.de, 
 lpieralisi@kernel.org, shawnguo@kernel.org, frank.li@nxp.com, 
 l.stach@pengutronix.de, bhelgaas@google.com, mani@kernel.org, 
 conor+dt@kernel.org, kernel@pengutronix.de, kwilczynski@kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
To: Richard Zhu <hongxing.zhu@nxp.com>
In-Reply-To: <20250819071630.1813134-2-hongxing.zhu@nxp.com>
References: <20250819071630.1813134-1-hongxing.zhu@nxp.com>
 <20250819071630.1813134-2-hongxing.zhu@nxp.com>
Message-Id: <175559221431.3513325.13023489258693158920.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: dwc: Add vaux regulator
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_013016_409843_0F23B921 
X-CRM114-Status: GOOD (  13.34  )
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


On Tue, 19 Aug 2025 15:16:29 +0800, Richard Zhu wrote:
> Refer to PCIe CEM r6.0, sec 2.3 WAKE# Signal, WAKE# signal is only
> asserted by the Add-in Card when all its functions are in D3Cold state
> and at least one of its functions is enabled for wakeup generation.
> 
> The 3.3V auxiliary power (+3.3Vaux) must be present and used for wakeup
> process. Since the main power supply would be gated off to let Add-in
> Card to be in D3Cold, add the vaux and keep it enabled to power up WAKE#
> circuit for the entire PCIe controller lifecycle when WAKE# is supported.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819071630.1813134-2-hongxing.zhu@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


