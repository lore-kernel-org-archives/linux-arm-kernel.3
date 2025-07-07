Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A505C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ng1wQtLHFug7kmO6H2Kb5UP1OF3WN7eVo9JKF8DKI8=; b=1hr4CVQWusdWobwBMzvEQollJ+
	lVjTCLPLs6dDoAaSylqX/3OOIOodLmYsNWog8Y2wURLz4eSp1NiO31wFo9RO2SbJ9XbSaoiPZtwJH
	w3C1mKL06oTwRI0k4lxP3ywV44TB3IbKhh+JVvnGghcCsWNjCM4tkwaffsTM4jC/aoC4DornJb4Bm
	W88unCRrJfRgiEv/14gZbNpL2ayEV6ZeGbVMyu0JZb8rVLvCxwrwdjt53rE6iEHLd4vb5SmwzodnN
	Z8n22jj4l2Up/9mxwS3YJs9iVkDPg5UvY3jJ2O/J4LIOznU0lIoN+tiaom4EGOJDUdEbQeHsrRj61
	B4QlEtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgEs-00000001gFq-3DrA;
	Mon, 07 Jul 2025 07:26:10 +0000
Received: from mail-8141.vip.126.com ([60.191.81.41] helo=mail-8141.vip.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgCX-00000001fqI-337A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4ng1wQtLHFug7kmO6H2Kb5UP1OF3WN7eVo9JKF8DKI8=;
	b=TmdpZtYxUI6+Dyd4c3TPrIw9Msyab+CBv2ECUfNf+/fvFrtmKMa9ubBnIKgUnH
	yMFRTHNAebhBcv2NFPfImyxFteMXGdJGQu2e1ODRiReKoNSQYM4CDQBBd90/OGte
	WU5zL6m5Ou6hECCCIP0XoaMB7D1ZdwkK//oUwVIylUnV0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3t5TDdWtov8w7AA--.42463S3;
	Mon, 07 Jul 2025 15:22:45 +0800 (CST)
Date: Mon, 7 Jul 2025 15:22:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock
 speed
Message-ID: <aGt1wwcRD1gF53g_@dragon>
References: <20250620213447.56392-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
X-CM-TRANSID: M88vCgD3t5TDdWtov8w7AA--.42463S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0b18UUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwWDZWhrVSl45gAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_002345_969979_67582D8A 
X-CRM114-Status: GOOD (  10.48  )
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

On Fri, Jun 20, 2025 at 04:34:45PM -0500, Adam Ford wrote:
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
> 
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied both, thanks!


