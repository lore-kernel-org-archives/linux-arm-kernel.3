Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24ACCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8fZSVL95erMaMyHPCedn250s/J96Co6GTJBPpiNgNA=; b=O0gwJjpw86FsM6yCAaUG+iysOX
	gSLt+1KldnKOgkjFSp+xN6NbBkCX/zxEDsAdDLrE9aFoLiweqycpgkmrisn0ClcaKqnpiTSMCJRT/
	uV+mXTQjBgtU/GX8lMkHG3rb4ifkjWkZ/hmqCI17EPyjFfgOJp5NKb4GAmWlSVtOUjBATvdKSWWsB
	cfBgpr3PwHPxtJxgko2G/Bdg6stWhQ8pKbu6KQvrDYXGje3G6k0TVh0A88Eslv7YPxMlqVqJS7X+u
	gPaJAZ8igZQSKCOJF2UpERDo+SxByORn+IDWQdWJXHCGSmQ/AvfMYyd+M6rXnEneXkQNl6WuevExS
	afeTKzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVoz-000000004bc-0Phw;
	Thu, 11 Sep 2025 01:09:57 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVow-000000004ap-0An1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=p8fZSVL95erMaMyHPCedn250s/J96Co6GTJBPpiNgNA=;
	b=jCAOO/RprN1yTPtfvT+mOmogybY+U+bASpvpUWB9ahkfir0D7ld6jJFgp3H4TO
	It9wIhIjBhRyJ8JyVrW1Qs8H01gZoFBw1EnTylHJy/7IYHnvgtrZsqOA+vi7R5Vn
	QP5O/CqHP8r6VrqV9kFURG+l4ctRXgrxXTY8hV/Rg2S04=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXv_hTIcJooAxfBA--.43095S3;
	Thu, 11 Sep 2025 09:09:40 +0800 (CST)
Date: Thu, 11 Sep 2025 09:09:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53
Message-ID: <aMIhUhBgpIo6cPW7@dragon>
References: <20250822120241.26419-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822120241.26419-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgDXv_hTIcJooAxfBA--.43095S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjBT5UUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAfFZWjCB7k19wABs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_180954_398396_A0EB69CF 
X-CRM114-Status: UNSURE (   7.56  )
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

On Fri, Aug 22, 2025 at 09:02:41AM -0300, Fabio Estevam wrote:
> imx53.dtsi has the following compatible entry:
> 
> compatible = "fsl,imx53-iomuxc-gpr", "syscon";
> 
> Document the "fsl,imx53-iomuxc-gpr" entry to fix the following
> dt-schema warning:
> 
> failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!


