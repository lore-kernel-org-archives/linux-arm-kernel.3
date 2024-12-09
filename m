Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC9DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChAIwGV7ZFkveVH5BCfEgrQPKa+agmYwut0/xNKhFek=; b=WZP+yCJ7OOZrOW/gapmCEo1oHr
	EDPTMTO5Wo8/0fsdOEWgtJzk493RgeoGFykWCGFTxci6YJwz1PwXjceEdCk9aaT6ugfSwXdMB1ci6
	dAJimUnUdRhb4XR0maVGjc+krgJir4sgrV14izqFRLr+XMaP5a3HYVGXm5Xk496Cyt+R1CPtn62wu
	UwGOXtPfo89RoLVL25jaap1udznYiutcb8ZfZZbO8MMUlga6ZDvk0oO7CecdfJ9BqZHxjWKx2pjtV
	UscKWwAlcXoAXNs9wLLwdgvf++oGFhK+IRSxDlLP3uqrvasWRpREuzJDRVV6b6NpEP12c82cUn/rX
	Dwhvf9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaTh-00000007AuT-0dKB;
	Mon, 09 Dec 2024 09:54:57 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPQ-000000079Ak-0Hwf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ChAIwGV7ZFkveVH5BCfEgrQPKa+agmYwut0/xNKhFek=;
	b=kXQPbSzn+GbtajNR9BYQgkCkT46oSgqEAk3vHk2xh08y8sMDwLyTPHvGVH86JT
	90W2P/YNcISXT49tA0P8H+N7ydzUSjU1PgY33KB8wfr8u29gSsqSif+/UCaq5IZs
	88dVcX/NQ014JwgTSZPM5oBizvpZiAg4d06b2H8j84V0s=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3NtRBvVZnJDOOBA--.47668S3;
	Mon, 09 Dec 2024 17:49:55 +0800 (CST)
Date: Mon, 9 Dec 2024 17:49:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] MAINTAINERS: Update entry for DH electronics DHSOM SoMs
 and boards
Message-ID: <Z1a9QGfVsSzc81ZL@dragon>
References: <20241111113524.10727-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111113524.10727-1-marex@denx.de>
X-CM-TRANSID: Ms8vCgB3NtRBvVZnJDOOBA--.47668S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaznQUUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRWwZWdWsiw1LwAAs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015032_422570_C1694BE8 
X-CRM114-Status: UNSURE (   8.55  )
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

On Mon, Nov 11, 2024 at 12:34:21PM +0100, Marek Vasut wrote:
> Update the MAINTAINERS entry to cover all DH electronics DHSOM
> SoMs and boards. The DHSOM is the name which covers all modules,
> DHCOM is the SODIMM seated SoM, DHCOR is the solder on module.
> Use glob pattern to match on every DT file which contains either
> of those three module substrings in lowercase.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!


