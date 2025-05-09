Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10D2C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYj+iCZ04f8tZWgdmxGg5BgqxXDWD3VjEstgUEc6ZtI=; b=Rah0OLGBPE9yGma5xMOMnwmEFm
	xELXvHSTj2eq7uBAh5DLK1rHr00beh/hJ0Uy9Q6AXb3xa/x77TZ3XO281zr5o7c+O1uHvqCADFTdA
	Aw67r28r79yrq7RluWm18k7Q7G9lhLNLYpPHcI1CBZhn1qoe8uvyAVRB202JH0KLjIDF3+sgaXOw4
	RipOxoV17bRgh17UP6dHS80ohxkcYNj+kwZEA94uHRC+nArR8gJb8M975fJ1wfBRLNvGILmHO/Fq1
	0ba7H+Sv9qOUXYx3k5QRdJ1oP3W0okUGvw6gkVpsRlQ8BWccG+qlNpWWYAc4VA0zsPBlrrxcn601q
	KMk+yFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLkj-00000003Pam-1vUU;
	Fri, 09 May 2025 11:18:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKn1-00000003F0B-1KSm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RYj+iCZ04f8tZWgdmxGg5BgqxXDWD3VjEstgUEc6ZtI=;
	b=iCgaZXRhN6LlN2ooal29hLGPGeP5qyMLLk5NsgH4hqsTML1ZtktRtqrAzAuUux
	KypUfuWbDrpq2AQIdATW92Ys3snuCOGoisGWXCYhRWRJeoe8BBhMDqdFCE3g8Yva
	s8EeVmN87w5dohA1aAt6px6lO7Ld+z8dP4V6kppcsAGNc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHt_EZ1h1ouMqlAA--.21330S3;
	Fri, 09 May 2025 18:16:58 +0800 (CST)
Date: Fri, 9 May 2025 18:16:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/3] soc: imx8m: Dump higher 64bits UID
Message-ID: <aB3WGZQdin9YcRUk@dragon>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
X-CM-TRANSID: M88vCgDHt_EZ1h1ouMqlAA--.21330S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOOJ5UUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBsdgmgd1hsl2QAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_031711_667693_B2714F5D 
X-CRM114-Status: UNSURE (   5.10  )
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

On Wed, Apr 23, 2025 at 10:37:03PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
>       soc: imx8m: Introduce soc_uid hook
>       soc: imx8m: Dump higher 64bits UID

Applied all, thanks!


