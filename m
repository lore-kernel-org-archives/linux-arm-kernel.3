Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80978E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 04:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byvfiLkLHPQubLRAWzosDVyl6ug4veFdMUvKeRG1Mgo=; b=JepBmH5dHmGZ+b3AjyCDrSptwr
	6qFx6tKz3xg5A2/S6FCwPzmtfxT9HmVB757F3xjAxYbs4KlYIda1UHOnAFdSKNO3oeVjIFUbtcJMe
	qEdIXrjjlYl3PKQeovtMk8xLY/i8OYHHdyb+X5UAe2wz47sLdphdRyIlorQaRW4gY8H0ePgGVI0aa
	gjnRM0fi7MknGvNU3j+s4o3+MsHbmjY8s16bUPQy7kWicwQj3In/+RWzLSL2GndvArd73VrTIpRZm
	v21vc4QN2dthv45wWRbo9NtOjaTk+piMud1ksb2YuyV3zrAOAcaArlsLpc1oF6IcRU77z5FUCM/cO
	0+yJ8B9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7br-00000004Wtv-1EWq;
	Mon, 30 Dec 2024 04:42:31 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7ah-00000004WpE-3wlo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 04:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=byvfiLkLHPQubLRAWzosDVyl6ug4veFdMUvKeRG1Mgo=;
	b=kQzYwbRGvjebhm7dSfWJz53E+xjqhVOpw2A5AY1Oc2e4KzaSVjn6Mp+SlrtiUo
	+AG1q50CCEAF11eBSeD5PdbOkcx1LnZt5jUNuZXIaZqgB0GRt0phigiQhpjBrg/p
	Cxcd2uKl7JFrmjZC2WegXb0B73gB8bN4tY2SkzU0zwAZ0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX3ghgJHJn9CX2BQ--.60471S3;
	Mon, 30 Dec 2024 12:41:06 +0800 (CST)
Date: Mon, 30 Dec 2024 12:41:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH] arm64: dts: s32g: add I2C support
Message-ID: <Z3IkYGFGb12LCVIO@dragon>
References: <20241206123119.1688712-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206123119.1688712-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID: M88vCgDX3ghgJHJn9CX2BQ--.60471S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWDtr4DWr43Zw15Cw1xZrb_yoW3Jrb_ur
	WSkr1kCrW5JF4xKr4fXws8Gw1I93ykGrn3Z3ySga93Gas5Jrs3GFZIqFyjqrsxX34xZr9I
	vw1DJF40krZFqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0wYFJUUUUU==
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQXFZWdyEUJH+AAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_204120_326167_BFE423F8 
X-CRM114-Status: UNSURE (   9.79  )
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

On Fri, Dec 06, 2024 at 02:31:19PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add the I2C Devicetree nodes and pinmux for S32G2 and S32G3 SoCs.
> 
> With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
> (rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
> are quite similar. The common part for the EVB revisions will be
> centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
> be placed in 's32gxxa-rdb.dtsi' file.
> 
> This refactor will also serve for other modules in the future, such as
> FlexCAN, DSPI.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!


