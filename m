Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A00C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpjggtp7GwhS048QoCuCUNA/NXXIWIBRizdSAeH+gKI=; b=cXjhjxeWPTOvNej4/ZiBHQ010W
	Gw3CsJhScbmCNHD80B1wYsIoVDOMCcwlvaR2BbpO7/FxKa2lmNvBKjytHby9XSGuuGEucHN0KuyaX
	mQQHPZThzfoAmrIh16uWEhk592uXkAlQxC2dSKCXo+4/oUZv1DeKVEGN+yBK8bpGbstvCez/5JsYi
	HKQKpNQuep/bJdaS5qclzwygSTOHvi6gp3YKzPh/Vhw3JrArMGizVDsTs+xO1n/5ZEoe4E4C0imhm
	4TTwOJBJHv1jQureNW6aqmXPs+fdV8FnZ+5wtWzbSMaTg7vpzjJgxVsIZFKmilh+kq6BcSEOOtbRX
	hidYcKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umALn-0000000Dc5i-0bhk;
	Wed, 13 Aug 2025 12:13:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9lc-0000000DX2Y-1H32
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:35:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F0EF12FC;
	Wed, 13 Aug 2025 04:35:28 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 922E53F738;
	Wed, 13 Aug 2025 04:35:34 -0700 (PDT)
Date: Wed, 13 Aug 2025 12:35:31 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>, alexandru.elisei@arm.com
Subject: Re: [PATCH 0/4] clocksource: Add standalone MMIO ARM arch timer
 driver
Message-ID: <aJx4g8z3l438Qgnv@raptor>
References: <20250807160243.1970533-1-maz@kernel.org>
 <20250813-macho-snobbish-alpaca-ff07fa@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-macho-snobbish-alpaca-ff07fa@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_043540_390123_DFC91346 
X-CRM114-Status: GOOD (  25.60  )
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

Hello,

On Wed, Aug 13, 2025 at 11:55:48AM +0100, Sudeep Holla wrote:
> +Alexandru
> 
> On Thu, Aug 07, 2025 at 05:02:39PM +0100, Marc Zyngier wrote:
> > For the past 10 years, both Mark and I have been lamenting about the
> > sorry state of the badly named "arch_timer" driver, and about the way
> > the MMIO part is intricately weaved into the system-register part.
> > 
> > The time has finally come to have a stab at it.
> > 
> > This small series simply creates a new timer driver for the MMIO arch
> > timer, and only that. It is an actual driver, and not some kludge that
> > has to run super early (that's what the per-CPU timers are for). This
> > allows, in turn, a pretty large cleanup of the per-CPU driver, though
> > there is more to come -- one thing at a time.
> > 
> > As an added bonus, we get a clocksource, which the original code
> > didn't provide. Just in case it might be useful. The end-result is far
> > more readable, and about 100 lines smaller.
> > 
> 
> (Tested it on Juno R2 and FVP in both DT and ACPI boot)
> 
> Tested-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> Alexandru found it useful(avoids some unexpected hang IIUC) in his setup
> based on bootwrapper which doesn't initialise MMIO timers.

Just FYI, this is the testing that I did.

Without this series, if firmware (boot-wrapper-aarch64 in my testing) doesn't
configure access to the memory-mapped timer:

[    0.000000] arch_timer: Unable to find a suitable frame in timer @ 0x000000002a810000
[    0.000000] Failed to initialize '/timer@2a810000': -22
..
[    0.528000] kvm [1]: kvm_arch_timer: uninitialized timecounter
..
# ls /dev/kvm
ls: cannot access '/dev/kvm': No such file or directory

With this series, if firmware doesn't configure access to the memory-mapped
timer:

[    0.549399] kvm [1]: Hyp nVHE mode initialized successfully
..
[    2.018050] arch-timer-mmio 2a810000.timer: Unable to find a suitable frame in timer @ 0x000000002a810000
[    2.018123] arch-timer-mmio 2a810000.timer: probe with driver arch-timer-mmio failed with error -22
..
# ls /dev/kvm
/dev/kvm

Thanks,
Alex

