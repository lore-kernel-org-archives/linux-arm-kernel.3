Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13053C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7ztE35OyDH09bsd9BKX6KL/UpDZEx4le33a86DXqi8=; b=rjQtRw3L5yCaZdTS7vFo58jp5r
	0XUSyzjNE+XJi0d1cKUrZM/hFq/gyDY/g+7VkvyASmwR2BRa0KtPRVs18MKHgxCrVssaPf+xF8Bt1
	Z150B9O+L7LhBE3m5MwsAbUMcMXpPRcPLqpBMKETIR4SE56FFgVyRI6q9KXU5ZBag6+2ofC12MAPw
	GURdjYNi9G6wG67iY72Ifvh/eqVkXP1uEFfe8zTWNh1SwtNsIYyd1pWK1NyTPMsGc2hJ8SMkqxAhl
	phAh7PQ15DBFkkKdwVJK/0MR4kiOMlE0+XNfHmtEY/IiRWIWmka330KIsWiRiHvseYIPHptNcxGxE
	bHz8Ojxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWchd-00000005qw3-1zlv;
	Tue, 01 Jul 2025 15:15:21 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbAt-00000005XXH-36d1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Q7ztE35OyDH09bsd9BKX6KL/UpDZEx4le33a86DXqi8=;
	b=gzWZYDLfLHUZsX+mSJguhIdK6R3/deiH2vVUhnxK86Bxmat3zJL7GJIA62+cZB
	fXxmq4o3DNa0S6axfUXcS+tIUX0+fFrcqW+iMoF1WtxTbyyp2ZJw1z+jJRr2aAP8
	Ouus4i/MbTKOZasV2nPBiBnYKHLdF3NLtg2qGNIp2sGfs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3vwmB5GNoGAkcAA--.36385S3;
	Tue, 01 Jul 2025 21:37:07 +0800 (CST)
Date: Tue, 1 Jul 2025 21:37:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-venice-gw74xx: update name of
 M2SKT_WDIS2# gpio
Message-ID: <aGPkgXt9gP0sAnLl@dragon>
References: <20250604225104.1429156-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604225104.1429156-1-tharvey@gateworks.com>
X-CM-TRANSID: Ms8vCgD3vwmB5GNoGAkcAA--.36385S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOksqUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgNMsWhj5IMU3QAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_063728_133124_984BCEA4 
X-CRM114-Status: UNSURE (   8.18  )
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

On Wed, Jun 04, 2025 at 03:51:04PM -0700, Tim Harvey wrote:
> The GW74xx D revision has added a M2SKT_WDIS2# GPIO which routes to the
> W_DISABLE2# pin of the M.2 socket. Update the gpio name for consistency.
> 
> Fixes: 6a5d95b06d93 ("arm64: dts: imx8mp-venice-gw74xx: add M2SKT_GPIO10 gpio configuration")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!


