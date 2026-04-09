Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBDEE9DE6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMmUZDUf/JeRR+9mmvRkSEZUr5AtKJ+nfa5lgc3IPyY=; b=enN8X0G8kpPXm61lGS6lNEMSXH
	TXLKkVs+F++Q7tIQMBDBfV9N+XZU23Q32OuNCX8ztzl3UWj2slIJ/hxM9qLhK7JqRIGWWgxP877z0
	7fsf3HAGrm/VmcPEOSPn1yS+676FAPC18zy08zRZ/O5Grdm+kmJIlnmzqaBnrBbEdJebjyhjf1CiQ
	ttyeMJ98F/g3LvTRbtwC37Ex6T1QP6F7+Gvsa85HleKPuaUjyEoHQ9AGaZsqHZZ5WsxoOE2yqgEjF
	55mBEfbQ8aEUboNXC/DE4bajyvaVbygdDL84acrxaqRoiJRcDDJ80B5U8+xsbWsrOyJjNXSyh6q1v
	HX6z0CiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAl45-00000009ySG-3MeV;
	Thu, 09 Apr 2026 08:48:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAl43-00000009yRi-1YPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E599042DE6;
	Thu,  9 Apr 2026 08:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41636C4CEF7;
	Thu,  9 Apr 2026 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724518;
	bh=Ucrrm+UdDjJaW/Cy0XhWuFhqJm3EGIewHjfu8mGM1Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9YuU1OK8hE77fbU342lH4ZxNDHUGbiWDT+bNv77/ibID3TxtJB/L7lnD5BHwT2YF
	 RfmCi4Vi8/nRGhRmU0dz6z5TATqJAcNwrjiQzpnOcqTsYzPgAldDVHZY+wie3uuLIX
	 SaoKKeFcbNmJVBB+gFz8iIiTCXogInrBUR1vBCRDMMxG9YNOMV64JmHFqIkenqEv9f
	 skIv/KmbeI4Z+Qh0A3W3T0OsOuTMC5p0HLPkrwS+nSEt1whsmKZexnq4PccbqePGAu
	 U426Wrvo4TLGE/Hvn4ebV6g9fQ8XZ9ZMR0Nbiy7V3INjewrIxucUU9mGx51nzHegFd
	 rpA4Zl9s32ABw==
Date: Thu, 9 Apr 2026 10:48:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add SolidRun i.MX8DXL SoM and
 HummingBoard
Message-ID: <20260409-peridot-lynx-from-uranus-75a502@quoll>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
 <20260408-imx8dxl-sr-som-v1-1-ce5a39acd713@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-imx8dxl-sr-som-v1-1-ce5a39acd713@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_014839_446087_C58DC147 
X-CRM114-Status: UNSURE (   9.17  )
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

On Wed, Apr 08, 2026 at 08:38:36PM +0200, Josua Mayer wrote:
> Add binding for the SolidRun i.MX8DXL based System on Module, and the
> reference HummingBoard Telematics.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


