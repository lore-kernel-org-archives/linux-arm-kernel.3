Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E5DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg1lOsicIGwMurHHg1lsBFSLBs1lOtH7DCGaQFmSoc4=; b=pBODSmQ7HLTL3LGgcRES63mfSX
	Ve2yQEW0ZI7+EWddFYty70gxzzW6+5TRUebAA0fSk/x3CaaDxc6lMFJlb+tq3BDOI+tpTch0/NqRB
	GpteKMIZJrs4jihUQv4v/qxBg4aJB/1hMUXYcrkEtPRRawJW15qrsrU8CMcQFtLhmcdG4eIlg9j85
	Vps09AyglNNmsdNCrWNChid43ds3CqMlGCQ2f/DHc97k6lDi456QNjDywgN2wpWiq7rbWh5rf1uCv
	TbCuZhfEItLuyrnaO2EpxmnbdZrF74QBXssSlE9jBXTNJio71VfKTcv2wMXLLAhzmW7LubpCb1hlo
	VHNffcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQiV-00000004JND-2YXS;
	Fri, 09 May 2025 16:36:55 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOXE-00000003v51-16Km
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Kg1lOsicIGwMurHHg1lsBFSLBs1lOtH7DCGaQFmSoc4=;
	b=SSkA9rzGzQPYLCmZq3aIZxQoDYOHXIIkCeFrJsIqAmFW1LByq3EGP4MrFBeYD/
	xNj44kpFFaqkqBEvtsiUciWqUrgnVuTLwb+qqUUAkNWpUY9S6/X3SbQCVdyf49eJ
	FOXSMjluCBPH6r+Ma45DCZmyLC4QNvMX16DqwHTgH/4iU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnB_pEDh5oyTOqAA--.49231S3;
	Fri, 09 May 2025 22:16:38 +0800 (CST)
Date: Fri, 9 May 2025 22:16:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add TQMa8XxS boards
Message-ID: <aB4OQ+sVXz1Qima0@dragon>
References: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgCnB_pEDh5oyTOqAA--.49231S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYD73DUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBFIZWgd-c1QIAAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_071708_666744_9082AECB 
X-CRM114-Status: UNSURE (   7.51  )
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

On Thu, Apr 24, 2025 at 09:55:29AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@tq-group.com>
> 
> TQMa8XxS is a SOM series featuring NXP i.MX8X SoC.
> They are called TQMa8XQPS and TQMa8XDPS respectively.
> MB-SMARC-2 is a carrier reference design.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied both, thanks!


