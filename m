Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84126CA5FB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGoi95HK0DawKJbc0JNfaYKaxMRLx0klu4MeJDrk2+E=; b=tggZEllwpVyepGvhpJN+8R24VI
	Lz5UxlE0s0Vba0ONn4g1Hk0Be+6t6h5dVddnODMItFslqgp3yorEcqMjSXmWa+P9mAmdmIC5Vf4du
	wPnrHu5PMAH7LG5r1mwhs6qb5Lhguhq3gwO38pcW7bdCRdR3szKeTInuuJ+LIBVZD1FkPZ5GuG72E
	+4yj0RHi6epAJ4RQXTeZ4Lrzjszj+nDjxqoji7u1vEQ7yfB/trP3z/vuvGyBwWvS1zGvSqUGK9f+o
	srz9QudgSNxRBR3UrOZsdGkJfkHcPxWXDt8d0RBnBEEpf6Uy7g6UXJm0ICORcpecJY2c5xm1VJ8HE
	DMJCe5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFp2-00000004Fmh-3rF5;
	Tue, 20 Jan 2026 17:47:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFoz-00000004FmK-3x9R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:47:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E20F91476;
	Tue, 20 Jan 2026 09:47:09 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.35.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1D803F632;
	Tue, 20 Jan 2026 09:47:14 -0800 (PST)
Date: Tue, 20 Jan 2026 17:47:11 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aW-_n_gWV_cxlS-L@bogus>
References: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <qv2do4mmxrlspkr2b2vzsozedxzdocoyapymll63laowljue3d@ycq3mlxrrllt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qv2do4mmxrlspkr2b2vzsozedxzdocoyapymll63laowljue3d@ycq3mlxrrllt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_094718_101651_D3B8B39F 
X-CRM114-Status: GOOD (  40.23  )
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

On Mon, Jan 19, 2026 at 11:21:07AM -0600, Bjorn Andersson wrote:
> On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:

[...]

> > 
> > OK if we are going there, can we blame the firmware for exposing this
> > information which is standard ? Sorry to repeat by firmware is exporting
> > that info in OS agnostic way and other OSes use that as the information as
> > it is standard way. Why can't we make Linux use or work with that information
> > as that removes all these vendor specific fragmentation created over years.
> 
> I certainly don't blame the firmware for providing a generic interface
> for exposing such information, it sounds like a good idea to me. My
> concern is that we're not "abstracting" this away from the applications,
> within the kernel.
> 

I see your point, but the purpose of the SOC_ID interface is to avoid encoding
vendor-specific interpretation in the kernel and to push that problem to
userspace. If we now need the kernel to provide an abstraction based on
vendor-specific information from the device tree and SOC_ID information from
the firmware, then I don’t think that’s feasible - SOC_ID was designed
specifically so that the kernel wouldn’t interpret it.

> I think the UAPI should provide one answer to the question "what target
> am I on right now" - not two (or N) different answers.
> 

I’m not sure that’s an exact match for the question. The socX nodes simply
indicate which SoCs are present and expose the associated identification
information for the system that’s running. It’s not clear whether this is
limited to the application processor only, whether it can also include I/O
components, or whether the identifier is required to be unique.

> > This point is orthogonal to user-space break.
> > 
> 
> With multiple socX instances exposed the UAPI no longer matches my
> interpretation of its purpose (feel free to tell me that I have
> misunderstood the purpose).
> 

I can’t say that you’ve misunderstood it; it may be that I’m misunderstanding
it. My interpretation is that it provides information about all the SoCs on
the system. That could include multiple instances of the same SoC, different
variants, or even I/O chips such as Bluetooth or Wi-Fi. That’s my take on the
socX nodes, but I may be wrong.

> > > What does it even mean to have two different socs presented here? How
> > > would userspace know which one to refer to? Should it refer to both and
> > > guess which one makes more sense to it?
> > > 
> > 
> > Yes, the standard interface doesn't have much info though, so it could be
> > union of it if the applications prefer that way.
> > 
> > > 
> > > To me, when you decided to add a second caller to soc_device_register()
> > > you created a regression in the userspace interface. If nothing else
> > > it's a leaky abstraction.
> > > 
> > 
> > In that case, shouldn't soc_device_register() made to give error when an
> > attempt to call it more that one time then ?
> 
> Based on my understanding of the purpose, that seems reasonable to me.
> 

It's exactly opposite based on my understanding though 😉.

> > Also should be change the
> > ABI documents to refer it as soc0 and not socX ?
> > 
> 
> I'm still grappling with the thought of what does it actually mean to
> find N socX nodes. Perhaps I'm wrong and the answer is that these are
> just different blobs of soc information and userspace should consume
> them all? (Just doesn't feel very user friendly to me).
> 

Why ? If the intention was to provide as much information as possible
about the running system.

-- 
Regards,
Sudeep

