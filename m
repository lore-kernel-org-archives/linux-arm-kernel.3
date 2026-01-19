Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D886CCCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VbFI4jjDFMI1IkaujVKRVMn59KMGUlwvLMICW8U8Yo=; b=je/fszHbWwk9yDtEdNaFNpqbOU
	46eJdzx3R/tuNJP5ZpFrR6NRHAUJULDwcVwMYDTd2OzE416c80Hv7eXByLCWHOiCsbcX2r7GlucH3
	i24R1ccNkmYjpFRcdUDrU0wzNgK4w4lkOGWpURKUzf6JamC/HzOoVDScpOLJ+PuA9vY3W/cjnFPEn
	37mBD4e9/bK9GbfltjE4EXSPsfN4ngyO0OX9s4cSvqsXB9wbmYyP6010C98bbCe88+aTwGj/Mpr1F
	Csd6FaQPKOQg9STZO8QiAFOjv5ECYJ/IhAnky39HAQHDKWtWlRLFqXzunw35SgT/AeqM1TPsXwqzy
	FkUrGmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnHa-00000001sFA-1kE9;
	Mon, 19 Jan 2026 11:18:54 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnHU-00000001sDl-0e7K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:18:52 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dvnxh1ms2zHnHFg;
	Mon, 19 Jan 2026 19:18:00 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id E139E40570;
	Mon, 19 Jan 2026 19:18:29 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Jan
 2026 11:18:28 +0000
Date: Mon, 19 Jan 2026 11:18:27 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<sudeep.holla@arm.com>, <james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<d-gole@ti.com>, <elif.topuz@arm.com>, <lukasz.luba@arm.com>,
	<philip.radford@arm.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH v2 01/17] firmware: arm_scmi: Define a common
 SCMI_MAX_PROTOCOLS value
Message-ID: <20260119111827.00001704@huawei.com>
In-Reply-To: <20260114114638.2290765-2-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
	<20260114114638.2290765-2-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_031848_359076_084A72F5 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, 14 Jan 2026 11:46:05 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
> SCMI stack.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Hi Cristian,

Mention the introduction of SCMI_PROTOCOL_LAST in the patch description
and probably say why it takes that value (which is much less than
the SCMI_MAX_PROTOCOLS value).

Jonathan

> ---
>  drivers/firmware/arm_scmi/notify.c | 4 +---
>  include/linux/scmi_protocol.h      | 3 +++
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index dee9f238f6fd..78e9e27dc9ec 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -94,8 +94,6 @@
>  #include "common.h"
>  #include "notify.h"
>  
> -#define SCMI_MAX_PROTO		256
> -
>  #define PROTO_ID_MASK		GENMASK(31, 24)
>  #define EVT_ID_MASK		GENMASK(23, 16)
>  #define SRC_ID_MASK		GENMASK(15, 0)
> @@ -1673,7 +1671,7 @@ int scmi_notification_init(struct scmi_handle *handle)
>  	ni->gid = gid;
>  	ni->handle = handle;
>  
> -	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
> +	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTOCOLS,
>  						sizeof(char *), GFP_KERNEL);
>  	if (!ni->registered_protocols)
>  		goto err;
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index aafaac1496b0..c6efe4f371ac 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -926,8 +926,11 @@ enum scmi_std_protocol {
>  	SCMI_PROTOCOL_VOLTAGE = 0x17,
>  	SCMI_PROTOCOL_POWERCAP = 0x18,
>  	SCMI_PROTOCOL_PINCTRL = 0x19,
> +	SCMI_PROTOCOL_LAST = 0x7f,
>  };
>  
> +#define SCMI_MAX_PROTOCOLS	256
> +
>  enum scmi_system_events {
>  	SCMI_SYSTEM_SHUTDOWN,
>  	SCMI_SYSTEM_COLDRESET,


