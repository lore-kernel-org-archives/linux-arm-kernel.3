Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021B9C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsOaeFx84mEMIUh1L0Rg4ey/wr5JNJW+7tpTSLncbys=; b=IKhIvPTTYCXPVTw8PlDLymaRR0
	Xgt93EGtV0xR2MMorX/PSNIpgayWnl1zl7pZem6dWm+9XXgLr115NT+AbBrcFIQAsubmyWHloXU6q
	ck5ODjSxsNJ6RErfd5uc07CWE1xV64EQoq8b4uYUeEvtXJCtk4pFPs9K/jad++FkhAGeq/XsU5Kkp
	dJo1ZahPvFfm9h3A+W8ZqtnaWHxShM4Yd2I5khvcggvglf0fjfeXZLrl0ebYFjbHGEHjr5IScW4Hs
	4QMgDxd1slHrGez6H09Xe7e91KYhOdDjFJcijrLkuGw8cWl1uXaNgHEF882QHIUtWGpqYdjsT1ckm
	ZPlMg9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trph4-00000004SiP-3mWO;
	Tue, 11 Mar 2025 02:50:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpen-00000004STZ-1YkN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=WsOaeFx84mEMIUh1L0Rg4ey/wr5JNJW+7tpTSLncbys=;
	b=aUk0JzXj24LIHoUlTD1VitEKqbk5WwNNDL1dNpHPSq1kBdHcdBqZLNPR7HRFRJ
	d6xvoCXtdbkyhM2TBH3Mus6x9u3PLGyNPYufcRPWdofRIXPJ0I9svTRsbd0ns5Z3
	xUhHsQxELYQvDN13ohHKEAMZOJb5Wkf9TevnFbZOA/wyU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCns4o+pM9nw3GvAA--.42893S3;
	Tue, 11 Mar 2025 10:47:28 +0800 (CST)
Date: Tue, 11 Mar 2025 10:47:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: imx6ul-tqma6ul1: Change include order to
 disable fec2 node
Message-ID: <Z8+kPrY3BsyniZS2@dragon>
References: <20250225144436.813645-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225144436.813645-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgCns4o+pM9nw3GvAA--.42893S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxG-eUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQQNZWfPU+r87wAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_194749_728874_85A28D46 
X-CRM114-Status: GOOD (  11.23  )
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

On Tue, Feb 25, 2025 at 03:44:35PM +0100, Alexander Stein wrote:
> From: Max Merchel <Max.Merchel@ew.tq-group.com>
> 
> TQMa6UL1 has only one FEC which needs to be disabled as one of the last
> steps.
> imx6ul-tqma6ul2.dtsi can't be included in imx6ul-tqma6ul1.dtsi as the
> defaults from imx6ul.dtsi will be applied again.
> 
> Fixes: 7b8861d8e627 ("ARM: dts: imx6ul: add TQ-Systems MBa6ULx device trees")
> Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


