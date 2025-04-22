Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B753C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYJPrUWUZYghHqO5DdKs7mZT6xUZJXtvop8ZZkPf7T8=; b=pssZ734ax5IUDcIhoGFFk/ZaP1
	N81GENJbJ7FrhWNgm9o5M3Yrv7DlxCBH6peEj8ytjoc1RbsXO6/3sqnN66QtCqHK9p9xdGNzOZAGK
	vgKWm9MyuVasvNtqQ4GqrVjAQ429j9T9Rh3BG9eaFElPhH4OAI6yL2XseXa7GwH30MYArTwsDY/yh
	vW5nJLJ0B4caC8QOh4Nwat/aeSIe2UkrF5GZ64CuUD25t8iZWA7PcTsDSsCYGDrvdEybY9S1075Ut
	UV5KkxSyODaQEUgD6ahJyGTZKStf7y4YU+qYYZyjbSKCGcpF/vbZL0ZKS0wSShBxXB5pV8Bz2C5Dz
	sNbYHNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73pG-00000005hH4-2pqE;
	Tue, 22 Apr 2025 02:57:34 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73gF-00000005gR6-0yDz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=iYJPrUWUZYghHqO5DdKs7mZT6xUZJXtvop8ZZkPf7T8=;
	b=TkTpbH+K5yOkEdzap3zS5GUTC/2ZYBl/NYQEJ6K4dMYepqC1ud8Erl9OXNw+DR
	anO2rS0YhEHhi6RkRHuDPJym1TES3HguTXpnX0Rk68Hua/N9tFvIKAgIWaDHWXCq
	dMLzlbL9o03513N8Ua+jJ3mWAVVi7c7yWhK9i/yFGx/no=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3Z0tYAwdoG4yjAw--.32361S3;
	Tue, 22 Apr 2025 10:47:54 +0800 (CST)
Date: Tue, 22 Apr 2025 10:47:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nxp: Align NAND controller node name with
 bindings
Message-ID: <aAcDWI/ehg2v8kgd@dragon>
References: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID: M88vCgC3Z0tYAwdoG4yjAw--.32361S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa0tCUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB83ZWgG2pu5jgAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_194815_577335_6F53C50B 
X-CRM114-Status: UNSURE (   6.78  )
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

On Mon, Mar 17, 2025 at 12:18:53PM +0100, Krzysztof Kozlowski wrote:
> Bindings expect NAND controller device nodes to be named
> "nand-controller".
> 
> Cc: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!


