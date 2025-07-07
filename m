Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA195C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlfspyJjbSk5hoUC2w/Rc3ZtDhkI9SmVzdkEY6k5DMg=; b=r5+sljgAEe3Ut7O7ndcfpiHgfj
	RSbQhMyDOrAP1o7tIMudXgYpqTuTqtdluzq+mnsXs1lvUSfOLwnVnCD0CMQb4XI8tr0ZO1F0bd5YP
	mownxCJjh/bg/83TBhXHxlCqcMbaPXCIBwV5/nxi+zNB1PXEG44ZQdn5AT6BXfeSv559Ly/amL8N4
	n7TTes3ZT87TE71OI5DaBB+2u3U6mxDIU3csUyVs7+cD64t5s3Q2CcR7rULrwO2MSbN0EQPG7ALTj
	R+tBaZqyT+Wfwdoq5H9hDmCI+jBd0UpefUci8b/fIeXUiUMLx8PWAiJH4y6O+gb67QTl0eHx3S5Yw
	38Bh2fXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiHe-000000020Jp-3MXU;
	Mon, 07 Jul 2025 09:37:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhhk-00000001ui1-1K2T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NlfspyJjbSk5hoUC2w/Rc3ZtDhkI9SmVzdkEY6k5DMg=;
	b=j+zmUsHVSPFrZdUoR2WWjvIiHwwkKBdwCqCPC+3NmBplpzl+/IgDHia0T1yfBL
	ni5LiRmgaBonuMSXa8K5DIhxTCrLNTaDNop8Uxyy0aEXVt31RqqSoXmlkgpVsW4Y
	aLTSjXURy0k3RWhBb9ruUNAUsVVgYYNr6cYzqy3/No8hQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXluN_jGtoVAF6AA--.63095S3;
	Mon, 07 Jul 2025 16:59:45 +0800 (CST)
Date: Mon, 7 Jul 2025 16:59:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Message-ID: <aGuMf9A0gONkaOmr@dragon>
References: <20250703113810.73023-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703113810.73023-1-aford173@gmail.com>
X-CM-TRANSID: Ms8vCgCXluN_jGtoVAF6AA--.63095S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwYLvDUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQWDZWhrVpnALQAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_020004_747316_44B4B7D2 
X-CRM114-Status: GOOD (  11.52  )
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

On Thu, Jul 03, 2025 at 06:38:09AM -0500, Adam Ford wrote:
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recommended to not use the DMA on the
> console. Because, the driver checks to see if the UART is used for
> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied both, thanks!


