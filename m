Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E79C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbSde886o+JYMAcp7GPNS8UU46+iMJnZAeP0RWUiOE0=; b=2ynPxNzgsti+LrGyytlEYI8jnR
	0GDPa2A1wRNvx51o/T7gR18hHh0KtzBuuV0ZRDdkilPj8eayQz54Y+j831Ql4BHmpn71/GwcxLHUe
	RdoQt36slOAoAt1tMaXgCRHfyNWgYlPhVyDxL0d+/rC/rKSI6J7qUF1Ph4Esp5sUq0i0WNJ/RDpYP
	NjCwuCDea5h03VHhDI9OXRtq0o2W0qORFA21JEhhwh/5J/xvCI4vviDa1L+sL65gsnyw4ciyMtxL1
	gQzogfQYIC3ndPvVl4Fr5PVc/S5QoBre0RY+w6qhlkC0c/FvWcSLbWMMOIp5i3hkHi8hltHI/DCoY
	IvQbMufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcn-00000004BJx-2tOg;
	Tue, 04 Mar 2025 10:35:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPXh-000000049X1-3Dly
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:30:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B88D7FEC;
	Tue,  4 Mar 2025 02:30:42 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F18E3F5A1;
	Tue,  4 Mar 2025 02:30:26 -0800 (PST)
Date: Tue, 4 Mar 2025 10:30:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>, conor+dt@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
	lpieralisi@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: corstone1000: Add definitions for
 secondary CPU cores
Message-ID: <Z8bWQDVebIehuftS@bogus>
References: <Z8XSIx75B4mtcV48@bogus>
 <20250303170012.469576-1-hugues.kambampiana@arm.com>
 <174108287362.420865.6246087705407586774.b4-ty@arm.com>
 <f6c7feb3-e003-4bbc-8179-3a3df533d2d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6c7feb3-e003-4bbc-8179-3a3df533d2d5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_023029_846129_160D2BE9 
X-CRM114-Status: GOOD (  17.59  )
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

On Tue, Mar 04, 2025 at 11:12:57AM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2025 11:08, Sudeep Holla wrote:
> > On Mon, 03 Mar 2025 17:00:12 +0000, Hugues KAMBA MPIANA wrote:
> >> Add `cpu1`, `cpu2` and `cpu3` nodes to the Corstone1000 device tree to
> >> enable support for secondary CPU cores.
> >>
> >> This update facilitates symmetric multiprocessing (SMP) support on
> >> the Corstone1000 Fixed Virtual Platform (FVP), allowing the
> >> secondary cores to be properly initialised and utilised.
> >>
> >> [...]
> > 
> > Applied to sudeep.holla/linux (for-next/juno/updates), thanks!
> > 
> > [1/1] arm64: dts: corstone1000: Add definitions for secondary CPU cores
> >       https://git.kernel.org/sudeep.holla/c/21b9f56cec8f
> 
> Why? Nothing improved here comparing to v1.
> 
> Your comment are still valid and the patch is still not correct.
> 

It was not marked clearly or noted as change. I agree that is confusing.

However the following was added:

"Only FVP platform will have SMP support and hence the secondary cpu
definitions are not added to corstone1000.dtsi"

Hugues pinged me in private to explain why it is done in that way and I
asked him to add the reasoning in the commit message which he did but
failed to capture in the v1->v2 changelog. I mentioned it in private
again as he is new contributor to the kernel, I was less strict on him 😉.

--
Regards,
Sudeep

