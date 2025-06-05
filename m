Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC545C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8yOLhECqdBYlQDfblWUN872eg1h7k1HPEZxUfwmZ/o=; b=DYZPVWKS2Sk0oWzLgtKpAC/2wg
	C2Y/gVjzQpfoDUOT1EGgrllTICkh76Zdn+IrqwTzKa0lNihUtv3S3yL0KX73wqukkjOME9nekPLf7
	B0lox5Qn9OunQv22j+bdwMfD3AhHB4fVmPyj1ZyWEQRCsCHuCTGZcTy0UDqdNynR5q7JgPyA9ivnW
	VjpN5bkzSDQJbtQWD2Ofpkbm9qYOR8NDRJrtfbqhUqkmKDgHUAV4N9fOEbzhZgm5HIce+r3VOAfiS
	JoFEN2KiNkFVyHDW1wpHJnvaVODzzfiZ1W11ST+YiuniOrWDGmoDhZlExXtDVAVbJyWDnNmjfi++/
	iVCrhhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFON-0000000GFsj-2BXB;
	Thu, 05 Jun 2025 18:32:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFKh-0000000GFKF-2rbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 18:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66DC649BA1;
	Thu,  5 Jun 2025 18:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5E8C4CEEB;
	Thu,  5 Jun 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749148135;
	bh=SxpCD6ISZ6SNV7q5q5PMNqCiQzrvFjlEMuMk0hZKHNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbr+e/HGgvpeQJh6yW6or2nZr4ZfFYL8fAZJYSY95Ear0/KmNWxkYyLIvzUGMiAKo
	 Rqrplat/dc/fSpzFNnL+eGpPtowTXRuDVaCaS+923qM+9yvSlgUFJvRwnFSdMSRPsF
	 NptqeeiElj4/OQ3F8jbVqleqAmV/ylOzkBSTVulWzH3f38dy1UO8foevSrzTkobRUY
	 1xT0+n4M6rNB//nE0Jq/U5aFfcqqd99QYY7heY34oTr2zdOkjvB5UwdV68kN8ZmCmv
	 pxtSBhmqWaCG4ItmEA9vwXR+1fKjuMd/H801aFoUcBd87s7KDveNiqTrDAIcU94Ymr
	 pi6jvxByoOOWQ==
Date: Thu, 5 Jun 2025 13:28:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt
 to yaml format
Message-ID: <174914812962.2988981.13376867927592691613.robh@kernel.org>
References: <20250528165755.692264-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528165755.692264-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_112855_747609_8638DA10 
X-CRM114-Status: GOOD (  10.99  )
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


On Wed, 28 May 2025 12:57:54 -0400, Frank Li wrote:
> Convert mxs-audio-sgtl5000.txt to yaml format.
> 
> Additional changes:
> - Add compatible string:
>     bluegiga,apx4devkit-sgtl5000
>     denx,m28evk-sgtl5000
>     fsl,imx28-mbmx28lc-sgtl500
> - Remove audio-routing from required list.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed commit change (all decleared in Additional changes of commit
> message).
> ---
>  .../sound/fsl,mxs-audio-sgtl5000.yaml         | 81 +++++++++++++++++++
>  .../bindings/sound/mxs-audio-sgtl5000.txt     | 42 ----------
>  2 files changed, 81 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


