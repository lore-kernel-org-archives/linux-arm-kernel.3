Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C02FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzHBSGDBCNOg5W3lz120DjabCPYaoJibXXim5/NGyYo=; b=27V6ZbVHKPVrvhylEq/AjZzTUq
	IiMRDAL5pK/wKXs7z2M8NrC6Cl2IuVkmQ+WacpZDsMmu48Gzbh4AYHpADmxUYSnNy06/pEss6vt9v
	yCrtrPMF8gOzx3QyJz26g/6PSJm2pQiX/r0bwCpbV+9CK4LcLvtleaBznawWarRaxHhIOdTUOwZvb
	Q10c6HnGY/FpSOgaElfWUogi1/1YHvSjQJMpgKf6pjCuVPnjSFMFEkTGKrK0dAKUEn+nOEFuYcfCo
	HLy9drfLGxi7+yY/y1rRstFP9s4PXr9OH8QxeLPTfxt92P7lmPYSjX+24zZ1MVJVOGaBeZuirlffw
	5SMpYQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtLn-0000000EQDN-1f9r;
	Mon, 20 Oct 2025 17:07:15 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtLk-0000000EQC1-2E9a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:07:14 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr1wH5y3pz6M5Bc;
	Tue, 21 Oct 2025 01:03:27 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 15A4C140276;
	Tue, 21 Oct 2025 01:07:05 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 18:07:04 +0100
Date: Mon, 20 Oct 2025 18:07:02 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/8] firmware: arm_scmi: Set fwnode for the genrated
 SCMI platform device
Message-ID: <20251020180702.00005106@huawei.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-1-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<20251017-acpi_scmi_pcc-v1-1-0adbab7709d9@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.75]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_100712_717649_7765E492 
X-CRM114-Status: GOOD (  14.65  )
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

On Fri, 17 Oct 2025 14:23:44 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

generated (in patch title).

> Add a call to device_set_node() in the SCMI probe helper to associate
> generated SCMI platform device with the firmware node of its supplier
> transport device.
> 
> This complements device_set_of_node_from_dev() and ensures that
> firmware node information is propagated correctly for both Device Tree
> and non-DT (e.g. ACPI) based systems.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 07b9e629276d..911941e6885d 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -473,6 +473,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
>  		return -ENOMEM;						       \
>  									       \
>  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \

device_set_node() is supposed to handle both dt and ACPI. So this surprised me
and I went digging.

dev_fnode for acpi is dev->fwnode, for of it is of_fwnode_handle(dev->of_node)
Which is dev->of_node->fwnode

So for acpi this is
	device_set_node(&spdev->dev, dev->fwnode);
which is:
	spdev->dev->fwnode = fwnode;
	spdev->dev->of_node = NULL; 

For dt
	device_set_node(&spdev->dev, dev->of_node->fwnode);
which is
	spdev->dev->fwnode = dev->of_node->fwnode;
	spdev->dev->opf-node = dev->of_node; (via some container of magic)


The device_set_of_node_from_dev(&spdev->dev, dev)
is same as:
	of_node_put(spdev->dev->of_node);
	spdev->dev->of_node = of_node_get(dev->of_node);
	spdev->dev->of_node_reused = true;

So subject to some reference counting that I don't think you need as the
spdev->dev parent is the dev here, the first call does nothing extra.

Maybe I missed something?

Jonathan




>  									       \
>  	strans.supplier = dev;						       \
>  	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
> 


