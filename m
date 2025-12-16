Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362ABD5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+02ID1Y3dnZ6pBYsFKgMuDmbdAn/3RbagsHQD7e0ILo=; b=Q7f3r6sm4YvisDVCryaFCjOuNI
	h9q92KIvzITTwiYl1wZp66qchso5Fy7hLPkuY5D4moyOznVy87I16OhecUFaHxAhOcYLqrqBvvMJM
	oefjf7WV6USorM8jm1lAjox3aoXYHsKUtr7Ilkj8LzABdGag/qEelxJz27mpZtf+7hNS9rg5q3agO
	lxE25dgEAx6Sq6zAB6Lw2GSm3q4EaN41yF8yCDVWrbYtt+kkxQolyTetBUMOCBY+PQE6WSf1G5kOJ
	GBVqFQBiARh9GMuHyUOvAavQDXukRa2LeuSbbHhLD5YnCl+4PTDg+WHwBC4CpeAnJBX3VeGUKIXos
	5ABCPRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO9E-00000004k4p-2UT8;
	Tue, 16 Dec 2025 06:03:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO9D-00000004k4V-04AA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFED260188;
	Tue, 16 Dec 2025 06:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7EFC113D0;
	Tue, 16 Dec 2025 06:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765864977;
	bh=Em6+p8Pu/6Vb7snDG9aA3wExt/uZfpztPqqJRPy+fdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMS4yQloi5hK9U3mbjIstm+y8nVJ4PngK72sD1tqlkt+A2n9H/tUVaCNir9v43FEY
	 pQtGBfjXcW/f+g/m67tx56ViSTQkBCDdnDbDN+vFK605fdYsI7+93TmcsYJbBroeE0
	 FDxsClrc6D/s6OAmMeNTcwfKUOOIK3fgw8qistpGP711amqxtvkPR28rmpLNCty5Ac
	 8PmnE7jx/7mkr++aoob9s5yOwuZ26liengFZdCcmmKclEkCT8MEfHok2ub8usJImu1
	 tuyDK8xMRU+MmJSAvG7iXlxqlQkOHsmBt8TXzC+ULYCsEcwvZAdukBARJLeA1yuzkS
	 8Cm6HQ4FsVRPQ==
Date: Tue, 16 Dec 2025 07:02:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
Message-ID: <20251216-energetic-bittern-of-diversity-b2e851@quoll>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
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

On Fri, Dec 12, 2025 at 11:31:33AM +0900, Joseph Guo wrote:
> Add the board FRDM-IMX91 in the binding document.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
> Change in v2:
> - rename 'frdm-imx91' to 'imx91-11x11-frdm'
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


