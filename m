Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CBDD59F6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFEXz+Kt/Bj9JMr7EmzrkZnEqwbRmWZ7uKnA5BbGehA=; b=VLkTZnaxDbsFG8b39ADr6DlIEl
	MX+cwupMADNXY4A+F9ZCGkgyvOLKZucyP/wXQR363Kb3bMNU0WL0EC3OxJT9zev4aDbi+Iw1MaRt0
	BFUEauGoX3EDVwWedtgpTIPanykTQKdxLHWbRD0oIneDR2pFU8Lr60xFlE7mCKxgDFLTPVFIAWwJI
	pQ0CQjFpFHktUXzO6hp6m36mObVVNZ0WT5xelbNuJv83haZpgD78BcozTR/nqyktWoY16BOFjgGk0
	GpHhmiIsWDmTCn/CSEoyJl4QahJyMP/HLf/g0ybeCrIE3BAoQq1zRwLa9L6AsXTjZv53oyV1ZJW/x
	X0yhrIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mHo-00000004e7O-3Ofy;
	Wed, 06 Nov 2024 20:05:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mFt-00000004dm6-1ssE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 20:03:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ADD7497;
	Wed,  6 Nov 2024 12:04:16 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 490D43F528;
	Wed,  6 Nov 2024 12:03:43 -0800 (PST)
Date: Wed, 6 Nov 2024 20:03:30 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <ZyvLktLUZOGP-LH5@pluto>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZytnRc94iKUfMYH0@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_120353_602572_1077EEB8 
X-CRM114-Status: GOOD (  30.22  )
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

On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
> On Mon, Oct 07, 2024 at 11:40:18AM +0530, Sibi Sankar wrote:
> > The QCOM SCMI vendor protocol provides a generic way of exposing a
> > number of Qualcomm SoC specific features (like memory bus scaling)
> > through a mixture of pre-determined algorithm strings and param_id
> > pairs hosted on the SCMI controller. Introduce a client driver that
> > uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
> > to detect memory latency workloads and control frequency/level of
> > the various memory buses (DDR/LLCC/DDR_QOS).
> > 
> > QCOM SCMI Generic Vendor protocol background:
> > It was found that a lot of the vendor protocol used internally was
> > for debug/internal development purposes that would either be super
> > SoC specific or had to be disabled because of some features being
> > fused out during production. This lead to a large number of vendor
> > protocol numbers being quickly consumed and were never released
> > either. Using a generic vendor protocol with functionality abstracted
> > behind algorithm strings gave us the flexibility of allowing such
> > functionality exist during initial development/debugging while
> > still being able to expose functionality like memlat once they have
> > matured enough. The param-ids are certainly expected to act as ABI
> > for algorithms strings like MEMLAT.
> 
> I wanted to give this series a quick spin on the x1e80100 CRD, but ran
> into some issues.
> 
> First, I expected the drivers to be loaded automatically when built as
> modules, but that did not happen so something appears to be missing.
> 

Hi Johan,

so the SCMI stack is fully modularizable as of this release, i.e.

 - SCMI core (scmi-core + scmi-module)
 - SCMI transports (scmi_transport_{mailbox,virtio,smc,optee}
 - optional SCMI Vendor protos
 - Std and Vendor SCMI Drivers on top of protos

....on the other side the SCMI standard protocols are still embedded
in scmi-module (or builtin) as of now...

Even though, module usage is tracked by the core AND when an SCMI Vendor
driver tries to use protocol_X, it causes protocol_X to be initialized
(calling its protocol_init), there is NO auto-loading for SCMI Vendor
Protocols when bult as LKM...because there were really no ask till now
and this stuff is in general needed so very early dburing boot...so the
usecase of all these LKM modules is just debug/test as in your case
(or in mine frequently)....

...and I am NOT saying with this that is necessarily right or must be
stay like this...just explaining how it is now....

....anyway...it is mostly trivial to add vendor/protocols autoloading
transparently...today I was experimenting with a patch that triggers
autoloading based on a generic common alias pattern in the form
'scmi-protocol-0x<NN>' (with NN the specific protocol ID of course)
that triggers the loading as soon as the SCMI Vendor driver tries to
access the protocol during its probe...

....I will post it for the next cycle once it is clean.
(unless I am missing something else that you want to add...)

> Second, after loading the protocol and client drivers manually (in that
> order, shouldn't the client driver pull in the protocol?), I got:
> 
> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> 
> which seems to suggest that the firmware on my CRD does not support this
> feature. Is that the way this should be interpreted? And does that mean
> that non of the commercial laptops supports this either?

This seems like FW rejecting the command, maybe just only for the specific
Linux OSPM agent since it is not allowed to ask for that specific setup,
and only Sibi can shed a light here :D

...but this Vendor protocol, if I am not mistaken, AFAIU, uses a bunch
of "algo strings" coming from tokens it picks from DT and use thsoe as
params for the set_param() VendorProtocol ops...cannot be that a bad/missing
DT value could cause the FW to reject the command due to the params ?
(even if the command is supported)...

...just a guess ah... I have no real knowledge of this venndor proto...


Thanks,
Cristian


