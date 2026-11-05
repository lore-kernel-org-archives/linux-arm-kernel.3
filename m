Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38571606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dNJ3b+pW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdeYV5o4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TAD50w4Kgmmwo5lPSjT+aAIMNVyfykU0qm7hKIpfWJE=; b=dNJ3b+pWFa32bjLeAfvZyd8m6l
	WM2upJt5t+VlNENGqmMo9T+YUc9scZSNd3AqOFTOh4USsFdNMcEx0MrVhrGwplT7jHM0W5oIvRhS7
	9t/02JulVInfP1LDfmNIDvVdUoRtr58P3AoMNaAlEFv0mWekXvu6hLF9BO5aVm45qnydYUhqPW9eq
	yh/blgytPGAl01TCY4OzH3cr9bRHrODYpOgb+r4hNFKbDDI0xCu7tkZjE2/OHY1tiBjUxARAM9bgT
	iMafgmvb/zg8DuygF+NrV7j9LlVRVwYqQ0VbpbfrKknpOYOC9fzEVbL9OAogc7BLgI818Jvo/B+dR
	FOTErGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxwn-00000009BH2-3X3N;
	Thu, 05 Nov 2026 13:56:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxwm-00000009BGe-46gz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:56:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E35C405DF;
	Thu,  5 Nov 2026 13:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184911F00919;
	Thu,  5 Nov 2026 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886968;
	bh=TAD50w4Kgmmwo5lPSjT+aAIMNVyfykU0qm7hKIpfWJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XdeYV5o4FFKHNhtNT2A9GVAg5b4ZTBernk7rOs899cnx0TEnmoFSNbIWbOIzMlz0U
	 Bdx0KdRvGTGYsyyKqjdb++QSlk09uMeGIcyXWfghAe9vGOgNOc4+2bpzkC2kwQg7d8
	 IM9ll6b+qbZ8Ca04ggAzXfOQ08U1pi41yqrBzT+kTZ6vgp/a1hTmK1q3hLbkk/QYaD
	 3H9ueTpy5SCuojkzBHsZ8xDYvCitMF5kSeEEkPolxgnyLKNpnGAXZl+Wf1ehzYR1Cy
	 +eD7M7VEq8XKyERZVIl2hAt1bgH0fM73uiyd4WoOLVVB4+Du3fNvL05/QzYOM50dmc
	 Zq+trhgrr2g6Q==
Date: Thu, 5 Nov 2026 13:56:02 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, arm <arm@kernel.org>,
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <20261105-tan-stingray-of-amplitude-cf5cff@sudeepholla>
References: <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
 <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
 <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>
 <aux_4NxiWvD9uVev@orome>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aux_4NxiWvD9uVev@orome>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 02:31:31PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 10:23:24AM +0000, Sudeep Holla wrote:
> > On Thu, Nov 05, 2026 at 10:54:42AM +0100, Arnd Bergmann wrote:
> > > On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:

[...]

> > 
> > I’ve quickly reviewed the patch; it does implements a custom method BMRQ
> > rather than a standard or out-of-the-box solution. More details on this is
> > used based on my understanding below.
> 
> To get everyone on the same page: in a nutshell, BPMP is a separate
> processor that handles various aspects of power management (Boot and
> Power Management Processor). The CPU communicates with it over a shared
> memory region and a mailbox/doorbell for signalling.
> 

I interpret this as PCC is used where needed and that aligns well with
my understanding.

> > > How does this relate to the EC and PCC interfaces in ACPI systems?
> > > 
> > 
> > I am still evaluating how the BPMP driver is intended to operate on ACPI
> > systems. In the meantime, I share the same questions noted above. The current
> > commit message lists several driver features that may not be required for
> > ACPI, which has introduced some clarity issues regarding the intended design.
> 
> My understanding is that an ACPI systems, as opposed to DT where we do
> this all through kernel drivers, the inter-processor communication is
> done via AML. This is because standard power management operations use
> this same mechanism to enable clocks, deassert resets, etc.
> 

Thanks for confirming this. I think we are almost aligned with respect to
the expectations from any ACPI system firmware.

> > > In current mainline, I see that the bpmp driver is used on DT systems
> > > by the tegra specific cpufreq, memory and pci drivers, but I would
> > > expect that on ACPI those all use shared drivers. Are there any other
> > > users that are not already covered on ACPI?
> > > 
> > 
> > For ACPI systems, CPUFreq operates through CPPC via PCC, MEMIO, or
> > supported backends.
> > 
> > My understanding is that the BMRQ method is called by tegra_bpmp_transfer(),
> > which supports Tegra-specific drivers for power domains, clocks, resets,
> > I2C, PCIe, and memory. On ACPI, these can be abstracted through PCC
> > OpRegions as part of standard methods like _ON/_OFF or other device state
> > methods. Although device/memory DVFS is trickier since the ACPI
> > specification lacks standard methods for it today, the commit message
> > implies these components are largely unused on ACPI systems.
> 
> I think this goes back to the disconnect from the patch thread and
> earlier in this discussion: the intent was very much to encapsulate all
> the power management within standard ACPI methods, and that's working
> fine, hence why clocks, resets and power domains are not getting exposed
> on ACPI systems.
> 

Agreed and I think we are aligned.

> However, there's no equivalent in ACPI to expose these MBWT knobs, hence
> the need to expose this through BPMP directly.
> 

IIUC this is Memory Bandwidth Throttling and shouldn't that align with
Arm MPAM and resctrl framework in the kernel ? We now have MPAM via PCC,
so if the firmware exposes the right interface, you must be able to reuse
that. Even otherwise, shouldn't to make this fit with resctrl ? What am I
missing ?

-- 
Regards,
Sudeep

