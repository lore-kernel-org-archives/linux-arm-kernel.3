Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19430E674BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2TwBYfpElSm/MhOCL9/cehfvLVKgyMFtIi/m3/gOgU=; b=jbxONCG3UDhV5erqbZIn7i78Qf
	bqCwyoAcg8xsYMFcdcBDfbf6fZiTkIvTsAf6zpUZER/8z1txwzq99huA+Q5/E5hSleEwNjBBcnswO
	s4G82mRPTOzDy1QeKLoMKsMByrlkYPZiH/RcbsIbAngwv6Sio/EjFhGyppOhKETrimTWnadadd9iM
	aIJUcZ6s2m4Wr+qI0IT4owEVBYiLxj6Lk9doCXEYC1VRj8fpYeU7BxThR2kWe74woLS5Tzc6bQfAe
	WtcbdgcNi6Q4b2unMBRhZkc3Og5fRG816Gcl3bNACcUmaAJUdKEffyQZy1T9zfO/p6E+GGrSDtBuH
	FA8H1tAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nzG-00000006PK9-04im;
	Fri, 01 Nov 2024 09:30:34 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nxZ-00000006P7m-3vYa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Z2TwBYfpElSm/MhOCL9/cehfvLVKgyMFtIi/m3/gOgU=;
	b=GBkr7Vc41c4uZsN7uGdzBSK5PTxR8rNYIUVi48x0UG1KRLZiRwH8X1LX9LrnKR
	XlGZgzpCuj12tyOrfEy45sgOK9k3ma+KzQLqkCbJwBGR0JdFqwjAk4JW+QEUvf9Q
	H8jucQXf5cBqf3stjvlMAP0xS+YLBN6K5zHFhP/XnRi/Q=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3lMpFnyRndp5jAQ--.13947S3;
	Fri, 01 Nov 2024 17:28:38 +0800 (CST)
Date: Fri, 1 Nov 2024 17:28:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH v2 0/3] arm64: dts: imx8ulp-evk: add sound card support
Message-ID: <ZySfRAjsPSsgbhk0@dragon>
References: <20241022052919.1946074-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022052919.1946074-1-shengjiu.wang@nxp.com>
X-CM-TRANSID: Mc8vCgB3lMpFnyRndp5jAQ--.13947S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVcTmUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR6KZWckjmUy0gAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_022850_308558_04E3DFBB 
X-CRM114-Status: UNSURE (   7.03  )
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

On Tue, Oct 22, 2024 at 01:29:16PM +0800, Shengjiu Wang wrote:
> add bt-sco and spdif sound card support.
> 
> changes in v2:
> - remove 'status' in edma nodes
> 
> Shengjiu Wang (3):
>   arm64: dts: imx8ulp: Add audio device nodes
>   arm64: dts: imx8ulp-evk: Add bt-sco sound card support
>   arm64: dts: imx8ulp-evk: Add spdif sound card support

Applied all, thanks!


