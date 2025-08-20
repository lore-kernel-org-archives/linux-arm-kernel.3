Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C96CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 02:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhgXz+NGz9dE9bo3AgVhV+r8lEFLGIj0GKiYKAiGm04=; b=GReZSHpTfTWtjeZFrkk0ztzH3W
	0MeShEWRbx41FRwsQ5+VFBm768bjeIG4XnIKoNFfYdXIJ4XPz8Q/fTtDYx+9FcQtj4gUptC3rgczG
	l8A28e3kAnw268BY8inAGx85d26lH02gxyaEKVoXkqpXBa1ooNjaFm3H4PMfZR57APEl6t5LqThL+
	2Qdx2inAOdpliws8l8cUV3VcFZyvfk0JXGwDElRGUSuUX7f+R3erUbM3O5vI2pID9BMqU5oKW9ILu
	MM4oeQjRphN2kBSxSYKcRWEPLgYYu4eq6BcRLJfuiuP70faoHCz0id5mc2a+1EX9kcgk6+OG6F/WR
	z/vBuBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYjL-0000000CC3d-2BEp;
	Wed, 20 Aug 2025 02:39:15 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYgi-0000000CBrf-3xaV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 02:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xhgXz+NGz9dE9bo3AgVhV+r8lEFLGIj0GKiYKAiGm04=;
	b=WcOh3ZWSv2Xk56vJhMpz6KCwCHurEduYoLeL7PSDayXg+xQrZ93ge37SGl8rre
	qbREsrJMJ1iAf4gfl0pxJaV1UcCM62QN2AYFMzqJ7gIp7iWsybmOZFIKrUn6JFfe
	Z4mUlqrF450rsSaU6hCZ39ffVes2sW4EiuAnLV1kfqA/U=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAn5W6VNKVobNX3Ag--.59759S3;
	Wed, 20 Aug 2025 10:36:07 +0800 (CST)
Date: Wed, 20 Aug 2025 10:36:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Christoph Stoidner <c.stoidner@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <aKU0lPi485xA5SS9@dragon>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524112315.695376-1-c.stoidner@phytec.de>
X-CM-TRANSID: M88vCgAn5W6VNKVobNX3Ag--.59759S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF13Gr47JrWDuryDKry3urg_yoWxuwb_ua
	y8K3ZFkw42yrZYgF4fKF42gr43uaykGFyrXr4rJw4fXryrXa4DWFn5Arn3Zr98X3yS9ry3
	WF909a4xursrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb7PEDUUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhe1G2ilNJffuAAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_193633_336172_AD5B8AF3 
X-CRM114-Status: GOOD (  10.98  )
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

On Sat, May 24, 2025 at 01:23:15PM +0200, Christoph Stoidner wrote:
> According to the datasheet the phy needs to be held in reset until the
> reference clock got stable. Even though no issue was observed, fix this
> as the software should always comply with the specification.
> 
> Use gpio4 23, which is connected to the phy reset pin. On the same pin
> RX_ER was used before, but this signal is optional and can be dropped.
> 
> Note: This comes into effect with the phyCOREs SOM hardware revision 4.
> In revisions before, this gpio is not connected, and the phy reset is
> managed with the global hardware reset circuit.
> 
> Signed-off-by: Christoph Stoidner <c.stoidner@phytec.de>

Applied, thanks!


