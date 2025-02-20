Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9328FC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZakjKfpdd5q/kOY1YxjEFOCLh8Mn5U9WJBrLFqWMoU=; b=qFQvL/fguc2aTqCtdkLLn+mQl2
	vIFky/U18jNshGziE+tZXPbhuMeKeJ5YzHilHYplWy+6ySLBtRn4EQYIAFX+tMiijDqcQ0txcbx11
	m4X+ZyLtkdk/Q4VjVNkXPABuFlWC20ptjXb7Kf8zNJ8p5cE7s6l5guWNRcH+OuMwvbhPbLtAMWGi7
	zqCpebtEWpv5U/R4MMqbMw54xvVibyT/Dc8AN05YgbwZd2rbfihhrRHCzvq8qGBJNHtL0WWmpKY+6
	HgYeTeRrwulH6oukQywB3QT8azQDNWtcrqJ6lTAbkNppexWdKZ7b/3b4g4vSnBnAOg71FB6k53DDi
	WVIH0XFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0zf-0000000HA8m-3LwO;
	Thu, 20 Feb 2025 07:29:11 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0uA-0000000H8el-0QwN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eZakjKfpdd5q/kOY1YxjEFOCLh8Mn5U9WJBrLFqWMoU=;
	b=HtZulXJvCYpp6bfr1Cb1q57qdDU/Er9FqWwOrtMwATooCFvidhbTNuZJX9gL7O
	KXUV9PwUIrDoEOLYsQ2V/h7z2ntDNgBQewP+JB0TK50V2pS6Tpd/MMY5yLPrYLyt
	evbjfJGlwDs5IBZkFZwkhijtRW95OeRGmq+2tn7D9JGk4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHrBFK2LZnqKBgCQ--.19831S3;
	Thu, 20 Feb 2025 15:22:52 +0800 (CST)
Date: Thu, 20 Feb 2025 15:22:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nxp: vf: Align GPIO hog name with bindings
Message-ID: <Z7bYShssqtqLusX0@dragon>
References: <20250115211659.194072-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115211659.194072-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID: Mc8vCgDHrBFK2LZnqKBgCQ--.19831S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVcTmUUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgr5ZWe202UXKgAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_232330_449924_FB50E814 
X-CRM114-Status: UNSURE (   7.83  )
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

On Wed, Jan 15, 2025 at 10:16:58PM +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
> 
>   vf610-zii-dev-rev-c.dtb: eth0_intrp: $nodename:0: 'eth0_intrp' does not match '^.+-hog(-[0-9]+)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!


