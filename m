Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868A9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsNsiG3pc8pWG7MUbtRJFCqC5DA+Sce6zLpMwj1ZxEQ=; b=KW7PuiZGNAZoeVGr6jVQYzMFil
	dXJy62XWf2r4FAxz9egmCrqqxNBlsg/Hk/gkLcwY/XoyGRTyJW/LGruYItELwQJULse1qd9Zipaiy
	3mvZmBdOx1jZwcSDoeg9Nn/wAKOHn8UpuiM2f2elM1LlDb37tk+Hh/VlyRz4MrdaSqHIfcRnU00WO
	5ubu0oidpbb1nOWMLwnEjzfwL1NsRQP31m9DPxgnrFW4d8/gYPrrNLVmKGffKvukl9XwdjCv1fD53
	15UaxQkRKzzTKSRcRjCxT/BbsArAZt1Pm9/US2wJaDKhwJXMqalfIA61Pt1lkP2G6lHwpoSLENlm9
	pDzlnCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVnl-000000004OU-2wB4;
	Thu, 11 Sep 2025 01:08:41 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVni-000000004Ln-2N82;
	Thu, 11 Sep 2025 01:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=CsNsiG3pc8pWG7MUbtRJFCqC5DA+Sce6zLpMwj1ZxEQ=;
	b=hehXzZHcto3G4TRvJ+zg/nlos1kK4ej4LIxxm7qsKs1H3wmwWPA2uD8ONtASQ1
	ZLIdo6sKL8mhnm0Rf0zMN+dd0euvQYtKTVrYttKUFtbh6Q+sXS3OeUn5PMnsumbt
	mpDcZDF4Tkqq5GuWpFKB7foki46XqiU/pXFOrAvMOs9Hc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyT9IMJo2QdfBA--.19610S3;
	Thu, 11 Sep 2025 09:08:15 +0800 (CST)
Date: Thu, 11 Sep 2025 09:08:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx8mp-moduline-display-106:
 Use phys to replace xceiver-supply
Message-ID: <aMIg_PPSZehzEyJD@dragon>
References: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
 <20250822-can_phy3-v1-2-73b3ba1690ee@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-can_phy3-v1-2-73b3ba1690ee@gocontroll.com>
X-CM-TRANSID: Ms8vCgDnjyT9IMJo2QdfBA--.19610S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5l1vUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAfFZWjCB7k19wAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_180838_956276_D315CD06 
X-CRM114-Status: UNSURE (   6.81  )
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

On Fri, Aug 22, 2025 at 11:20:06AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Fix the can tranceivers to actually use the new phy description instead
> of the regulator tweak.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!


