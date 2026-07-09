Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D433C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTRYbwF/XxEjYYFob5S+WLNVX0HYy0ckmE1WUa6o3cY=; b=RsQ5esLWiUbX21CrE5ZkfUxExP
	toAiD+jCeQlT6JRB34kcnejgRSJ75sCQQkw050hb2+ygG7m5dff/Xq+3gYu58umDY5eG8FbAAYqBh
	rvud9CNZ0GrLlLd3VxhS53gHXhn9PPHzfp3mo73OpOE3EZK9DN3Bt9oWZdn6G6fIAhKPIEXjToI/3
	RmIQUkW66t4P1erSY5mDAlswfi7jK85YhByv8ZkVxV/WxTT2veIYPApf0kzbIa7ncyIQcos6hJCCN
	gvQS2Q6emR/241mpJT9tKk4Qf4lbB9FhbU3D6YKXkOOXBKuhRmxrMxiARUIkbZ7qBFRYrylk+87yC
	h8VOibRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnwd-00000002QIC-0Iu2;
	Thu, 09 Jul 2026 12:33:35 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnwa-00000002QGg-2SUw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:33:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwvWr1BmTzMlHC;
	Thu, 09 Jul 2026 14:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783600408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTRYbwF/XxEjYYFob5S+WLNVX0HYy0ckmE1WUa6o3cY=;
	b=tyMdvF2xv5nIaXfmCYxbD6fRdAiNP55s0Xay6tcyDLZrqQOMXLTJyKpAAw0Axl9uJsn9H/
	p8JvUbMcfGOoTIZRbQddoYA0iZ7D5dLVGObch3s0ZKgetZBbBOuGBJHV3zuvlpjIjec333
	maPFXff9ntUELPQ7/XzebTVp/tx9R/9W2i+mzO9lF9F82FWnTE/+jTH05RsMS1XGZOS7nu
	zSibBMFF8pCrKFwSRGQfvwvyVTLwG83C9AF0CW0YzlkPEd/nTsLetHNaY1d2vL2XZWF3SK
	262lnO+lrhsIe+m5MAM8+pTj4smXWeFKJM2iZC7KXGU/1xScS8lLbZhzoKdiWg==
Message-ID: <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
Date: Thu, 9 Jul 2026 14:33:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a566168d3a29b829815
X-MBO-RS-META: r9xtkd8txggmkzk54mcmgk1r644y6icg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_053333_161933_5E2397BF 
X-CRM114-Status: GOOD (  13.12  )
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

On 7/9/26 2:19 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
>> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
>> case MSI are enabled and disabled.
>>
>> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
>> configured to 32-bit address width for AXI or APB interface.
>>
>> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
>> implementation cacheable and shareable limitations.
>>
>> Marek Vasut (5):
>>    PCI: dwc: Determine whether iMSI is used before calling .init
>>    PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>>    irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>    irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
> 
> Is there a functional dependency between irqchip and PCI patches? Since the
> irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
> through PCI tree.
I do not believe there is.

These two configure the PCIe controller hardware:
   PCI: dwc: Determine whether iMSI is used before calling .init
   PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used

These two fill in GIC ITS quirks:
   irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
   irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround

This one does yes depend on the two and two patches above, and can only 
be applied once all four aforementioned patches land, otherwise things 
really yes will break:
   arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes

Would you like me to split the series up , or can you and Marc (?) pick 
the relevant parts via matching trees ?

