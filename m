Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D23C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWHWsFxVNliajgkItvwKp+DuihIwOwMdJ2GkvMNKmIA=; b=b7gp9gU267y1+8Sos3yiU4sHdc
	2DVf4Iah64UeMlFCqgzaDjeHOT1+lXWacoR7x6IPSo2kxWMXf4kBlTXXr8Q49oNnaIbzQte6W6G0Z
	I/zCbBmIneB8AMfQFq29XH1nW5kWEEHm8GYyp0d7mQEWCJYyCsEcRqGA2DBaS/khPwOw18iK75Mwy
	tk0AH4fPy40+qr/wSen3FIoiI0nqL4WqbwgPemfTVzbaP6TOnoRtXUMdAFFYFgAtVavAkiZVD6AAX
	r9Uqzfa72MeDu1ng0gU8AkJnJLv0cT5j6fDKmI/JA5tMqbGNHrWaws/FS9yhAOzOT9ped/aOKkESk
	M+AL77tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU9p-00000009Vfq-3RHn;
	Wed, 25 Jun 2025 17:43:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQfS-00000008t2j-07hn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:00:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3238D106F;
	Wed, 25 Jun 2025 06:59:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A59E3F66E;
	Wed, 25 Jun 2025 06:59:56 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:59:46 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 1/7] firmware: arm_scmi: Define a common
 SCMI_MAX_PROTOCOLS value
Message-ID: <aFwA0n2krgW0_cNr@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-2-cristian.marussi@arm.com>
 <20250624031351.GC10415@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624031351.GC10415@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_070002_107815_40221754 
X-CRM114-Status: GOOD (  15.90  )
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

On Tue, Jun 24, 2025 at 11:13:51AM +0800, Peng Fan wrote:
> On Fri, Jun 20, 2025 at 08:28:07PM +0100, Cristian Marussi wrote:
> >Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
> >SCMI stack.
> >

Hi Peng,

thanks for having a look.

> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/notify.c | 4 +---
> > include/linux/scmi_protocol.h      | 3 +++
> > 2 files changed, 4 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> >index e160ecb22948..27a53a6729dd 100644
> >--- a/drivers/firmware/arm_scmi/notify.c
> >+++ b/drivers/firmware/arm_scmi/notify.c
> >@@ -94,8 +94,6 @@
> > #include "common.h"
> > #include "notify.h"
> > 
> >-#define SCMI_MAX_PROTO		256
> >-
> > #define PROTO_ID_MASK		GENMASK(31, 24)
> > #define EVT_ID_MASK		GENMASK(23, 16)
> > #define SRC_ID_MASK		GENMASK(15, 0)
> >@@ -1652,7 +1650,7 @@ int scmi_notification_init(struct scmi_handle *handle)
> > 	ni->gid = gid;
> > 	ni->handle = handle;
> > 
> >-	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
> >+	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTOCOLS,
> > 						sizeof(char *), GFP_KERNEL);
> > 	if (!ni->registered_protocols)
> > 		goto err;
> >diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> >index 688466a0e816..6f8d36e1f8fc 100644
> >--- a/include/linux/scmi_protocol.h
> >+++ b/include/linux/scmi_protocol.h
> >@@ -926,8 +926,11 @@ enum scmi_std_protocol {
> > 	SCMI_PROTOCOL_VOLTAGE = 0x17,
> > 	SCMI_PROTOCOL_POWERCAP = 0x18,
> > 	SCMI_PROTOCOL_PINCTRL = 0x19,
> >+	SCMI_PROTOCOL_LAST = 0xff,
> 
> The enum says this is std protocol, but 0x80~0xff is for vendor extension.
> It might confuse others to keep "SCMI_PROTOCOL_LAST" here.
> 

Yes indeed. This patch was lingering around since ages in my trees and
it is probably to review in itself.

> > };
> > 
> >+#define SCMI_MAX_PROTOCOLS	(SCMI_PROTOCOL_LAST + 1)
> 
> How about "#define SCMI_MAX_PROTOCOLS 256" as the line you removed in notify.c.
> 

Yes, probably the easiest thing to do.

Thanks,
Cristian

