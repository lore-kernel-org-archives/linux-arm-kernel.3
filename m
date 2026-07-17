Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2CBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4R3cxIMePttvrKg1e90PVDnx6t4gSLZY45tTG8rEzg=; b=brb/+GikBl9JIc9ZyiLsvcRUau
	dUI41OuUXbJK7G62W2mGy79PsO4RiuuiQZ1BJCl+yno6OvWSZWINGwsI5UA+2FtY4H0RlEsxXg/7y
	rkTrt+TFjxAt+wYqv6uItyyaiMXD6rOsOKnecBJ4Ju5WRePsWyOob3LFs+rDmX+4UcGaSzq3cU1sz
	5fwbL/rxRh702Ne+BluZvmzTVwIaCF7we8mew7akvHNkHZssbwBrfxIltJxhQK/KpMG6Dmg5mIO2W
	fFCGGFywFsBFo0TvCiUi2zXtgTEeQuoW1eimhyQt7qFNvuCnrNFP7ByhvOioKRtxg9cs5uhqkG+VY
	/mkgfGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkek7-00000001p4R-0zDj;
	Fri, 17 Jul 2026 09:20:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkek6-00000001p4F-3RpM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:20:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B9E242E03;
	Fri, 17 Jul 2026 09:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EEB1F000E9;
	Fri, 17 Jul 2026 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784280026;
	bh=f4R3cxIMePttvrKg1e90PVDnx6t4gSLZY45tTG8rEzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sjxw9QwtTff4v6rLg2EnxKi2c3nqfXvn1+TAmBhdP/gVmZpiJMidNATRfUWs5+RSI
	 UAdiidABsFIEXZ4ukiAKP5en0pOxDCV2qr307JTiYnRre/GMdErB0eUEvw1Lq2roR8
	 9wl5cCw+EtjQD16WgrYjooXu9lonzUC9Lyydta4HBKEHQ06gHNEC3CmlxexoAJWjpW
	 szeTqTsADnjozyVXxps/2nqHAqsCIa+QzdD/4UnROaPDbAD42NgctOjrRsKg2u0uGe
	 NF8+la8yN5zUU5vYUvIgFYQWNvmMDTjsUbk8t2CTNTdN3KXglimdGmFUTkKD01tZyj
	 3+JDZ3+g2H6yA==
Date: Fri, 17 Jul 2026 11:20:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harini T <harini.t@amd.com>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com, 
	appana.durga.kedareswara.rao@amd.com, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: can: xilinx_can: Document phys property
Message-ID: <20260717-determined-mindful-dalmatian-bfa374@quoll>
References: <20260717021415.2234865-1-harini.t@amd.com>
 <20260717021415.2234865-3-harini.t@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717021415.2234865-3-harini.t@amd.com>
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

On Fri, Jul 17, 2026 at 07:44:15AM +0530, Harini T wrote:
> The Xilinx CAN and CANFD controllers can be connected to an external
> CAN transceiver on the board. That connection is described with the
> standard "phys" property on the controller node, pointing to a CAN
> transceiver PHY node which models the transceiver and its control
> lines (for example the standby/enable signals).
> 
> Describe the optional "phys" property (a single transceiver PHY) so
> the on-board CAN transceiver can be described in the device tree.
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
>  Documentation/devicetree/bindings/net/can/xilinx,can.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


