Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32BDCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 22:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVPca2W85m+WmiLy6hXkm+KXlzNSHX/SVNrgp/WFCYs=; b=W/XHtvsABVtAWx9BhxqLa7A4aq
	fNpFjwExlPc06XIyKycCwbmO6aH4WQHGcg3tflOCtoLqf6R8Q11d2Imlx48nm+gkaT64/9ZM+vm0Y
	EGZ9p/JObOzo7WaOnxTTc4H1pItEeb/qE5yI+ANrK05TzfhlXd0JxLoJPBve/vAMJsT+gJ59K19FV
	fnRi/oAV9MsjUzXCyhaIgppAABqbsEwWIqiguqJ5Sy13I+2xVaebe8JZZxPoUIqMFeEqUKm2LOwzw
	P8NUdnE8yqvx8Gkb3ocgDHN1C5hD3rmG1BTAl5XTB20JD/KJJa3ksk7xmcIok4TYtIM7bNg/XAW/Y
	PQU7zowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKrj-00000001pWo-1bc2;
	Thu, 18 Jun 2026 22:05:39 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKrb-00000001pRm-3BTA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 22:05:33 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ghFCY6prBz9tFt;
	Fri, 19 Jun 2026 00:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVPca2W85m+WmiLy6hXkm+KXlzNSHX/SVNrgp/WFCYs=;
	b=MLPaW2n459d+ZgMQupaC9cF9NkFnV8HVsA7YZFIOL4YDnDdYKBu2HHWsJmxlacmjhSC0+j
	m9YUvZ5OLeiNwf27VA8VFjPlG9ydb+0z3coInn8B0CCcPSkA6ZpySvAe7vrxwKdJFm6Pgz
	r5bxrKBhvCOfEnYAYY7z+Mb7kcqXEf1+4W74LUKTLFDwHBy3QU0qmzs0c5fu8VnyYf3kIf
	f66wT9fzcnpzfc6mwGyNpQASIRihVjZRbGGYw0kF0IK/R8JfNmqBwhof92OBh8ic9/B8z8
	oIbvD5UdtpNqtNllporgkNR++Aypq6qyZJJ0sCZNGoq9jhnwcKI74I52LF2Ptw==
Message-ID: <4fcdc951-e3be-4ae4-8d60-03fd496baec4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVPca2W85m+WmiLy6hXkm+KXlzNSHX/SVNrgp/WFCYs=;
	b=l7JqWS1c9Nbgd+oxIvdhdZQFRMrMzI7ax8TH2QPOzHcz/1mY9EWngrrtKXZmc3BT6CT6wz
	NyuUGcPjNljxdPwvkYOVPUQnXtOmWgGQgr+zFAcIzPxld27e1kaOkDKvFileIdklavCK9E
	XM0mGvwpbvnozt7A4aDSUK7QvGAJy8ZwqgwPt5/VO7imOiYiQyox0BHp9fzT6uIyUM+kBY
	3/jQxfaoa+E9LJ/2gv0Co1T7/hy6qgZ3Iqm0xPN1YycpIcv2k1dgM7I8G7bIq6cAgZGili
	sdKtkRZiDQUn+X1y2nnYEESGXPFV9hctt+5Z8MlBvKjekDA5s/M/A6ZZsGTO1A==
Date: Thu, 18 Jun 2026 23:54:43 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Marc Zyngier <maz@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
 <864ij1tyrj.wl-maz@kernel.org>
 <0935eb67-83d2-49ea-89ab-0d0aa51ead8a@mailbox.org>
 <86ldccs0oj.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <86ldccs0oj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4c9c6b62bae1d8a0379
X-MBO-RS-META: 1e9soejg6nzs4wwimrf51bf5maqubzyy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_150532_140208_43578E27 
X-CRM114-Status: GOOD (  21.92  )
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

On 6/18/26 10:38 AM, Marc Zyngier wrote:

Hello Marc,

>>>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>>>> or APB interface configured to 32 bit, it can therefore access only
>>>> the first 4 GiB of physical address space. This information comes from
>>>> R-Car V4H Interface Specification sheet, there is currently no technical
>>>> update number assigned to this limitation. Further input from hardware
>>>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>>>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>>>> limitation.
>>
>> My concern is this ^ , I do not have an erratum number, because there
>> isn't one. I am in touch with the hardware engineer and I did get a
>> glimpse at internal details of the three SoC, which confirm the
>> limitations. Is this sufficient ?
> 
> To be honest, this is between you and the SoC vendor. I'll take
> whatever symbol you come up with at face value, and will assume that
> the vendor agrees with it. After all, they are on Cc and have their
> SoB on the patch.

All right.

>>>> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
>>>> common for many ARM GICv3 implementations. Therefore, add an extra
>>>
>>> Not quite. It designates GIC600 unambiguously.
>>
>> What I am trying to communicate is, that the 0x0201743b ID is not ID
>> of the Renesas GIC implementation, but it is a generic ARM GIC600
>> ID. That is why we cannot match the quirk on the ID (it is generic ARM
>> GIC600 ID), and instead we have to match the quirk on the [ ID
>> combined with of_machine_is_compatible("renesas,...") ].
> 
> This is understood, and is no different from the other broken
> platforms in the tree.
> 
>>
>>> It is just that GIC600
>>> is integrated in zillions of SoCs, most of which don't have this
>>> problem (the machine I'm typing this from has a GIC600 *and* 96GB of
>>> RAM).
>>
>> Right.
>>
>> Shall I reword this paragraph somehow to make it clearer ?
> 
> I'd simply say that the workaround is keyed on the combination of the
> GIC implementation and the platform identification in the device tree.

OK

>>>> of_machine_is_compatible() check.
>>>>
>>>> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
>>>
>>> Is this relevant?
>>
>> I included it for the sake of completeness and to provide all relevant
>> information, based on previous discussions about similar limitations
>> that I could find on lore.k.o
> 
> This information is already contained in the ID you quote (bits
> [19:12]), and can be decoded using the public TRM [1].
I'll drop it then.

Thanks

