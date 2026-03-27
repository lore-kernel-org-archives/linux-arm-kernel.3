Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C2A10ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQND9qJMQuFwt26UPVkGgVksw+lNR3gkBegAEAsuUXU=; b=fk27OiPE5FzmhuRAFm7A9NylDg
	3hU4qY+M9a6iq3pIgaQi+tJVRzC/nTuJbl3nBL6FMPV7VfOeJtrcJ38G+GjwypjPBQTYHv7VRdnNJ
	1lpNO8EugViJ6wZOmuL2lA7OK6meUH/SlE15lUA6yVh89Aktg3w2lURnu6ejdK179teGCrmqoLL9Z
	RhRkyePLqt5sPmjjLVeiEOsFeW7L82KN/8DGv6ayNtQ6VLPIvm8+OXVBA2Ieh2+bV5FheV1FTBprg
	jjHtiw6Qdssb160FoFAghP6bL2/C+U/UvWnJGyOev42qdAgkSAcNMhcJhQ1+yzMHfAZE4iWpDOtss
	I8gtj6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65kk-00000007Jd8-04La;
	Fri, 27 Mar 2026 11:53:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65kj-00000007Jcw-09OW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 783EC6132F;
	Fri, 27 Mar 2026 11:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C310C19423;
	Fri, 27 Mar 2026 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612404;
	bh=0Rc6QMs+lYNi4jCX1Pmmc73oJrF8z9ofWC+hGzYSaW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJTUcxJhahvhGQtZ0KWLSiVfCsyWChBmsTnYv4iPgEF7NJR3yiwSmtAXHZM3ka0dx
	 uWaa7D3v/FcPCvFCnnMCCCz2ocFlN0VcZsDtDkGye08sr97RInghtUCgW65Yudpg91
	 wedZhzpOqSHiREk1XWMlEefBN13IYDI3v56/9iMHTzSYF5xy60strpZsZZqw9vS+dl
	 F7Cb9DXwHjBtCRKL7pC276LsDBpwZmuWk3AsPlOi3TA2Q+pl+227CRGZTlcMAhrrCy
	 nI80uQlnY4PKEQ46u/dd787GCfHiEDeOF5GGxlLXOSn4CuIPU6RNDySqN7u0DdagHh
	 9xb0d06Ocaspg==
Date: Fri, 27 Mar 2026 12:53:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Rosen Penev <rosenp@gmail.com>, 
	Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, William Zhang <william.zhang@broadcom.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de, khilman@kernel.org, 
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
Message-ID: <20260327-lurking-amazing-pudu-114fe8@quoll>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
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

On Mon, Mar 23, 2026 at 12:02:38PM -0700, Florian Fainelli wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree
> 
> for you to fetch changes up to 220bdfcb4b4788f57faa2c28454d8b2dd3bcab6c:
> 
>   ARM: dts: BCM5301X: EA9200: specify partitions (2026-03-20 16:57:31 -0700)

Four days after:

Days in linux-next:
----------------------------------------
 0 | ++++++++++++++++ (16)

...

Commits with 0 days in linux-next (16 of 19: 84.2%)...

Are you sure your tree is included in the next?

Best regards,
Krzysztof


