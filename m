Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429C0C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 10:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozkC6Yfi70ZPxCUSUp/JvQ/B52PbE24QuKFnQk4/24c=; b=jJLdLWWY5hmNSSXP4hOK0u8iAi
	PD5jJI5jb8knC12DwSln6Y/L/4PhZ+FUZKpClV+OotBIL03YT2gMSw+lFxO15tikOwxCKPozJwxrb
	tTYxCoGkQGP6p2zu08Mx0w//s6u7VHwm3qoDlOZmB5lU6J8BO5nxmtd03MP6aSIFftRNwGYLlAlWe
	fNjLwwwuNuSa53MmVuvL4IAmeBlqSfinYIz4wWip2Ap8dbhDKbLgA4fAaQLXqwE/sX4Zh01/gPKdw
	H8sn/Wth6PWp+976ZdROiJdB2DIjaIPlV7RV9xKAU+F+DO+JPjHcm0joYGL7+0q4qjKzd0K5PIymV
	QNyi7YMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9E4-0000000As9h-14KB;
	Sun, 23 Feb 2025 10:28:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9Ca-0000000As1P-1txE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 10:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2BD05C62A5;
	Sun, 23 Feb 2025 10:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8045C4CEDD;
	Sun, 23 Feb 2025 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740306431;
	bh=M/NiBlLZB/96+Sf8fu4U8io2VkaRX38UaB7BPciHyp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtyaSA7kyxslpOuXl8UvM2sb2GrvXcbFGIl9j9QxEoZ5Z5D7Ez41+9sDvPtkBfv3F
	 mxpoipHXNZ0b59zuGAWrB+hDRQoO8TCMiOFDJ0TsACaEr/sBZItLpxXSV9/DARCcfc
	 v/e13HWsXGYtGIXM4mEMnCW7k5Cp5Yjek0ibuQh/fLpXa9mticuYQR68l/xvbOqJoV
	 y6HfeeZTLidNA3OQ6v6gXvgBE+rJwXlL7jIC9HygPRCncKY+IsywLcwzkguhSXwoIb
	 /Mn0v2UpQ3ByfHl7WclQ4whC8lWw/j0Ne81LOnNg12cn3pEVw/HJHVGbFe6bL4ATSH
	 Z1KsoNKolO4DQ==
Date: Sun, 23 Feb 2025 11:27:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mm: Add pinctrl config definitions
Message-ID: <20250223-messy-silent-tuatara-68f2e7@krzk-bin>
References: <20250218-pinctrl_defines-v2-0-c554cad0e1d2@gocontroll.com>
 <20250218-pinctrl_defines-v2-1-c554cad0e1d2@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218-pinctrl_defines-v2-1-c554cad0e1d2@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_022712_540934_32303603 
X-CRM114-Status: GOOD (  11.82  )
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

On Tue, Feb 18, 2025 at 09:39:16AM +0100, Maud Spierings wrote:
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>

Why are you adding defines which have no users? This is just dead code.

Best regards,
Krzysztof


