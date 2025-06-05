Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3898FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 23:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yj6Vz/uvAqZGn2tlIdZTWqPwE2FqVODDQybTQJtwCoc=; b=zAL1xbhS8ULso+ByeWNEur8/3Q
	4iqIma9bzN/I0O2lxuVoNIuNXDzHEzKk2zrGpubMYchez5dT8z0XqoanqatmgQQ5+iqA5mqNVtfaY
	rEzDAEYKM/gbgTaaUKU1Fr97k9iHAzQqVooTXsvrurIufeQN4/DQDbWjQbrqrPolaq5vyAJy2gnlM
	vioOEk8FlHlNOBkzk3KmE0ETHb9Mjd1wXym101gk3HqwumXBEcxTzMNwBsGSnX/S7fMOFlxX5VdkE
	gVvXaEhxAa15pB6TBTt5w2jr+LCmSKqtu50nfVRl8izatMTdr7IcD7i5MUNiR3OU7wn8dW3IkctqQ
	0T+Y48nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKIM-0000000GnqB-1MFv;
	Thu, 05 Jun 2025 23:46:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKGB-0000000GnfV-2uzH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 23:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20D8E61F1D;
	Thu,  5 Jun 2025 23:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E592C4CEE7;
	Thu,  5 Jun 2025 23:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167074;
	bh=uLnzJMygHu8Tutkf6XRz1D8vcZXOGaOVsErURKnt+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfK6jviX+s81FJV1x7o2MMM+yujt7hf+LRO5tnojRkJ53FvdGAWd0WuV1yY8iK3CM
	 2FSQufCf9T9pVQOqhYkmROLIFrjYbPKa4+AzmJPqtlj/ioV40tWR5zAZ4a4os7B/im
	 /wk3eLBdBlcOUh54GWA2ij/D4okS7KSXg6NI+LDMIOW2qT41vjQVK3wRm1N7rCGkcY
	 14JwtjWwd3+xmZWz/qD/zAldBAY7EmMyDcUPaSq7OjSf1ZuiNzT71/kFMwoUx3bF05
	 e4aTb8qpbq6sS1eQKgo55vj9RK+LJHalRpTLuUNI/ArhwVXoC8dUb7wZ83BmlNBvIR
	 TjD/WiFDnIgRA==
Date: Thu, 5 Jun 2025 18:44:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: Add fsl,imx23-digctl.yaml for
 i.MX23 and i.MX28
Message-ID: <174915544909.3193294.9385556983515352599.robh@kernel.org>
References: <20250528183549.694434-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528183549.694434-1-Frank.Li@nxp.com>
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


On Wed, 28 May 2025 14:35:48 -0400, Frank Li wrote:
> Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28 to fix below CHECK_DTB
> warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx23-sansa.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000:
>     failed to match any schema with compatible: ['fsl,imx23-digctl']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add more description about digctrl hardware module
> - fix double /
> ---
>  .../bindings/soc/fsl/fsl,imx23-digctl.yaml    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
> 

Applied, thanks!


