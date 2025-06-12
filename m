Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBD5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7bmc/TE0Cpmjx2x5BymBb3H3wO3D26PuXJn/y60y30=; b=lvw0xoNU6ulAajA0/daI7jfKfD
	GtyILfXMBcKSVYmzAKtXRowacHqUjoBe5+cEOATahr68wtx6kTuQq4T74+DVCkidJcXU4VwnscKKc
	N5q2p0mOZw3e5NcYZZQAk2K9CwkqMHzLzuCRBS7Zovk3E9PixdrhwR8xqmrlh1A/pbJdC9CHatZ4y
	Gk9VqZFo9/W3eLXIab8L9UOicxsbKe8NtWPJL0d/D7eGef3vJQDdtKAL4VYGtJ89MsB7opUNcQixl
	uBVLsFrO79HHkXE7gWMCAgbNuvtTwBxR/UYfhBrUMx75ymDkzyUqWQH0u2JL9xTH5U8HOA7032mss
	UKycA8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdkX-0000000Ck8M-3kTE;
	Thu, 12 Jun 2025 08:57:29 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd4m-0000000CZhQ-1Eqa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=P7bmc/TE0Cpmjx2x5BymBb3H3wO3D26PuXJn/y60y30=;
	b=FxmvYO5BUUaj0e1z5HGfnvzp5/hgUVUvFFvanXs5cXQ8s9cElDxNtDWOQFxXFg
	iDXw2D+qYpVfPsHQ0vy4I7V0PnCG70REWrivS8gGtGlzSVv+RUY1cBA/bixbaiC1
	v889CBqgeiviCDkEKQQ+Pnn7qXqnZMf9tlwYMDdH6rUp8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31+1JjEpoEXJ+AA--.15796S3;
	Thu, 12 Jun 2025 16:14:03 +0800 (CST)
Date: Thu, 12 Jun 2025 16:14:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v17 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <aEqMSG8k+NpQ7ROH@dragon>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
X-CM-TRANSID: Ms8vCgD31+1JjEpoEXJ+AA--.15796S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgJqZWhKSSr63AAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_011420_738247_51065AA4 
X-CRM114-Status: UNSURE (   7.71  )
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

Hi Pankaj,

On Sat, Apr 26, 2025 at 12:31:31AM +0530, Pankaj Gupta wrote:
> Testing
> - make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
> - make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
> - make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
> - ./scripts/checkpatch.pl --git <>..HEAD
> - Tested the Image and .dtb, on the i.MX8ULP.

I have an i.MX93 EVK board.  Do you have some guide that I can follow
to test the driver function properly?

Shawn


