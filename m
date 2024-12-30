Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B664E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 04:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRbOUu8aGJVO600q2KogDHBrNV2xszMwCHc4iiXDYuk=; b=DuZzczoI6P27wUGPyUiEo70Epg
	kQ5dXN7FZ8vaVIIFrKdrugyE8e78pztas7CLfExLNyH1ha+xBF1R6JV5jsxzB1l60qv9PVkCdta0J
	DbJ4cctSr/IJnd9PnCwFzf58UcoapoNdDOMSjU3G6cbAu8UZv+qvYR3WjMmD/W0u5R/7CuddMStgJ
	ZtADVS+ws3SGYds+9W8YVY4re7o0/HaZs6P783y/g6KAVtU1hJBYV1LQQMQaZ8mTu4Zp2Rc7Mstvf
	lXDrYXBQcWFu/lf8hInuXx0tSax/CHdT1vY4kcAR9IK26YwRSvBaqQM7IeGpwojEAVt86abcu+r6c
	OgaE5EKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7UC-00000004WF9-2FRG;
	Mon, 30 Dec 2024 04:34:36 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7Sy-00000004W40-1Wvf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 04:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sRbOUu8aGJVO600q2KogDHBrNV2xszMwCHc4iiXDYuk=;
	b=ONItbrkihs+pA902M+iRc/mvKo6K5EiqF45hs6AogEPrx9aQ1XYO6O0gGAEs3h
	vVa8xgPEs4uQfcvTTBOdbvqV1N4b/DI+mbEsQxgGk04Iw8ERhL/5woDbnZkxrFI1
	4J46z3QMTGEifviG8LMWZOPFMTYp4jg72B35602iG+PRk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXHQR+InJniNUDBg--.61031S3;
	Mon, 30 Dec 2024 12:33:04 +0800 (CST)
Date: Mon, 30 Dec 2024 12:33:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH v2] arm64: dts: imx8mn-bsh-smm-s2/pro: add
 simple-framebuffer
Message-ID: <Z3IifsJxLG34b3sN@dragon>
References: <20241205162612.1804274-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205162612.1804274-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: Mc8vCgCXHQR+InJniNUDBg--.61031S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBA7FZWdyDmBPOQABsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_203320_751393_9551B3B9 
X-CRM114-Status: UNSURE (   6.77  )
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

On Thu, Dec 05, 2024 at 05:26:04PM +0100, Dario Binacchi wrote:
> Add a simple-framebuffer node for U-Boot to further fill and activate.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied, thanks!


