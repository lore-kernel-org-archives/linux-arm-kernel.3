Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCA8FCE086
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUsE/ay4HCwYnv/iGAzXX9BodcGCyR/uM8ydwv7aDgo=; b=QihWXDeiwoZXZrc/KyjGZCK1PK
	+D4ho/aRz2SZrQFHMJ7HicgfeAsCUgGh8WGOq9ajT4obZ7Sa2S4PUfSehkHBhOSI+VeAe0Q7N/9SA
	kj6165C0tHZyeqFVjXN7ek7oIbkiy/dpvt0fjsBw7EhAA9yx2Lna5X64sI1/rAWLfzwPB08bJqaxx
	x4zskVGIkQhkka8PWyNQl8ZwtrbJY00+Dl9yOQnnCdqBa6UlLqbZ+CqKNqdRBSYRFvLOPGEMxCg8A
	dpb7hSkBmw8rNbwupVMdQ3IoZ75Jvkp2Sq1gf7IucwQdE0uLLDU19EJmJ3FJr2/5JaYJycSXHi1Rl
	6buaXSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbpz-00000006GsD-0xDX;
	Thu, 26 Feb 2026 13:55:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbpv-00000006GqT-13oU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:55:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8740497;
	Thu, 26 Feb 2026 05:55:17 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA7673F62B;
	Thu, 26 Feb 2026 05:55:21 -0800 (PST)
Date: Thu, 26 Feb 2026 13:55:13 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
Message-ID: <aaBQwXHA1pAQ4XHF@pluto>
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
 <aZ2aBD_u_RVhgsei@pluto>
 <b4c42f88-80fb-488b-9ca5-95f5795fd2f8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4c42f88-80fb-488b-9ca5-95f5795fd2f8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_055527_420792_056E3BE0 
X-CRM114-Status: GOOD (  33.74  )
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

On Wed, Feb 25, 2026 at 12:42:08PM +0100, Krzysztof Kozlowski wrote:
> On 24/02/2026 13:31, Cristian Marussi wrote:
> > On Tue, Feb 24, 2026 at 11:43:38AM +0100, Krzysztof Kozlowski wrote:
> >> Severale functions operating on the 'handle' pointer, like
> > 
> > Hi Krzysztof,

Hi,

> > 
> >> scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
> >> to const thus they should not modify the handle.  In fact that's a false
> >> statement, because first thing these functions do is drop the cast to
> >> const with container_of:
> > 
> > Thanks for this first of all...
> > 
> > ...but :D
> > 
> > ... the SCMI stack attempts to follow a sort of layered design, so roughly
> > we have transport, core, protocols and finally SCMI Drivers.
> > 
> > Each of these layers has its own responsabilities and the aim was to
> > enforce some sort of isolation between these layers, OR even between
> > different disjoint features within the same layer, if it made sense,
> > like with the notification subsystem within the core...
> > 
> > Now, given that all of the above must be attained using our beloved C
> > language, such attempt to enforce isolation between such 'islands' with
> > different responsibilities is based on:
> > 
> >  - fully opaque pointers/handles...like the ph protocol handels within
> >    SCMI drivers...best way to do it..if you cannot even peek into an
> >    object you certainly cannot mess with it...
> > 
> >  - some 'constification' when passing around some nonm-opaque references
> >    across such boundaries
> > 
> > So, when you say that some of these functions sports a fake const
> > reference, is certainly true to some extent, BUT you miss the fact that
> > usually the const is meant to stop the CALLER from messing freely with
> > the handle and instead enforce the usage of a dedicated helper that sits
> > in another layer...
> 
> The caller can mess with the handle, because of container_of() cast, so
> there is nothing stopping it. I understand you want to express that
> handle is somehow unchangeable but then as you mentioned - it should be
> opaque pointer.
> 

Well no, the caller who calls from within the _protocol_init code can only
do what the available function (set_priv) allows him to do when called....
...like setting the priv field....and scmi_set_protocol_priv, which live in
another 'logical island', embeds that logic....from within protocol_init
you cannot get to the protocol instance directly simply because you dont
have the definition of struct nor the ph_to_pi() macros...

Also scmi_set_protocol_priv() uses the const ph to access the container
pi and change that...NOT the ph object...even though clearly it could once
it has pi (as you pointed out)....but that would be a bug...no ?

... on the other side dropping the const from the protocol_init funcs as
you suggest would mean that immediately you could do from within the protocol
layer stuff like:

	ph->version = 0x12345;

...while now you can only read ph->version, since it is discovered
negoatiated and set by the core SCMI stack and so it is NOT meant to be
touched by the protocol layer, while it has to be freely modificable by
the core...(sp it cannot be real const in the core)

Yes, ideally ph would be better as an opaque object of course, like it
appears to the SCMI drivers when it is used to call proto_ops, BUT the
attempt here was to maximize isolation while also keeping the thing
practically usable AND without having to export zillion symbols...

...that is the reason also for ph-embeeded xops/hops...if you make ph fully
opaque also to the protocol layer you will have to expose and EXPORT
xops/hops since vendor protocols can be loadable modules, and in general
all across the SCMI stack we generally always chose to export the minimum
possible number of symbols and a few handles with attached ops to let the
stack work, since if not, given the nature of the SCMI protocol that is
highly extensible, we would have ended up with a constantly increasing
number of exported symbols to maintain...
(imagine to export all of scmi_protocol.h)

I agree that the current const usage patterns in the stack are semantically
slightly off at time, but what is the real benefit of dropping such fake
const ?

...because on one side they do stop any attempt to mess with the internals
of the handles IF such attempts comes from a context in which the objects
are NOT supposed to be touched, and so, in some way enforce and constraint
the developer writing these protocols (standard or vendor) to 'behave'

...BUT, on the other side,  what would be the gain in having such consts
insteaD more pedantically applied (dropepd) ? What are the compilation time
benefits that you mention ?

Thanks,
Cristian

