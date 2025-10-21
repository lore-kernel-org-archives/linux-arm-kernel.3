Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3A5CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 06:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BGQT/0zx6/PdcgD8cdOCVtrbxP2MY/Jbm/3GvbRSM0=; b=XrIZ92Z1mKnrWUdZxWlvfQ+PR5
	6UOCsSZMs3U9hIgJ8vQqTt0e08YYKc9jJ1l3F2lwZrsUqzu3UzOsHlzlzLj/dKUBQV8ijSJM7hbRN
	ZrXexQtXZ5ObpYk5y0lcA+vnChBM7WvPq/nDaPNu7EyRVC8qJAyvr0mYF6iiSUlkjEA+b0xCfCCdD
	hVEM84TZxKSDYAIdzxWinnYFC4gmzbYtQMPU7apbIzTGHHOwZ2fn1I/va4FzscHN7swgZuSLc46B/
	uChpURH3JdYx5F62Mpk+ntJLol7esM0ok/xcWIvbtFAXigEpqQTgEnuhmokvcqGKovClcEc4o/D09
	0AaYpC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6El-0000000Fy21-21Tp;
	Tue, 21 Oct 2025 06:52:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6Ef-0000000Fxte-0vVB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 06:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C67A143B51;
	Tue, 21 Oct 2025 06:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119D9C4CEF5;
	Tue, 21 Oct 2025 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761029564;
	bh=kEveI288R5aLgEy1LfWmXLzg1vJMJmJhDW/u+SLA3ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufgJENoWaQrbt1LbWl7US2kpvPAXm6hP4SYC0sBEkppguWvqx4odoeREOZ1hzvcGH
	 T9puAiLpk8ER0bHDe+9wfqX+bS1+J00ibNQc5Q34vqQUr2Z/VbZaiNtXT5b7nPfxE9
	 x3thfr7qGTtlUbZ/qk+m0cjtv6PT/V+URbn6Ar+0wMPpOtKABk2ZHCO4ISJUlIxFIl
	 sBujnreUL9haT+U2tsiifPloDnhX93Helsh60Bhwd484BroWUlphn78V/HSabn7DSR
	 nEpicEoTQiKy2nsGxdymT+5neEkdjAHbVQW6Df7K3aQe7y0lwCaNsBw10mJ7voRV9f
	 al5JbcNESGw/g==
Date: Tue, 21 Oct 2025 08:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Message-ID: <20251021-mighty-artichoke-crayfish-dc85b7@kuoka>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_235245_308286_015DA28D 
X-CRM114-Status: UNSURE (   9.12  )
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

On Thu, Oct 16, 2025 at 10:07:26AM +0800, Liu Ying wrote:
> On 10/15/2025, Rob Herring wrote:
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx95-dc-domainblend
> >> +
> >> +  reg:
> >> +    maxItems: 1
> > 
> > No clocks or other resources?
> 
> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.

So they should be here. Just like all other resources, because bindings
should be complete (see writing-bindings doc).

Best regards,
Krzysztof


