Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98C0CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJn9fnOUcCS1mQTvgDWkMQL7/Wza3X8Ei2QFf8PWwBE=; b=nKtdvwZVEAekTJhxy12U8wQV9y
	LJd6UT70x8+cRph79EIAVV/8DIMAwqmp/zyUxe27A0pT3XZ/rjA8FTtpwa1w7z0fQiG3wUzCuXXmr
	4skEtLpqEzE6a5whcp9pErzL4LN7xyRVMw0sNzsIJLYiJw96DZ1+HKeWU0PqP1RAAnXTkBPa4o0sI
	FjwGj+6jl+ZJ65rFyBttOb9pa318XPzbpPt3DWJIaOnhJC3FUXAmNdUZf4m7sSNnCYpNjRGlWtgs6
	ihIhffhxXdt1vDuChAb+Uq3xZY8G5/FFPxz8UXUrb78IDOco7aAinahCdd/yYhzXbfmUAcVc+PCuA
	XScquxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp0u-0000000DQHs-3Mxm;
	Mon, 20 Oct 2025 12:29:24 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp0q-0000000DQDi-1p5c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LJn9fnOUcCS1mQTvgDWkMQL7/Wza3X8Ei2QFf8PWwBE=;
	b=JKAqWX5XH3ilwfNgT/VBxvt0be3Q3kSdPjrNHVAs0shs2gQMEKcmP5j+ymvCCK
	jLmLvzIRBZeu1WmyE/yFMugqDZboC5RCHWFt9twb3C9CvX7bHVDKnAT9Dt9h71Xq
	I8Y8NuNVJvY9jiBzaYGuMDAptqE/SxI1zZBuqv40lhMq0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHtQQNK_ZoIc1TAA--.8980S3;
	Mon, 20 Oct 2025 20:29:03 +0800 (CST)
Date: Mon, 20 Oct 2025 20:29:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl: Add MicIn routing
Message-ID: <aPYrDW1lrlWFKw8X@dragon>
References: <20250916055119.135637-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916055119.135637-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgCHtQQNK_ZoIc1TAA--.8980S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4knYUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg+lC2j2Kw8e1AAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052920_811559_00CA654D 
X-CRM114-Status: UNSURE (   7.27  )
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

On Tue, Sep 16, 2025 at 07:51:18AM +0200, Alexander Stein wrote:
> MicIn is connected to IN3_L. Add routing including the Mic Bias.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


