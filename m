Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA13D111B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZRpCxs1ZQTmZewSRGTv8tKfeNyI4SPc6Zju2MFK6Jg=; b=2qdZWI/MPSA7I98ABjGC8r9/9i
	D8YrLQ+6SdV+2sQLI0E+BzC6dmq2f0f0MzQXrFQygXzgKCreyRvjNoAQkumIuJm/aNY0nG8TKAn1L
	1eNNnMt5m99VG+lTDW5L7ejBrL6RVXgwJFIp7oZgSiF5Nie0qnbiHtJNI3ne60qO5SMnAGM2BgtVJ
	IUnWNaZ+GYIKe8FDw96+9FBQytE7lDyDusTDbM0ZInAGwMCwQGDIkKZLOr2lkxDYUtrgSyK7t1wXb
	YC8UTkpcAqK16QI7YLR7jObIyLKFErp+Yy9UwFK3oHxEQjZSABJpDdL416JR7JP+2jxim0sHXuH78
	DXHWwVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rjA-0000000CsTc-1uRm;
	Mon, 04 Nov 2024 07:42:20 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rgv-0000000Cs9v-1xSA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IZRpCxs1ZQTmZewSRGTv8tKfeNyI4SPc6Zju2MFK6Jg=;
	b=gvGGCXOiiOnY2rDmLIb1mGs6sM8ngd9H+Ubx8cwyBOCLGJZw7qlZOcuunFvutj
	4sonau3Vgnse4MItd3uIgjEAiNbE5MF82l2WMU4mLBUjPU5CRVmainI+IQUwOmIj
	NT8+pqAbZunxJG2GNOoxnRt0pe7iaKxfOz6SzpeSAUuRo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnT+o6eihndZamAQ--.16521S3;
	Mon, 04 Nov 2024 15:39:40 +0800 (CST)
Date: Mon, 4 Nov 2024 15:39:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v4] soc: imx: Add SoC device register for i.MX9
Message-ID: <Zyh6Oi+3cPXmMjz6@dragon>
References: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
 <ZydAVhFvHWCk6oNH@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZydAVhFvHWCk6oNH@dragon>
X-CM-TRANSID: Mc8vCgCnT+o6eihndZamAQ--.16521S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyrArW3tw1UGryrAryftFb_yoWfAFX_uF
	1DC34UWr1vgF4xuwn5Crn3ZFyftw1UXF98JrnFkFWfWry5Crn8JFs7X34fta1xW397tFy7
	CF1Sqr4FvwnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn6wZ7UUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRCNZWcoYCtN+gABsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_234002_665562_72812AAA 
X-CRM114-Status: GOOD (  12.18  )
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

On Sun, Nov 03, 2024 at 05:20:22PM +0800, Shawn Guo wrote:
> On Thu, Oct 31, 2024 at 02:54:38PM +0800, alice.guo@oss.nxp.com wrote:
> > From: "alice.guo" <alice.guo@nxp.com>
> > 
> > i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> > which are provided by the corresponding ARM trusted firmware API. This
> > patch intends to use SMC call to obtain these information and then
> > register i.MX9 SoC as a device.
> > 
> > Signed-off-by: alice.guo <alice.guo@nxp.com>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> 
> Applied, thanks!

I have to drop it for now, as I just recall that we should probe SoC
driver as platform driver.  Could you rework it a bit like what Marek
has done for soc-imx8m driver?

https://patchwork.kernel.org/project/imx/patch/20240929184930.73049-1-marex@denx.de/

Shawn


