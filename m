Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C091FC83F0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=632+rhx9yB6Fm/tjsLJEwD3si/omCndt8TY0nCUbZ2U=; b=YikV9uAajeuG5FaBxdS5YJSpWO
	1RevbTDf90xqy5VHySAFEnh3F0OvHUj2xBYsX2xwrarOU/CdNL3u15SRGfwp680vldpltXo/eZObo
	mXexhgaru8t3T0OFi8svBEFaapeRmIN3Y5QPCLA7riy7p0acjzhA+4LYp8rGR6UJz3EPrVAiH69gV
	2cnKYfGY83kpeN6IisC8UdVtiIDcpF3SmWW8XJUBVgGKvcF8qTNcMrAylUrrDf/qLRtaGvBGZAwZG
	lQr0zOvTGCphrcTWhKN/QATAk3UF7k4bwe05mLMddIFiY+Y/8M+PT130I86MzmrK0ey9RQjr6zsab
	nB4a+VFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyC-0000000EHq6-27xb;
	Fri, 04 Jul 2025 11:52:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcVN-0000000DtuA-0PVu;
	Fri, 04 Jul 2025 09:14:50 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bYScg4BMbz6L55T;
	Fri,  4 Jul 2025 17:14:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 546161404A9;
	Fri,  4 Jul 2025 17:14:43 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 4 Jul
 2025 11:14:42 +0200
Date: Fri, 4 Jul 2025 10:14:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>, <jic23@kernel.org>,
	<dlechner@baylibre.com>, <nuno.sa@analog.com>, <andy@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<kernel@collabora.com>
Subject: Re: [PATCH v2 4/6] iio: adc: mt6359: Move reference voltage to
 platform data
Message-ID: <20250704101441.00004cbd@huawei.com>
In-Reply-To: <cbd79481-474e-4c9f-bbe8-367917115ccd@collabora.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
	<20250703141146.171431-5-angelogioacchino.delregno@collabora.com>
	<aGaThTSAriz46D7T@smile.fi.intel.com>
	<cbd79481-474e-4c9f-bbe8-367917115ccd@collabora.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_021449_280963_76B9E2C9 
X-CRM114-Status: GOOD (  11.85  )
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

On Thu, 3 Jul 2025 16:40:38 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 03/07/25 16:28, Andy Shevchenko ha scritto:
> > On Thu, Jul 03, 2025 at 04:11:44PM +0200, AngeloGioacchino Del Regno wrote:  
> >> In preparation to add support for new PMICs, add a `vref_mv`  
> > 
> > I still think that the vref_mV is a better naming.
> >   
> 
> Ouch, I think I missed that comment; if there's nothing else to change,
> I wonder if the capital V can be fixed while applying?
> 
> Otherwise I can send a v3...
> 

If that's all that comes up I'll tweak whilst applying.

J

> Cheers,
> Angelo
> 
> >> the AUXADC_VOLT_FULL definition.
> >>
> >> As a consequence, the definition was also removed.  
> >   
> 
> 


