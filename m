Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D5E9B258
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DOWytpHioKvtvTxZXB+XETKBWt7ncLchHHy6p+YPRg=; b=POlOHtzqKV1iZzUAYJHRzNFUkR
	jajrWi6Bek0rtnD0b/l1iR6R21AkMDLJZae8Iq3S9oz3SRejSXTC6QJmo0RsLU0ni6QgymPdZYIZ7
	RSVVeHoKWAfC70JsaJbO1OLc9o/kTZ2AI3LOoxJqegw0AwxO5UlgrX8m4fzjGOhqS8rm71VEgiAd4
	go/wooMbnVa7wFV6QnEW+NhOGAJVIrAbFtXWJT0m/LWPvzYIUziuC7J8prpg+T2NZrL3Tyct60huY
	JxtLqlpvpinj0+HsqkzID8lMvuCIL55SXAkC8sPcEwGZ8PDIHX9K4zlLOjiSvQ/bSrTHUgi821g6d
	rnOLyz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurZi-0000000239F-10xz;
	Tue, 24 Feb 2026 12:31:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurZg-0000000238l-0jUU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:31:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC1F2339;
	Tue, 24 Feb 2026 04:31:26 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD6553F62B;
	Tue, 24 Feb 2026 04:31:29 -0800 (PST)
Date: Tue, 24 Feb 2026 12:31:21 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
Message-ID: <aZ2aBD_u_RVhgsei@pluto>
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_043136_329569_7FA84615 
X-CRM114-Status: GOOD (  17.62  )
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

On Tue, Feb 24, 2026 at 11:43:38AM +0100, Krzysztof Kozlowski wrote:
> Severale functions operating on the 'handle' pointer, like

Hi Krzysztof,

> scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
> to const thus they should not modify the handle.  In fact that's a false
> statement, because first thing these functions do is drop the cast to
> const with container_of:

Thanks for this first of all...

...but :D

... the SCMI stack attempts to follow a sort of layered design, so roughly
we have transport, core, protocols and finally SCMI Drivers.

Each of these layers has its own responsabilities and the aim was to
enforce some sort of isolation between these layers, OR even between
different disjoint features within the same layer, if it made sense,
like with the notification subsystem within the core...

Now, given that all of the above must be attained using our beloved C
language, such attempt to enforce isolation between such 'islands' with
different responsibilities is based on:

 - fully opaque pointers/handles...like the ph protocol handels within
   SCMI drivers...best way to do it..if you cannot even peek into an
   object you certainly cannot mess with it...

 - some 'constification' when passing around some nonm-opaque references
   across such boundaries

So, when you say that some of these functions sports a fake const
reference, is certainly true to some extent, BUT you miss the fact that
usually the const is meant to stop the CALLER from messing freely with
the handle and instead enforce the usage of a dedicated helper that sits
in another layer...

As an example, when you say that the scmi_protocol_handle *ph is indeed
manipulated by scmi_protocol_set_priv() and so it is NOT const, you are
certainly right, BUT the above function and the protocol handle itself
lives in the core, a different layer from the protocols, and indeed the
protocol_init function cannot change directly the protocol priv value
but instead has to pass through the helper ph->set_priv() which is the
only helper that can touch the ph content...
...IOW you are forced to respect the isolation boundary (as much as
possible) by the constification of ph...if you drop the const in the
protocol_init protoypes you end opening the stack to all sort of
cross-boundary manipulations annd hacks: helpers like set_priv were
added to be able to manipulate the bits that needed to be modifiable
while maintaining separation of resposibilities between latyers.

Similarly for notifications, they are kept isolated as much as possible
from the core.

So, I still have definitely to properly go through all of your
series, but while the usage of container_of_const() is certainly a
welcome addition, because it raises the isolation factor, dropping the
'fake' const seems to me a step back in the enforcement of isolation
boundaries between different layers or different subsystems within the
same layer.

IOW, the last that we want is to be able to freely change the content
of such const handles from outside the 'island' they live in...

Any improvement on such isolation with more modern C tricks, if
possible, is pretty much welcome, i.e. I am not saying that the current
system is perfect and not improvable...but just dropping all of this in
name of some better possible compilation optimization seems not worth in
terms of maintainability...

Does any of the above blabbing of mine makes sense :P ?

Thanks,
Cristian


