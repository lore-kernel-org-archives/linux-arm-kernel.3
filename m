Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B20C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH7i3hEBunXl56kGHk5HmVNJ3ShdY5ZTb+FytLjyRoY=; b=ECowsTa26xszVsDR6qv9gH1omf
	54drsCt7YY7vmS3cqOpACy07rQov9Y+GsL6QHMbCGETz9ICZznZoRIydf1y39eQtyzhfZ0B0ZXiDb
	fM0N6HTLDGe3FDJtj3+An8lWqiRvOqm3gL+NkLtijnGV69u/GI2FRlR0PjeHo1IgQqwyVQN7jerQP
	bTWCq62FbWrzkCmtsh1ZM6rAbGEVfBOWN9RM3ZOBQ7BKU1m3m5D4YdEPjp4JASJfaK0JSV8yxKQX/
	MJjW3I6m5Li00myid8AVV+XQ3YVt9u/EM6qT6+TIIPjjCKt8RWxueh4Dm4R7vTy2Dq/V4RUUZ7gAC
	cRRm7Buw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpIM-00000004PxE-3aRm;
	Tue, 11 Mar 2025 02:24:38 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpGf-00000004Ps9-2Slz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SH7i3hEBunXl56kGHk5HmVNJ3ShdY5ZTb+FytLjyRoY=;
	b=ip1G6nMbetQfy4n7AFrG5+zjHYqZOIHmTr3npDbaScpW1iyI9Rne44mmrPIlld
	DHRemHeIcXi/ub2gwMyzlN1zfjIc2AAQ6EObqg08WoVAWD6C6890Mm2R5YFMng2C
	xTrmstW6UnVyxH4LaGLe/xYwkKclUflqVQDUlzrAqdYNA=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHMiJwns9n3Eq0AA--.48756S3;
	Tue, 11 Mar 2025 10:22:41 +0800 (CST)
Date: Tue, 11 Mar 2025 10:22:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: add imx95_15x15_evk boards support
Message-ID: <Z8+eb5HNX/FQPg5P@dragon>
References: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
X-CM-TRANSID: Ms8vCgDHMiJwns9n3Eq0AA--.48756S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVpVbDUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQQNZWfPU+rdgwAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_192253_956149_4457D118 
X-CRM114-Status: UNSURE (   6.12  )
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

On Fri, Feb 21, 2025 at 04:15:56PM -0500, Frank Li wrote:
> Frank Li (4):
>       dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
>       arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
>       arm64: dts: imx95: Add i3c1 and i3c2
>       arm64: dts: imx95: Add imx95-15x15-evk support

Applied all, thanks!


