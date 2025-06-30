Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC12C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 03:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMBvYrfcJhEzV4RAOAmAuxyy61g3GX1XMHx4/6zqp6E=; b=sB0jy3NHs5VrhRIOLH+q04/9U5
	IBCbFePhuHXLXM/R0m2ueDwZHQM9HXDQar5LK+KZHK6eyJtXTvSlAAykzgzJk4/mXUemhO6uulooD
	Uj3GMF8kUOrSnolxYsy4g2M4hRXO6RESjB/m+LTCbyxqqoOXeNZ35QXweyr2uGPXBRzGKe5kRj5Dd
	HYfOZWB4dEcvo+bwmVvOzunjhOo4c/Iun1zEKTLA+ny7aoJFANwB1XGYdXM340hJXub86No8MXzh6
	Vav6IEMvVRlbk6FiMevNFXYWhRq/vlq3TOmy/pU8HI5btNJDRi11FcZJUZQf+yG4Y76v5FK2+I4vy
	iMsNwrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5H6-000000017Z0-328c;
	Mon, 30 Jun 2025 03:33:44 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5Em-000000017SI-0qLp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 03:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eMBvYrfcJhEzV4RAOAmAuxyy61g3GX1XMHx4/6zqp6E=;
	b=JjPxa0dTW5h72qIOXR/CH0HfNVHEGE/jvjLlQD3CWmgu9Z54+8maopt2F9+Kyw
	uqE5Bh6yP0YOeo/f5nj49/vi/AnrQF0tHHW4FuVOUvjmd98Z1s5k4Cx3GHrfKwWe
	vxIq65+m8wtQWHNwJsF53hRfuCCruDKXgmTfD0hNljZNg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnLxXzBGJoSvnNAQ--.18360S3;
	Mon, 30 Jun 2025 11:31:01 +0800 (CST)
Date: Mon, 30 Jun 2025 11:30:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH v2 0/6] arm64: dts: imx943: Add sound card support
Message-ID: <aGIE86uLisSjCK+h@dragon>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
X-CM-TRANSID: M88vCgBnLxXzBGJoSvnNAQ--.18360S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYZ2-UUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ98ZWhh4l2X2QAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_203120_548497_FDEF6B44 
X-CRM114-Status: UNSURE (   8.68  )
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

On Wed, May 28, 2025 at 09:58:31AM +0800, Shengjiu Wang wrote:
> Add sound card and related i2c device support
> - micfil
> - bt-sco
> - wm8962
> 
> changes in v2:
> - use (FSL_EDMA_MULTI_FIFO | FSL_EDMA_RX)
> 
> Carlos Song (2):
>   arm64: dts: imx943-evk: add lpi2c support
>   arm64: dts: imx943-evk: add i2c io expander support
> 
> Shengjiu Wang (4):
>   arm64: dts: imx94: Add micfil and mqs device nodes
>   arm64: dts: imx943-evk: add sound-wm8962 support
>   arm64: dts: imx943-evk: add bt-sco sound card support
>   arm64: dts: imx943-evk: Add PDM microphone sound card support

Applied all, thanks!


