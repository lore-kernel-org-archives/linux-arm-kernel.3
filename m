Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB16C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DJtdglWdhtyGucyQVZjA4gR9eVcUWIO30Bf0LYMArA=; b=i1AaBVdPtO/Awcl37F2tcUq1wT
	LWaGEGKFTa7JgYZP7322iS5I2kYBQuqM8n3KZuOEi2r7a5Ay4ySnjAamcvtgNeyBCUF4SS890HFGK
	9LlqUbQ97eok6G50Wjo6o+NvUxUhzFuZ0SkhL7b22D9BPTV+OpHG54Tgs6yBi1fFp5FTGa1vHGiPE
	j93BlZk1vjoHlybqSFK2z7V35NrdBECLRSkmR7Plhnxf8d412MehNgjfu27LxPmhFzGoDMAL+aX4n
	mlDChGb0V0zhXhxdCkM3V7jbWaFgBM6Gay3a6pDR4C0LYsPjx3uJSYBtlMchjbKDfKXL2fSHOpYGV
	UM5zZG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqb5-00000002uBX-14hF;
	Thu, 09 Jul 2026 15:23:31 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqb3-00000002uAy-06n9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:23:30 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gwzHx3V6xzKnRd;
	Thu, 09 Jul 2026 17:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783610605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DJtdglWdhtyGucyQVZjA4gR9eVcUWIO30Bf0LYMArA=;
	b=BQ7qj2ikuao6hCeNkVjToIpnnOPPxG5jLL+0iwcDY8+7B7zpJJg/zpTeSP5IbLZ8+ZWSRw
	6d2K7pJtenD3l95c1cNZ607GCFfxVCL0xxYrQ4HPV6X67laguX9IYzI47FAe+b26xXYuyf
	IbB8N0JFDswID8N6f56VF8LqEBBu647mV4rLfIgEecghLbjO76iBIWz5NEyCaDXcxDx1GG
	/O1Ee4jE3Xd5C06TR67+43tHw3bMAZ5jcrb+UdDsi0yjhGF6mm9KwxUhpF8YLHx8yyDfwN
	b3Dr6ijdLOJDKKBhZvUuNkfh4kVcJPO+PxgQAQm7HO8qhwYCGZCUcuGspnEq3A==
Message-ID: <6c93677c-974b-46d5-aa81-1ab04c8dd940@mailbox.org>
Date: Thu, 9 Jul 2026 17:23:21 +0200
MIME-Version: 1.0
Subject: Re: (subset) [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle
 GIC ITS
To: Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
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
 <178360186732.755595.3582150626313807959.b4-ty@b4>
 <ael3rodbevow3q7r4y6zavouh3pvoljmyaev5it6dknyaw7vcb@szfampjit4ds>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ael3rodbevow3q7r4y6zavouh3pvoljmyaev5it6dknyaw7vcb@szfampjit4ds>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4a5df62b25b95807fda
X-MBO-RS-META: t18uwoiuq7fkdmahe51a9qkz95ma4n46
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082329_217957_0BC89CB5 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

On 7/9/26 2:59 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 09, 2026 at 02:57:47PM +0200, Manivannan Sadhasivam wrote:
>>
>> On Tue, 07 Jul 2026 22:35:38 +0200, Marek Vasut wrote:
>>> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
>>> case MSI are enabled and disabled.
>>>
>>> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
>>> configured to 32-bit address width for AXI or APB interface.
>>>
>>> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
>>> implementation cacheable and shareable limitations.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [3/5] irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>        commit: 96b193897fd374fcb63a782c52f8b079134d0222
>> [4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>>        commit: 14e8394423ffd4fd28884ec8b4d5ba15be6e7e0d
> 
> B4 got confused here. I applied all 4 patches.
Understood.

5/5 should go through Geert / Renesas SoC tree ?

Thank you !

