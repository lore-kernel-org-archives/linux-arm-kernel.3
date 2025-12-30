Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9CEE95A8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mro0doOh0X9RxbtP6AspUu78gbQOGO/4DVR8EBmDhBk=; b=r2IsjbwOPKeHZb543bdnUuSjNx
	HYnc5Nhmesy5Xg+itwuoYyUedmB54Op9YXJfkCD3Z+fn1KtgJLdhzNPl8y9tVux8SPi4JB0WH92tr
	PUrbkC6Uk28aIO+KlVT6nEv+CwyiTqRJ71t4WFo4/QoxLZKX8YY3sCq1odaQRGo+RkuDv1SillSzW
	/66TQjB8z3s/aR6dFnYN7VADGn+l+5Npj+nuyWhtCwLtVp5k++bZEnSOZnKwUb/oS+8dnV78poavW
	UgxHsHcKp6YhrigV167AoYvqUSzPnRnNK4y7sEQDE6f73ieMxr4t0fIMZLX5NySsjMkpF1rb766uZ
	hTwkC9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZae-00000004r6U-21Tw;
	Tue, 30 Dec 2025 13:16:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZad-00000004r6G-1FOM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DB136000A;
	Tue, 30 Dec 2025 13:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3037EC4CEFB;
	Tue, 30 Dec 2025 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100602;
	bh=oOocE+3FAjl8ilqNiFKWU7yGNQPLFNxslL7pnT2aNng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZNdw6/hZV8x1aWhMmi4iDj8wW3dASSjIrdFjeEcJ+hGfmGiq6WJOaEVED2OQ2eUo
	 MSWy2acAghE7LUI90FccDE3oK0NokFgEAvJw/Cfo3Dm1/n9tutbXqt4EFikQuj+Yd2
	 L91DoYq8T30fEbsCflv9Xqip5MH0/tvkri3aupWXboCQzs1rzSqXukj6HFCC01a9mB
	 qUE4Nd4ZRL8JHjEfzSUPWQY1IUaf72m4vU7GS8uzh6jsZr3RsYgDneOGiNviBLQi+j
	 U2xByMYqH7RN65uSQc78efi6skStfQXavo0lkOnW9d07TAZKGXyw9yZIFCYNBPmI8J
	 ypP4QEPOH5TkQ==
Date: Tue, 30 Dec 2025 21:16:32 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] arm64: dts: freescale: Add Apalis iMX8QP
Message-ID: <aVPQsKS5iERmmKG9@dragon>
References: <20251223162833.138286-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
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

On Tue, Dec 23, 2025 at 05:28:26PM +0100, Francesco Dolcini wrote:
> Francesco Dolcini (4):
>   dt-bindings: arm: fsl: Add Apalis iMX8QP
>   arm64: dts: imx8qm: Add CPU cluster labels
>   arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
>   arm64: dts: freescale: Add Apalis iMX8QP

Applied all, thanks!

