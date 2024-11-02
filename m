Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DC5E677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSPQBPU9VpGhI17i4emlrIw4t8MerKFEhaezHfQMv1o=; b=R/GNgPRuygrAEPYLHmV7jk2bLD
	i6shyLRJ/E3bQsRbbknryHeLJ8sfozlDe5bI5K++F7GL/eYpcS9wJQsA0+UHq9dAwP1guczpShyTa
	b5hAORCrSnl2IqvI8AF0X9Xtvw6GQi2X73LwDfoNp/u8b7Z2B03+etQ8/tfzHfEKHPdkTggl9/Whf
	8zeCqlopIjGiUsSzv8nZdTe9K7oY0krLt+LD8bvS+hx1MD1g0SGPjRfT667oek7BV6kpgwrsPJawz
	Lz4ifbzqC5XX3JQa/aAxPOd98npl61jeV3N2N7oaL3rnLjVNwqF0M0cwfbJszsl/PjxQ8tP6Ae4J2
	a+5qgJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t78GZ-00000009CJs-065y;
	Sat, 02 Nov 2024 07:09:47 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t78Es-00000009C8r-1Xxi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 07:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SSPQBPU9VpGhI17i4emlrIw4t8MerKFEhaezHfQMv1o=;
	b=NVy63dFm47y4WN43OQDZk59kI1f5y4gxJX5UFAvTD5wB2zbAD5gIqHIveGd6uv
	sSpVWkI3GYQxOH2iNQiWRF+3rRR5dtrO45Cdbkmmg9qixIvrKYG98kDe/7rAgaeR
	eei8OZnLyqk2Bkta8J0lX34Cw/D3LrDml3quSXo0RDAs8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXl526zyVnPL1+AQ--.14928S3;
	Sat, 02 Nov 2024 15:07:40 +0800 (CST)
Date: Sat, 2 Nov 2024 15:07:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2 resend] arm64: dts: imx95: Add missing vendor string
 to SCMI property
Message-ID: <ZyXPugjIFe9FOpKO@dragon>
References: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Ms8vCgCXl526zyVnPL1+AQ--.14928S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVg10UUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCw2LZWclsr877QAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_000802_747177_EA28F3C5 
X-CRM114-Status: UNSURE (   7.21  )
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

On Wed, Oct 30, 2024 at 10:55:51AM +0100, Alexander Stein wrote:
> With commit 7bf46ec090b9e ("dt-bindings: firmware: arm,scmi: Add missing
> vendor string") this property has 'arm' vendor prefix. Fix the property
> name accordingly.
> 
> Fixes: 61ed94cd54e3 ("arm64: dts: imx95: set max-rx-timeout-ms")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


