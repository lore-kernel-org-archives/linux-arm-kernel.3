Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9242A1067041
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJlMUM3Pi+ePixcksQ2Lzj71wtmXHY1ZrHPi2eotSkA=; b=DHcOaaf/z2fbuRhjqweKYt6U1A
	qlFAt8XVax6MitKOjZqY6QsskFx58/tlCn7hfqjB1VdLKEbjVtCHNr6VloD/OBazhaBPhaycscDkh
	ZdvsUU+05XRebNZN3til2P8dyKAGfkIG3XysvXvbiDYE2gqacUL3NbV6bqGj7CW/FrrY8BgTSI5Vk
	lh/vip/itIgPpv1vBGp49oT/QfzfcxxheQV4xpgz4CcRyHLeRjg2W/3LZpMLEx+oXsc2dY4a4K6af
	4cr3KZ/J3ICC1KBLPmi1624R+mUFHN8zRJcqK6L/JMlCzex46qiUwXzAnoVFoJcnvtJlRGbuD4HF5
	9Bb0HIZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hmW-0000000ELTv-44hF;
	Thu, 12 Mar 2026 15:17:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hmW-0000000ELTW-1lMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 711AC60054;
	Thu, 12 Mar 2026 15:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FCBC4CEF7;
	Thu, 12 Mar 2026 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773328619;
	bh=RBNqncS6RC7Y+TZL/EQyfROxqo/Ml0jF+bxN4+ojSKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZonUpNGjmkG/C408szBXBPt3JUPOMO/aIqQN54AfKBB4E0l/PQhjbYY7xJyTelc6
	 1mqfODbRLJjeRue4TvruNPTgdv2xrnj6VfPhr3gn0glq34d+I4B4x+Kxtuk766ho+p
	 68lMNgEDZST99X4Kg0FyMRh4TpfzATkDS0RjhnhCmxgNQQvhXJG6DGGaE0kVA4liQR
	 gsqLb11Cp8fB30Jo33ZpF4yrKEygmCAXIxvIX1LzTGJyUOIqW2p9wPUGqG9/t3B+k4
	 v6o8Vw8lwa0uxk6NF4LOmZcAY2JcN7zMfw41aqgW6+UZIXBVem8bM/eugElna5ZfTI
	 nxDA6jFig/JjQ==
Date: Thu, 12 Mar 2026 10:16:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abin Joseph <abin.joseph@amd.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	radhey.shyam.pandey@amd.com, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com
Subject: Re: [PATCH v5] dt-bindings: dma: xlnx,axi-dma: Convert to DT schema
Message-ID: <177332861768.3154388.13563344241435238840.robh@kernel.org>
References: <20260309033444.3472359-1-abin.joseph@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309033444.3472359-1-abin.joseph@amd.com>
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


On Mon, 09 Mar 2026 09:04:44 +0530, Abin Joseph wrote:
> Convert the bindings document for Xilinx DMA.
> No changes to existing binding description.
> 
> Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> ---
> 
> v5:
> -> Use > instead of | for description
> -> Use unevaluatedProperties: false because ref to dma-controller.yaml
> -> Reorder the properties in the example
> 
> v4:
> -> Fix the dt_binding_check error
> 
> v3:
> -> Update the subject heading
> -> Remove examples for cdma and mcdma
> -> Fix the syntax issue for the clocks
> -> Squash the interrupt use case for axistream
> connected cases.
> -> Reorder the list as per the writing bindings
> 
> v2:
> -> Add examples for each compatible
> -> Remove the note added
> -> Use 'enum' rather than 'anyOf' and 'const'
> -> Wrap 80 char per line for descriptions Add dma-controller yaml
> -> reference Add -| for paragraph separation Remove labels from the
> -> examples
> 
> ---
>  .../bindings/dma/xilinx/xilinx_dma.txt        | 111 -------
>  .../bindings/dma/xilinx/xlnx,axi-dma.yaml     | 299 ++++++++++++++++++
>  2 files changed, 299 insertions(+), 111 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
>  create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


