Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A9AE9410A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clsigyX47lZkdH/N62Rkeyk4H3J1LmQvkV8b+N3azvs=; b=qeG+9AxONCUd2oD5mwKsBOaalI
	rxAlIWuHCoeqInl34oDV6elZ9Kt4+VX9sNeAHZGi/2kjzwR51wiL+s650g73r52xblas4cMte4f/o
	6gIpIOEpEJWkhxb4i3vXHBWwQRZedRowB3JyOFVFNNrkS68SXxL+f4KTo79u8hFo+9lrDP1HvQT6A
	Rnif1iFrvNIaaHZ2wcrIZy0Ob7apLHx14rT/jgo5F6vg11uU/nXwOf2dIXplXPOoJzQuBj+Z7omtl
	W5blidL6mEgOBTLO3fLJfMxD4lChZf05SwXYAX7BjvQZddlgC/bxjarXcF2kyrMQ3CsHOZfY7hlMb
	xYtix5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPvY-00000004L90-0bNl;
	Tue, 30 Dec 2025 02:57:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPvU-00000004L8d-42iT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAC8F419F5;
	Tue, 30 Dec 2025 02:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7A3C4CEF7;
	Tue, 30 Dec 2025 02:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767063455;
	bh=mZPhCiEGuhQZnTX/hLxPJDSMGw1z4lrwY4SA3V8cPhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTHxhPyw51sxj3aFJxPPtceSmKmDzNCA8UDtFhlFgAT+7byLdOqpy4SauMZZeBg+W
	 lwKfpzDJCdFv2Omu+LeYDtgFe3muAL+TfpDcYVDrP2muXD3KmHM+0lnK+V1tHPnE6r
	 wBquegnp+3XsqbYVTFjXC5RjnDlzU/iXvIP+jQ/SjtPW7DbS2oU2aQgeXTsvvtWq5u
	 BGNnUm1cg0e05VmGEzB/mxsqLS/Tdrpf3RXACuwzbiCeC3BwAlrfqdxPzzRY7+YwhI
	 +rmkWjmUUUdQ7iV+UaROqOBb2dED+9U2EhbAStGxlTX9zPlcirp29b+3ruKT89MIh/
	 sx8KciWNOMzoQ==
Date: Tue, 30 Dec 2025 10:57:31 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefano Radaelli <stefano.r@variscite.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] arm64: dts: imx93-var-som-symphony: align DTS
 with hw revision
Message-ID: <aVM_m_qAo91E5oKM@dragon>
References: <20251205182258.50397-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205182258.50397-1-stefano.r@variscite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_185737_021748_7386A95E 
X-CRM114-Status: GOOD (  12.01  )
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

On Fri, Dec 05, 2025 at 07:22:53PM +0100, Stefano Radaelli wrote:
> This series adds support for several peripherals available on the
> Variscite Symphony carrier board for the VAR-SOM-MX93 module.
> 
> The patches introduce:
> 
> - GPIO aliases cleanup to better expose available GPIOs
> - FT5x06 capacitive touch controller
> - USB1 (OTG, via PTN5150 Type-C controller) and USB2 (host-only) support
> - LPSPI6 controller exposed on the expansion connector
> 
> These changes describe real hardware connections and make the exposed
> interfaces available to user applications.
> 
> Tested on the Symphony board with a VAR-SOM-MX93.
> 
> Stefano Radaelli (4):
>   arm64: dts: imx93-var-som-symphony: Update gpio aliases
>   arm64: dts: imx93-var-som-symphony: Add support for ft5x06 touch
>     controller
>   arm64: dts: imx93-var-som-symphony: Add USB support
>   arm64: dts: imx93-var-som-symphony: Enable LPSPI6 controller

Applied all, thanks!

