Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C8FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rqq3SONqpdrDbku+XNyb2Qh0+pAmCkyeETHl4n92OHg=; b=Jbe/2258cIqQ2Vl173NSPQ6cSP
	9YPmjB+mRCxDNfhJczoVGwrncE9uQs03WtaQA4Gxk8padVXeLmp5tDyEpdD4E/NsMKvQy6O+glMi/
	xbGk3mrjCdOJHd+vSCtE2vV+UrBUC66e1GHe2u7dA1yaFQg1810LeDXMKpTug4oMg6BCfkEYElm2q
	2Vq7mGTnlr9qHFY3Xm6fjZw4eWWUvP76IOjGZ5DKfAVcUAJbthJQ2ULvUCXFai0kqnViF5V42cvBE
	90oxGRu3C5HOG0OMJA7XC8Q0f+vKAkbp4BFClhMFUD0382hJze33zwSHrUXwWhxyqlS1te53ULnXW
	0AcOllkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpB-000000043oM-3yzY;
	Sat, 23 Aug 2025 06:34:02 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO8a-000000023Tt-1G5Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Rqq3SONqpdrDbku+XNyb2Qh0+pAmCkyeETHl4n92OHg=;
	b=UHUUsSR6+9FvDGFtlWrCcTJo4OOkBZOn7ROcNarnzXe3zmvUmGESBf9QCJE5f6
	zFMiMf6WzQGFHwJtePNQaOX/39r8TNeIoMEtdmw+4YozqzDw+xSG7qEY4B5Xr53S
	oO7DcinesoOy33RyUTKemQL3WN5gwDHF31BbDp1F3JtSI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnVdkkOaholXooAw--.13666S3;
	Fri, 22 Aug 2025 17:32:21 +0800 (CST)
Date: Fri, 22 Aug 2025 17:32:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, stefan@agner.ch, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] ARM: dts: vf: Change the pinctrl node name
Message-ID: <aKg5JPSfy8_khe3v@dragon>
References: <20250819193405.2847808-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819193405.2847808-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgAnVdkkOaholXooAw--.13666S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYF4EDUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwabAWioOSahQgAA3X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023244_646398_69760F96 
X-CRM114-Status: UNSURE (   8.48  )
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

On Tue, Aug 19, 2025 at 04:34:05PM -0300, Fabio Estevam wrote:
> fsl,vf610-iomuxc.yaml references pinctrl.yaml, which only allows the node
> to be either 'pinctrl' or 'pinmux'.
> 
> Change the node name to 'pinctrl' to fix the following dt-schema
> warning: 
> 
> iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!


