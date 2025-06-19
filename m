Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C51C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lP+gDKbQezxIlLFIgSMniGFSlc9jyFMOUqLPioyqDrc=; b=wAhaNT7H8190TLda9XJhzrWBhO
	0737kII4BnQWpbGYD9fmfPITsf4T95kYF/ye/5Su3htGVhfVtxXdaecqGmMhjG4EeAgf/F3nRzYO4
	ccHC53SwSf0ogDHeesUb6frqScf5/nCuaHaVP6eFyaUJhaaaH/8W6dveJ8fYaXpfgpYcEZska2nin
	HyqxLTBdrr/Z9SwEPjA3MYtLcLr2x0wN2pdxSazK+96HcEG1GMp202WNxLwmGzHwB+M202ucbh0gk
	PN0xMiCqmqQoxgUtmDajHcLVWInOkbRDyFWa32GdixUDS8zKHUDh30bIfEbq5VM5Q8GGNBu8kIb2Y
	TX031FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAWT-0000000CQ92-0PCV;
	Thu, 19 Jun 2025 08:21:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9xV-0000000CKnE-3cly
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=lP+gDKbQezxIlLFIgSMniGFSlc9jyFMOUqLPioyqDrc=;
	b=Eqdgg8Q817fHZeYYBrEIlLTPQeVYz4/zCZenXNr4OoOP8qvZs3jFdXqIuV5NAs
	K86cQh/nHFIggB1eF68Do1jGdeNFFKU4X1L+KWVkN3PhBxmt9r+ACDStxy+YDL/Q
	quqNDvrtzgXw6Di/Lr9Qg/UUvdR6LylxufJUuqJaV5HGk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3R+v0v1No6CEAAQ--.2185S3;
	Thu, 19 Jun 2025 15:44:53 +0800 (CST)
Date: Thu, 19 Jun 2025 15:44:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] ARM: dts: vf: remove reg property for arm pmu
Message-ID: <aFO/84lEFST8s1PZ@dragon>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523161726.548682-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgD3R+v0v1No6CEAAQ--.2185S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzOzVUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARZxZWhTmlaLjgAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_004518_251750_D4F79CF6 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, May 23, 2025 at 12:17:20PM -0400, Frank Li wrote:
> Remove reg property for arm pmu to align binding doc and move it under root
> node to fix below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!


