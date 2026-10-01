Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D51CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iizZ37YCyt0JuD9TWG1UJdkgHhgtfmDppBMBFdI7UxA=; b=pqIOCQza5ON8SPnZBaPPzLmkE1
	swdB70EPT9TbqW+4HAE6MDqZg+GCBogI/Lp+RPaFwgy6ZPL38VcIuOurxe54sp4pYS8482A7NXOGg
	vaDMzc8o4JqWUwzO7RM5hAsoX6+nJ2G9QVwxKNfOQnF1ASeHdBVSocif8Odaw5YBlqY0OCY0qjMRg
	SMlBDpV3a709GKZCU4VjTj0W6d4CcUZ8kX1MPOBr74rY+LPyBTnTuOnnohtZ54riatCLLUgDbkBdd
	DM9/tthm/ipT5Mo1ekCBPENKAf0GamdZx+L5qQ3Waw29otUwooZEPUk931HlphgFbsDI9IZpASXbr
	lqaEodbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB5z-00000007z2D-0Cks;
	Thu, 01 Oct 2026 07:20:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB5y-00000007z1t-0CP2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 07:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iizZ37YCyt0JuD9TWG1UJdkgHhgtfmDppBMBFdI7UxA=; b=Jvq0UdEr/0oJ510rMlbfzZ39Q7
	vO9pVYKoAKMLocfusO4LwFLS1SCT2Y/LhO2JNLSndOxgVgFauQVD2jwvOeYoAfxX7aaZyiGw7PsaK
	k23G48J5QeDilJIjnx4CyTGwAqNrF4qhJTkhKwKgaiTKgIPqUKTsJjGGtu504C7osB/D9vdyst+8F
	ybpjXZtLkw5UDDMz/vs6qb5TQ74kMJY84a1PZM8aFWcoBsPcHpaSzgC7SnaZ6AHetFoXvvluDeqhP
	cxAfpDi8SeVJnYbYP1xer+Zc4G9kIJW8fOqqO2IlBa5YqqpBzvEKwVPG1hGxdF8e/FQY+a1DHx+1Z
	R2wwKggQ==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCB5p-00000004fil-07yP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790839237; x=1822375237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5oEqkdeg9YvpX/JVhCgWCo74NzUlC5YA5Ynfjw7rP4=;
  b=J2KIJIYobF3XKm7wm4jaVL56YTymP3UrcQmv0aZQe05ln3THHfinqrpB
   XLYwo3VVsiFwR8ZidaErxjUO8cGAnBjI3ZR2OgvJvVerdx9XWbYwJR/Xl
   5zGyi81WsbKz2mOghAhTFqhSYIod9nxy/huS1ptrkv++afQIXcS30vG8P
   8MicLVCpX4gAexnuFaPxEuH755OC+qKJKiPoJxcsb5jxI0Bc0wl3jUKP/
   QXpVKEwzACa/1YKHobPKAXZhXThjVFL9Uerkrb3YNSvVcBtFnDK9WAj2G
   h2Y5CfB3uxg2Am7+wbLd6NGfpvFFHe/FVvi3d/a8ZRP0H7TPypVhm2HXf
   Q==;
X-CSE-ConnectionGUID: jHO4DcImSl2UGEoEAlqAPg==
X-CSE-MsgGUID: kWJZMz+uQim37FoUcU5GCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="95396583"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="95396583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:20:32 -0700
X-CSE-ConnectionGUID: R8cZksT4SGyr7eFGfnLaAQ==
X-CSE-MsgGUID: bpltgbzmR/6D/vwvT0LK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="302171307"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:20:30 -0700
Date: Thu, 1 Oct 2026 10:20:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 5/6] spi: pxa2xx-pci: restore LPSS private register
 state across S3 resume
Message-ID: <ar4Ju6oGkWGCOlct@ashevche-desk.local>
References: <20260930160629.1822-1-fourdollars@debian.org>
 <20260930160629.1822-6-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930160629.1822-6-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_082039_432189_352D7FF1 
X-CRM114-Status: GOOD (  19.79  )
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

On Thu, Oct 01, 2026 at 12:06:28AM +0800, Shih-Yuan Lee wrote:
> On platforms where Intel LPSS SPI is enumerated as a bare PCI device
> (such as the Apple MacBook8,1 on Lynxpoint-LP), the LPSS power island
> loses power during system sleep and powers up with the controller held
> in reset. Because the device lacks ACPI companion objects or MFD
> binding, neither drivers/acpi/x86/lpss.c nor drivers/mfd/intel-lpss.c
> restore the private register context across S3 resume.
> 
> This causes memory-mapped I/O reads on resume to return ~0, resulting
> in PCIe Completion Timeouts, missing interrupts, and dead
> keyboard/touchpad.
> 
> Restore LPSS private registers and deassert functional, APB, and iDMA
> resets in the PCI glue layer:
> 1. In suspend, quiesce the controller queue via spi_controller_suspend()
>    so no transfers remain in flight and chip select is deasserted.
>    Then save the LPSS private registers (LPSS_PRIV_REG_COUNT 9 covering
>    up to offset 0x20 including reg_cs_ctrl at 0x18). Ensure the clock is
>    active for reading MMIO registers using pm_runtime_resume_and_get(),
>    balanced by pm_runtime_put_noidle(), before calling
>    pm_runtime_force_suspend().
> 2. In resume, restore LPSS private registers and deassert functional,
>    APB, and iDMA resets via pxa2xx_spi_pci_lpss_restore_ctx() before
>    calling pm_runtime_force_resume(). Because the controller clock
>    remains gated (clk_enabled is false) during this restoration, any
>    interrupt arriving on a shared line bails out early in ssp_int()
>    without accessing registers on a controller held in reset. Once
>    resets are deasserted and private registers are restored, call
>    pm_runtime_force_resume() to enable the clock and mark the device
>    active, and restart the queue with spi_controller_resume().
> 3. In probe, call pci_d3cold_disable() for Lynxpoint-LP (is_lpt) to
>    ensure the PCI device cannot enter D3cold during runtime PM,
>    guaranteeing that LPSS private registers are retained during S0 idle
>    periods and only require restoration across S3 system sleep. Set
>    DPM_FLAG_NO_DIRECT_COMPLETE to prevent PCI subsystem direct-complete
>    bypassing system sleep callbacks.
> 4. Scope LPSS context restoration specifically to Lynxpoint-LP
>    (PCI_DEVICE_ID_INTEL_LPT*) devices to avoid perturbing other LPSS
>    PCI platforms (BYT, BSW) or non-LPSS platforms.
> 
> Export lpss_ssp_setup() and core runtime PM ops so the PCI glue layer
> can invoke them around private register restoration.

No, as I told earlier please find a way how to not add a code duplication.

> Assisted-by: Antigravity:gemini-3.8-flash sparse

Assisted-by: LLM

-- 
With Best Regards,
Andy Shevchenko



