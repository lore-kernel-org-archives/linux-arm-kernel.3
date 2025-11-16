Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA78CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 09:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cY+G5UJjnLAD9/H2WXsd8B/NgDerlBepu3HbT7K5Ak=; b=gDfS9BBIJoxcprsGxMDlk9Bmi6
	wE71RcYsBtX/2za42H352UpzFvvokWsBz0sGvY9sXIAq4axiouC0xIYc+Km1q7UCGduN64DuFfY6G
	EshsLeSZ8IRktjtI8YU8RkUfLx8UI+4x+F08MJn3GhdViCYb0tjtKopiFJVG50oOvCS/cxr7foB7T
	yxKgfyMdhU+KEoN52iTgmqL+vnlVtlWKBXQJF/4ZyVOkSKbGVOJsfEzIUlqBi6WxZssrVBff5a7iF
	ZpKhtF5KjP771uxrehvWscQfXmOzE+kEqR+NkPa1xxPcEEEny02/5gPIfBFkktJmHwKGpVnVX2EEP
	2iWDpp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZMt-0000000EWWF-0z9S;
	Sun, 16 Nov 2025 09:48:23 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZMq-0000000EWVr-0L3A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 09:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0cY+G5UJjnLAD9/H2WXsd8B/NgDerlBepu3HbT7K5Ak=;
	b=N9/Q6SI7lq1zQ8sgGDzn0Xo/e9jlUnGFwI0ZkiFPshrDabfuEya3AaCiZzruK4
	hH5dUCpeCgSUUpUCG05+Nsgc+9DwTDm96Q/R/npjwfFLeQSz5mWHdxCwegKBwMD4
	RpeJ1p0q8ktGlggLd/toyq1WqJGMoqluLG8Zjh6IbowuM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnzQbXnRlpa9c5AQ--.7981S3;
	Sun, 16 Nov 2025 17:48:09 +0800 (CST)
Date: Sun, 16 Nov 2025 17:48:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH 0/8] arm64: dts: imx8qm: collect some missed qm patches
Message-ID: <aRmd1_B5nnUr9Bu0@dragon>
References: <20251028-b4_qm_dts-v1-0-51ba94389c1f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-b4_qm_dts-v1-0-51ba94389c1f@nxp.com>
X-CM-TRANSID: Mc8vCgAnzQbXnRlpa9c5AQ--.7981S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5tw1DWr15Xw4xJw18tw13urg_yoWxXwb_u3
	9YkF1kCw43Gw4fA345A3ZF9rWjgry5Cr9Ig3s8Xw17Jw4xZF1ayFy0va4rWrykWF1fZFsr
	A3WUXw12gr45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1a9aDUUUUU==
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBk+o2kZndlRiAAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_014820_425487_C2359888 
X-CRM114-Status: UNSURE (   5.41  )
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

On Tue, Oct 28, 2025 at 04:30:41PM -0400, Frank Li wrote:
> Frank Li (7):
>       arm64: dts: imx8qm-mek: add state_100mhz and state_200mhz for usdhc
>       arm64: dts: imx8qm-mek: assign double SD bus frequency for usdhc1
>       arm64: dts: imx8qm-mek: add lpuart1 and bluetooth node
>       arm64: dts: imx8qm: add label thermal_zones
>       arm64: dts: imx8qm-mek: add pmic thermal-zones
>       arm64: dts: imx8qm-mek: add usbotg1 and related nodes
>       arm64: dts: imx8qm-mek: replace space with tab

Applied these.

> 
> Richard Zhu (1):
>       arm64: dts: imx8qm-mek: add supports-clkreq property to PCIe M.2 port

This had been applied as part of another series.

Shawn


