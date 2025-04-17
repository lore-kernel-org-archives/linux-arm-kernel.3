Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA00C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZU2FPh5U8l6hTMl7qziYXfxC6u6n8ejdJYBkk8O/i0=; b=49DLSlylrHl/ywqPhlrMcQ8JmM
	bcfY/qrGmPO3umAauGSintoYNz3cgGgx9hhlUT7AEvGnbpARf9hnOqyV1Ip/7oSqOCxwFslEenT6G
	U+wpDwM/Q1JS7I0e6JNLABJll1+e8ctDj/VIWn85zo5EHnDlpKzXdNtg+mvKyoOMgVW1taxEZUptN
	XYbhgOLV2yxFgTdxNDDuVPAR91asesX63NQy75pGDxDXVFGWmtN/peAbkqIuM7gH75mwj5sggBmOh
	/FhSLQidmVMgV0NuNC2rqspNkPsUbYfWGl80U6o7eGfCXsu/+OTu754p3q9aC74d+Fz1rmByDQcrf
	GsaXHrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tki-0000000DzAu-2F8w;
	Thu, 17 Apr 2025 18:14:20 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TKZ-0000000DuVl-34ah;
	Thu, 17 Apr 2025 17:47:21 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zdlg51YQyz6L57h;
	Fri, 18 Apr 2025 01:45:53 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 297C8140146;
	Fri, 18 Apr 2025 01:47:18 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Apr
 2025 19:47:17 +0200
Date: Thu, 17 Apr 2025 18:47:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andy Shevchenko <andy@kernel.org>
CC: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
	<jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, "Cosmin
 Tanislav" <cosmin.tanislav@analog.com>, Tomasz Duszynski
	<tduszyns@gmail.com>, Jean-Baptiste Maneyrol
	<jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, Petre
 Rodan <petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
Message-ID: <20250417184716.000044bb@huawei.com>
In-Reply-To: <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_104719_913947_F07E9D5F 
X-CRM114-Status: GOOD (  10.59  )
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

On Thu, 17 Apr 2025 20:01:13 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:
> > Wile reviewing [1], I noticed a few more cases where we can use
> > aligned_s64 or need __aligned(8) on data structures used with
> > iio_push_to_buffers_with_timestamp().
> > 
> > [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/  
> 
> 
> Link: URL [1] :-)
In a cover letter? Not sure we care.  In general agree though.
> 
> This will help to maintainer with b4 as it manages tags.
> 
> > Signed-off-by: David Lechner <dlechner@baylibre.com>  
Also no need to sign off on cover letters as they don't end up in git.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> for non-commented patches.
> 


