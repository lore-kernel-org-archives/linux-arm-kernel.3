Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD74E67497
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 03:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjL0raJiVUlycOYhCY61dJCO2t6SV6L7FxvmwMjQWlU=; b=IF6SoapaUNsWMBbAIvtH0XyVQH
	stPo23KIz0PhvDG0hVtPUPTXj8VOuU2j7LuJ8sAQi43fz/P/d0VWrCNqT4RDvbelnjZSzUSYIS1HZ
	qxCvQI2Vycq5czFGtNG+lPWFWvOjirTYsfrNNcs+49QnU0VstSGsMpbeB6dVfGbgnopibXQog2r6A
	FTMRqmGjeU7KvTxf+2ouWjux2ktlTyN0jrDhuVSPe/LSUIQ9JTpt/MELHo9c0T+P/nZSrjEurvt4p
	xHFWpH4VqGradMqtBWGWJi/sEI+t+TNQO1R0WVdCz4VgBUXLwJrhfH3vJvaidaDBQtHlmzFHEdOST
	h1tGlg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74jS-00000008wdF-0bAt;
	Sat, 02 Nov 2024 03:23:22 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74hl-00000008wYg-3gXn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 03:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=JjL0raJiVUlycOYhCY61dJCO2t6SV6L7FxvmwMjQWlU=;
	b=YvqeqwxUiIF8HgDfuN/yIassynajvdq7Mh3cKvrq7U7SJCGFJM+oy4IoWDE+t7
	Ay37B2QzF6wl9G7Uf0z6ZYaebsm8n44x/rOiR0olwmquDJEl+I2DSYe11imhGbkx
	opZytiRLbRBb8C/pSDWHFvSsOsRvVk7mClivoTyMWp4Nk=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXz0qvmiVncM5yAQ--.14512S3;
	Sat, 02 Nov 2024 11:21:21 +0800 (CST)
Date: Sat, 2 Nov 2024 11:21:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7
 irq number
Message-ID: <ZyWar1bUUufm1fOC@dragon>
References: <20241025004159.1571782-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025004159.1571782-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgCXz0qvmiVncM5yAQ--.14512S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx0eHDUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERWLZWcliaEkcgAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_202138_305671_C7F27CB7 
X-CRM114-Status: UNSURE (   7.93  )
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

On Thu, Oct 24, 2024 at 09:41:58PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Unlike the other i.MX devices, i.MX7 has only two anatop interrupts.
> 
> Add logic that contemplates such case to fix the following
> dt-schema warning:
> 
> anatop@30360000: interrupts: [[0, 49, 4], [0, 51, 4]] is too short
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied both, thanks!


