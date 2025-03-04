Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389C3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMcI+cXZGABb51aVn5Gf0/vwUKUlUIvwtwFRy+dg7/k=; b=jK3zuvzWa2dQncHSUvUr21lLTj
	8meri2r5TVAysofqALnRYavDSK8GUR8c+82QKWRiPeA+vIRSE0OWnwcgiKI5qfuBNDAVPvzwOF1Gp
	R/L8N49J0yQGTe3HEIx/L935JpMSNQcpcye8ObvLHtIU/WoQSIID9Yxp8lpHyz9hUhevMNIY5JPdF
	RZVd5+u+iK8iZvYFpV4hnzJmlbGKQPK+VX4zDv+RQ75WXeBKzv6309C61uW1AQQbVcPDrTPvGjzzi
	uPwx667JZ71/04SzxdAcktDSUe26yvDoXmsVK3328bltb4pY39UlryI3iW4Oqfk4ilSjFhnJ+2f1S
	i7DcgtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOxg-000000040Q3-3WgB;
	Tue, 04 Mar 2025 09:53:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOuK-00000003zON-3Mwt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:49:50 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z6W7F0Vl1z6D90N;
	Tue,  4 Mar 2025 17:47:21 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 01C8F140A08;
	Tue,  4 Mar 2025 17:49:33 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Mar
 2025 10:49:24 +0100
Date: Tue, 4 Mar 2025 17:49:19 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Will Deacon <will@kernel.org>
CC: Yicong Yang <yangyicong@huawei.com>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 4/9] drivers/perf: hisi: Use ACPI driver_data to
 retrieve SLLC PMU information
Message-ID: <20250304174919.00001e24@huawei.com>
In-Reply-To: <20250301064347.GB27700@willie-the-truck>
References: <20250218092000.41641-1-yangyicong@huawei.com>
	<20250218092000.41641-5-yangyicong@huawei.com>
	<20250301064347.GB27700@willie-the-truck>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_014948_986135_ACB62F8E 
X-CRM114-Status: GOOD (  19.92  )
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

On Sat, 1 Mar 2025 06:43:49 +0000
Will Deacon <will@kernel.org> wrote:

> On Tue, Feb 18, 2025 at 05:19:55PM +0800, Yicong Yang wrote:
> > From: Junhao He <hejunhao3@huawei.com>
> > 
> > Make use of struct acpi_device_id::driver_data for version specific
> > information rather than judge the version register. This will help
> > to simplify the probe process and also a bit easier for extension.
> > 
> > Factor out SLLC register definition to struct hisi_sllc_pmu_regs.
> > No functional changes intended.
> > 
> > Signed-off-by: Junhao He <hejunhao3@huawei.com>
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >  drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 191 ++++++++++++------
> >  1 file changed, 125 insertions(+), 66 deletions(-)
> > 
> > diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> > index dbd079016fc4..c1fd60d397c3 100644
> > --- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> > +++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> > @@ -36,11 +36,14 @@
> >  #define SLLC_SRCID_NONE			0x0
> >  #define SLLC_TGTID_EN			BIT(5)
> >  #define SLLC_TGTID_NONE			0x0
> > -#define SLLC_TGTID_MIN_SHIFT		1
> > -#define SLLC_TGTID_MAX_SHIFT		12
> > -#define SLLC_SRCID_CMD_SHIFT		1
> > -#define SLLC_SRCID_MSK_SHIFT		12
> > +#define SLLC_TGTID_MIN_MSK		GENMASK(11, 1)
> > +#define SLLC_TGTID_MAX_MSK		GENMASK(22, 12)
> > +#define SLLC_SRCID_CMD_MSK		GENMASK(11, 1)
> > +#define SLLC_SRCID_MSK_MSK		GENMASK(22, 12)
> >  #define SLLC_NR_EVENTS			0x80
> > +#define SLLC_EVENT_CNTn(cnt0, n)	((cnt0) + (n) * 8)
> > +#define SLLC_FIRST_BIT(_mask)		(find_first_bit((const unsigned long *)&(_mask), 32))
> > +#define SLLC_FIELD_PREP(_mask, _val)	(_mask & (_val << SLLC_FIRST_BIT(_mask)))  
> 
> It's a bit of a shame to have to compute this dynamically given that th
> input mask is constant for a given device. Is it not possible to use the
> generic FIELD_PREP macro in per-device code and then just dispatch to
> that, instead of funneling everything through hisi_sllc_pmu_regs?
There is yet another ongoing discussion of handling non const
field cases:
https://lore.kernel.org/all/cover.1739540679.git.geert+renesas@glider.be/

Maybe that will resolve with a nicer solution but I doubt it.

Alternatively best plan may be a shift (and length) instead
of the neat solution of FIELD_PREP().

Jonathan

> 
> Will


