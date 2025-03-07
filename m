Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B70C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmpRHggy5GjvVIT0duWQl0IWhuJDRxSDhATt469mtFQ=; b=t8A7Uz5sf2mXOhisJOWerlWWnZ
	E+A+Soj0t7/LvPWcKA/eZcVh262xTmBmveilEpVRARxkB1hvluzpIFT/Ur3DoAiOtYwrfTkB5qLql
	10SSSSx77fyPKoVtRN3w7+MrPmhHjIa29GFd9Y166nARkbzK9MspjSSYxMjbA+jQkfzq4F3KcfX9L
	kUQJJvEteIdDWIo1CcDKeBS4poTwzRmqZL69/nR4GgqSxrUKEu1CLeX936i9weCK0cC19Kf0uzC+Q
	JhNK7BTjgh6mH0puBTx+hfGPme9EVPEFVvGghKHv+EznkcyD2nWDeyJFgiUYQ20/Lrk3bmarZub+Z
	rG2bPY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa7s-0000000EncB-3DZ3;
	Fri, 07 Mar 2025 16:00:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa4Y-0000000Emm0-08SF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 884DFA458B4;
	Fri,  7 Mar 2025 15:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A87C4CED1;
	Fri,  7 Mar 2025 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741363032;
	bh=EmpRHggy5GjvVIT0duWQl0IWhuJDRxSDhATt469mtFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbwdaSexawmGG+Xv5BuwBQNMDlSnh6UlFKlxL7wJGrm4J6ZXTV7zSvnahjARaApTj
	 YlVDWzpeHDccHdtH20YRsuIhR/OSNoEw1vnZ/KZRVFG+uVJxImuAvEyyG+8YPXQyY1
	 T+LQa8yzn+CeskX8paolAgKtuzv5CrT0xBOJm/TkU2x5Dnzv+V7w+tPMDAXyDqt8Es
	 uHIGp0I3+vlBfjVL29msAdEv4wmTDEzMfl7cOdjLy0et8s8p+NKCtdNm5sn6J2N1Tv
	 K98fOQen85FCRz/Phtm7x3pXIYjh+Z6R6uTQQhKTqprytV84N88XtjUkX2x98Y1Tv/
	 2D2o6renZHAog==
Date: Fri, 7 Mar 2025 15:57:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: mmc: fsl-imx-esdhc: Add i.MX94 support
Message-ID: <20250307-darling-alto-4ad82d5dd20c@spud>
References: <20250306170937.242183-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WYpN23PbLVfjPCHe"
Content-Disposition: inline
In-Reply-To: <20250306170937.242183-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_075714_161425_711D2AE5 
X-CRM114-Status: UNSURE (   8.92  )
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


--WYpN23PbLVfjPCHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 12:09:37PM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-usdhc" for the i.MX94 chip, which is
> backward compatible with i.MX8mm. Set it to fall back to
> "fsl,imx8mm-usdhc".

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--WYpN23PbLVfjPCHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sXUwAKCRB4tDGHoIJi
0nbXAQDXtgw//BRVfcxZWeWP78cFq3Sym85AsObMUrTxtRtYCQD/eQOM0xIWbK3F
WGMtZmLz79WsWahdW3LsJ4+PFmn6/g4=
=bxlQ
-----END PGP SIGNATURE-----

--WYpN23PbLVfjPCHe--

