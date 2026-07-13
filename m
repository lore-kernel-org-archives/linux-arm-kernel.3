Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191BFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XH/u9f3n9ze575dKtp+OBjodUyjg/aa/V3GePJcips=; b=o6EdF8OpCzaVdzZAZI4izIOTGO
	CYs5iKh1RPDF9c4Mb7YjbTBvIvzM4o0kUbOtlhKA4jEgUcg4gU6ch0M1ilUHVuRLD/MSV++SjhsAU
	ekmBVP8cPxWQctBFI9Qc/AROuIBrdVjtAscvHN0FxZmUIJAD67JC0EOVqWLCBJjxmZsXEwB/mTT78
	lZ0kzJo2zGP5zxJGJp9mYv4sLBz79t29OmKz9+d2ej+EBVtUchntIC3U9k/M6UHSvV1hIsgS663E+
	rjkTbsT2doZEPObIxGV02W0mCENj6OpRCqMLF6rb1xy7Hqt5BVS9isJfiYp8oVegutvinDZUyHrVf
	sODQwk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3j-0000000AYNT-1wd4;
	Mon, 13 Jul 2026 23:27:35 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3b-0000000AYJg-2pOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:27:28 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gzdrX0VmWzMlPJ;
	Tue, 14 Jul 2026 01:27:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783985244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/XH/u9f3n9ze575dKtp+OBjodUyjg/aa/V3GePJcips=;
	b=FW+MatIV82GZ7usqlRMim9OBbQM4Rsy6V89NrvztMMtbJlCy7LJo6DlZaFeYeEe9iNyH33
	ROXKS03mQBvs/OPq4LtSk0ePcJoxNOcaRaAiKfuf/l6NnuLdDWvbSAR3IwKHoHTfVDJYHz
	7Ahgd0WoS8rcSBoLkY5nd0r2Nks/kpOklFHK/2/X2OGQMqQyBz4C7thHddYhJo/1zI+bSi
	DkD1HZB6bVZIkUMdePX8swPJqYiFIttMpLf/iqhJ2xjSjjE/TZJoK/cbqYVJ9XlXMs0SPR
	5NOphRYmYyyKUhNQRDT0wmHu6DtcsTJV+EHCI+bDotLuFHaCihK6TNtCP5TFug==
Message-ID: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
Date: Mon, 13 Jul 2026 20:05:38 +0200
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
References: <20260713175400.GA1258926@bhelgaas>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260713175400.GA1258926@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 937e62b771432b11064
X-MBO-RS-META: 1467nai4bxnyrqy9i1zw7971mbwut18b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_162727_910082_F4A4CB97 
X-CRM114-Status: GOOD (  14.03  )
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

On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
>> On 7/10/26 10:30 AM, Marc Zyngier wrote:
>>> On Thu, 09 Jul 2026 21:10:03 +0100,
>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>
>>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
>>>> copy the one GITS_TRANSLATER register offset macro directly into
>>>> the driver.  This repairs the ability to build the driver on
>>>> non-ARM non-GIC targets the way it was possible until now, which
>>>> retains good build test coverage.
>> ...
> 
>> So in the end, it is either this patch or limit the build to
>> arm/arm64 . At least this patch still allows building this driver
>> with more compilers on the various build bots, so I would opt for
>> this patch here.
> 
> I like the build coverage, but duplicating the #define doesn't really
> seem good to me.  It makes readability worse because cscope/tags now
> sees two definitions without an obvious reason.

I can rename the macro, or ... sigh ... I can reduce the driver to build 
only on ARM/ARM64. Which one do you prefer ?

