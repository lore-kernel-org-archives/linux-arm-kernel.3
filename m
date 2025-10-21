Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049ACCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMJOUQmpNHk/jiX02paVM4JctocpFGCuLJbmYhANAlA=; b=Xv8A5DrznO65uWsMnMcMZPwEyx
	muG8RlXwVAcYvB6dvrtqZYOa5tmr5N+SYZvCbIizw4b2gLGYT4lCDgztFAxlsIxW9agcgudIqqV2o
	Dnz7i6sL8Ct2UTklVii4NeuE03s9uuqnVfF4fNO3F+Fig+mg+AN+1T6qQAURtBsx7uFUY27SjR4ci
	oSk9u4JkFYxvuSeq3ofSJOVwQyXBxOfyTWtrSrkwSDckv/dYae8cMV/sYaOxacwXO7bx+eUo2PPTm
	x3ERZ4hXhfKcS/dqLA8Z19pOLRms0gj2IgICREkL6aFsc4tddbbCBNlW2o9PbNxnGf7LXFTwZ8sGw
	8If3zwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7lB-0000000GHET-3IUX;
	Tue, 21 Oct 2025 08:30:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7l9-0000000GHCX-0Ade
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VMJOUQmpNHk/jiX02paVM4JctocpFGCuLJbmYhANAlA=;
	b=ZU0zSUKV0Bxoz5ZKaWBVciTCln9AUjCMWCGCZhyoGFTdnCgSvWgPuuzucazuDN
	AMYBLLs1KTnQ3mQ76BK6zvaYhPwmvYfpk5d7z+5HkaKgc8L+X9KrkG9aQQQZyeX/
	xQE3Dlx5n+IH9bxKdeNdjc1IFDonYHFcmM/auw6+RHr/8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3H1mIRPdoDG1gAA--.33981S3;
	Tue, 21 Oct 2025 16:30:02 +0800 (CST)
Date: Tue, 21 Oct 2025 16:30:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] various imx8m*-venice dt fixes
Message-ID: <aPdEiMbL2xCeMhP6@dragon>
References: <20250918154451.2531802-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918154451.2531802-1-tharvey@gateworks.com>
X-CM-TRANSID: Ms8vCgD3H1mIRPdoDG1gAA--.33981S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15JFWrJw45Zr48Jr1xAFb_yoW3CFXE9r
	12qFnY9w1UKw4ftw1rtwn0qryqkr1Uur1DWF1xWw4Dtr1fAa4rAr1vv34fXr1qvanxuFs8
	Gr1rX3yrXFW5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1D3kJUUUUU==
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRftZWj26mT7FQAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_013023_399665_476EF2B0 
X-CRM114-Status: UNSURE (   8.05  )
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

On Thu, Sep 18, 2025 at 08:44:44AM -0700, Tim Harvey wrote:
> This series contains various imx8m*-venice board dt fixes.
> 
> v2:
>  - add additional info to commit explaining changing TXC slew rate for
>    improved signal quality and emiisions (Peng)
>  - add tags
> 
> Tim Harvey (7):
>   arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate
>     usdhc1 props
>   arm64: dts: imx8m{m,n,p}-venice: disable unused clk output for TI PHY
>   arm64: dts: imx8mp-venice-gw702x: reduce RGMII CLK drive strength
>   arm64: dts: imx8mm-venice-gw700x: reduce RGMII CLK drive strength
>   arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
>   arm64: dts: imx8mp-venice-gw702x: remove off-board uart
>   arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1

Applied all, thanks!


