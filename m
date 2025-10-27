Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C9BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wchuM/atPhQeDpxnNvkmnGKoss9rmmV4M2KNf+X91FI=; b=kRp3XbRSJ6dlH+/Q5MrovIStQe
	KeOihCE4GXiYoFXpejI5nd7IHmUDr1vURhmk89RdKb03BSiuH+nog+5GxN2MY2msULL4V7CtmdVSY
	yYTILfhUTrHABqRvRsjXHi7qZCHgrriGdMBQCDnrwStw6eZkBljtdUrEddhIcxkIQz5juTiiOISTE
	Sww/T1Xt6uAatsmpf8WzoWMR2QhGLPYiEAR2ytpwIPftfa/nocl8BrhS+wg2dujaUyugPPh6+Lh/5
	Ky+471N8zd+Khe8bRTAqQyJ+U81z0d0Zs3r6aL0UBnszO9uIfAId4mHCkWT+vPDltp3Xw3emguomf
	I0WqwfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRaO-0000000EVi2-24Gl;
	Mon, 27 Oct 2025 18:04:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRaO-0000000EVhv-0R2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 461886119F;
	Mon, 27 Oct 2025 18:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB18C4CEF1;
	Mon, 27 Oct 2025 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761588290;
	bh=wC3dF4Z/2TLP6nYVtiNgty+OuO6sR3fKRJSKrIGVSQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7SlGX81jMR6yj1IeJWwwVYQ3+3tPTmCK831vU1PnUIt/iyPj3GDmL9XiYKXpNDQ2
	 Z/LRHnTrpEIFm63gcu23hvDSaBvb82i2geNIvK4sey3zIvfbtoBKF2HX15Mb64mP1H
	 81WWYU6T9B1ikykq2fnt3FSFoX+2h0A+ih/98aLlfjn6aGOO2h1g7gGYFT/6Q7aTAw
	 oILKlawFztGueWsy1Fqu1lVYO9XvG15dNOuHf4Hm5aGkdfStrLGi39FfRz6paFKUvk
	 sjbjjOs/5XEoKmxLLxO7nuYcFWMhILxQe6vS5CFaSHHqsyg8dqQL681CX7/X9jaXPs
	 Aikt7gxqowQ4A==
Date: Mon, 27 Oct 2025 13:04:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	Frank Li <frank.li@nxp.com>, imx@lists.linux.dev,
	Xu Yang <xu.yang_2@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: perf: fsl-imx-ddr: Add compatible
 string for i.MX8QM, i.MX8QXP and i.MX8DXL
Message-ID: <176158828675.1280181.1101688513107475187.robh@kernel.org>
References: <20251024-qm_dts-v2-0-7a7e07022ed6@nxp.com>
 <20251024-qm_dts-v2-1-7a7e07022ed6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-qm_dts-v2-1-7a7e07022ed6@nxp.com>
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


On Fri, 24 Oct 2025 14:17:11 -0400, Frank Li wrote:
> Add compatible string fsl,imx8qm-ddr-pmu, fsl,imx8qxp-ddr-pmu, which
> fallback to fsl,imx8-ddr-pmu and fsl,imx8dxl-db-pmu (for data bus fabric).
> 
> Add clocks, clock-names for fsl,imx8dxl-db-pmu and keep the same
> restriction for existing compatible strings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - move fsl,imx8qm-ddr-pmu, fsl,imx8qxp-ddr-pmu under enum
> ---
>  .../devicetree/bindings/perf/fsl-imx-ddr.yaml      | 29 +++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


