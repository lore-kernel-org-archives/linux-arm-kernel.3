Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11736C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gx9ZYZEfMPvpNfsm7y2FmscG8VU7g8hiMvYXHAUSJ20=; b=vSkqZzA/PFwfsdxcPEo58spIdE
	AeICPWTN47dlqRwKNCthHwhdocbfNm1QoD2aftHUV7gFwjLVejINbuvseIWuzPqcOVbXBgUnqD44k
	FDbPMPJTqdYapRwS+2rzEh84DYvQb7AiVufcuIqY74h9m6bzFRr4wZj8PsdfY9p85nrAtBimv4vvb
	aoaQmj1Sta1Kxugz/j9C9eMFZCk6NFZTnwK89yGYdxAswb4qTQura5JfL9Pa+bzbqXL0wkadtrA6u
	yCl0SKLrFPwlL5cuNVJVpcjnRzPrBjCSj1nmhv/RvgEfmy6TDdsY03JbJRt5JNyMm5qJDd5FJMfct
	ahRCmuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAPv-0000000CPAf-4Byq;
	Thu, 19 Jun 2025 08:14:40 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9vt-0000000CKOG-2qme
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gx9ZYZEfMPvpNfsm7y2FmscG8VU7g8hiMvYXHAUSJ20=;
	b=Il1fwPTxBxtqZ3FQjQNk7TdfLMfBJFI1gsaPam5Fw7dTvDxqCeWquWZvrpcYoO
	CkHpyKXr0o/3nsk3h3ksRjfHnbVKrmhxe22UaPuEEptqQ0Mgel6XsDPF9VBNqA3w
	qRhykdiJzzw/H99mxJw5OIFmnp8yj6BL+z2wAzHjCdvHw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXHzwnv1NoPNT5AA--.63344S3;
	Thu, 19 Jun 2025 15:41:29 +0800 (CST)
Date: Thu, 19 Jun 2025 15:41:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Xiubo Li <Li.Xiubo@freescale.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: vfxxx: Correctly use two tuples for timer
 address
Message-ID: <aFO/J1+Q8mWiffKi@dragon>
References: <20250523071921.43216-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523071921.43216-2-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID: M88vCgDXHzwnv1NoPNT5AA--.63344S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzOzVUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQnoTmhTvylr5gAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_004338_031122_4B0974F1 
X-CRM114-Status: UNSURE (   8.62  )
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

On Fri, May 23, 2025 at 09:19:22AM +0200, Krzysztof Kozlowski wrote:
> Address and size-cells are 1 and the ftm timer node takes two address
> spaces in "reg" property, so this should be in two <> tuples.  Change
> has no functional impact, but original code is confusing/less readable.
> 
> Fixes: 07513e1330a9 ("ARM: dts: vf610: Add Freescale FlexTimer Module timer node.")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!


