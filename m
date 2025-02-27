Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C459C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfKKlZuDCNLGw2tdmgJXJuKGo/tGh15gbtXLZF/uf4I=; b=F87QsFz/ELCr8oixLriEZv1ZYZ
	oLI0t/IxlrMBG+3lz0nbX8Ry3Y+YLDeSGgvEm/FL1qB4wBgM4ZirUX2Mdua5UGVhdxRPSovr7YJh6
	dZ1ekrqYNCaL7bbJIimDTSDKqFzFkm6rCZRvHgijgQGyjOm2cdfn2s+IY5XdVJaS/M4VxdwT5am26
	a87o4gJKJNuJQCNCKQKyRhTCas2eexFp4tISm3VFlmJakr+TBYly6w7S5+cy/8MBKPOJK4sUvrBSt
	w5VUQxEMEPu1i0XF3JBw5CNUaj/qarJZATO0BDkVLOgIshAysaDXzo3I4DEPqwR71+xRaRHSoyHZe
	HaCXyBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZxw-00000006pNt-1yYR;
	Thu, 27 Feb 2025 09:14:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZwO-00000006pEd-0ydF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:12:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 145782BCA;
	Thu, 27 Feb 2025 01:12:39 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88B543F6A8;
	Thu, 27 Feb 2025 01:12:21 -0800 (PST)
Date: Thu, 27 Feb 2025 09:12:18 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, <cristian.marussi@arm.com>,
	<saravanak@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
Message-ID: <Z8AscmP2O_HjEnsL@bogus>
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
 <20250226160945.GA2505223-robh@kernel.org>
 <Z79NOeyWzfRio8qs@bogus>
 <20250227031551.GC11411@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227031551.GC11411@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011224_312998_C6157A05 
X-CRM114-Status: GOOD (  26.13  )
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

On Thu, Feb 27, 2025 at 11:15:51AM +0800, Peng Fan wrote:
> On Wed, Feb 26, 2025 at 05:19:53PM +0000, Sudeep Holla wrote:
> >On Wed, Feb 26, 2025 at 10:09:45AM -0600, Rob Herring wrote:
> >> On Wed, Feb 26, 2025 at 05:44:56PM +0800, Peng Fan (OSS) wrote:
> >> > Quote Sudeep's reply"
> >> > I am not blocking you. What I mentioned is I don't agree that DT can be used
> >> > to resolve this issue, but I don't have time or alternate solution ATM. So
> >> > if you propose DT based solution and the maintainers agree for the proposed
> >> > bindings I will take a look and help you to make that work. But I will raise
> >> > any objections I may have if the proposal has issues mainly around the
> >> > compatibility and ease of maintenance.
> >> > "
> >>
> >> This all looks to me like SCMI has failed to provide common interfaces.
> >>
> >
> >We can look into this if having such common interface can solve this problem.
> >
> >> I'm indifferent. If everyone involved thinks adding compatibles will
> >> solve whatever the issues are, then it's going to be fine with me
> >> (other than the issue above). It doesn't seem like you have that, so I
> >> don't know that I'd keep going down this path.
> >
> >Sorry if I was ambiguous with my stance as quoted above. For me, 2 devices
> >pointing to the same node seems implementation issue rather than fixing/
> >working around by extending DT bindings like this $subject patch is
> >attempting.
> >
> >If you disagree with that and think 2 devices in the kernel shouldn't
> >point to the same device tree node, then yes I see this is right approach
> >to take. ATM I don't know which is correct and what are other developer's
> >include DT maintainer opinion on this. I just didn't like the way Peng
> >was trying to solve it with some block/allow list which wouldn't have
> >fixed the issue or just created new ones.
> 
> With compatible string, no need block/allow list anymore I think.
> 

I completely understand that, I was referring to your earlier alternative
solution to this $subject approach. Sorry if that was evidently clear.

-- 
Regards,
Sudeep

