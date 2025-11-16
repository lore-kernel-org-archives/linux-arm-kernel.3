Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31768CEBF8A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuCXAew1ENyewRNTNIKnXN+mXacGjLsytBQ3ltmtgHU=; b=JHgoXqADLPmD8K6V75htq7Srlc
	gQBL8swS54E0+Y8f0lKlFq15Myipl1HmdJkfvz8tX3ci6YaGmYDba0Xt4S5tGyadC/SLHE+pJf8X2
	eWUSC7aGP0OIOHM2emEh+PVZEYrM3OAvkhkAPdxYqTlp3gQi02o/tYLW4F/sAS7vPTSaIDbMYBIz0
	jVjDdjaP7CiMYnFkPCFVOQlFuMEkDqvVrz8pQsYbQGpXsUvv39uC/iHboxEmR0JWKyYE8MSm5GHpT
	okNH6QHxt9Ea3+4pUVUFxZ9zuwX0rnREEIoJz1V44GjpNipAiCD3WRlADpM8qyu682T/ETGI7HKsi
	Jf3P4MAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZIl-0000000EWJM-1tzI;
	Sun, 16 Nov 2025 09:44:07 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZIi-0000000EWJ1-224N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 09:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yuCXAew1ENyewRNTNIKnXN+mXacGjLsytBQ3ltmtgHU=;
	b=V1qlQuWduYpXQe4zr4nr/k1OLwA/LgCaONo3FAFjtvsEO93i9peYIJFQP4NtZw
	q7/AylopJCe49l+DisN7kYcSwZw0/5lvTpLJgJtHRo4xXX3cqTkAFMFXShxNJcBx
	pNKyWn5xdtlaiS8+/B8X7JrFV5/a3mCuNepDRQHFbkGSc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_1TPnBlpHEsWAg--.7896S3;
	Sun, 16 Nov 2025 17:43:45 +0800 (CST)
Date: Sun, 16 Nov 2025 17:43:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] ARM: dts: imx: e70k02: add sy7636
Message-ID: <aRmczxYXbjRDMHXD@dragon>
References: <20251028-sy7636-rsrc-v4-1-242ccfd3bc10@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-sy7636-rsrc-v4-1-242ccfd3bc10@kernel.org>
X-CM-TRANSID: M88vCgDX_1TPnBlpHEsWAg--.7896S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOjg4UUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOBH7YWkZnNENYwAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_014404_855535_2871E8F2 
X-CRM114-Status: UNSURE (   5.97  )
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

On Tue, Oct 28, 2025 at 04:00:36PM +0100, Andreas Kemnade wrote:
> Add the EPD PMIC for the e70k02 based devices as a step towards full EPD
> support.
> 
> Acked-by: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>

Applied, thanks!


