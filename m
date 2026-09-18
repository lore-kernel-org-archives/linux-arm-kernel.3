Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81617C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij3/p0dhbAUiVjyYTDfkDCSx8NXCa/WOMpRl+VoVpxA=; b=xkeM2xL1iFZyDotFEW/a+a4TIh
	oiORlJpCY3NLzAANqc8+oOOhY5K3k/NW2j65PjXGyictHtmO4xOhgXmVsodVsZRrppLgGFfiIyEqj
	xEpzpZD7v9VUsK1UJ/KYE46rh24neJc6TFKePeV8DKaDDrMLsac56BioeiyrG2zgVgsLC/7fNMJ1r
	07gYH4gYP63VXlsgBIRw4YbnBd0JEjNDMEroJGuwgPGC/QzTEK5+t8efByzDx1HaI0H1bbo6q20nq
	DSXTa5spD49H2TrbTGchmCtcfxJ+6G2KbyrKDpVTkj2dalHEm++bHcqkjXFOpTX9uM6veSJT6udTZ
	SqPXc4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dY3-0000000FLGz-0zjo;
	Fri, 18 Sep 2026 18:42:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dY2-0000000FLGp-0j3H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:42:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9944E6053B;
	Fri, 18 Sep 2026 18:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C17F1F000FF;
	Fri, 18 Sep 2026 18:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756977;
	bh=Ij3/p0dhbAUiVjyYTDfkDCSx8NXCa/WOMpRl+VoVpxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWkvT9Htb1/VrVpaMsiU4UOOK0PQWV5wnQX3psqVI9gxTN0+dVXGLEog6wMQXekS4
	 w+is54urG2RnpZ6bWzR9KBvS3VMmVwy4iyps7T6AOdQhTUebNcT92lJ6QZg5n18OIl
	 oV/IiOuzYTvqzIYDXASXEZB4Yf1FvSQTsqxjxsJ325i1BAvjI4vmxHncoW3Ksdl4jI
	 cq70e3N99vvoo8Cl79VA7ld9J4ODbVbdSKJ9SwS60/BmmIWxtkA/M7KcilFDKygsjW
	 YoHyFjGYrsUynpzgfJRlHVQXr3IVnw38Lr1sOndN/RO1ccsUA4TDw6IX+/gWb1x9nc
	 yBH6IFHFcb+mA==
Date: Fri, 18 Sep 2026 13:42:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simeon Marijon <simeon.marijon@foss.st.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: add binding for STM32MPX TAMP
 backup registers
Message-ID: <178975697493.1358225.12539962963666785405.robh@kernel.org>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
 <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>
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


On Thu, 10 Sep 2026 16:11:22 +0200, Patrice Chotard wrote:
> From: Simeon Marijon <simeon.marijon@foss.st.com>
> 
> Adds the binding documentation for TAMP backup registers.
> The backup registers is a part of the TAMP device of STM32 MPU.
> 
> Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/nvmem/st,stm32-tamp-nvram.yaml        | 57 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 64 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


