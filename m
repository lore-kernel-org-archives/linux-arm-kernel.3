Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB08EC110C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eps0GbHRnnUiz5QXS57P8YcOxkuqa+HTNk4jYoir3Qs=; b=gatnN4okasleR1fxNBXaMZY5My
	8GwnUJxJR0ZDGDWiAUVWrwBFD33QShu2ogIn4Jn3SyuF0bxtPeFASesz9k2q4p2Kqv6LZO+SL9h0Y
	MClnsPTT0SDS4U4EAI5icSD3GXhZIzEMHmMOaU8vcykqX1vJyjVyz2Q6Qqe9yC6jd91U+IiTlET1E
	Dqai18kqEelA68jUFxewKxwMQCQ5PRd7ehNUiDqg1pxLvzjLjy8hWmaMdITV78ytt6WaeklPIMA+O
	/RPj1+4Pz7/ndt1noYeIo24yagohUST+jg8dVD0m/V/xcJQWN0s5fvInm/50m74K01BItmE7dfLss
	tyIYa6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZvQ-00000000nud-1bT0;
	Mon, 23 Feb 2026 17:40:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZvP-00000000nu5-0ZiB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F17860123;
	Mon, 23 Feb 2026 17:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC94C116C6;
	Mon, 23 Feb 2026 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771868449;
	bh=Or4h+xHQ5FS/HiNmiFjEj7nHN/WXQsovDaKSA44TqMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ARdLszs83gSNML82XVROwKgGssmLGH3Zynb+n4i3A37u+11VB3Ra0MmFkeLVwsqcp
	 2pD1eIIeioFfNydazYpvFaV36XoVfvkj9psjyzwQtTWewlXaicI6COHdVstGUDP4Kn
	 9zjHnNcggwzTsFr3DuCJU8aSLmW/ypq5NyiT74Jij7z1SZW0wSPqVTi7VvDWsIolJZ
	 grOXYA81PBrDevgU86FNOggHRpha2Us9Qeea3Q9Qgifv1MY7etncSJIwnBieaQO/CR
	 tuGinhvisN83D+eFMvHhWp6mT6a14ZTT9fybrVLQzPaHarcdWi0V5Cdh2t9laiNcaO
	 x6m5epfwZR8DA==
Date: Mon, 23 Feb 2026 11:40:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: fsl: add compatible string
 fsl,imx25-aips
Message-ID: <177186844812.4160031.3323512453919011209.robh@kernel.org>
References: <20260211221529.3745404-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211221529.3745404-1-Frank.Li@nxp.com>
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


On Wed, 11 Feb 2026 17:15:25 -0500, Frank Li wrote:
> Add compatible string fsl,imx25-aips to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


