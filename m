Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CD0E66880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKMw7PWCHtYF2/1dnThOi6q3Zj91xf2WJokS+nJ3Q6Y=; b=lKYjnYp9bZDu6qnKYKyGHd8yne
	5uOVMPCjx4+eUM9bJRxYlJSBAqTE/96lNIS/ToqhrNwtrLrIrGPQHnd6YubKV0ri7sMNvVQyKCeBy
	UIaQ+04JwSspvpKhgmGCBKyWL2Orb9keze8+xT3Nn93D2rvI46Ci85euPnObniZTNFAR1PCAJVN1g
	ijE/llUkPgpCMlBApJQOI9kEhB23906cBz38o67nN6ZmPd3fI3ATt2CkOgSbuM+ErPcmjrsolty0a
	UjcmvyqpGgI/Re5h0fxKo2zPHYtp4IG0nt/r0WldUFhG987AQuxOsmmQUp1yf6cuz7TxugoPUbZ9C
	I2zVSoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeBQ-0000000Ai40-0KFN;
	Fri, 19 Dec 2025 17:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeBN-0000000Ai3S-3L95
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 17:22:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAC2DFEC;
	Fri, 19 Dec 2025 09:22:17 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 421CB3F73F;
	Fri, 19 Dec 2025 09:22:22 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: Will Deacon <will@kernel.org>
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
Date: Fri, 19 Dec 2025 17:21:54 +0000
Message-ID: <20251219172212.2844694-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aUVMWMMmiG8_I2I2@willie-the-truck>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_092225_939117_0C428378 
X-CRM114-Status: GOOD (  30.54  )
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

On Fri, 19 Dec 2025 13:00:08 +0000, Will Deacon wrote:
>On Fri, Dec 19, 2025 at 09:02:35AM +0000, Ahmed Tiba wrote:
>> On Thu, 18 Dec 2025 03:19:17PM +0000, Will Deacon wrote:
>> > On Thu, Dec 18, 2025 at 01:42:47PM +0000, Ahmed Tiba wrote:
>> >> On Thu, 18 Dec 2025 12:13:25PM +0000, Will Deacon wrote:
>> >> >> Introduce a platform driver that maps the CPER status block described
>> >> >> in DeviceTree, feeds it into the estatus core and handles either IRQ- or
>> >> >> poll-driven notifications. Arm64 gains a FIX_ESTATUS_IRQ slot so the
>> >> >> driver can safely map the shared buffer while copying records.
>> >> >>
>> >> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
>> >> >> ---
>> >> >>  MAINTAINERS                     |   1 +
>> >> >>  arch/arm64/include/asm/fixmap.h |   5 +
>> >> >>  drivers/ras/Kconfig             |  14 ++
>> >> >>  drivers/ras/Makefile            |   1 +
>> >> >>  drivers/ras/estatus-dt.c        | 318 ++++++++++++++++++++++++++++++++
>> >> >>  include/linux/estatus.h         |   3 +-
>> >> >>  6 files changed, 341 insertions(+), 1 deletion(-)
>> >> >>  create mode 100644 drivers/ras/estatus-dt.c
>> >> >>
>> >> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> >> index 6b2ef2ddc0c7..5567d5e82053 100644
>> >> >> --- a/MAINTAINERS
>> >> >> +++ b/MAINTAINERS
>> >> >> @@ -21761,6 +21761,7 @@ RAS ERROR STATUS
>> >> >>  M:   Ahmed Tiba <ahmed.tiba@arm.com>
>> >> >>  S:   Maintained
>> >> >>  F:   Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
>> >> >> +F:   drivers/ras/estatus-dt.c
>> >> >>  F:   drivers/firmware/efi/estatus.c
>> >> >>  F:   include/linux/estatus.h
>> >> >>
>> >> >> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
>> >> >> index 65555284446e..85ffba87bab9 100644
>> >> >> --- a/arch/arm64/include/asm/fixmap.h
>> >> >> +++ b/arch/arm64/include/asm/fixmap.h
>> >> >> @@ -64,6 +64,11 @@ enum fixed_addresses {
>> >> >>  #endif
>> >> >>  #endif /* CONFIG_ACPI_APEI_GHES */
>> >> >>
>> >> >> +#ifdef CONFIG_RAS_ESTATUS_DT
>> >> >> +     /* Used for ESTATUS mapping from assorted contexts */
>> >> >> +     FIX_ESTATUS_IRQ,
>> >> >> +#endif /* CONFIG_RAS_ESTATUS_DT */
>> >> >
>> >> > Why do we need this in addition to the four existing GHES slots? The DT
>> >> > code doesn't use it and I was assuming that the ACPI code would continue
>> >> > to use the existing irq; is that not the case?
>> >>
>> >>
>> >> We still need a dedicated slot when only the DT provider is built.
>> >> All four GHES slots are defined as part of the ACPI implementation,
>> >> so they are not present in a DT-only configuration.
>> >>
>> >> The estatus core always requests a fixmap index from each provider
>> >> before copying a CPER record. As a result, the DT driver must supply
>> >> its own slot to return a valid enum value to satisfy the common code.
>> >
>> > Sorry, but I still don't follow this. The DT code doesn't use the fixmap,
>> > does it? It looks like it maps the buffer ahead of time using
>> > devm_ioremap_resource() and then the accessors don't use the fixmap
>> > index at all, hence the horrible '(void)fixmap_idx;' cast which presumably
>> > stops the compiler from complaining about an unused variable.
>> 
>> Correct. The current DT driver keeps the CPER buffer permanently mapped with
>> devm_ioremap_resource() and that (void)fixmap_idx; line is just silencing
>> the warning. I’ll fix that by dropping the permanent mapping and copying the
>> status block via the fixmap entry, so the DT implementation mirrors GHES. That
>> gets rid of the cast and makes FIX_ESTATUS_IRQ do real work.

> Why can't you just drop FIX_ESTATUS_IRQ entirely? Your original
> justification was:
>
>> We still need a dedicated slot when only the DT provider is built.
>
> but as above, the DT driver doesn't actually need it.

The DT provider is intended to mirror the GHES path, so both need to supply a
fixmap slot to satisfy the estatus core interface.

I could drop FIX_ESTATUS_IRQ entirely, but that would require relaxing the
estatus core so a provider can explicitly indicate that it does not use a
fixmap and instead relies on a permanent mapping. If we want to stay aligned
with the ACPI/GHES model, keeping the fixmap-based approach seems preferable.

Thanks,
Ahmed

