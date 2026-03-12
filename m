Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49521FED2E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+BHwLwGTC9buFNuVJJj2C5HiiQN1vRFWKn+Wc70FFA=; b=RHiLKUJvdh3S1EfFI1TQxZFfGY
	cQEMoLky2d/VpevNQxid2lUwdkHhRB9WPieCQx7TJi58z6sEG6wY/SJPjPjWdIjBlrVZ8dhPP6Fif
	Vq5QuN4w4WuJoEmmKqK2qQPVWalJHj/OM4AfD1jVN1p8t7iScorv+ieAnEulaotJXdZByVT8MU3O2
	ZO0l8C0aEj5rEDxS498fp0DC25Og+U3KLJfjp+fTQ0XGBnmVnEActrIp0gRDWMBFjD4mY9vXuKi0w
	L5lJcdyA0vU4wPfj2RXZLl6eP9AsdCMRwBTqKkmyniduozVaswbztFOWOf7ISn1WkWP9ipnkxo9Aw
	e5d0ni0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hMq-0000000EFrM-2dxE;
	Thu, 12 Mar 2026 14:50:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hMk-0000000EFp3-0fWO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:50:25 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fWr9X4TXYzJ46fS;
	Thu, 12 Mar 2026 22:49:20 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 9CA7540572;
	Thu, 12 Mar 2026 22:50:08 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Mar
 2026 14:50:07 +0000
Date: Thu, 12 Mar 2026 14:50:06 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<Dmitry.Lamerov@arm.com>, <catalin.marinas@arm.com>, <bp@alien8.de>,
	<robh@kernel.org>, <rafael@kernel.org>, <will@kernel.org>,
	<conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <krzk+dt@kernel.org>, <Michael.Zhao2@arm.com>,
	<tony.luck@intel.com>
Subject: Re: [PATCH v2 11/11] RAS: add DeviceTree firmware-first CPER
 provider
Message-ID: <20260312145006.00000770@huawei.com>
In-Reply-To: <4a193f85-e0ed-4367-b69b-587b2cbc977f@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
	<20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-11-347fa2d7351b@arm.com>
	<20260224155520.00004e92@huawei.com>
	<4a193f85-e0ed-4367-b69b-587b2cbc977f@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_075022_504895_E8C95E9D 
X-CRM114-Status: GOOD (  17.24  )
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


> >> +Firmware-first CPER via DeviceTree
> >> +----------------------------------
> >> +
> >> +Some systems expose Common Platform Error Record (CPER) data
> >> +via DeviceTree instead of ACPI HEST tables.  
> > 
> > I'd argue this isn't really DT specific, it's just not ACPI table.
> > You could for instance use PRP0001 and wire this up on ACPI with only
> > one trivial change to generic property.h accessor for the boolean.
> > 
> > Or use another firmware information source entirely.  
> 
> I'm intentionally keeping the scope DT-only for this series,
> so I'll keep the wording DT-focused.

Why?  Generally when the support works fine with generic firmware
accessors that's preferred because there are no real disadvantages.

> >> +#include <acpi/ghes.h>
> >> +#include <acpi/ghes_cper.h>
> >> +
> >> +static atomic_t ghes_ffh_source_ids = ATOMIC_INIT(0);  
> > I'd normally expect an IDA or similar. If nothing else it clearly
> > indicates we only want a unique ID.  
> 
> I'll keep the atomic for now; it's just a monotonic unique ID with no
> lifetime tracking. If you strongly prefer IDA I can switch.

If it doesn't 'need' to be monotonic due to some design issue then
yes I'd prefer an IDA.


> >> +	spinlock_t lock;
> >> +};  
> > 
> >   
> >> +
> >> +static void ghes_ffh_process(struct ghes_ffh *ctx)
> >> +{
> >> +	unsigned long flags;
> >> +	int sev;
> >> +
> >> +	spin_lock_irqsave(&ctx->lock, flags);  
> > 
> > guard() + include cleanup.h. Then can do returns in error paths.  
> 
> Agreed. I'll switch to guard() and include <linux/cleanup.h>.
A general process thing.  If you agree with a suggestion, just
do it and crop that section of the email thread out.
Reply that you agree tends not to benefit anyone!


> 
> >> +			ghes_estatus_cache_add(ctx->generic, ctx->estatus);
> >> +	}
> >> +
> >> +	ghes_cper_handle_status(ctx->dev, ctx->generic, ctx->estatus, ctx->sync);
> >> +
> >> +	ghes_ffh_ack(ctx);
> >> +
> >> +out:
> >> +	spin_unlock_irqrestore(&ctx->lock, flags);
> >> +}
...

> >> +{
> >> +	struct ghes_ffh *ctx;
> >> +	struct resource *res;
> >> +	int rc;
> >> +
> >> +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> >> +	if (!ctx)
> >> +		return -ENOMEM;
> >> +
> >> +	spin_lock_init(&ctx->lock);
> >> +	ctx->dev = &pdev->dev;
> >> +	ctx->sync = of_property_read_bool(pdev->dev.of_node, "arm,sea-notify");  
> > Hmm. I'd allow for other firmware types with
> > 	device_property_read_bool() instead.  
> 
> Given DT-only scope, I'll keep of_property_read_bool() here.
> 
> >> +
> >> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> +	if (!res) {
> >> +		dev_err(&pdev->dev, "status region missing\n");  

Jonathan


