Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D4EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbQbuM44J9RM7u4vPDqQfR5xiMPHChU+di9URZ1y9zk=; b=A41aUF5tWYKYo6JtPtOoit8xqw
	bNE4ubzef6AIf8zVb+tdfBO0NOW+agQq6HEk72VeyhkV7y1/bmU6ynDoEhZRwUAZgh7M8lvsM31Ic
	xJRabieqP0u4qdrjXtQCrxKotzSU1Y0T7j994brUAhlWPyz2lfH7A3njH2r2417wP0ANz/iOT+hJy
	h7plsmamnI37pCv975fcswreWkv+vVfjUCcR52vWhOGjAqEH519eetc7u7NgfrlACzBeVoDqkYWRs
	2Urvhbq28JOv+ZiXyLfb3Vx9ytDTftM6YkECfrAQ/E/nJE4pg4gnzoWpAQ4ksptdgArrcUAhAMSs2
	kywIjXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuS6-0000000HGo6-3Ley;
	Tue, 25 Feb 2025 12:54:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtpd-0000000HAsu-1d6p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:14:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06CB7152B;
	Tue, 25 Feb 2025 04:14:53 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1B463F6A8;
	Tue, 25 Feb 2025 04:14:33 -0800 (PST)
Date: Tue, 25 Feb 2025 12:14:31 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 00/10] arm64: dts: Add Arm Morello support
Message-ID: <Z720J5kXEnj5sZn0@J2N7QTR9R3>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <Z7jL5wBUJNjOlg4r@J2N7QTR9R3.cambridge.arm.com>
 <58ee2a8d-d3c1-4bc2-92dd-6568f645b01f@arm.com>
 <Z72ydHCLxd-WGsJu@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z72ydHCLxd-WGsJu@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_041437_467076_5CEF4B10 
X-CRM114-Status: GOOD (  27.65  )
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

Hi Sudeep,

On Tue, Feb 25, 2025 at 12:07:16PM +0000, Sudeep Holla wrote:
> On Mon, Feb 24, 2025 at 10:08:18AM +0000, Vincenzo Frascino wrote:
> > On 21/02/2025 18:54, Mark Rutland wrote:
> > > On Fri, Feb 21, 2025 at 06:03:39PM +0000, Vincenzo Frascino wrote:
> > >> This series adds dts support for the Arm Morello System Development
> > >> Platform.
> > >
> > > Do we actually need the dts for this board?
> > >
> > > I have one on my desk; it boots vanilla Debian 12 via UEFI + ACPI just
> > > fine, with the Debian 6.1.0-13-arm64 kernel.
> > >
> > > Is there something that we can only do with the DT? i.e. some
> > > functionality that isn't exposed via ACPI?
> > >
> > > How do you expect this DT to be used?
> >
> > There are functionalities that are not exposed via ACPI, e.g. gpu, dpu, i2c for
> > the phy, etc. My aim to have upstream support for all the hardware exposed by
> > the platform.
> 
> Does this address some of your concerns ? I do understand some of these
> are not well addressed in ACPI and hence people use DT as an alternative.

Yep; I'm happy with this so long as there's an actual functional reason
to have the DT, which it seems there is.

It would have been nice for that to be spelled out a bit clearer in the
cover / commit messages, but that's not important and doesn't need a
respin.

> I was thinking of queuing this in -next if all the bindings are acked.
> Let me know if you still have concerns and would like to avoid getting
> these merged. I will hold off then.

No need to hold off.

Sorry for the confusion; I should have been clearer with my questions.

Mark.

