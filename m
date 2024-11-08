Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEC9D64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5RnZ3odi4QDaI+8GhTuadJCJOPgMKKktFV1UAVTBLo=; b=01T9HUvdx9jiHpz7aWGqtUE3M5
	c/pZPrYr0OrD3zPdEIhGke94sRtvPGMo37fCONO7ptJGfLs5TZCb5vhWTHaxrDH51rT1SM6VXxwfD
	4c9C833CtRRn3bFNCJmovAQpnnMvDGL6Uhg/+AA5xcreOQZZrBUf151Lpf7KdZPZlGc4pM/fO5Lk3
	LUfnMtKW8cRfTVAnCNn5MPM6RJT0JcTmKeTIedGkbP6KxJmAebHIJKXsxS9fb8S8SFPhT9marxbp9
	iceyWXj7i52mmEqW36y7TZWAGXHznPJkIT4sAvUVxxpbd5dzBiHk5CuNFrOi5H+qfjOb5ahdzGCzs
	OvZIxx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtl-0000000BDG6-0QbF;
	Fri, 08 Nov 2024 16:31:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QgW-0000000AzZK-3CIv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8BBEA44102;
	Fri,  8 Nov 2024 15:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40592C4CECD;
	Fri,  8 Nov 2024 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731078843;
	bh=D1KdnZEqwOBAkW2gdT2OYagXEMiuHefSlBOJ+Jlh4Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPU8BB2hxklea4mlCBAKGkUL1VXNzNev8Gf9OaXw4U4XGqGcnoDJCLJ1RAq+pOQcF
	 osWdPeKLF3P4DCtV+h+eH4tWiDBKObPNj7OHVMgACVScEwKOO4SFjKVCXp1JYCYukr
	 sVx89JzBiAyqB/PODaA6dInFqMi0a03hdPBj8/4ns1ajaDltqGbsSAU8frDpbRps8H
	 BeT7Jn/rFmDn7OQLQDMHkrVjJNEtU0+7bCU2mFY1ycXfSwpjpDIxTUWrQ62JrrQJFW
	 UCL5yvHklEPA9Mnf5ac3fTh/r5tMZ8oGYjY2XgK/0PyB+FZcPmu72bBYpIdX7qp5ij
	 MkxqdymErTbWw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9QgX-000000005v6-0BX0;
	Fri, 08 Nov 2024 16:14:05 +0100
Date: Fri, 8 Nov 2024 16:14:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyvLktLUZOGP-LH5@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_071404_966003_741C536D 
X-CRM114-Status: GOOD (  30.57  )
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

On Wed, Nov 06, 2024 at 08:03:30PM +0000, Cristian Marussi wrote:
> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:

> > First, I expected the drivers to be loaded automatically when built as
> > modules, but that did not happen so something appears to be missing.

> Even though, module usage is tracked by the core AND when an SCMI Vendor
> driver tries to use protocol_X, it causes protocol_X to be initialized
> (calling its protocol_init), there is NO auto-loading for SCMI Vendor
> Protocols when bult as LKM...because there were really no ask till now
> and this stuff is in general needed so very early dburing boot...so the
> usecase of all these LKM modules is just debug/test as in your case
> (or in mine frequently)....
> 
> ...and I am NOT saying with this that is necessarily right or must be
> stay like this...just explaining how it is now....

Ok, thanks for clarifying.

> ....anyway...it is mostly trivial to add vendor/protocols autoloading
> transparently...today I was experimenting with a patch that triggers
> autoloading based on a generic common alias pattern in the form
> 'scmi-protocol-0x<NN>' (with NN the specific protocol ID of course)
> that triggers the loading as soon as the SCMI Vendor driver tries to
> access the protocol during its probe...
> 
> ....I will post it for the next cycle once it is clean.
> (unless I am missing something else that you want to add...)

Sounds like that would solve the issue. I was just expecting the memlat
client driver and its protocol dependency to be loaded automatically
when built as modules on machines that can use them (e.g. as we don't
want to have every vendor protocol driver built into distro kernels,
etc).

> > Second, after loading the protocol and client drivers manually (in that
> > order, shouldn't the client driver pull in the protocol?), I got:
> > 
> > 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> > 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> > 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> > 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> > 
> > which seems to suggest that the firmware on my CRD does not support this
> > feature. Is that the way this should be interpreted? And does that mean
> > that non of the commercial laptops supports this either?
> 
> This seems like FW rejecting the command, maybe just only for the specific
> Linux OSPM agent since it is not allowed to ask for that specific setup,
> and only Sibi can shed a light here :D
> 
> ...but this Vendor protocol, if I am not mistaken, AFAIU, uses a bunch
> of "algo strings" coming from tokens it picks from DT and use thsoe as
> params for the set_param() VendorProtocol ops...cannot be that a bad/missing
> DT value could cause the FW to reject the command due to the params ?
> (even if the command is supported)...
> 
> ...just a guess ah... I have no real knowledge of this venndor proto...

Yeah, hopefully Sibi can shed some light on this. I'm using the DT
patch (5/5) from this series, which according to the commit message is
supposed to enable bus scaling on the x1e80100 platform. So I guess
something is missing in my firmware.

Johan

