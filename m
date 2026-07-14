Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/cRu//uWOT+qbh6qti9TRa8/+CwFICDDK98F8HF74U=; b=Malr7/+sd+EOqZOhOlt9Itgb1f
	MGr7LPm+HLN+QYgM611gFFrvGaKKpMAb7Hc9yPrg/5DcY03oFWspGzSu8C+8pqFppZPWH6QH30KM7
	cMoag8E2Li9ax3C00DVXi2hhwkf+a/CmwQF2oyzkDrNfCn6q/EZ3RPE7QCFNSLAPXvkUoZkUuDrDl
	O4smjTAIkd++dR/m/m9HIqqZcLhJVtLvyGB1I6Etu87KnY18oXjYAQtggKLJhQrMyAEqm+SxUCvMx
	br4htcqYtKB7r/0k67cJtKa6eSn3FB0QrrDT+fUDYLDefKoeOVTvkNU+ULs4tZA8V5u/MGukWPauq
	a3efG1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd1J-0000000C918-2Yrv;
	Tue, 14 Jul 2026 13:17:57 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd1H-0000000C8zz-1uVG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:17:56 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h00Gl6g31zMlV7;
	Tue, 14 Jul 2026 15:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784035071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/cRu//uWOT+qbh6qti9TRa8/+CwFICDDK98F8HF74U=;
	b=a6BkgyohfmFI+SrqxlZSKaV8Mxro64qxCsTaKQUj57vVL1YP83+ZmREJX+WB8HYThSsolS
	fzdGccDFmlRU021CFKT+MLG3V5KkSvexSHlDHUNn8dMFXIO9tKqUVjzuLccjIZPSPZZ1gT
	UitCI1+6i4QFVrOhd+Y26YV92pmFlqNsaWO9Tjp9Gjkud5SegyW/7ASV9X7Nz+ilqNgOUw
	uVeCcB4bUeMqAC1/IxZADk2PgVQEepEp1Pt1hN9WPWbq9lnLEq2US+FINcmGYTcWBi8GP8
	Zu4YnuDP/2MPORP2mYESX/Kevt630h1jrXBgd6OKFgpOtZUrn9lWXEn7pd+HPw==
Message-ID: <43b0883c-8ade-4129-8fe3-bd6fcb191ea5@mailbox.org>
Date: Tue, 14 Jul 2026 15:17:46 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
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
References: <20260714110041.GA1349622@bhelgaas>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260714110041.GA1349622@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 32a8528cd2be18f19ff
X-MBO-RS-META: 4qmkcnquwqej65t44z98iiowifkh7d94
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061755_647087_5556C7CB 
X-CRM114-Status: GOOD (  14.62  )
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

On 7/14/26 1:00 PM, Bjorn Helgaas wrote:
> On Mon, Jul 13, 2026 at 08:05:38PM +0200, Marek Vasut wrote:
>> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
>>> On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
>>>> On 7/10/26 10:30 AM, Marc Zyngier wrote:
>>>>> On Thu, 09 Jul 2026 21:10:03 +0100,
>>>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>>>
>>>>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
>>>>>> copy the one GITS_TRANSLATER register offset macro directly into
>>>>>> the driver.  This repairs the ability to build the driver on
>>>>>> non-ARM non-GIC targets the way it was possible until now, which
>>>>>> retains good build test coverage.
>>>> ...
>>>
>>>> So in the end, it is either this patch or limit the build to
>>>> arm/arm64 . At least this patch still allows building this driver
>>>> with more compilers on the various build bots, so I would opt for
>>>> this patch here.
>>>
>>> I like the build coverage, but duplicating the #define doesn't really
>>> seem good to me.  It makes readability worse because cscope/tags now
>>> sees two definitions without an obvious reason.
>>
>> I can rename the macro, or ... sigh ... I can reduce the driver to build
>> only on ARM/ARM64. Which one do you prefer ?
> 
> I think a dependency on ARM/ARM64 is preferable.

I will send a V2 shortly.

