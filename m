Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48019C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kF8YJNx5cxsy4lSLpZugZPOKiY3xkSFhFAltfnnkcFw=; b=4p9MXmE8Hy6P5tNzVOMAT3D2JD
	8jX1BGOksg4+DCtqTtPpxTlwqgfHcCHmri2UiS0cBFsuao686w3qdmUp2L4BvLZuqEQ2VqoZhgStc
	CogvMqA/mHWKyPy1g+9lRSQYkRXYCqNv0AOTqbY+pPjK+KCjGBARvoFeEJgTTlF3OqrGbOiJ17C+h
	YuIkgrl4YDJhjY2D+4fQxk8o4IwG4KVzEj9vY5QoVEys1lUzYbOqmdykX/rm9C1GWX1WcQwY9wh3W
	FNCtV79Xxwno99jP0XIGVipfQeHNarskgmJ5uG+jLzSZ4XJHp1iotcWDRrbnqRZ60AqGftRZK1dk5
	iSKW6WZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwwi-0000000DD6R-0RPm;
	Fri, 27 Jun 2025 00:28:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvvO-0000000D33J-35CE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 23:22:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BBAB5C69A8;
	Thu, 26 Jun 2025 23:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A71AC4CEEB;
	Thu, 26 Jun 2025 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750980151;
	bh=iCtlLNqs4td/sAbrwzzl0mCercZnD9PWCfAlyf24ubY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/sVwzH47ESATrCJ0HpGSUIe/ZVAy1lcIGLcaz2gT0L8bIT5xS569DM9OVyVNd0fq
	 5bWbdk3NrbB6tXd1SsbqXt8VmxdPmVAaogdwIoGr9o8czZIpV7YGSey0HdLleOuPoL
	 okmfCDoAo36E7LberQTXRTCSLw/WSjyvFFsCdZXlrRJHHYGNWcTokM2rnr1fSWOKw+
	 7RZrX0xC5lgN+ziRnFMSqghhMF82DDJLFjLFfKMOoJ99rQsgSIRSpUOO+WYB5yzhac
	 b/yEuypL0Mw0/Pp0wAP7hoT72Ehu1To3srB/YPuI5j5AJKfKDgUo91AqqqV++LI3CR
	 7jTOfSYGTVkiA==
Date: Thu, 26 Jun 2025 18:22:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Purism Kernel Team <kernel@puri.sm>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, Rui Miguel Silva <rmfrfs@gmail.com>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <175098014957.1390900.11681586327735894598.robh@kernel.org>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_162234_813498_72E8232F 
X-CRM114-Status: GOOD (  11.64  )
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


On Mon, 09 Jun 2025 02:58:38 +0300, Laurent Pinchart wrote:
> The CSI-2 receiver can be instantiated with up to four output channels.
> This is an integration-specific property, specify the number of
> instantiated channels through a new fsl,num-channels property. The
> property is optional, and defaults to 1 as only one channel is currently
> supported by drivers.
> 
> The only known SoC to have more than one channel is the i.MX8MP. As the
> binding examples do not cover that SoC, don't update them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


