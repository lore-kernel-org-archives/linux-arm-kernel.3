Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C38C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhAsV/CBrgYXlLFY+8qkcKo/GadLSGwmgLi8pRb4QUk=; b=ZZH1mvofNlicCwKFFfkAtSO/Qg
	fIKKiRiQ2EkFHrb3nKxkK82dMlneS3ZjOblqg5wyuO8DfzJYWcjB4RMx2+/sIFLqnUX4/dGLBVnXn
	LoQU722Ng0DljgcdcCBSWjV20lhzKk6cXpfiqOr8aWosgk9NSVi90NRJOuhe8CMYnitcn4QVemBLq
	8rQs/h3XoZVXzuf6HakypsmMyLOMvkHGKzOMQq5xJhjG13CpX8/dSUGVIoOI7I2rZARDYLCkH0Cdl
	v6WtK1JOfxjXOVIEwBNQC5lZCG9svONiYJJb2gUjG8gtAOjoRRdTdyTGtcVe1lNceSQe8po819fch
	PR8zKiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Z1-0000000DmgQ-1dyK;
	Fri, 11 Jul 2025 05:44:51 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Rq-0000000DlLP-0d0y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OhAsV/CBrgYXlLFY+8qkcKo/GadLSGwmgLi8pRb4QUk=;
	b=H62B/Bbg/cEOgUnp7ap3h3tfUm7W4fQQmbCIIu7+/C38Ajeij8sKBhr6nwaiI3
	03t8NYs71gCAxHhpYnrVzpereZLFz2CdbnKGk5w2MU1NOHSKh6rFJZ/0Id7N7Av8
	e9mxbeNGEaKp/i3Nir3h+qEI66llfAv+KbFqy0+FEBZ7U=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHX52HonBobvdOAA--.742S3;
	Fri, 11 Jul 2025 13:35:05 +0800 (CST)
Date: Fri, 11 Jul 2025 13:35:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v17 0/7] firmware: imx: driver for NXP
 secure-enclave
Message-ID: <aHCihwHKVck-emEX@dragon>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <aEqMSG8k+NpQ7ROH@dragon>
 <AM9PR04MB86048A698B03E974CFD3DB489574A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <aEuB1qgd6aVl0i7i@dragon>
 <AM9PR04MB8604F77BCD3427B38CB9E664957DA@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <AM9PR04MB8604BFF7161570CD464723FA9549A@AM9PR04MB8604.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604BFF7161570CD464723FA9549A@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-CM-TRANSID: M88vCgDHX52HonBobvdOAA--.742S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4DurW5ZrWDuFWkGrWDCFg_yoW3KFc_CF
	Wqv3ZrC3WUG3y7tFsxJryqyrnxK3yj93Wft3yUtrZIy3s3Ar4kZFWkGryfAw18JayrGF9r
	Cr4DZa4DA34xZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7DGUUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQkBZmhwookRsgAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_223726_543950_7CD27FB9 
X-CRM114-Status: GOOD (  15.17  )
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

On Wed, Jul 09, 2025 at 10:23:45AM +0000, Pankaj Gupta wrote:
> >>> Hi Shawn,
> >>>
> >>> To test it on MX93, you need additional patches on top of these.
> >>>
> >>> The plan was to send the next patch-set to enable the support for 
> >>> MX93, once these got merged.
> >>>
> >>> If you suggest, I can share the patche-set to enable MX93, as an 
> >>> attachment to you only.
> 
> >> Yes, please.  I would like to test the driver before it gets merged,
> thanks!
> 
> > Please find attached the patches for enabling iMX93.
> 
> > I have also sent v18 to dispose off the comments:
> > 1. documentation,
> > 2. updating the commit message with collected reviewed by tags.
> 
> Are you able to test the driver on i.MX93?
> Any help needed?

I did not expect those additional patches (except i.MX93 DTS
changes) for testing the series on i.MX93.  So, no, I didn't test,
sorry!

Shawn


