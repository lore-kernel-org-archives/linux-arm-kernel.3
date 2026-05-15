Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB7CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppvZio4KLnzq4q/KW8MzT8nudBBCjg+lEjRqcmhEYog=; b=35IUDPnG9JeQElJyBQbtQO7JOr
	H83lU7GyRfXyRIkb4zVb52SqBiEhJ8bL8E+mA3ZTmwcMJjYLmzHB1zGFUPSgm0G+Di0f0U5nrvgmi
	odQqnHIODrUMYbhRNMVZRs9O172/FGjxlF+0ZUIW7z1bTjVkydAYDTdFKvgC0pUdwHYdlpeAFVFB3
	w1wDUEiAdG93bX5l02GZTt1W33igNtjI0xVZYUCFb95PMwXzCYX87gG5eSe7q2R3D5gCetnPv0B1S
	Tq+b8ePWu0j8ICCq3Z5BO/BXe2L4Kc2m5+XupRHnNf3mxzMFk1cNcU0snYNopzgSodjpsG5bF/AEi
	c/Jv4rZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoll-00000007sAs-3KvJ;
	Fri, 15 May 2026 09:23:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNolk-00000007sAI-33DS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A45FB60581;
	Fri, 15 May 2026 09:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC31C2BCB0;
	Fri, 15 May 2026 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778837023;
	bh=AwYB5qEle5qClbxh2ptaO9cbSszb0tZ8KAQzR3xrtPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRiDrwmkiDtfDqKCZnBdvNM+X/X8bZozNhS51TzN2KYDyOo/tQHEoMt7oFngw4PH6
	 TUMC1yPUQtOs7K7rhpY6lgDbOkjPKp9Hv/g+r5xSsSxMt3lJkSbyVyLTfNTZxrqkAe
	 Fxu5HR26xnHnm2hj5w6nWSbQkvAAdT2h7I28bBYQBCYOacgflrbS4y0AVTVk9FGPzS
	 sW/NFev843wgWvF2f/hPM1sHz4wRSK6tF3ibVnnOyIdAX5uUX+5wkmuGiVb//uajmA
	 EeEU5MtEFelR2Eaap9WdsH1+m/sZ4m0M4lqoepoHsb/+lR6obns86zA695ElHPvs8s
	 1uNrcvoisJQeQ==
Date: Fri, 15 May 2026 10:23:40 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Message-ID: <20260515-zippy-notorious-caiman-ea4ec6@sudeepholla>
References: <20260513032800.68807-1-jamien@nvidia.com>
 <20260513-tremendous-conscious-sunfish-06eecb@sudeepholla>
 <5325A2E7-4987-400A-A1B2-A5C3122D88D1@nvidia.com>
 <20260514-serious-bumblebee-of-prowess-b6bf2b@sudeepholla>
 <5AF8DFBF-18EC-4C8A-84A0-F27298DB9BD0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5AF8DFBF-18EC-4C8A-84A0-F27298DB9BD0@nvidia.com>
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

On Thu, May 14, 2026 at 05:37:38PM +0000, Jamie Nguyen wrote:
> 
> 
> > On May 14, 2026, at 2:16 AM, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > On Wed, May 13, 2026 at 07:48:05PM +0000, Jamie Nguyen wrote:
> >> 
> >> 
> >>> On May 13, 2026, at 10:15 AM, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >>> 
> >>> On Tue, May 12, 2026 at 08:28:00PM -0700, Jamie Nguyen wrote:
> >>>> __ffa_partition_info_get_regs() walks the response with a hardcoded
> >>>> 24-byte stride (regs += 3) even though the SPMC tells us the actual
> >>>> per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
> >>>> read into buf_sz and then thrown away.
> >>>> 
> >>>> That works while every SPMC returns the FF-A v1.1 layout, but it falls
> >>>> apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
> >>>> strides over half a descriptor at a time and ends up parsing every
> >>>> other entry from a slice of two adjacent ones.
> >>>> 
> >>>> The FF-A spec (v1.2, section 18.5) says that the producer should
> >>>> report the descriptor size, and the consumer is supposed to stride by
> >>>> that size and ignore any trailing fields it doesn't understand. The
> >>>> non-REGS path (__ffa_partition_info_get) does this already, and the
> >>>> REGS path should match.
> >>>> 
> >>>> Use buf_sz for the stride, and bail out with -EPROTO if the SPMC
> >>>> reports something we can't safely walk.
> >>>> 
> >>> 
> >>> Can you check if the issue is addressed in -next by:
> >>> Commit 3974ea193840 ("firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies")
> >> 
> >> Thanks for the pointer.  I tested 3974ea193840 on the same hardware
> >> that reproduces the bug, but the descriptor-stride issue is still
> >> present.
> >> 
> >> The relevant loop at the end of __ffa_partition_info_get_regs()
> >> still has:
> >> 
> >> buf_sz = PARTITION_INFO_SZ(partition_info.a2);
> >> if (buf_sz > sizeof(*buffer))
> >> buf_sz = sizeof(*buffer);
> >> ...
> >> for (idx = 0; idx < nr_desc; idx++, buf++) {
> >> ...
> >> regs += 3;  /* bug is here */
> >> }
> >> 
> >> With 48-byte descriptors the SPMC returns nr_desc = 2 per call,
> > 
> > Well why is the firmware sending 48byte entry when 24byte is expected.
> 
> We're starting to test with a v1.3 SPMC implementation.  UEFI brings
> up its FF-A driver first and negotiates v1.3, which the SPMC then must
> keep for the lifetime of the primary VM per DEN0077A v1.2 REL0 section
> 13.2.2 [0]:
> 
>     "Once an FF-A version has been negotiated between a caller and a
>      callee, the version may not be changed for the lifetime of the
>      calling component.”
> 

I need to check the v1.3-alpha specs to understand/recall the version
negotiations but until v1.2 and the current driver which is v1.2 we don't
have any idea about all these new changes. But since v1.2 already has size
of descriptor, we can and must handle that independently of this new
version (re-)negotiation.

-- 
Regards,
Sudeep

