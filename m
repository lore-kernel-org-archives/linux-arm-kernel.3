Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67787C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwKYzZwBzARYFTnLsux7Eiv5inSyE2lM5w71jLeeHjM=; b=hEuFR25w1dhoZ0
	lALgIkmxHsaUwHqwI8yCtHC/ExDl3eRdB9aO5VWABBcpPHWIpEu8i42rRRe+p1s5pgoq54TL5dfKT
	Ho0/gzetECOdACRNlglWceV90Ngpw5mKRTt/NZ/kelpl8R4BpkcZvLNIABzGiO0i+NVEQcErXXC//
	EzEoK8eLN5nFFuLwr9KBTjI+BNLaV/1cHsrb+PJ+b2MHCzvstc3jc6KJEGdqCQT+62Q2huTa030z6
	++qvD59ADbHQUoyKiP6aWymvvLDs3DmIgMZZ42A9rxcQTt2fkggTVYRpjVd2kPlc4V1j56FmFtAaH
	TekWxh005Uuj41E0Bl6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3eQ-00000004k0c-2o0X;
	Tue, 08 Jul 2025 08:26:06 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3bA-00000004jJw-0qIf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:22:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbvGR4w7yz6GCk0;
	Tue,  8 Jul 2025 16:21:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 762A41404C5;
	Tue,  8 Jul 2025 16:22:36 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Jul
 2025 10:22:35 +0200
Date: Tue, 8 Jul 2025 09:22:34 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/5] arch_topology: update CPU map to use the new API
Message-ID: <20250708092234.00006fd5@huawei.com>
In-Reply-To: <ca58608c-c147-45a7-910f-41a7c312fd5a@kernel.org>
References: <20250707150414.620-1-alireza.sanaee@huawei.com>
	<20250707150414.620-3-alireza.sanaee@huawei.com>
	<ca58608c-c147-45a7-910f-41a7c312fd5a@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012244_382847_70E3061F 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: mark.rutland@arm.com, robh@kernel.org, saravanak@google.com, devicetree@vger.kernel.org, coresight@lists.linaro.org, suzuki.poulose@arm.com, linuxarm@huawei.com, dianders@chromium.org, shameerali.kolothum.thodi@huawei.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ruanjinjie@huawei.com, james.clark@linaro.org, linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 8 Jul 2025 08:29:43 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 07/07/2025 17:04, Alireza Sanaee wrote:
> > Cleans up the cpu-map generation using the created API.
> > 
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > ---
> >  drivers/base/arch_topology.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index 3ebe77566788..88970f13f684 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -518,23 +518,23 @@ core_initcall(free_raw_capacity);
> >   */
> >  static int __init get_cpu_for_node(struct device_node *node)
> >  {
> > +	struct device_node *cpu_node __free(device_node) = NULL;  
> 
> 
> That's not a correct style anymore. What's more it is not really
> explained anywhere. Follow standard cleanup.h rules (constructor).

There isn't a good solution in this case as the constructor is via
a pointer passed as an argument. I'd just fall back to not using
__free here and instead doing a manual put of the node in the
paths where it is set.   That might just be the final successful
return path - I've not checked closely.

> 
> 
> Best regards,
> Krzysztof


