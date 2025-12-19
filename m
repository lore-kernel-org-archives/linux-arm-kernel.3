Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CC1D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l+Tto5sXZ/1JeEqTJeSqKVVolqW7hbqVXEzASll9f4=; b=LlCvGwhINN7v/xm3btd0l4CmOI
	yTR3bq3nVLtq69q0CvhAFPJhQt7rI5LkBKs8bJ+YGSRyxQ4mRkuryBGUfRLUKw8GXQdF+2JpwMWqE
	PCrgqSq8dELJvxr+xL07ci0uimJMRmThFzWu2ZZvaugYB6BjGAPoedOn5V72txM0ANujL2pNTKxky
	QNC1l7fIW22yb1+drAX93Sb6XDPD7FBM0euzeVLyPvf49CUBt2CdtdLwFB9NfdNllQ5RyD6bOGkPu
	AfxF+YsLlOSfxoZFaZpzz7diHD8/qVDCEFCAt4SECf62+2Mbt7FPvrI4zHH3T8BD/H6eXrOiTls+A
	xU+tnUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcRI-0000000AVyL-3K7c;
	Fri, 19 Dec 2025 15:30:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcRH-0000000AVxf-0vTI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D23560177;
	Fri, 19 Dec 2025 15:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA550C4CEF1;
	Fri, 19 Dec 2025 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766158242;
	bh=jt4o90nFqHZWWhidO6jTOb7JTdQc/098/qNRW8giZpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gej9VTqKwoEXwiCEGCqUZY6iQ4PNWwaeW79Gzxr5r9nFMikliZ5LXqTsWFPG3bCIv
	 2oXHGCkF+YspSK7e0mHuWvyOzSgmsB63m9QrAWizqGO9KL9ZhHd7RSviFSmn9bVMyi
	 p8wQfqICFrz3bcbbYsNqcw8/xzOICei13f3EYzA0fZ6riCEiSMYVC61h75Bon+6CYK
	 YbwxTq3akrcn01sWbH9+dPumAodrbAXX7BdcN/AdbjQIQI72GhF+0fHBtMZ2cScLRs
	 sYbrrDtdgow1zlq0cKZJGdi35OcLVfbY+UsiobuaAOXvPt0LyiiebZ03JfzC/SsQYq
	 QcRi1CSAJpwfQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vWcRE-00000006Q1i-0mcd;
	Fri, 19 Dec 2025 16:30:40 +0100
Date: Fri, 19 Dec 2025 16:30:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, tony.luck@intel.com, bp@alien8.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, rafael@kernel.org, 
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com, Michael.Zhao2@arm.com
Subject: Re: [PATCH 03/12] ras: add estatus vendor handling and processing
Message-ID: <euhams5heiuaawxq4e5ty7iijuvwt5gvdx3flsm4npligjeulq@lv3cwekyb2o2>
References: <20251218170453.23be9049@foz.lan>
 <20251219144943.2798169-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219144943.2798169-1-ahmed.tiba@arm.com>
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

On Fri, Dec 19, 2025 at 02:49:02PM +0000, Ahmed Tiba wrote:
> 
> On Wed, Dec 18, 2025 at 05:04:53PM +0100, Mauro Carvalho Chehab wrote:
> 
> >> Teach the estatus core how to walk CPER records and expose the vendor
> >> record notification path. This adds the section iteration helpers,
> >> the logging helpers that mirror the GHES behaviour, and the deferred
> >> work used to hand vendor GUIDs to interested drivers. No users switch
> >> over yet; this simply moves the common logic out of GHES so the next
> >> patches can wire it up.
> >>
> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> >
> >...
> >
> >> +static bool estatus_handle_arm_hw_error(estatus_generic_data *gdata, int sev, bool sync)
> >
> > Huh?
> >
> > This is a CPER record from GHES. Why are you moving CPER code out
> > of ghes.c, placing in a file named estatus.c? Doesn't make much
> > sense on my eyes...
> >
> > Same applies to to other GHES CPER record types.
> 
> GHES still fills in the CPER record, but the parsing and logging logic is
> shared with the new DeviceTree provider so I pulled those helpers into the
> estatus core. 

I see, but this is not really estatus core. Instead, it is part of GHES CPER
handling logic, which is defined at ACPI and UEFI specs. moving it to estatus
sounds odd, at least on my eyes.

Perhaps I'm failing to see where at ACPI/UEFI specs how CPER would be
integrated with an OpenFirmware approach to handle CPER without GHES.
Care to point to the relevant specs, if any?

> Both providers already call into the same notifier chain and
> memory-pool helpers; this patch just moves the generic CPER walking routines
> next to the rest of the common code so the DT path doesn’t have to grow its
> own copy. If you’d prefer a different file layout or naming to make that
> intent clearer, I’m happy to adjust.

Moving the code from ghes.c to estatus.c or to elsewhere shouldn't make any
difference, as the DT handling logic could simply be calling the functions
from ghes.c (or estatus.c). I fail to see why they need to be moved.

-- 
Thanks,
Mauro

