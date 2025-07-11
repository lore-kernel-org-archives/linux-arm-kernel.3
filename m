Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F404BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j0jqJPEbLjGvO3x4LIJknZ+8gxAOJOXwXGCHnsrgqQ=; b=q602THHqZr7c6E
	OJLjkYY+LY5IKIhYH4XeasB72vy/eLWZC8OZblz+00kFkCp+UVRBcGFd7Gg+2r6FQM4kyryfDHeo5
	rnzRlitkDoqCM3vwlg3bY/1cJzUxZS83TLGtTgvkNlylezsJ5/qm9WuBHnNrpF88mGnspxdP+MAyh
	AFb6EMxgdqozWhWBgkJOY8JaI7qcA4Oa0YjH2XmTKXCIYteTZo2LoRMP/8w0ueArpFoG+66BAeEdO
	sHuD3LJwzlmF17d4enzyM4V8DYX2PCvE/KaxpGUcD5MJH9tHuLj30iwqHSe15WZRa0kZ2U98VnaKp
	LJoAPvG3QJ5qzurUu5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGxu-0000000FKyA-3RRk;
	Fri, 11 Jul 2025 16:51:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGIp-0000000FEeS-00zH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:08:48 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdxPt6dkMz6L56p;
	Sat, 12 Jul 2025 00:05:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 670101400D3;
	Sat, 12 Jul 2025 00:08:41 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 18:08:40 +0200
Date: Fri, 11 Jul 2025 17:08:39 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v2 3/5] coresight: cti: Use of_cpu_phandle_to_id for
 grabbing CPU id
Message-ID: <20250711170839.0000688c@huawei.com>
In-Reply-To: <CAJ9a7VhfW2RYXv6ZO28m65C75iyJUqTYos1tFXs8gAG5gx9yDA@mail.gmail.com>
References: <20250708151502.561-1-alireza.sanaee@huawei.com>
	<20250708151502.561-4-alireza.sanaee@huawei.com>
	<CAJ9a7VhfW2RYXv6ZO28m65C75iyJUqTYos1tFXs8gAG5gx9yDA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_090847_188738_306D8016 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: mark.rutland@arm.com, robh@kernel.org, saravanak@google.com, devicetree@vger.kernel.org, coresight@lists.linaro.org, linuxarm@huawei.com, dianders@chromium.org, krzk@kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, shameerali.kolothum.thodi@huawei.com, ruanjinjie@huawei.com, james.clark@linaro.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 11 Jul 2025 16:55:15 +0100
Mike Leach <mike.leach@linaro.org> wrote:

> Hi,
> 
> On Tue, 8 Jul 2025 at 16:16, Alireza Sanaee <alireza.sanaee@huawei.com> wrote:
> >
> > Use the newly created API to grab CPU id.
> >
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > ---
> >  .../hwtracing/coresight/coresight-cti-platform.c   | 14 +-------------
> >  1 file changed, 1 insertion(+), 13 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> > index d0ae10bf6128..e1dc559d54aa 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> > @@ -41,20 +41,8 @@
> >   */
> >  static int of_cti_get_cpu_at_node(const struct device_node *node)
> >  {
> > -       int cpu;
> > -       struct device_node *dn;
> > +       int cpu = of_cpu_phandle_to_id(node, NULL, 0);
> >
> > -       if (node == NULL)
> > -               return -1;
> > -
> > -       dn = of_parse_phandle(node, "cpu", 0);
> > -       /* CTI affinity defaults to no cpu */
> > -       if (!dn)
> > -               return -1;
> > -       cpu = of_cpu_node_to_id(dn);
> > -       of_node_put(dn);
> > -
> > -       /* No Affinity  if no cpu nodes are found */  
> 
> Leave the above comment in place.
> 
> >         return (cpu < 0) ? -1 : cpu;
> >  }
> >
> > --
> > 2.43.0
> >  
> 
> With that
> 
> Reviewed-by: Mike Leach <mike.leach@linro.org>
Just in case Ali doesn't notice - typo in your address Mike!
(usually it is me who manages that ;)



