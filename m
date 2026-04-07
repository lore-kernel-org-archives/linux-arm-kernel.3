Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A5CFF512C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPVkUkYH7s1zVS7ZZogWQb7eUpEuMkdV9yczv5401Kc=; b=fOWFeLXCNfqtFwXj71GMtdkiAg
	JLqvWfDwoHVqdgMGMTOl23tGRfKN3rPqA5boLCZc9IY3hqhmrMGpJYd+Mh5S07xaxCGKskwQ4ycdB
	YrYHU2+cqm5v1v7b5JyyijQx9ouu48Mow1uu6Ma2wudMqY2BY/NbVTWjBeBu8AcVxBLJuR+5hIzd8
	zmPTeDcfonU7hOscPviSFRrKKctDH+Hv57gntc027R+XI5Byswb7RbhEwv/o3fALIdbALRj8zeaSr
	5lVbn1e4pWaDtWxz1RGlm/8s82jo6Gj7DDiHM/v90BIDcWMESOvOT02pXFAuRZ0X19+lKCIVOSglh
	icAM0ejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAsX-00000006tqd-09AV;
	Tue, 07 Apr 2026 18:10:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAsU-00000006tqE-0LIv;
	Tue, 07 Apr 2026 18:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83D2F406BC;
	Tue,  7 Apr 2026 18:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFCDC116C6;
	Tue,  7 Apr 2026 18:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775585416;
	bh=9fjuIFhmUoz+pTrO13nFTJUB6S3fQXknIHSx7EgxRZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dT8gTIpSJ89F+AHfiGM46qYbQ39i+NWIhwAa8WarZjcopRFBIdCHC1IzpIlk0NiPO
	 HeRXXpKvxuAFyEvqJfVGM2u6hrtFZ+BLucPGY0G8Ogdf6LJ2U41qTWY+gnAnPRt5MP
	 tw5QouUWRBTt0c/3Or3/5I4/Ju2QV5jZmHtOS0aCp4dFhlR1Yn8lsEcXsK2MQru/Nq
	 DWEfqvMe6RnBweQKFoQbOuYvoiqb7FkTvzf5HHn2BrtuDtJT2TSPi7MV8c20OczSrV
	 crugcMLxlbegmrtvSFVc3yBYgDrnsXBBN9n0J5Et3ejufmxx/ygfrWxQWX2Ulnkipb
	 gGokkkjHXJegg==
Date: Tue, 7 Apr 2026 13:10:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>, devicetree@vger.kernel.org,
	sebastian.reichel@collabora.com,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 01/27] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
Message-ID: <177558541397.3220552.1652779778691249972.robh@kernel.org>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
 <20260325-spu-rga3-v4-1-e90ec1c61354@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325-spu-rga3-v4-1-e90ec1c61354@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_111018_160891_3192A22C 
X-CRM114-Status: GOOD (  14.55  )
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


On Wed, 25 Mar 2026 15:50:32 +0100, Sven Püschel wrote:
> Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
> peripheral found on the RK3588 SoC. Also specify an iommu property,
> as the RGA3 contains the generic rockchip iommu. While other versions
> also have an iommu, it's usually specific to them.
> 
> The RK3588 contains one RGA2-Enhance core (also contained on the RK3399)
> and two RGA3 cores. Both feature a similar functionality of scaling,
> cropping and rotating of up to two input images into one output image.
> Key differences of the RGA3 are:
> 
> - supports 10bit YUV output formats
> - supports 8x8 tiles and FBCD as inputs and outputs
> - supports BT2020 color space conversion
> - max output resolution of (8192-64)x(8192-64)
> - MMU can map up to 32G DDR RAM
> - fully planar formats (3 planes) are not supported
> - max scale up/down factor of 8 (RGA2 allows up to 16)
> 
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> 
> ---
> 
> Changed in v3/v4:
> - Dropped Acked-by: Krzysztof Kozlowski due to the added iommus property
>   and description adjustments.
> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


