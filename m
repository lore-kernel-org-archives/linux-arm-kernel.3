Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C07C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJYRJqSd9Ae9wweoiiLp5AMfYL5xGK6xjRe0kFNGmKI=; b=qyAvDuoe3ysvlC9KepYIQ/l4M3
	Ds9VcPr2DM/gbVPhsB7IP7Dsl8CaO2WyIaY0riKlJ3Zwn5LbjoYVFolSZJmEPcC8c6LkIIRZCs680
	FvoOa6Jyj6EplVVT71Zy7BWwQ8vWP25qdA6DGpG9mitrzBBbmbVww5NqmSdVBf540n2gCabj42Bd5
	x/F//ptAcTcnWtwn6rwfzkoAj3ujQAgFrf1oPa3TlLChBm2xmAlDuxWc/5Y6Wi/lbQtn9oHkvFnH0
	fRuFhplNYte1xDzLyi5QMnZ8T3r8xz1/NTxuzl1qztLBfM+R+Q7mH1Ag5rUUFc8vPBvp0N+soyQYz
	4gy5HXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlvK-0000000GQQq-22os;
	Mon, 03 Aug 2026 06:13:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlvH-0000000GQQG-3F8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:13:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76A8C143D;
	Sun,  2 Aug 2026 23:13:10 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 505913F66F;
	Sun,  2 Aug 2026 23:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785737594; bh=12WF0nbOTufgJfMoGC5WjlPKMp8kTAFitthbPVUOzpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkEfKzj/WhOiUQ3UDUlStFj4XamZsfgzWcxa0UevnWDUUClv1wF3F6fpc524V8LjZ
	 TT9T9wtm5PtoNDTWuvNlfbyjWFfvezQhe0a4QMrK2OO9nj0RvFCZv027s8VjRqdhc7
	 8OW6ai/EBCz4PUps2Rq4qRbVhxmXwE5AnJ9B0xUE=
Date: Mon, 3 Aug 2026 07:13:04 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, brauner@kernel.org,
	souvik.chakravarty@arm.com, david@kernel.org,
	subrahmanya.lingappa@oss.qualcomm.com, leitao@kernel.org,
	kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
	kernel-team@meta.com, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v6 21/22] [RFC] Documentation: Add SCMI System Telemetry
 documentation
Message-ID: <anAxcCMYOT9Pbw8T@pluto>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
 <20260724144430.1440170-22-cristian.marussi@arm.com>
 <874iho8m26.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874iho8m26.fsf@trenco.lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_231315_853389_F52EBEF2 
X-CRM114-Status: GOOD (  20.15  )
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

On Fri, Jul 24, 2026 at 09:05:53AM -0600, Jonathan Corbet wrote:
> Cristian Marussi <cristian.marussi@arm.com> writes:
> 

Hi Jon,

thanks for having a look at this !

> > Document ARM SCMI Telemetry IOCTLs interface.
> >
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>
> > Cc: linux-doc@vger.kernel.org
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > RFC since it still needs more extensive examples
> >
> > v5 --> v6
> >  - fixed typos
> > ---
> >  Documentation/userspace-api/index.rst |   1 +
> >  Documentation/userspace-api/stlm.rst  | 143 ++++++++++++++++++++++++++
> >  2 files changed, 144 insertions(+)
> >  create mode 100644 Documentation/userspace-api/stlm.rst
> >
> > diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
> > index a68b1bea57a8..22daa7ebf78e 100644
> > --- a/Documentation/userspace-api/index.rst
> > +++ b/Documentation/userspace-api/index.rst
> > @@ -54,6 +54,7 @@ Devices and I/O
> >     dcdbas
> >     vduse
> >     isapnp
> > +   stlm
> >  
> >  Everything else
> >  ===============
> > diff --git a/Documentation/userspace-api/stlm.rst b/Documentation/userspace-api/stlm.rst
> > new file mode 100644
> > index 000000000000..e34226b11373
> > --- /dev/null
> > +++ b/Documentation/userspace-api/stlm.rst
> > @@ -0,0 +1,143 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. stlm:
> 
> I'm not sure what that last line is meant to be?  It *looks* like it's
> meant to be the sort of top-of-file label that I've been trying to get
> people to stop adding for years...but it lacks the leading underscore,
> and so won't work even for that.  Remove that line?
> 

Yes...my bad I was trying to badly mimicing from some other place...
I removed this in v7, but the Docs are still RFC (even in V7) since they
still lacks a lot more usage examples....I'll go for that in v8

Thanks,
Cristian

