Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEE6C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 03:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrU1Qp/eZd7ALHelvjCOtCIA18zLzIZINJNIAtGn/KQ=; b=K1Gf5jGcjmi6vdrnkXsMgcVT+i
	PGXsNPqsHyvQawQ4kMXq3mekOEdZTcMrr7b2rpT4pjVbMjYErgcU0ceRAS/w+4hr3SJghzVlJgm6X
	R0JNuX1Fpnm20Nzv388JcN25pafXD7mCT+eYohxbhaqEzIdjrxaYzkctGX0TZKIta1TknZ3t5jpnJ
	MO5QXk/6kDIXa09Gq0nB1lgTpaVBMepUOx7ASxELe1kfLAavB5ePHSN6fzqhqVnAuq6Zw3Aaq8VCv
	L2OT55Qr8ldymPUvwz0AOQ0znGPc5KQEhw73/053B4SggobrFjWe2Va9RdaGt1IeQwjOzB5S2cuDc
	nAU7k2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6GA-0000000Bw3j-205P;
	Thu, 19 Jun 2025 03:48:18 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS68n-0000000BvCw-2PAX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 03:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QrU1Qp/eZd7ALHelvjCOtCIA18zLzIZINJNIAtGn/KQ=;
	b=qZYWEZg6XxqmoHJM63m7/I/H/0S+PJmR900cv7AEWqOh2POm/c41bgYYtAF2Tj
	0JfNxbkfsUkgk0+ocZDzn4/sUXD5yT53HNek3YD6rQeHkJmx+1cVrltPVrHLNQg+
	rvwMxtA0xNMCElpMViQYrUmC9no1pzDq1iiWeFnVn7RXQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3d86ThlNoRUT8AA--.41655S3;
	Thu, 19 Jun 2025 11:40:05 +0800 (CST)
Date: Thu, 19 Jun 2025 11:40:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay
 to include display name
Message-ID: <aFOGk8V6PkuEg8Xl@dragon>
References: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
 <2788842.mvXUDI8C0e@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2788842.mvXUDI8C0e@steina-w>
X-CM-TRANSID: Ms8vCgB3d86ThlNoRUT8AA--.41655S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwmiiUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRW1G2hThpWGgwAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_204042_031443_228B813B 
X-CRM114-Status: UNSURE (   7.28  )
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

On Mon, Jun 16, 2025 at 03:01:06PM +0200, Alexander Stein wrote:
...
> any other feedback on this patch?

It doesn't apply for me.  Could you rebase?

Applying: arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name
error: sha1 information is lacking or useless (arch/arm64/boot/dts/freescale/Makefile).
error: could not build fake ancestor
Patch failed at 0001 arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name

Shawn


