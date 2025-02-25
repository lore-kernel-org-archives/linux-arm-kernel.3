Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945CDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZgdWO7k4+OKLqpthfS5rJrQuQPttt/GmTiWB7L+cFI=; b=ogxOGDFxzQKzrM6VaRMqVYv5oO
	co9lNs37Ni2VwmaVXhdAvuIxSO4UecBbRxj5u93tvo/1RTea5E/Nn5+hqD8D273MX9DlBHo97Mrrd
	QH+iDtGFVdPEmA+6dPU1kxbNMKWEuOBMAX7f5a8bI2mmqImrRik6eXLsnyP8RacixXcMEad+I6mXN
	VfL28c2qL1/5voadQb/zoB0YCnWRnsQk63i/M1NU5kTA29tJKVmq9qjXVLhylgPvDOqiTe4iULcIC
	rV5lDV9DLWf55FIXapS5x7fclZkTIEtqensDURk+D5mgp7aw/fHu+Vf1TLyNXmH3vM8R1Ky8/5YMV
	I3KlxwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuM1-0000000HFnN-2cJK;
	Tue, 25 Feb 2025 12:48:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtib-0000000H9SR-46Ee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:07:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8753152B;
	Tue, 25 Feb 2025 04:07:37 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135943F6A8;
	Tue, 25 Feb 2025 04:07:18 -0800 (PST)
Date: Tue, 25 Feb 2025 12:07:16 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 00/10] arm64: dts: Add Arm Morello support
Message-ID: <Z72ydHCLxd-WGsJu@bogus>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <Z7jL5wBUJNjOlg4r@J2N7QTR9R3.cambridge.arm.com>
 <58ee2a8d-d3c1-4bc2-92dd-6568f645b01f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58ee2a8d-d3c1-4bc2-92dd-6568f645b01f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_040722_059506_B35205A6 
X-CRM114-Status: GOOD (  30.62  )
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

Hi Mark,

Thanks for raising valid points/concerns.

On Mon, Feb 24, 2025 at 10:08:18AM +0000, Vincenzo Frascino wrote:
> Hello Mark,
>
> On 21/02/2025 18:54, Mark Rutland wrote:
> > Hi Vincenzo,
> >
> > On Fri, Feb 21, 2025 at 06:03:39PM +0000, Vincenzo Frascino wrote:
> >> The Morello architecture is an experimental extension to Armv8.2-A,
> >> which extends the AArch64 state with the principles proposed in
> >> version 7 of the Capability Hardware Enhanced RISC Instructions
> >> (CHERI) ISA [1].
> >
> > None of the CHERI stuff is supported upstream, so from upstream's PoV
> > this is a low-volume dev-board/SoC with an experimental ARMv8.2-A CPU.
> >

I understand and agree with your concerns.

>
> Agreed, I have no plans to upstream Morello support beyond the device tree.
>
> >> This series adds dts support for the Arm Morello System Development
> >> Platform.
> >
> > Do we actually need the dts for this board?
> >
> > I have one on my desk; it boots vanilla Debian 12 via UEFI + ACPI just
> > fine, with the Debian 6.1.0-13-arm64 kernel.
> >
> > Is there something that we can only do with the DT? i.e. some
> > functionality that isn't exposed via ACPI?
> >
> > How do you expect this DT to be used?
> >
>
> There are functionalities that are not exposed via ACPI, e.g. gpu, dpu, i2c for
> the phy, etc. My aim to have upstream support for all the hardware exposed by
> the platform.
>

Does this address some of your concerns ? I do understand some of these
are not well addressed in ACPI and hence people use DT as an alternative.

> Note: This series contains only the basic infrastructure, the plan is add
> progressively more features in the future.
>

I was thinking of queuing this in -next if all the bindings are acked.
Let me know if you still have concerns and would like to avoid getting
these merged. I will hold off then.

--
Regards,
Sudeep

