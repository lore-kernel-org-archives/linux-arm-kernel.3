Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6jyp32uUawh83SRhr8POWlLF0OVHeuNyqGYp5nxZsY=; b=ey+vBEeD+xF97F2QdJIoAZZFn1
	D0e0666xwWLCsMtIR4HTDz2z/73OyZZzgTzD2I5QsEBDFZ0/X+eo/iVYqKzhT7dx7zLh4ltBKUxod
	g8DKrSzc9UDkQl80x40oLIESWPnNgqY3lt9ek8MRlGtdD44BgVPAbqS/BFfkZiRXXnUJrBjFqGCtN
	Agl97QuDuX8GmSri0VmLfuYYVCB3EVRpQ3bHVdkec1D/PUQLobe0QZPeG7wkCh473vCFeVLziMi75
	sM4ZcGbABmNI2UazRR6dw04mUqBLelY1ZCHL2eqRNodWX6qyk2971+4foMHZwCnLGnPRT5K5GIQa4
	/uoNY0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3c-0000000AYKd-1ATm;
	Mon, 13 Jul 2026 23:27:28 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3V-0000000AYH3-3JwH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:27:23 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gzdrN5XjXz8v6x;
	Tue, 14 Jul 2026 01:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783985236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6jyp32uUawh83SRhr8POWlLF0OVHeuNyqGYp5nxZsY=;
	b=eeFZ4MWuPw2jU5Jcg7tSt39IfugRem3NikpSYn2zhVLCahxbtlWJdjgXDpQfyxw4LG+Bw6
	aFInhLaVgicO1NFdzknmCWt9l5VsdB9KnpHor1SiPt3gYaxV/Kqx0Erhau2IJWA/s0q8PV
	UUVD2H0b3QfX7LGqCfUUSKN41g1RJc5h9ewzCb4tbC5eBdty4zW9yChEp0C98o4VdDtKRD
	qr/kbY5B9jBMmrD4Ju2rNBFuzdxSSCpNwQpINvcdpb3Ltvo5kY4+Bbg3A2UBYdBmAhGcq2
	EP5h2nU9DRLck57ikG3T0RmATVVo8wdJ9DUEjTMOTYfQAIdzm/VF/cOfYyQaVA==
Message-ID: <7715ca62-be37-4c6e-86d1-3d0816bf9bfb@mailbox.org>
Date: Mon, 13 Jul 2026 18:20:14 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260709201103.90162-1-marek.vasut+renesas@mailbox.org>
 <87qzlb5jsl.wl-maz@kernel.org>
 <2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
 <87fr1m6hma.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87fr1m6hma.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 870d1a74b75403cd9a9
X-MBO-RS-META: m76s4j99tj8fo9x8q4hzjed7j1qa4ujj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_162722_118410_C4E572D5 
X-CRM114-Status: GOOD (  15.52  )
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

On 7/13/26 5:20 PM, Marc Zyngier wrote:
> On Fri, 10 Jul 2026 14:35:10 +0100,
> Marek Vasut <marek.vasut@mailbox.org> wrote:
>>
>> On 7/10/26 10:30 AM, Marc Zyngier wrote:
>>> On Thu, 09 Jul 2026 21:10:03 +0100,
>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>
>>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h , copy the
>>>> one GITS_TRANSLATER register offset macro directly into the driver.
>>>> This repairs the ability to build the driver on non-ARM non-GIC targets
>>>> the way it was possible until now, which retains good build test coverage.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
>>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>>> Cc: Manivannan Sadhasivam <mani@kernel.org>
>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-doc@vger.kernel.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: linux-pci@vger.kernel.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> Note: The alternative I could think of would be ifdeffery which
>>>>         is not nice and thwarts the build coverage, or limit the
>>>>         driver to ARM/ARM64 in Kconfig which also thwarts the build
>>>>         coverage. I could also split off the register macros in
>>>>         linux/irqchip/arm-gic-v3.h into some separate header
>>>>         linux/irqchip/arm-gic-v3-regs.h and include that which
>>>>         might be OKish and avoids duplication. Thoughts ?
>>>
>>> No, I'm not hacking something that is purely architecture specific for
>>> the purpose of a bizarre integration quirk that should be handled by
>>> the boot firmware, and not Linux.
>>
>> The PCIe controller is fully controlled by Linux.
> 
> And it shouldn't. Why can't your favourite boot-loader use it, like on
> any reasonable machine?
Because U-Boot is designed to boot as quickly as possible and get out of 
the way, which means lazy initialization of any and all resources, which 
means skip initialization of any and all hardware that is not needed to 
boot the machine. It is one of the core design decisions behind the 
U-Boot driver model [1].

The R-Car V4H using mainline U-Boot can boot from PCIe/NVMe SSD, but 
that is purely optional and some users might instead boot from SD cards 
or eMMCs, and even then the PCIe hardware is shut down before booting 
the OS to prevent any issues during OS boot or reinitialization by the OS.

[1] 
https://git.u-boot-project.org/u-boot/u-boot/-/blob/main/doc/develop/driver-model/design.rst?ref_type=heads&plain=1#L794

