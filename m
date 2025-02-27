Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56699C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FchCnFdXZIvgNrmRKba4B0cXbIE27vqylGGiyuaqzrI=; b=EFv1YDYxdisW1PPDg/TPlV6Eb/
	CEAEmU5dlnHUcGw2cFVnbjJzuFu3WbrJat3+blZs5GQYgWg0fYAXxYY1WkMgsb8Fz0yXbyCY3fgUz
	+OkSLBy0Ja3GzmYz3Tc7RWJTgCx7GmQP9vdhzSk8pXNSfxqAmeq7RndQY8Eh+yjt3Hpk5GBxviAND
	aAkds6djkAxObRqDi6f+h/kYs1onOeojWoLk5gpiyfpKC6ScOv3nhRNU46XtgZpLj0efc3ybpeIfh
	z3dZwJA3MzSzwh0IdQe6KVowfDpSeL3DU2wVEXJsAcv3Os82qCiR4rfXiU4UjyPIultGDkweQj7YZ
	dt+xsy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncuu-00000007Lpe-1irR;
	Thu, 27 Feb 2025 12:23:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncNz-00000007Et8-2vib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:49:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82B831688;
	Thu, 27 Feb 2025 03:49:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 015903F6A8;
	Thu, 27 Feb 2025 03:49:00 -0800 (PST)
Date: Thu, 27 Feb 2025 11:48:51 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, saravanak@google.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
Message-ID: <Z8BRFezgiWDtmdd4@pluto>
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_034903_826087_A33C4B88 
X-CRM114-Status: GOOD (  22.69  )
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

On Wed, Feb 26, 2025 at 05:44:56PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for the protocols by adding new nodes
> The current nodename pattern is "protocol@[0-9a-f]+$", the new node

Hi Peng,

> name will be "scmi-[a-z\-]+$".
> With compatible string and new nodename, cpufreq and devfreq could be
> separated into two nodes. And fwdevlink could correctly link suppliers
> and consumers.

beside the backward compatibility issues that Rob mentioned, the thing
that worries me most is that, while the current bindings describe the
SCMI protocols because the protocols are WHAT the platform FW exposes
(and that is all that is needed by drivers to refer to a protocol and
its resources)...here you are getting rid of all of this, and moving to
describe basically the various devices that will use a protocol,
potentially the same protocol, just to have a distinct fw_node ...
(...I mean my understanding is that there wont be any protocol nodes
left when the scmi- variant are present and, once, somehow, we will
have transitioned into this...right ?)

I haven't really had the time to go through properly your proposed
solution to understand fully all its possible side-effects and how
many SCMI features could be destroyed by removing protocol nodes
descriptor as a whole...but...off the top of my head, as a quick
example, how you will define a per-protocol dedicated transport
channel in this new scenario ?
...because You wont have anymore a protocol descriptor where to fit
this AND you could have multiple DT nodes describing drivers that use
that SAME protocol, so using this new nodes to fit the same
transport-chan descriptors wont be possible either....

IOW, sincerely, I understand you want to resolve the problem with
fw_devlink (me too), but nuking down everything, while loosing, possibly,
a number of the existing functionalities of the SCMI stack just to make
it work with fw_devlink at all cost it does not seem to me an acceptable
trade-off...

...killing the whole existing protocols descriptors structure seems to
me a recipe for disaster, also because, it just goes against the very
essence of the objects that the FW exposes and the bindings can describe:
as an example, the SCMI platform server manage and exposes PERF_PROTOCOL
and its related DOMAINS (all fully discoverable without any bindings),
so, THAT is what is described in the bindings and referred by SCMI driver
users: SCMI FW does NOT handle/expose TWO distinct perf devices, like the
cpufreq/devfreq-device that you are trying to describe...

As Sudeep mentioned, IMHO this seems mostly an *unsolved* implementation
problem more than an actual issue with the bindings and how we describe
SCMI resources that we need to refer to..

> With compatible string, and driver updated.
> - Differnet vendor drivers with same SCMI protocol ID could be built in
>   without concerning vendor A's driver got probed when using vendor B's
>   SoC

as said, this is a corner case that is easily solvable with the current
layout (and I will post a patch soon-ish to addess this...)

> - NXP scmi pinctrl and ARM scmi pinctrl could be both built in, without
>   concerning arm scmi platform takes nxp scmi pinctrl node as supplier.
> 

..the only real issue is the general fw_devlink issue as in cpufreq vs
devfreq...

Thanks,
Cristian

