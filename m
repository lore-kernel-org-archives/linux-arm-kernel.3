Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDAAC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zczJdr4x96q520o3t6HU+u3KmLVhsf3BMnJqd64NB0k=; b=mWVEVv49O0mUhMo4/3gqe9Yr6w
	dp4uNAykT6/5WUWlgvc8TZTpK39UPExvml+ypf4TNoIKQTgGMXmjCRvB8HldmZLVo/5r8ULxLZz27
	SjQ/EE7Ycx7N7EGRYeyLS419DXmzD1oVXAW003IPSmgUgMxb1cJAIfymA2huTOEj3imeIjazKwYBv
	Y66V5eTuEwDZ55CADSFW2M3zeU6y9IidUEz/5P6B0haKAtkAWBHhwH1pXeykf98AlE8LNygmigHqC
	bBPuGO8FAWta5qfuSCCc4fwTuLUn/9uThYnvFepZ6+g/qZAtkYwERTlUN0zYmy2O43OcFrFqWVThy
	/dSa3pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA95o-0000000DzvA-2D3E;
	Fri, 25 Sep 2026 16:48:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA95n-0000000Dzun-00sP;
	Fri, 25 Sep 2026 16:48:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59E7460136;
	Fri, 25 Sep 2026 16:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05021F000FF;
	Fri, 25 Sep 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354890;
	bh=zczJdr4x96q520o3t6HU+u3KmLVhsf3BMnJqd64NB0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=brXp1DtUwDmfFXlJcboWgg1XECzBk1LYm8tGmkSFq1U5qkbn+/8XvUJukZfCdhiU7
	 HdFNq5+Dl7gRGQl7W1LQAmgqRGMNpRODZU4PZ7V0E1VDkd1o37v649Hh/BFhCJFhG8
	 YahYzU5aRLIgSrCGs81gcVfSvDnJYCyebHkh87pKS1BoRCvLjxy5rHF+f5KkFBfByR
	 yGQV4eThyWQdc/3Mbxn8ErXjavxV3z1Jyo0BWrI/EYVggTLMB1iokjkS31zDwF3sIn
	 hN3P8TX4WtbtbB8/nbpP0w7uCLzwrl9zZerx9CPDUlSaYxTRxOIEk/jYb5q/+SWwpy
	 jg3q4rqheD6Jg==
Date: Fri, 25 Sep 2026 17:48:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v6 3/6] dt-bindings: display: brcm,bcm2835-hvs: Document
 iommus property
Message-ID: <20260925-flattered-thigh-50cc8cd8f9fe@spud>
References: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
 <20260924-bcm2712-iommu-submit-v6-3-7b3cace86973@reactivated.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8LAgqHSG8PdthsFm"
Content-Disposition: inline
In-Reply-To: <20260924-bcm2712-iommu-submit-v6-3-7b3cace86973@reactivated.net>
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

--8LAgqHSG8PdthsFm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8LAgqHSG8PdthsFm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaralxAAKCRB4tDGHoIJi
0nClAP4qSb3LEvuzORVdDN0PI6kfRuFphwW+o0wepGOBT1ImdAEAlIrQeeTCBnTU
xjRn3e1s5f9rvcd3cBB32d1CylXd8Qg=
=IMHn
-----END PGP SIGNATURE-----

--8LAgqHSG8PdthsFm--

