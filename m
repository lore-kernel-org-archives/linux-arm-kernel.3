Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E91D74969
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of2zYMn9Y37m+Nb8B/qaCcNtZbFVJS5uJCNEGYQef1E=; b=4P4jw3g533sPTGMeicSz+xBEsC
	dHpBbSWt2q2L/VqH80pjYyFz5vAv0RdMwSpTQ1jdiS9WYb4S+74VMvoI796lLWKzy6Zrmde/id6x6
	NMIqbdHZ/yiib0mkkPLpBVKSxeDor+YWbgAYymThSiLGkcsODqSbjxV21ONxL2YWlLOQ5hapf2HVe
	1oTaCovdcwmAoBTB0h/0alFJkhbuixZDkaIk7wCMCn4S6Nc4YyqNf5u0BxF3aNU0/PnDaPffL4VaQ
	1D7af5EnsYrPvzz0h4TcHq8rKHUF6RJnqrvTAQrUp14b3NuxaQZdbr9ifVGcoM8KakARvj4MjFIy4
	962I0tyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWNt-00000009u40-1DQ9;
	Fri, 19 Dec 2025 09:02:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWNq-00000009u3c-1AWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:02:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9578EFEC;
	Fri, 19 Dec 2025 01:02:36 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 865ED3F73F;
	Fri, 19 Dec 2025 01:02:41 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: will@kernel.org
Cc: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 11/12] ras: add DeviceTree estatus provider driver
Date: Fri, 19 Dec 2025 09:02:35 +0000
Message-ID: <20251219090239.2692458-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aUQbdZHkzumTnwVP@willie-the-truck>
References: <aUQbdZHkzumTnwVP@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_010246_433024_92EE684D 
X-CRM114-Status: GOOD (  27.32  )
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

On Thu, 18 Dec 2025 03:19:17PM +0000, Will Deacon wrote:
> On Thu, Dec 18, 2025 at 01:42:47PM +0000, Ahmed Tiba wrote:
>> On Thu, 18 Dec 2025 12:13:25PM +0000, Will Deacon wrote:
>> >> Introduce a platform driver that maps the CPER status block described
>> >> in DeviceTree, feeds it into the estatus core and handles either IRQ- or
>> >> poll-driven notifications. Arm64 gains a FIX_ESTATUS_IRQ slot so the
>> >> driver can safely map the shared buffer while copying records.
>> >>
>> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
>> >> ---
>> >>  MAINTAINERS                     |   1 +
>> >>  arch/arm64/include/asm/fixmap.h |   5 +
>> >>  drivers/ras/Kconfig             |  14 ++
>> >>  drivers/ras/Makefile            |   1 +
>> >>  drivers/ras/estatus-dt.c        | 318 ++++++++++++++++++++++++++++++++
>> >>  include/linux/estatus.h         |   3 +-
>> >>  6 files changed, 341 insertions(+), 1 deletion(-)
>> >>  create mode 100644 drivers/ras/estatus-dt.c
>> >>
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index 6b2ef2ddc0c7..5567d5e82053 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -21761,6 +21761,7 @@ RAS ERROR STATUS
>> >>  M:   Ahmed Tiba <ahmed.tiba@arm.com>
>> >>  S:   Maintained
>> >>  F:   Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
>> >> +F:   drivers/ras/estatus-dt.c
>> >>  F:   drivers/firmware/efi/estatus.c
>> >>  F:   include/linux/estatus.h
>> >>
>> >> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
>> >> index 65555284446e..85ffba87bab9 100644
>> >> --- a/arch/arm64/include/asm/fixmap.h
>> >> +++ b/arch/arm64/include/asm/fixmap.h
>> >> @@ -64,6 +64,11 @@ enum fixed_addresses {
>> >>  #endif
>> >>  #endif /* CONFIG_ACPI_APEI_GHES */
>> >>
>> >> +#ifdef CONFIG_RAS_ESTATUS_DT
>> >> +     /* Used for ESTATUS mapping from assorted contexts */
>> >> +     FIX_ESTATUS_IRQ,
>> >> +#endif /* CONFIG_RAS_ESTATUS_DT */
>> >
>> > Why do we need this in addition to the four existing GHES slots? The DT
>> > code doesn't use it and I was assuming that the ACPI code would continue
>> > to use the existing irq; is that not the case?
>>
>>
>> We still need a dedicated slot when only the DT provider is built.
>> All four GHES slots are defined as part of the ACPI implementation,
>> so they are not present in a DT-only configuration.
>>
>> The estatus core always requests a fixmap index from each provider
>> before copying a CPER record. As a result, the DT driver must supply
>> its own slot to return a valid enum value to satisfy the common code.
>
> Sorry, but I still don't follow this. The DT code doesn't use the fixmap,
> does it? It looks like it maps the buffer ahead of time using
> devm_ioremap_resource() and then the accessors don't use the fixmap
> index at all, hence the horrible '(void)fixmap_idx;' cast which presumably
> stops the compiler from complaining about an unused variable.

Correct. The current DT driver keeps the CPER buffer permanently mapped with
devm_ioremap_resource() and that (void)fixmap_idx; line is just silencing
the warning. I’ll fix that by dropping the permanent mapping and copying the
status block via the fixmap entry, so the DT implementation mirrors GHES. That
gets rid of the cast and makes FIX_ESTATUS_IRQ do real work.


Thanks,
Ahmed

