Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE301C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z/rv6kgbqoEOS86d4A1Y0Ox+de8Jp1ZNiq3e/n2Z+0=; b=C4E/yLLhUj37/hPfti6mAV1ofL
	l6xqaGJbzSTVABMXaQLgetfVETxHFmxXw/j8k77G0EyO+HrOzpweLDpsTSC8QWIwzZCoMdbsN3tm8
	t+7U5H0oLV5/vB4pMddVHyTowc1zWQASD/GgUZyRQ9yMfdFRURToBUp/P3aS73fx/Per8QlrdzzrV
	a5+Y71KN1D22OYYjZzq84TsOlYb1/njOqf8A+sqDL3HgXBW7f/1rkyjClZkDAAO3k3QmimzZCuKNz
	CBHtjZFC/VzrBE9IoR7rxLNX1YNzVYL9XJDzMsNjanu9huEn7JyYEGQus/aqRiBLdcnQmvQAKk6Us
	dJAWFoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGFx-00000006s3D-275c;
	Tue, 18 Feb 2025 05:34:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkG8B-00000006qmb-3EQm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5Z/rv6kgbqoEOS86d4A1Y0Ox+de8Jp1ZNiq3e/n2Z+0=;
	b=a7+hdU1DqXwpOZMxiVczG6MxPp7lyP9gTrPGKiYsFe6vyVLv6puTFoIxIja/Sy
	Laq+l91Au5+e6XtMLnv8steg8BnrNC27fF9OShYZvPVakLzXCLzcyWcfpIyN+476
	VX0/hc0rO0snjY/aXe3/kOAFzD0cnMv/LWEmplhkNfWfc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3WloFGrRnlE02CQ--.18058S3;
	Tue, 18 Feb 2025 13:26:31 +0800 (CST)
Date: Tue, 18 Feb 2025 13:26:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 0/5] TQMa8Xx update
Message-ID: <Z7QaBZ4kWTBrVOEo@dragon>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgC3WloFGrRnlE02CQ--.18058S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhj3ZWe0E1YVmgABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_212652_110064_F9C06708 
X-CRM114-Status: UNSURE (   6.21  )
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

On Tue, Jan 07, 2025 at 03:01:05PM +0100, Alexander Stein wrote:
> Alexander Stein (5):
>   arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
>   arm64: dts: tqma8xx: Add vcc-supply for spi-nor
>   arm64: dts: tqma8xx: enable jpeg encode and decode
>   arm64: dts: tqma8xx: Remove GPU TODO
>   arm64: dts: mba8xx: Add PCIe support

Applied all, thanks!


