Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2F9C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOHv8pX5jbxxuCYHGHw737xsClV8Yj1+G5jAUW7Z8nc=; b=CthvCBVxOlM7n5C5PH+mU3edtt
	i83prtDWAJmMmdvk3vU8FDKKc6DHErvzHHFLBjfWyKR+9iX3d4O13XzZ7gfmbkl+kU3/Fj43XfuT+
	yv1Van5hIcDhsEoE1cKq3PU5UU1otiSNjykYXzCTukwM+TZZ3PGvBhJsOuTchx29YlhMhtJi6P1bN
	spy9DVP0za2yFGqyM1+3N67/dmoglb6ubkFzl1K3j8oLtt8ll1VotqxJq36KXqUO4GVHl/5eMU31X
	0wDWEuROv2weGmBLsuJge+riZ4DTVwnl+JMhCUaWyP1lBPVIgSGAcBp1Pah/h1fpdeoukYIkgdtyv
	DAd5PuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpRb-00000004QvJ-3wbW;
	Tue, 11 Mar 2025 02:34:11 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpPx-00000004QoD-3NnC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hOHv8pX5jbxxuCYHGHw737xsClV8Yj1+G5jAUW7Z8nc=;
	b=mISa2eJM9214+1xaX0k7LKZ1UnOPAOPCJL24x69Xjmma+nn14mcBDv8xaIOgIb
	VQkjpd529Q/ddmclfK6A9DXRBVLR0tM+Gus4MTiea9agnHiY/25YtIvGqYig1v5+
	8qD2P/DBVwZisvSTpQBSQCNk+Dmm9B489zH2DcO+lQxKE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3AoqloM9nvESvAA--.42680S3;
	Tue, 11 Mar 2025 10:32:07 +0800 (CST)
Date: Tue, 11 Mar 2025 10:32:05 +0800
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
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mpxl: change
 sound card model name
Message-ID: <Z8+gpX+REkX4SEUz@dragon>
References: <20250224150016.499055-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224150016.499055-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgD3AoqloM9nvESvAA--.42680S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr43uF43XrWfWw48Zr1xuFg_yoWxuFg_AF
	4fGr1DGa1DZan3uw1Fkr4agrZa9ws7X3ZrGr13G3sxX3WFkan5Wrs0q34Syw1j9ayvg345
	Cr9aqa1093yjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0rsqJUUUUU==
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAcfhGfPoKfalgAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_193230_207908_6020FD1D 
X-CRM114-Status: GOOD (  11.36  )
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

On Mon, Feb 24, 2025 at 04:00:14PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> The card name for ALSA is generated from the model name string and
> is limited to 16 characters. Use a shorter name to prevent cutting the
> name.
> 
> Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
> use the same codec with the same routing on board it is a good idea to
> use the same model name for the sound card. This allows sharing a default
> asound.conf in BSP over all the kits.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


