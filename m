Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D67EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f//MRChZFcP5XIL4mb8oxZ7K1cGhRbiRX/pH6Xavkpc=; b=aZ8CsRP5tAXvkCLOA9JqflUIr1
	XKzKdMcA1opOOa0zlkm5Oq0jBLqLEEWupSaY745R/qokpsmbt9cpcKg9uQQzQx1wKIAPrBLyMEsyQ
	Sgn4ypOCMBPXFjUAoFQ30IHGs2V+fjEju+0Pha9Nx75c4xCG10lGWGg8caVAERVz5lW1sj7/HnRXX
	TbDmEx+7Pd7Zm8b0NcWf0RVUYBYcr/k342EFG1UQ7j4jP+0iKNZV4Od47gPao8EWEF4Jt+2sHqod+
	9jAjkaNFhH089Rw94pMIvUuVE1ccV1XZjKBTOEDtvPUPB26wTvlSY/2dBLDY+jhIP1pO5qiUB9YXU
	PQhtHvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Zk-0000000EERP-0xo8;
	Fri, 11 Jul 2025 08:57:48 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8lx-0000000E4z7-3qt7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=f//MRChZFcP5XIL4mb8oxZ7K1cGhRbiRX/pH6Xavkpc=;
	b=YGRijOPNm8XEsZj90dG3t/VTs87/yllFVhcTeBganDd6/72iDbj50NEATPTt4C
	55PejR7yfL8NSSoImyX892vzk5o/qklxbAMXyYs44qRQdsnZ5haQWhjfgOxPY2qV
	hpRunqyPjjIxC6hT2C5o8xPIKpCUVHM0/l5uvtPyNdFgQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXv_jZxXBoUV9TAA--.19772S3;
	Fri, 11 Jul 2025 16:05:47 +0800 (CST)
Date: Fri, 11 Jul 2025 16:05:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Annette Kobou <annette.kobou@kontron.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for
 RS485 interface
Message-ID: <aHDF2VPGraI5ceXZ@dragon>
References: <20250708122442.53829-1-frieder@fris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708122442.53829-1-frieder@fris.de>
X-CM-TRANSID: Ms8vCgDXv_jZxXBoUV9TAA--.19772S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0g4SUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwGHZWhwilDNbwAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_010622_266650_48BB3F72 
X-CRM114-Status: UNSURE (   7.87  )
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

On Tue, Jul 08, 2025 at 02:24:41PM +0200, Frieder Schrempf wrote:
> From: Annette Kobou <annette.kobou@kontron.de>
> 
> The polarity of the DE signal of the transceiver is active-high for
> sending. Therefore rs485-rts-active-low is wrong and needs to be
> removed to make RS485 transmissions work.
> 
> Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Fixes: 1ea4b76cdfde ("ARM: dts: imx6ul-kontron-n6310: Add Kontron i.MX6UL N6310 SoM and boards")

Applied, thanks!


