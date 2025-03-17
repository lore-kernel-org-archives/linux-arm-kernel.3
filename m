Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D58C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iGRMnP68keSOEDZnwi0eUgqGjCc7ESLttoR+giRBSg=; b=f7tCzUCs5azIL3Rg8CfvQfzLD5
	ePuDI5BDDkzZyizF36aDrqqWATELBbKgGTZ5GAqvx+AWE8lF2+VvEUtNoSxZZaAPLSmDLi7queNix
	Oy8SZk9KRF8nWgTDvi8ftyv7/J+HOwbXSCKqjDI91zvtFJWtmQzhzmrMh7VzaD161XhdO6xdqdLyJ
	bqpuGEnOy7Qz97tGdTGg98eufUiQOEhAHym/aoFjq20aRyWL9KArnQFmHk4Ja1erN5oOAbSdxueKp
	Ca+6j4T7atGc+8ov2/Xrsw8fwcMVKDuA0PbSrCt0X/K+eE2AvS+V+3iTA8i6UbDybroUfo2bt4kv3
	TZ9hlxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEoM-00000003d68-2AeX;
	Mon, 17 Mar 2025 18:03:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWk-00000003aV3-1hNA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:45:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2DD413D5;
	Mon, 17 Mar 2025 10:45:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A758B3F694;
	Mon, 17 Mar 2025 10:45:22 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:45:18 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 6/7] coresight: Remove inlines from static function
 definitions
Message-ID: <20250317174518.GJ2487211@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-7-james.clark@linaro.org>
 <20250314095025.GW9682@e132581.arm.com>
 <9d06b27a-c2ce-41b8-9657-151000c0b244@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d06b27a-c2ce-41b8-9657-151000c0b244@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_104526_491556_2DC71426 
X-CRM114-Status: GOOD (  25.39  )
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

On Mon, Mar 17, 2025 at 03:26:42PM +0000, James Clark wrote:
> On 14/03/2025 9:50 am, Leo Yan wrote:
> > On Tue, Feb 11, 2025 at 10:39:42AM +0000, James Clark wrote:
> > > 
> > > These are all static and in one compilation unit so the inline has no
> > > effect on the binary.
> > 
> > I read the doc coding-style.rst, the section "15) The inline disease",
> > my understanding is though the inline is not encouraged, I prefer we can
> > follow up the rule:
> > 
> >    A reasonable rule of thumb is to not put inline at functions that have more
> >    than 3 lines of code in them. An exception to this rule are the cases where
> >    a parameter is known to be a compile time constant, and as a result of this
> >    constantness you *know* the compiler will be able to optimize most of your
> >    function away at compile time. For a good example of this later case, see
> >    the kmalloc() inline function.
> > 
> 
> Isn't this advice about whether to make an inline function in a header file
> or do definition + declaration?

Maybe it is not about where defines inline functions.  It is about
how these inline functions are invoked.  E.g., in a single C file, a
inline function can be invoked in multiple places, and it is possible
the incline function can optimized by compiler case by case.

To be honest, I don't really understand how compiler works :)

[...]

> I think it can be useful, I've used it a little bit. Might as well make it
> easier to use for someone if it exists.

Sure.  This patch is fine for me.  I verified this patch with default
kernel configuration (-O2, -g), it does works as expected (no code and
data section's size change between with and without this patch).

Thanks,
Leo

