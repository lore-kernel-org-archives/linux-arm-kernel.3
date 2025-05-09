Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A514C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ssj99sYpJXTFZJPScPM2oAgzEWZZ5DXMgQ1Kw1tihm8=; b=j2CzqAEBUeEutx00e1W3cWQK7C
	/s1a0qSnhzbV4ZPylKP0gaxsGElfRzqnYoep2h6rDKgT8f6YJlZUNkfUOz4ki5D7ejfOlUdRLvAPn
	s69fRAcFCr/C2F0UOpKsm8ctfgFbDinsaQw/+s/tFaKFtTLzAs5BcScSjlaVmwvQo804xHKv6BlSF
	x6QPR0949FfAWL6LDZwUsbbGTduDn9cY3duGSoR5cuWIDvRYKu+j2Tmv1+Sh+GVAhZW8AUBwfWAzX
	+inzqazDgrNUhsCiVn67uAXmjwQDb5q6pu56PC3DCzEj01MHA+4dlQrPjG21skD66QoWm3/gYau87
	6P+hzmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPW5-000000043yX-35BD;
	Fri, 09 May 2025 15:20:01 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOBI-00000003qn6-0uP5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ssj99sYpJXTFZJPScPM2oAgzEWZZ5DXMgQ1Kw1tihm8=;
	b=K9PxEyfrbz73OF8/PjGXttw51CntkQtp8Pcbv0grEMfrKTo5rb0zlIAijENPoG
	mCc4ACT8lOyuSJ/KCQXwjiVlmoiC9kBFV+SWjAWl1hIQHnnieRK9wM112FY2qrMO
	UvSNxJDdHH4EGV9ZDWtCI1yAqtdstUuUPenLd0O7+k+pc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHj_fyCB5oUfWpAA--.49000S3;
	Fri, 09 May 2025 21:53:56 +0800 (CST)
Date: Fri, 9 May 2025 21:53:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	linus.walleij@linaro.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH v6 0/3] Add i.MX943 basic dts support
Message-ID: <aB4I8gGl+Z0v3JnH@dragon>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421065139.3073232-1-ping.bai@nxp.com>
X-CM-TRANSID: Mc8vCgAHj_fyCB5oUfWpAA--.49000S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFsjjUUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxpIZWgd37VaMgABsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065428_644913_E1C532E4 
X-CRM114-Status: UNSURE (   6.94  )
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

On Mon, Apr 21, 2025 at 02:51:36PM +0800, Jacky Bai wrote:
> Jacky Bai (3):
>   dt-bindings: arm: fsl: add i.MX943 EVK board
>   arm64: dts: freescale: Add basic dtsi for imx943
>   arm64: dts: freescale: Add minimal dts support for imx943 evk

I fixed the trivial things on the second patch, and applied the series,
thanks!

Shawn


