Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E9CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYva0zJP6Rmxup2wFI4YtWjjpjCUlkRQ1dY8dRLxW4A=; b=0+/52N1/wHPoiIkjBjsyqThOND
	pwW7GZ8855Ek0+iB8oFV9dK4y5c2GojsZRsSX00d78BSbunZLgXOtH1XtjSPp4zEg6FbiEsmGyfgT
	hYqVEMOU8fMx3Yqj/yxp3mZwVmZXutudekr+oZe1hmZOgsZVCTgVH+PqHqS+nB4FM+KLoSf6gVBRu
	A7i7NJgs1E4X0Ur7NJIAlfN8+2CWIbSMprWKcDY7CI/gUEvLS0tBN9I0mkAZay+7m5HImgGgaijNw
	QopUkFIjKe2uqkpdRI+V5DQ0MVdhMdtGCHg9sa3SCesQ26ppAZ0nxM10w03pNJvVN3m0YTOFEp2ZJ
	KTWDEyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8HC-0000000GNp6-27LO;
	Tue, 21 Oct 2025 09:03:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8H9-0000000GNoL-2fkQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:03:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC911063;
	Tue, 21 Oct 2025 02:03:18 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAD483F66E;
	Tue, 21 Oct 2025 02:03:25 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:03:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/8] firmware: arm_scmi: Set fwnode for the genrated SCMI
 platform device
Message-ID: <20251021-tireless-urchin-of-ampleness-cbfbd7@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-1-0adbab7709d9@arm.com>
 <20251020180702.00005106@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020180702.00005106@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_020327_790304_60BB5D08 
X-CRM114-Status: GOOD (  25.16  )
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

On Mon, Oct 20, 2025 at 06:07:02PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:44 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> generated (in patch title).
> 
> > Add a call to device_set_node() in the SCMI probe helper to associate
> > generated SCMI platform device with the firmware node of its supplier
> > transport device.
> > 
> > This complements device_set_of_node_from_dev() and ensures that
> > firmware node information is propagated correctly for both Device Tree
> > and non-DT (e.g. ACPI) based systems.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/common.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index 07b9e629276d..911941e6885d 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -473,6 +473,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
> >  		return -ENOMEM;						       \
> >  									       \
> >  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> > +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
> 
> device_set_node() is supposed to handle both dt and ACPI. So this surprised me
> and I went digging.
> 
> dev_fnode for acpi is dev->fwnode, for of it is of_fwnode_handle(dev->of_node)
> Which is dev->of_node->fwnode
> 
> So for acpi this is
> 	device_set_node(&spdev->dev, dev->fwnode);
> which is:
> 	spdev->dev->fwnode = fwnode;
> 	spdev->dev->of_node = NULL; 
> 
> For dt
> 	device_set_node(&spdev->dev, dev->of_node->fwnode);
> which is
> 	spdev->dev->fwnode = dev->of_node->fwnode;
> 	spdev->dev->opf-node = dev->of_node; (via some container of magic)
> 
> 
> The device_set_of_node_from_dev(&spdev->dev, dev)
> is same as:
> 	of_node_put(spdev->dev->of_node);
> 	spdev->dev->of_node = of_node_get(dev->of_node);
> 	spdev->dev->of_node_reused = true;
> 
> So subject to some reference counting that I don't think you need as the
> spdev->dev parent is the dev here, the first call does nothing extra.
> 
> Maybe I missed something?
> 

No, you didn’t miss anything. You’ve articulated my analysis well - the same
points I had intended to include in my commit messages but had forgotten those
details of at the time of writing the commit message.

I retained the call to device_set_of_node_from_dev() primarily because it sets
dev->of_node_reused = true.

I’m not entirely certain about the implications of not setting this flag, and
it wouldn’t be set if we used only device_set_node().

Thank you for noticing this and bringing it up for discussion. I had planned
to raise this when I first observed it and made the change, but unfortunately
didn’t document it properly - that would have saved you from having to
rediscover the details yourself.

I’m fine with whichever solution we agree on. I retained both calls
intentionally to prompt exactly this kind of discussion.

-- 
Regards,
Sudeep

