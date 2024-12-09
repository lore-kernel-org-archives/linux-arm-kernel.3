Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4EFE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnPHthB8LMV885tm2rzcxoiQ16KBEntsl0UFvMdQ5Uc=; b=RXrl4bNIKGZEWInGtW8ogfdvZ3
	HwHuqZzmC6905vh+pGiDyl9/uQrq2fTHdMhBg78B0jZC12z7aXJ/5pi5P018+2jqSmpBqVsiAGqUm
	U2iLI75SjXeLHIEElehn8KtHrage1tcCBuCt1Evy/cqQCL2ofI1WAb5pzfxVTaDGLAP5gXyaR7x8o
	UDFdsGkxDVbqapvZcMTTngWGWLnZ6zfdWJDSnXtFl99uaTvtZQMX64mD2RIZ69u9hJGhGzXRAs+zm
	ibTM3PoaLaRYdbx7zNnPKqCWr9uBW08jC/Wo6PXN/rSdaBZncme4bVkevgTQ5Ig5zlITQmBZYBS58
	XXbR65Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZHX-00000006xMp-0lmN;
	Mon, 09 Dec 2024 08:38:19 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZGT-00000006xDN-0c53
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YnPHthB8LMV885tm2rzcxoiQ16KBEntsl0UFvMdQ5Uc=;
	b=OlebIETzWJZPMwMwiY14oww5JJuepQGVeAXTeZimR0bjfe/+F1B8hp9/9/rTyx
	bz5boksMDTAqM7oVRfo6Q73ckNGHckIUSxiDXeuatyOUBgrhQJCUBq7irb3tvgPd
	xbHl/ZrVlRlW97C+ZSz541pTExVPaTvo2BYTQDeGTh5f4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3boEqrFZnOi+NBA--.47304S3;
	Mon, 09 Dec 2024 16:36:59 +0800 (CST)
Date: Mon, 9 Dec 2024 16:36:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: add aristainetos3 board
 support
Message-ID: <Z1asKaRAJKTBv8ui@dragon>
References: <20241105064206.43626-1-hs@denx.de>
 <20241105064206.43626-4-hs@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105064206.43626-4-hs@denx.de>
X-CM-TRANSID: Ms8vCgD3boEqrFZnOi+NBA--.47304S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRywZWdWeNriYAAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_003713_545117_D9614020 
X-CRM114-Status: UNSURE (   9.00  )
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

On Tue, Nov 05, 2024 at 07:42:06AM +0100, Heiko Schocher wrote:
> Add support for the i.MX8MP based aristainetos3 boards from ABB.
> 
> The board uses a ABB specific SoM from ADLink, based on NXP
> i.MX8MP SoC. The SoM is used on 3 different carrier boards,
> with small differences.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>

Applied, thanks!


