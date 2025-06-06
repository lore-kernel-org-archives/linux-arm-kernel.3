Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711DBC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRZhlse3+EomXBkZrbHe1obXQxG+6zFlmRHjMW0cCaU=; b=tE7zv7wnKaoQXgsCwA9l+OCnC1
	SA66kW5fWsUW4MRW9bl6zhFdA2jSUZc/kU+ZJFGX1TnTPALc9I7TI8u/y4Wvb806HltQkwBUY74EL
	Qk3m/iDUlNkteSw3sHpXyPq50yza0o4kdYauUAEtgnN+oG0LUQmjNGByKeup2fXKJ5RID60h5zRUX
	yYZ54IeB5MTagC3P9PCvD5kVUOFOxIbmF4rTIWs72hoXlU4JD/Bu4RFyG/yJBASJjKE2XCQJuTkWl
	wu9WUQVnrJvfxX6DI+bdjBbSW4Ed1++3bD+D/9Ahs5xEQAfiE+/ERtRQoP4a4qa4ro5fH2r2Vod2o
	kAtJmIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXsO-00000000PWT-0y97;
	Fri, 06 Jun 2025 14:16:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXqG-00000000PPY-2hzA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 14:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A50E5C62FD;
	Fri,  6 Jun 2025 14:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB6CC4CEEB;
	Fri,  6 Jun 2025 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749219283;
	bh=39pmQdxSkt0c2D+ArHLlW6gILLh7CUV7D7iGTD7hAkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaKortSkRTmhC6Us6hrpg+/9Ya1IpbUoxPtBDSVvmcitOIycuJoYEjZwyPadzcYmp
	 pOhAbADR15yqqgoqDo3BerzMZcTmCRuhTo0NARtpqaMfcr8pQakUIU7q/6A5NOFIjk
	 OZNbnkiEpjqaosVv66OY3u3vhoK18Pw/gr2dnLc7VDCMJD4Sr7IbDBJVdPm9J+W9my
	 wICy1VF+4Z2YfELiOMb1mMsUpQjkIkDj0evCrpVrn2sQsq5UX6E+jps0Yn/BKwtFee
	 q+uyJ+32pN6Ly8b7D25o9ugXc6dz7YffZ0si3eiNrvG75RWaumNJ0/wkbJphaVgms+
	 DlIiNdeuW83Xw==
Date: Fri, 6 Jun 2025 09:14:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Marek Vasut <marex@denx.de>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH 1/1] spi: dt-bindings: mxs-spi: allow clocks properpty
Message-ID: <174921927901.1475063.16362852854822063618.robh@kernel.org>
References: <20250528222821.728544-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528222821.728544-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_071444_729372_CBB87133 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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


On Wed, 28 May 2025 18:28:20 -0400, Frank Li wrote:
> Allow clocks property to fix below CHECK_DTB warnings:
> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80014000 (fsl,imx28-spi): Unevaluated properties are not allowed ('clocks' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/spi/mxs-spi.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


