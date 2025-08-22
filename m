Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F790CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7lCgG8GrQswBuJIJakKfaDBSGGImpfURwXpxB+YW5w=; b=k0lOVHcoYOfqua5TS3sXywHsc8
	fiiD+5LEPwNL9CcPRBLSc6+lqQSws8Q+0fhxdXwIKJhpHqekWuivajgXEI/4j9uQSH7hPcQ7lfUTH
	uKf0FWfPyasPWiZUxfO7/hRx/BX8jnlsirhxSM9l13rtW14CK7XqZHiJtbNVRW7cHfmSVsBCXm47T
	/en6CLndKoJL9nRZlFqi0/UWTWIWCIDNuy99wYtojULlW+Ap5HFaFsRhvVVR94Yv9pnn/pDOp68j8
	dE0cibA6g/MYDUJ+MMqz6NT7JQj1pQ1ORnH3yoqIK9HAGe0R9/Vk53g2REdZ9l8A3PzPXhi1ckaqs
	e+ZZF1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTma-000000032Gb-1Ivj;
	Fri, 22 Aug 2025 15:34:24 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upN0v-00000001vFa-1Dtv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=X7lCgG8GrQswBuJIJakKfaDBSGGImpfURwXpxB+YW5w=;
	b=WOPPS5hR2h8KH9M7CWhDIeOhj3zQBWrhoYPH6BQwq3SINLnZunFKigpbdDon7S
	C2hi5bh9tj6USHS7BJvZu8nuFBaI8jKEWfxHA+LUVEeX/UNUnvgc4Du83Hx4PpoA
	Y9lwLd96YWBQ6CIPhMfRyKE/dua4BrpQY6afnIYr8WFSg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDX3bE9KKhoWrobAw--.25268S3;
	Fri, 22 Aug 2025 16:20:15 +0800 (CST)
Date: Fri, 22 Aug 2025 16:20:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
Message-ID: <aKgoPGO_CXVrH57j@dragon>
References: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgDX3bE9KKhoWrobAw--.25268S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWftFWxAFy5try5uFyDZFb_yoWfKFg_XF
	WxXwnrAws8Ww4Ska1FqFs8KFyS9rW8ZFnxJw18Kr4fGryIvay3WFs8K3s8Aw129a1vka4D
	GFy3ta1jyrZ8JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb4S5UUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB9dwmioKD-XjgAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_012045_924920_79BCAE0B 
X-CRM114-Status: GOOD (  11.57  )
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

On Thu, Jul 31, 2025 at 11:16:52AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Fix SD card removal caused by automatic LDO5 power off after boot:
> 
> LDO5: disabling
> mmc1: card 59b4 removed
> EXT4-fs (mmcblk1p2): shut down requested (2)
> Aborting journal on device mmcblk1p2-8.
> JBD2: I/O error when updating journal superblock for mmcblk1p2-8.
> 
> To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
> regulator that is supplied by LDO5. Since this is implemented on SoM but
> used on baseboards with SD-card interface, implement the functionality
> on SoM part and optionally enable it on baseboards if needed.
> 
> Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


