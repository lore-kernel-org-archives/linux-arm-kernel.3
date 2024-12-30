Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4412CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 07:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy54HaJtZV3aXuq/5zN+MYA9MTDJ14jB3IIBVXkWUo4=; b=PKrOskumkKp0105xN8ESbXkpZ3
	lxKSLyeLMFR/yqISyv2fiXc0KGYaz27/hOuaSrrJBNg2doinL6Qy5nypuTUxsZdJJiPoFnjyHrGK3
	4zbQgSQYcros1AOl6Sau3OCfdrX6BslNGUUQE5Kkxgx/QcKHZUNwDu6g5oiif0lB5PUYtyMLdgNQQ
	ARUiK7aIg8kwwnBmTa80mydJnyDAtcGNKKcukuXnBu6OYwPi15GgAMryjjZplpQGaVIY06JkQg52q
	YY5usSu1zJgLsCFgSP6+LZRjm1ICyxBn+K8nivSjpRoYHMqq5k+l3IphpWA8qxayCPfK1/O1+K+cr
	W6ee3YzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAR6-00000004kZH-3u9a;
	Mon, 30 Dec 2024 07:43:36 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAPt-00000004kTT-0suR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 07:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gy54HaJtZV3aXuq/5zN+MYA9MTDJ14jB3IIBVXkWUo4=;
	b=d92MefF67V5RbQfyJ1F0o4q0fhIqz2KU/9C5/xXRCXqz8SUysw7qjWUhYpOnek
	/BkVWTuMhpPgMXEEyfdw8N6D1AGd9LpRUgJdDx22kHvCxWvfRjug0y00jQiGP/fR
	QViJqf7Npi3LYg5/U/PPXDPCMkj26SwhGtXA3L+43633E=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3XBXKTnJn1T74BQ--.60267S3;
	Mon, 30 Dec 2024 15:42:04 +0800 (CST)
Date: Mon, 30 Dec 2024 15:42:02 +0800
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
Message-ID: <Z3JOyuehpLSfT+RL@dragon>
References: <20241206123119.1688712-1-ciprianmarian.costea@oss.nxp.com>
 <Z3IkYGFGb12LCVIO@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3IkYGFGb12LCVIO@dragon>
X-CM-TRANSID: M88vCgB3XBXKTnJn1T74BQ--.60267S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1fAFy3tF1fZFyUKFW8Crg_yoWfGFb_uF
	WSyr1kCrs8JF1xKr1fXws8G342g3yUGr93Zr4fGa93X3Z3JrsxGFsIqr10van8X3y2vr9I
	vr15JrWIkr9rXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0IdgJUUUUU==
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRvFZWdyEULbFgAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_234221_668539_E42348AA 
X-CRM114-Status: GOOD (  12.33  )
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

On Mon, Dec 30, 2024 at 12:41:04PM +0800, Shawn Guo wrote:
> On Fri, Dec 06, 2024 at 02:31:19PM +0200, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > 
> > Add the I2C Devicetree nodes and pinmux for S32G2 and S32G3 SoCs.
> > 
> > With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
> > (rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
> > are quite similar. The common part for the EVB revisions will be
> > centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
> > be placed in 's32gxxa-rdb.dtsi' file.
> > 
> > This refactor will also serve for other modules in the future, such as
> > FlexCAN, DSPI.
> > 
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Applied, thanks!

Dropped.  Just noticed that review is still ongoing.

Shawn


