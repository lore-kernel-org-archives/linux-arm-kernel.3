Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADA6C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p26k3iNBH6NEFpUE2GR2mYl5kAA+PXFhcjSGL4mCfPA=; b=tS69wKW3XNDW+G8e8clbEq0VGe
	FXFHRRIMqagpjnGrX1ncKvcS8NuCzQ5qDfD7I+Bz9wK6azk1sBMzFHg0cpiP87Zw9IuH+zrcfZoHa
	9tVx3BYkAKLb2QE41ul7mcy3kebjgD39mA7AbW3oehS8mJG1UFrDSCU/cFKiMMb9ZYpph1/TzMHAB
	N51By0gK9bNkeTcJg8PtRUHWVILImjfoDbLGNLGpwXMu5meWeNEBLkTGoc+r2HkkJDnSQ7r8kmAlx
	Ku5E7GBgOvHs4EM2RpK/6++l2Jh+yUg157hK/uj1dqndINg/0U8+TripfwsvcIjBU7nRJN3FatcpW
	Shl9VspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdRk-00000005xyn-2RZR;
	Tue, 01 Jul 2025 16:03:00 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbnf-00000005fXd-1RHP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=p26k3iNBH6NEFpUE2GR2mYl5kAA+PXFhcjSGL4mCfPA=;
	b=TbhgpTn6hdC1rodjsefbUOg8xgpuZ6gyHHbF7NXNUo92APh/KWd1H2pZp/svIw
	i5RIjX67k8zYHGgNq6g2uzycNnJ0tTxfOqD7E6CMJcm8J1Cmur0DoBbuwYy39JGY
	hn5bUFQ3+sJ9nzD51RTrnOUiMvqZ4v1+HGOmS+xama+/M=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3V+bs7WNozMcBAA--.4462S3;
	Tue, 01 Jul 2025 22:17:18 +0800 (CST)
Date: Tue, 1 Jul 2025 22:17:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: imx93-9x9-qsb: add IMU sensor support
Message-ID: <aGPt7Cs2jrGDAZ/m@dragon>
References: <20250609165237.1617560-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609165237.1617560-1-Frank.Li@nxp.com>
X-CM-TRANSID: M88vCgD3V+bs7WNozMcBAA--.4462S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoYLvDUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNA6pD2hj7e6qGAAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_071731_815106_062026E3 
X-CRM114-Status: UNSURE (   7.96  )
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

On Mon, Jun 09, 2025 at 12:52:32PM -0400, Frank Li wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> The i.MX93 9x9 qsb has a ST LSM6DSO connected to I2C, which a is 6-axis
> IMU (inertial measurement unit = accelerometer & gyroscope). So add the
> missing parts to the DTS file.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!


