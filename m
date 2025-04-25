Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2965C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 05:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyQprxTrTzeJEuddDXNiYr4ctzPhYLZ6Cp5WEsAgS9s=; b=JORv6jRTcqEMljBnrSOcv4P2vd
	YeFoLn33e5AiV1tHw4ljiM4Vc8RqGE0oZDvY0BpttfzZfAprcqHQDvqBMW4IGXeEA8NbvTpAzfHcZ
	kLx882iXwP9k2fdOalJi5/LL+xJVxc+5v4yWkB+lvXVCcnmIFk4oOG/XN9fMwmV7ggoRJw4bwoWlQ
	6er5UCaIfdP9/b9ua46DgK8uEPS9XIM4PWvygFEJdZV8vwYZBHel0gN8PpyMo6rEZdA8PxAB0iJOR
	L7vxTVLjCmcNW7/E0CyQnLc7aKQiC5Bl3+wlO+HSiOQ2BwokxpVAQi2fEY4mnkWZQknPIKKk/FgMF
	byuV9UfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8C1Z-0000000G1XS-2CyB;
	Fri, 25 Apr 2025 05:54:57 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Bzh-0000000G1O9-1j4L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 05:53:04 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 083881F944;
	Fri, 25 Apr 2025 07:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745560373;
	bh=UyQprxTrTzeJEuddDXNiYr4ctzPhYLZ6Cp5WEsAgS9s=;
	h=Received:From:To:Subject;
	b=yuheSb8htIWbOcxaC4uxXuHyj0CX6UJYao3KmcRicGjt3irM9wHqvMVjc4T3ol8NN
	 rK8IkJo+Hm6qk+L8FoHUQyue8CZ6yn/iWFiuJpYoulREypk49UYHf+O89rHlwEq5yg
	 XRM1O0COTqgzcgB2kIwV76mGvhoZzqLZgcb8sZ5G7LnHokIOPXrIiyng+16M8qZlDr
	 kiFJENmxo9Y2jfp9BZB9mbgU9j0XWjyNvpSENR+D9OfPCrw1tHKGAEcE89y/IPahTh
	 Mgigt1E8PCarR6soLXSVo4hGNQh+DKfeUwv6Kszss1GDw6xhYpIOtsqVI4/CzGhpHG
	 mxWZJ9MBSeyVw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 9BD827F94C; Fri, 25 Apr 2025 07:52:52 +0200 (CEST)
Date: Fri, 25 Apr 2025 07:52:52 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	Manuel Traut <manuel.traut@mt.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <aAsjNP_2jo-zDeEk@gaggiata.pivistrello.it>
References: <20250424095916.1389731-1-Wojciech.Dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424095916.1389731-1-Wojciech.Dubowik@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_225302_487336_D5502C39 
X-CRM114-Status: GOOD (  11.33  )
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

On Thu, Apr 24, 2025 at 11:59:14AM +0200, Wojciech Dubowik wrote:
> Define vqmmc regulator-gpio for usdhc2 with vin-supply
> coming from LDO5.
> 
> Without this definition LDO5 will be powered down, disabling
> SD card after bootup. This has been introduced in commit
> f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> 
> Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
> Tested-by: Manuel Traut <manuel.traut@mt.com>
> Reviewed-by: Philippe Schenker <philippe.schenker@impulsing.ch>
> Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")

FYI, you can have multiple fixes tag, and to be safe to not introduce regression
on some stable backport because the 2 patches are not back-ported at the same
time, better to have both the Fixes tags here.

No need to send a v5, the tag should be picked up from this email.

Francesco



