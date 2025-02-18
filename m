Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A766C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLj9MWLdh0oMfWDc+SInSAR4dxVskqRMPSbsgEfwJUI=; b=XoTJabKLOrWMgAv62m+2TbFtK3
	qLB2mRf+31tTHzOAmvoYb624/BEMKVCYhaK7ToxOTUP2V4tP1K1e65AYZ2uZY6nq9PmpfAUvp3z6v
	9T3EfLYnf+QftJ+gYszVtEnMhqo1CYTGShP6WStb9t0KjWU1n13BVbsuip4z1jDOjshZIdBV/dj6N
	LkLOGa6kcqICqjbtQ323i6+JqHKnoba9lAIf4QrZ302bh5C9QRV+f/FAIHOw04y6rgGslimreqQbm
	Wo6wBQ0lrk6JowCGqCsNub+kkJJNLPLUbZDmFMChzsp1QEB1noQPNVXqnhz3Yl6cFRipywlZ4oGNX
	kfBudL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKO9-00000007ddn-0Q4N;
	Tue, 18 Feb 2025 09:59:37 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK6z-00000007ZSF-0UOT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eLj9MWLdh0oMfWDc+SInSAR4dxVskqRMPSbsgEfwJUI=;
	b=BSnIe/Ugl+bHYxYpJFgcOGidrVXpe4CZh22unGoKI2XGY7g3OqEpb8T8oVtGQg
	rTg1uNBLMPaPsqM0qNIbwBFXiH/8AVCpqwLRZquNaiFJi/Dd5rnzmU5D4G28MTaR
	dsH3yMYOACWxOylHfLWNLgHZGlz1Dt1kmFpoGhYctqGK4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHLe3TVbRnBRI6CQ--.18371S3;
	Tue, 18 Feb 2025 17:41:41 +0800 (CST)
Date: Tue, 18 Feb 2025 17:41:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH 0/6] Complete WM8960 power supplies for i.MX boards
Message-ID: <Z7RV0wA0WCi64pGs@dragon>
References: <20250109012718.328692-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109012718.328692-1-chancel.liu@nxp.com>
X-CM-TRANSID: Mc8vCgBHLe3TVbRnBRI6CQ--.18371S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaqjgUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhD3ZWe0L6um2QAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_014153_615867_FECB3FF8 
X-CRM114-Status: UNSURE (   4.98  )
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

On Thu, Jan 09, 2025 at 10:27:12AM +0900, Chancel Liu wrote:
> Chancel Liu (6):
>   arm64: dts: imx8mp-evk: Complete WM8960 power supplies
>   arm64: dts: imx8dxl-evk: Complete WM8960 power supplies
>   arm64: dts: imx8qm-mek: Complete WM8960 power supplies
>   arm64: dts: imx8qxp-mek: Complete WM8960 power supplies
>   ARM: dts: imx6ul-14x14-evk: Complete WM8960 power supplies
>   ARM: dts: imx7d-sdb: Complete WM8960 power supplies

Applied all, thanks!


