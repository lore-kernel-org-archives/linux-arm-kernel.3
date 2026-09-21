Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96994C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUk6xrHyMi4gFz7Q2nWEkOHH5s2Hu2ne+l7Vi+ljp6Q=; b=pAYz+b5jq2dZJZQvX01Oxyt76g
	VdLF/E+KQXqwmmP5Rouvme0IJrNaHBO2S5F47d59YdTfoTS4NkS7sqSEB4RD8sr3i00KWdPNVVlHM
	MMuPK8QPZfzDPmiNf0WMFsqwg3gk6AzHLae1JTUESMAWEcfy5Xlw8/KC49UqrQNBdGQKqV6s4M7Iw
	UPIxnp7zVcn97Bi90gm6x1M5YF99ZTGKlwz99FmHbOi0x8T/yRorM29VQXlZXxAmzoLqXkqzNFq7L
	cRoOxPy2w6riKa+EV/CGoWLk7/gMZijDV1lQLq0Q1KX0MPH4ZzmI0cZWt7tkqHrjZIb47PryqRtjS
	A4yHUm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gkK-00000002oH6-2aGD;
	Mon, 21 Sep 2026 16:20:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gkJ-00000002oGv-0MSB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:19:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D26DB429D6;
	Mon, 21 Sep 2026 16:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA1D1F00893;
	Mon, 21 Sep 2026 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790007598;
	bh=yUk6xrHyMi4gFz7Q2nWEkOHH5s2Hu2ne+l7Vi+ljp6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UbxK2uxURejDJlalyThSRTeTHPax9jSfShPdzCRZkP3u0RZSL8ufyoda7eOKicwe8
	 A6vKtma1Z4LdM6+QhHs2KhURVQw/tQweIBomV0Fs0bIxphqHuqdBdXTH6uj89tQocL
	 QmEawNd3P4dx1hmF2HM1b2KwGFi7NihQpZZ4x/+VT8vNVTVnWrDKAKXogwLjhJV5pv
	 XEV+9G4BACeyxqQh1+IIFCDVF8Cx/+xCnMajPrKrlZrazEdt3drIXiGv21VItc1Uek
	 QjDuJj4USMvKbR2MO0l6ymVn/GNsoa5SsO39JaNz86/hs3yczaiN+IweshvtnjgRVU
	 Ots9izkGZaPtw==
Date: Mon, 21 Sep 2026 17:19:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 8/8] firmware: smccc: lfa: add sysfs ABI documentation
Message-ID: <20260921-essential-inquisitive-spaniel-9801eb@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-9-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 04:11:11PM +0200, Andre Przywara wrote:
> Document the sysfs attribute files as exported by the LFA driver.
>

Looking at the sysfs output in 2/8 message log,
activation_pending is missing from the documentation.

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/ABI/testing/sysfs-firmware-lfa | 106 +++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
> 
> diff --git a/Documentation/ABI/testing/sysfs-firmware-lfa b/Documentation/ABI/testing/sysfs-firmware-lfa
> new file mode 100644
> index 0000000000000..afd349af9cf14
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-lfa
> @@ -0,0 +1,106 @@
> +What:		/sys/firmware/lfa
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		The Arm Live Firmware Activation (LFA) spec describes an
> +		interface between platform firmware (an agent) and any user
> +		on the non-secure side (like the Linux kernel) to activate
> +		pending firmware updates at runtime. The actual firmware
> +		update would be provided independently (out-of-band, or
> +		via any existing explicit firmware update mechanisms), then,
> +		if supported, can be activated immediately, without rebooting
> +		the system.
> +		This directory contains one directory for each of the LFA
> +		capable firmware images supported by the agent, identified by
> +		its GUID. Within each directory, the same set of sysfs files
> +		provides access to the properties and actions for this
> +		particular firmware image.
> +
> +What:		/sys/firmware/lfa/<GUID>/activate
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(WO) Write a boolean 'true' value to trigger the
> +		activation of that firmware component. An update must be
> +		pending for this to be successful.
> +
> +What:		/sys/firmware/lfa/<GUID>/activation_capable
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(RO) A boolean value to show whether this firmware image is
> +		capable of being activated.
> +
> +What:		/sys/firmware/lfa/<GUID>/auto_activate
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(RW) Write a boolean 'true' value to allow a firmware image
> +		to be automatically activated once a new firmware update
> +		becomes available ("pending"). This depends on a working
> +		notification scheme, for instance via an ACPI notification
> +		or an interrupt to notify the kernel.
> +
> +What:		/sys/firmware/lfa/<GUID>/cancel
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(WO) Write a boolean 'true' value to cancel a recently
> +		triggered activation, if that has not finished yet.
> +
> +What:		/sys/firmware/lfa/<GUID>/cpu_rendezvous
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(RO) A boolean value to show whether this image requires
> +		a CPU rendezvous in firmware to be activated. If true, this
> +		means all CPUs will enter the firmware during the activation
> +		process, so will not be able to execute kernel code or
> +		handle interrupts for a brief moment.

What use does the userspace have with this 'activation_pending' and
'may_reset_cpu' ? We should drop them unless you convince otherwise.

-- 
Regards,
Sudeep

