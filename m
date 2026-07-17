Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160C1C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu1fYMemoRzsLaUDl+FpewPLFgJ5kKqgw36YQDXyJEo=; b=gc3GvE12GwFRrB8uabFo1j96lK
	4MTQH3IsyJlSQM1LQXCsKMf3Ak/pj62XZQ/NViSc4hTodiK2uzyLaHew6IrD9klRMUWTduPQUt+3R
	Qoybchw9opThbf0ZSnpN9jl+Dax0VsJ3p48nDe56rHmoCqP58JohEAjIEDI3BYuyD3cDGy8HMNseg
	BRPCKEkusq9i4owrjh2/EJqmierOKgIgKHCKoVW6ZzwvLFbvcJvntI8HvZIC48T6Haf20nR/FRJ2r
	SQTtzhMeE0IUk65iISUD1zwjvuXqCwJAQ2BvtDpKasomX8wbrqsjoGcypKJ/KlTkxik3MPsgtR8/7
	ni3r0BEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkj6X-00000002Ruj-12Qk;
	Fri, 17 Jul 2026 13:59:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkj6V-00000002Ruc-2n6Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:59:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2ED360A59;
	Fri, 17 Jul 2026 13:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686751F000E9;
	Fri, 17 Jul 2026 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296790;
	bh=Iu1fYMemoRzsLaUDl+FpewPLFgJ5kKqgw36YQDXyJEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VaziPRFN8QO4BZ1W9/a5ZtmZBroMmzgtfSeNF2GAyhSPqpTXYewMZBgR+1uasZZfM
	 Z/z3KRSCLHFuVf8xiRUCazJHd5VvMwX/3AGFCurqBATvSapSBizoAkStbF4qNeNTXn
	 tqPgzTKvuLwKmaJCNTtvo8/AJxBDU4xLMl+ZEDmVsiPm7HviaDusPTY4VfReO8WiQs
	 2+f0bZrp1hm8wtngFhaKLeccUuB6bIEKnfQ3R6GVu3EGxqH9Nx/0eH7UCpW24JbDWF
	 v7cOUH130ViIYeZoOCpQzg5L66SPahvmVTm9/XWu1nYwJwuIy55u0HHM3r9j0kWDL1
	 5l+pyf6Yv9S6Q==
Date: Fri, 17 Jul 2026 08:59:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Linus Walleij <linusw@kernel.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Lee Jones <lee@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: st,stmpe: add deprecated properties
Message-ID: <178429678856.574428.4894136808352380805.robh@kernel.org>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
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


On Wed, 08 Jul 2026 15:48:56 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add deprecated properties st,sample-time, st,sample-time, st,mod-12b and
> st,ref-sel. The both driver drivers/mfd/stmpe.c and
> drivers/input/touchscreen/stmpe-ts.c parse these information. Some dts
> put these properties under mfd, but some put these under child node
> sample_ts.
> 
> Allow these properties put under sample_ts and mark as deprecated to fix
> below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mfd/st,stmpe.yaml          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


