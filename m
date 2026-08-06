Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04DDC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Q+zziGDBIptMzsPZcTiv1Xi/fJxSGOGLNBn/2gz4qA=; b=Xo3SbXmWy1XSJ6d6IhMAcoXYwX
	nLztw/yNV6fAABAohqAHK1Y3z/w0TeXeauo0EBxHnfmYuz+YY0c8t6OR1u5k5+9Zcmai2tzBWt8ft
	tvXw4EfZFIpEne4aZFaTiOyUxvKJ6Hgzx/r77scDQNID9Rc8vBLAreAipD3EH1X0N6+OYm8vMDVVs
	8tK5PaFSvIevtPAMyi0Mi2CC4Pw11CLXgUnbNdDeOpug53t3hrWdCAJGiOys30XncFKL/mtWeKplE
	vrUqFgFPKvyOKliF8Z6gNWFrnVuirGGubxrr9bOEgd3Pd+/q8ixjcn/7MxPBvfetehjrcZ47eTVB5
	W49GrAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx4w-00000005khD-0TS6;
	Thu, 06 Aug 2026 12:20:06 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx4r-00000005kfl-1KI8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:20:04 +0000
Received: from omf13.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 06F4F4071F;
	Thu,  6 Aug 2026 12:19:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 8425720010;
	Thu,  6 Aug 2026 12:19:52 +0000 (UTC)
Date: Thu, 6 Aug 2026 08:19:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
 mhiramat@kernel.org, alexandru.elisei@arm.com, vdonnefort@google.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/11] tracing: Include linux/types.h in
 trace_remote_event.h
Message-ID: <20260806081952.5cbd8170@gandalf.local.home>
In-Reply-To: <CA+EHjTxZ1tBfau4eK-nOdqig1xwngzsq8YyHtiE-iAMkZpSF8g@mail.gmail.com>
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
	<20260804112317.1937387-2-fuad.tabba@linux.dev>
	<20260805165432.0118a513@gandalf.local.home>
	<CA+EHjTxZ1tBfau4eK-nOdqig1xwngzsq8YyHtiE-iAMkZpSF8g@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 8425720010
X-Stat-Signature: r86qiecciymy1dxrye8d3wyxeubaweq4
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19xrAhumewMEU9bfBTbxDXmAHqbmaYBTcE=
X-HE-Tag: 1786018792-901548
X-HE-Meta: U2FsdGVkX195zuqn6+P/oJUmDDmBsGeDk/Dol51GDMslSARahWNz568H6AtS7EGsXujFR5EgnerJAA1FLcRtHPbxXpVUqLywGSkHQCrLp5MMyOzhfpBJktvO9poZuZIuc2bqlmAIxIsHu6m1BBV10K+mDygWR0Q72fcRl0tfpITuQ6ol0J6Uq1wof/YO35DXnmCeVAZfY2ACGKSPARPQ5q6a4D5JodKbU9zOfAXLY6igoorxNrttkORPBbra1VvJ6+fyPYWKHprBf7RlDIqX1WHxGhaue79t/6UsjyUwbZcuAYGowA4DC0/RtB1xeIJp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_052001_418105_94070101 
X-CRM114-Status: GOOD (  17.68  )
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

On Thu, 6 Aug 2026 09:43:00 +0100
Fuad Tabba <fuad.tabba@linux.dev> wrote:

> > My ack still stands, but I wonder if we should just not use the include and
> > instead s/bool/_Bool/ ?  
> 
> I'd prefer to keep the include, if you don't mind.
> 
> As far as I can tell, apart from the typedef itself, the only headers
> built into the kernel that use _Bool as a type are a uapi one and
> arch/um's user.h when it's built for the host, neither of which has
> bool available, plus what looks like a leftover in bcache_ondisk.h
> from when it was uapi.
> 
> The include also covers whatever field gets added next.
> 
> Happy to switch if you'd still prefer _Bool.

The reason I suggested this is because I'm not sure how much we want to add
Linux headers to files built for the hypervisor.

If Vincent is good with adding this, then so am I.

But I rather have him give an ack before we do.

-- Steve

