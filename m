Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DBECDE01B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 07:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrZu68cQFEoaA1tEm+6w22JTgrzxCMVscivrPw9ACnU=; b=cVsVNFPVrDqrz3z5LLCk1jk2mK
	nTJSdDNPsuHdcL1wPMZfwIyO18zkaGjn+i+nUxmqCnzR1gt3mj3qxeXTkhfsmXCzEm3WaZIbPPmcp
	DcYvBm9PQSdCyv9GsDvk8WGaFFY8E4SgQtMN+KqmXV7M9CR9PuWSK87eLkLf74hhKerh3QGvmNPku
	rudozhTDN5iwS5LgSpdQNSHmbdf75DKq/QrK4eEwNAUYpOBYQMz50JhezXM0vAyXeUeQlWtevORPT
	8CUEUGKIxp6X3PhbjhtoOlL4RUWGxTjD2xusl22ERi/fYSmnYxdsxTBwMz0lwUP7KA779yKLWITv6
	RFX8QCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo8B-0000000Bk96-2Ido;
	Fri, 14 Nov 2025 07:22:03 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo87-0000000Bk6U-3Ehh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 07:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=QrZu68cQFEoaA1tEm+6w22JTgrzxCMVscivrPw9AC
	nU=; b=XO5VmrZQgvsNF2j5p04YVDCNh2RvciAmO6f1YJS5IqilRw55uyiP1OAh8
	aek8Si+4pfrznioXvLbvmq1lUm6VbhZVZMfRtNL+R2nuFR/fPvvCRiStVfNYqtmy
	6hpO5DTIZ0JhQ3EkeGi2DW+C0ZSdUc1v3H9/wwLIhvDOj6Wvtnx2ZE9OoNGk6zWF
	OucX1gMT7WCYU2gcX/jRHCfDTjPVVs6C7jqTldKLejB+GbVbMfvU1wL33kXZU00p
	DEIL/c8DYS1K/ToAM1eUAJs7gzACSR5fNFPYDPEWAT/hE3i0ic1z6rxhvoFXOxWt
	qQtNztQrJKa3w85u8rQCtvjHCoMbQ==
Received: (qmail 2203272 invoked from network); 14 Nov 2025 08:21:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2025 08:21:53 +0100
X-UD-Smtp-Session: l3s3148p1@6ssM2ohDSLIujnuZ
Date: Fri, 14 Nov 2025 08:21:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aRbYkXDuHZCCgFe5@ninjato>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
 <aRW7BZimWdpq4TyX@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRW7BZimWdpq4TyX@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_232200_701905_C1336E7F 
X-CRM114-Status: GOOD (  17.02  )
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

Hi Cristian, Marek, all,

I am working with Marek on the same project.

> > While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
> > Shared memory based transport" , bullet • Completion interrupts, I found it
> > explicitly states:
> > 
> > "
> > This transport supports polling or interrupt driven modes of communication.
> > In interrupt mode, when the callee completes processing a message, it raises
> > an interrupt to the caller. Hardware support for completion interrupts is
> > optional.
> > "
> 
> Oh, yes...I knew that...it is just that till now, no systems were really
> ever developed that lacked the completion IRQ as a whole, it was, till now,
> more of a case of having the capability NOT to use it selectively at runtime
> and instead use polling when wanted (like for clock ops in ISR context)

So, I also read in the spec that completion irq is optional and wondered
why it was not possible to describe that in DT. And while we do strive
to get the SCP fixed alone for technical reasons (it is just better),
the spec doesn't actually require this, right? So, my suggestion for v2
is to reword the commit messages a little. More in the direction of
"support irqless implementations" rather than "support broken FW until
fixed". Or?

> I am not sure what is the reason why this only-polling scenario was never
> supported in the HW description, this indeed pre-dates my work on SCMI....
> ...I would/will check with Sudeep, when he's back, what are the reasons for
> this (if any)...

Cool, thank you. Looking forward to hear about it!

Happy hacking,

   Wolfram


