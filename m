Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925F0CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r4kIGjYXoigmTYNPzj8IlPYSV2loK7C+T5IdiCS4QY=; b=hLa9nJ2pVZEn3uf2NuQQTTVMuI
	r30L8e7hLcMuriIRX2Tl3+O3LWpFW2BFCP18/SUp8TIxQi0zDedbDJYSlNnzMO4ZdQ8P8LtAL1wWm
	fhf7PDbdfgRqqc1HVUW9ocui5ZMK1GO44992ur0QhtrsVtff0bbUmaJTyCs5XOWy8GyhZQ+GP18wS
	1F71S4l722ZcLqdRjLeU2j2onm/Dt5h2+pyAdYMgQNh0yWuC2Q3oPuAK+f5sqetygpgux+2qLAkUU
	weM2iH/jhcYQbPsjIT4/2BuSc/jsN2Tb0XO0a85fIOWt6X2Av3won9cfYAvAIdvdHzbLlZi/Plem7
	J9zT0v7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91ba-00000001ia0-2g8G;
	Wed, 15 Oct 2025 13:31:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91bZ-00000001iZf-1mKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A6AB612A2;
	Wed, 15 Oct 2025 13:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B13CC4CEF8;
	Wed, 15 Oct 2025 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760535108;
	bh=U6U9Isg9UG30rWgAIkGOrIJ8TJ7Vt+fz8n5cRLTTnNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjkVEOa0kDfH9tViKXPU8re9ULjS63UkwqtmS40Er35wFdQP/39XagX39obdH0pNS
	 kacHVArwTN8ZpgIFFwnorVX7x71UBMbm1LVlKkWodBC+sxGBwPhuI8fgokg4mG0SRl
	 9QgQzrOlPBRf7hcdcdowOGDhAs8Ig8rqpXrG5duNFvzuXWt3NP1N1OwpslbIKFbMbY
	 0kqTF2XVa0QxJ7tffLU6jZX/jbyQTyLdPeVOpntsnk5dTRufeHH8JWCbbECC1GIlXt
	 wDIdOI7lTQSIv0/VcCtNNOGylySalRmp8Ja0tkKf2guvhWUB0JMAUaJaN9dCpBsR1w
	 tfVDFvPSjOUiA==
Date: Wed, 15 Oct 2025 08:31:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Liu Ying <victor.liu@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 37/39] dt-bindings: interrupt-controller: fsl,irqsteer:
 Add i.MX95 support
Message-ID: <176053510455.3263483.4220696056487086323.robh@kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-38-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-38-marek.vasut@mailbox.org>
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


On Sat, 11 Oct 2025 18:51:52 +0200, Marek Vasut wrote:
> Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
> backward compatible with "fsl,imx-irqsteer".
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml  | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


