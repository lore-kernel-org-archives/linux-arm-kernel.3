Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0814EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNXkJxcJ2zsVazXzVhb67vC/AWSm5E/sISjDwq9fejc=; b=q2vjpmyAvW2XEIOdKkNE51zxEl
	MN6VSwCjbvYZRUzZgn2ZDqAaxRBgNAQhhttOj5nOy2Q03weWQhfyrOKjA81f6hM3wcqHmNNjMwRg2
	VJwrlr4SDNH4llAUs5b7chxb1vPgxywC3BhkKt6rPaLIPqr+S68BFHLxHURw4v4ZIS63IZmZ+UlDs
	CSHypUCW7vG5wwMlA2wA+11IuAOV4TE8ez+QoQuGq6tX1vrPLnJCfbuWaRgK/b5xUDz5YD1vYvOtX
	GFCRCcj/H7eNu12ZZtuUQXaGFJUDswajrGndqWoFB2qZUBL4xJ8EHI5tmtGWHgwDxh0XzBRTkJYAv
	X1SvSKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trodu-00000004MSS-0eAV;
	Tue, 11 Mar 2025 01:42:50 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trobz-00000004MJF-2hZ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aNXkJxcJ2zsVazXzVhb67vC/AWSm5E/sISjDwq9fejc=;
	b=QyvimTasT15gCS/eL9gH7dR1XCjRIaHLmSGawEgiQNyCNQEbQqZUQBmpNu8ytM
	W6ateqgBkQc1Y3b0eOALREUSlFp/7z0kKxudAbLp826Yz3bcmsfOjgcTlYFYxszk
	NEoDQugL3Yo58BGWfkXKCydkgxL4XvH92CJnSgF+BWNSA=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCHyeCWlM9nKL2zAA--.807S3;
	Tue, 11 Mar 2025 09:40:40 +0800 (CST)
Date: Tue, 11 Mar 2025 09:40:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 0/6] arm64: dts: imx8mp-skov: add new variants
Message-ID: <Z8+Ultn2BDg+fSng@dragon>
References: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
X-CM-TRANSID: Ms8vCgCHyeCWlM9nKL2zAA--.807S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4IJmUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRANZWfPUEK8TAAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_184051_999940_9E75F1A9 
X-CRM114-Status: UNSURE (   6.47  )
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

On Tue, Feb 18, 2025 at 07:38:12PM +0100, Ahmad Fatoum wrote:
> Ahmad Fatoum (5):
>       dt-bindings: arm: fsl: add more compatibles for Skov i.MX8MP variants
>       arm64: dts: imx8mp-skov: move I2C2 pin control group into DTSI
>       arm64: dts: imx8mp-skov: describe I2C bus recovery for all controllers
>       arm64: dts: imx8mp-skov: add revC BD500 board
>       arm64: dts: imx8mp-skov: support new 7" panel board
> 
> Oleksij Rempel (1):
>       arm64: dts: imx8mp-skov: add basic board as fallback

Applied all, thanks!


