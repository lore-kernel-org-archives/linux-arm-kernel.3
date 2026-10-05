Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D08CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd4+5Wpltbd4UHs8m7Jg0BtmW4zxBsg77tDhADJx1qU=; b=tDWAl1VjUONLn5gaVVp5+Zs2ov
	E9UeMWNtQ8n7CxiHJQwhXvMflhI4dPFwp8jhRYnkZ9K1KvcqBe/fnHzzQxzj5VanUHnYdnkDVCv4u
	vkjgykdbD6+VmEXGsrt9MYH0AZ+u95JE7kdORFkugMDQTPcqrnjsf313K2cQiwaVfDxD98WD8Tk5g
	fghHPqRB7xh+WAZRSdGk3eG3aic8wK8r0U38Bz0hAeRVzyowEupXcB7Um/eOtAHcJoKHt7PTxUNR1
	pkZoezzJ7SSI/BvLKFsxLVp1wsGDPpuhiZQ1NfjwoiHIGsAUyT2lIun+UAlQWoOIh+PsMvESbDhBS
	tzVqpbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpmi-0000000HASx-0pVH;
	Mon, 05 Oct 2026 20:59:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpmg-0000000HASd-0haO;
	Mon, 05 Oct 2026 20:59:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5548E43074;
	Mon,  5 Oct 2026 20:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2AF1F000FF;
	Mon,  5 Oct 2026 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791233981;
	bh=Hd4+5Wpltbd4UHs8m7Jg0BtmW4zxBsg77tDhADJx1qU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=B3kTnT4aYxXIrltShEqfO8pnc3XaIm0eVzw1o4Xekcf3wYgLM8ESzohQfGoVi9DQl
	 d7wzRQPMTuCXTB8C7AorKMNdpSCdH0VKdun7BqkR5lt+CYcmpz5SgB1h/fCFJbMBxq
	 5XpoVR08NsSPs8MBVZ/dk1sKIHqsX4DN5D182EBjT+taB9U3Hj/Nf7FC6WLJmX87vr
	 Ypl8i9d0hIMOyA/eQKwYHwcQEBlK1cNIPjuljt8kjkjQfF/PuNJrKLLSS4lRZbQBu7
	 kyVy07a+v8Rp8YIyd+UuAA2umIMXyFPTdjelr14S9l77O0YEZN/Lx6wDVNb8/pYxSj
	 K+WZMgH76ajqA==
Date: Mon, 5 Oct 2026 13:59:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>, David
 Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
Message-ID: <20261005135939.01ccde50@kernel.org>
In-Reply-To: <20260922200336.2201212-4-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
	<20260922200336.2201212-4-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 23 Sep 2026 04:03:27 +0800 Coia Prant wrote:
> On RK3568, the SGMII interface can be routed to either GMAC0 or
> GMAC1 via the GRF register pipe_sgmii_mac_sel.
> 
> Add support for this selection by introducing
> the "rockchip,sgmii-mac-sel" DT property.
> 
> From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> bit 1 (pipe_sgmii_mac_sel) is defined as:
> 
>     0: SGMII routed to GMAC0
>     1: SGMII routed to GMAC1
> 
> The hardware reset value is 1 (GMAC1). If the property is set to 0,
> the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> remains at GMAC1.
> 
> This is necessary for boards such as the Ariaboard Photonicat, which
> uses the SGMII interface connected to GMAC0.
> 
> Out-of-range values are rejected by dtschema, so the driver does not
> duplicate the range check.

While looking thru the patches again I noticed this is changing generic
PHY. Maybe you can send it separately to Vinod? I don't see a hard
dependency? The code can "converge" during the merge window for the
whole thing to work.

