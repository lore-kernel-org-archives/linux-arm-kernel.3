Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0221C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6jqwo4O2Pk/LlFTf1dxPn0trRdMJZXcWid5JjSLdQk=; b=gMMPNG0Vgo50TJYxz2/5btCay1
	RDg8WruzCywWuOHdd7HzMHgyUoC9hC16kXrjkKQaSd0j0LMgXmOdk5vM0ibjvP+I7849bi66oEN0D
	11NlSgfWrVRJ1IvgE0NN4EXGnXrdjn1NjB1b4CCCvXU+v3hCGJzZc/0tFEIgN3kbMmqDUaYfwgbMj
	eWEtWHlrCUEy2/iEdoR03VkPS0MQ6jDfRmf4HHWPWR1AwhGpthWY7vw9zPFTxtW732kTgaQSzXukY
	h/PNj+9/6pNtDMK9aiPH3CxYmJ+Ath4XRs4A87RhyHG/9NzMvZtlvavvy9ZUuDPTNx7uc48F2ik8c
	q3H0zhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ek-000000019WA-2xs0;
	Tue, 25 Feb 2025 19:31:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0SF-000000016pc-0ZWP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:18:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E0E6152B;
	Tue, 25 Feb 2025 11:19:09 -0800 (PST)
Received: from bogus (unknown [10.57.37.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6DB83F5A1;
	Tue, 25 Feb 2025 11:18:49 -0800 (PST)
Date: Tue, 25 Feb 2025 19:18:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 00/10] arm64: dts: Add Arm Morello support
Message-ID: <20250225191846.5zopbxloo4zuoxp5@bogus>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <Z7jL5wBUJNjOlg4r@J2N7QTR9R3.cambridge.arm.com>
 <58ee2a8d-d3c1-4bc2-92dd-6568f645b01f@arm.com>
 <Z72ydHCLxd-WGsJu@bogus>
 <Z720J5kXEnj5sZn0@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z720J5kXEnj5sZn0@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_111855_220156_88F22CDD 
X-CRM114-Status: GOOD (  36.67  )
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

On Tue, Feb 25, 2025 at 12:14:31PM +0000, Mark Rutland wrote:
> Hi Sudeep,
> 
> On Tue, Feb 25, 2025 at 12:07:16PM +0000, Sudeep Holla wrote:
> > On Mon, Feb 24, 2025 at 10:08:18AM +0000, Vincenzo Frascino wrote:
> > > On 21/02/2025 18:54, Mark Rutland wrote:
> > > > On Fri, Feb 21, 2025 at 06:03:39PM +0000, Vincenzo Frascino wrote:
> > > >> This series adds dts support for the Arm Morello System Development
> > > >> Platform.
> > > >
> > > > Do we actually need the dts for this board?
> > > >
> > > > I have one on my desk; it boots vanilla Debian 12 via UEFI + ACPI just
> > > > fine, with the Debian 6.1.0-13-arm64 kernel.
> > > >
> > > > Is there something that we can only do with the DT? i.e. some
> > > > functionality that isn't exposed via ACPI?
> > > >
> > > > How do you expect this DT to be used?
> > >
> > > There are functionalities that are not exposed via ACPI, e.g. gpu, dpu, i2c for
> > > the phy, etc. My aim to have upstream support for all the hardware exposed by
> > > the platform.
> > 
> > Does this address some of your concerns ? I do understand some of these
> > are not well addressed in ACPI and hence people use DT as an alternative.
> 
> Yep; I'm happy with this so long as there's an actual functional reason
> to have the DT, which it seems there is.
> 
> It would have been nice for that to be spelled out a bit clearer in the
> cover / commit messages, but that's not important and doesn't need a
> respin.
>

I can add that info in my pull request as it is very valid point. One needs
to know why we are pushing DTS now after couple of years after the boards
are available and why DT over ACPI which is shipped with the device.

> > I was thinking of queuing this in -next if all the bindings are acked.
> > Let me know if you still have concerns and would like to avoid getting
> > these merged. I will hold off then.
> 
> No need to hold off.
> 
> Sorry for the confusion; I should have been clearer with my questions.
> 

No confusion as such, good to ask explicitly and get the motivation for
this series captured on the list. Since I had gone through this motion
even with N1SDP which for some reasons I don't know didn't appear on the
list, I didn't ask it and implicitly assumed similar reasoning.

So, it is good that you asked and got it answered for wider audience here.

-- 
Regards,
Sudeep

