Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95585CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W+GhsVGQZssgST8zzZDN7iyPi1PBzlz1+D/8wws7Aw=; b=b50QZ1AkMIxtKO9Tf//HOtdBUv
	iihl+qOLurtD3LHzaWfxxRbxOYjvqEu1EBBlfZpMhiN2ZuevT0cfdo9h8twsaQP4xY8adjZP/kTXh
	gXOhKP8yfs1ddG3bklB0YJvU9xTw2Jt16ppPQ4m29UGCm+pBLPyM08GjcCqQ7LQ9nDZOM+TiPX8XQ
	nNEE00R2VTw68t/autc8A+Rod0bLkqohM9pUpDoMvxJwcMH/I6Z5Ts8b9gj/y1p0BWPYqNl6h2W9c
	HFN4btP7etgso64fQKNz2sgMuwKJKLMq98g53IF0PvTVAzN4B1AjKyUxZHU4V1SjJ5CQtPCiiAlzI
	jFZSyjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSBN-000000052O4-1mzP;
	Thu, 14 May 2026 09:16:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSBM-000000052NR-0M6d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:16:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 267F06012B;
	Thu, 14 May 2026 09:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB84C2BCB7;
	Thu, 14 May 2026 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778750198;
	bh=dOXz1EDIBARRzpQwY+sDWV9fzr6+uPTuMpnzBkWeKEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAckPcWAmdMRrYSCMsqdBCX5uYTigSETMlPLFJybx6tSacMyXME8svvN79OAROclM
	 +hniAOfkgJo6wuCkHMmH8icldA3VWBGx8dZtZLiTbc8ty4yKqG10hRMZWrQAMr7Efq
	 X0m0Kw4z5QqrhVNCKWAfoQUtd3opoX+eMJkbOytd2/nJ355HQDMezywHwLNO/9bo63
	 02BOpgmAnHKCJLWaUVerfTgOf1jxscYYVOpnA2tVheJfJGpD4tXYGlt85Rr24vtEhh
	 H0EmIclDT2UcqjWL54W7t694EXVCA/z16d2QunnNlQSu34LFa5Xt5R+6Uz39A4Dt3m
	 xtH46zdX1tu1w==
Date: Thu, 14 May 2026 10:16:35 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Message-ID: <20260514-serious-bumblebee-of-prowess-b6bf2b@sudeepholla>
References: <20260513032800.68807-1-jamien@nvidia.com>
 <20260513-tremendous-conscious-sunfish-06eecb@sudeepholla>
 <5325A2E7-4987-400A-A1B2-A5C3122D88D1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5325A2E7-4987-400A-A1B2-A5C3122D88D1@nvidia.com>
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

On Wed, May 13, 2026 at 07:48:05PM +0000, Jamie Nguyen wrote:
> 
> 
> > On May 13, 2026, at 10:15 AM, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > On Tue, May 12, 2026 at 08:28:00PM -0700, Jamie Nguyen wrote:
> >> __ffa_partition_info_get_regs() walks the response with a hardcoded
> >> 24-byte stride (regs += 3) even though the SPMC tells us the actual
> >> per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
> >> read into buf_sz and then thrown away.
> >> 
> >> That works while every SPMC returns the FF-A v1.1 layout, but it falls
> >> apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
> >> strides over half a descriptor at a time and ends up parsing every
> >> other entry from a slice of two adjacent ones.
> >> 
> >> The FF-A spec (v1.2, section 18.5) says that the producer should
> >> report the descriptor size, and the consumer is supposed to stride by
> >> that size and ignore any trailing fields it doesn't understand. The
> >> non-REGS path (__ffa_partition_info_get) does this already, and the
> >> REGS path should match.
> >> 
> >> Use buf_sz for the stride, and bail out with -EPROTO if the SPMC
> >> reports something we can't safely walk.
> >> 
> > 
> > Can you check if the issue is addressed in -next by:
> > Commit 3974ea193840 ("firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies")
> 
> Thanks for the pointer.  I tested 3974ea193840 on the same hardware
> that reproduces the bug, but the descriptor-stride issue is still
> present.
> 
> The relevant loop at the end of __ffa_partition_info_get_regs()
> still has:
> 
> 	buf_sz = PARTITION_INFO_SZ(partition_info.a2);
> 	if (buf_sz > sizeof(*buffer))
> 		buf_sz = sizeof(*buffer);
> 	...
> 	for (idx = 0; idx < nr_desc; idx++, buf++) {
> 		...
> 		regs += 3;  /* bug is here */
> 	}
> 
> With 48-byte descriptors the SPMC returns nr_desc = 2 per call,

Well why is the firmware sending 48byte entry when 24byte is expected.

-- 
Regards,
Sudeep

