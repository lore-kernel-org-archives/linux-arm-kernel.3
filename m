Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EB3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItwwoQS2DypATRkFBHij4Vjb0IiXALL7RICbuUvRstY=; b=gXbVaDRyLwAKXfQVXj3ZH4wd/O
	6gzYFuA8Fq+MeVYA6HVRfsnOtV19yjZtdp0UQ27WCCnv82i3SwE26L/7mdr2yMIcqGbk/LaErdR64
	Kn502xyf/qJf4GqHOaUCyPgSASwJ0e5yVl6v3FibtO1ETjQowCC4CmF9I6MFMDCECsBV4KWteVeh5
	jGhHqG2jlSSXSs5F4aO4pQa7rA7ipWz6zbw38QPIh+kT9E+2neoac+f7VR0UUMQmxG/kHUTPZaBJl
	IwwBKjl/5Xos7PFCllWSArDxg1tEKN5v6mZcs9FIQgaCRD9nPUCN9R0xmaciSnDvIzuCmZz3Ep+MI
	61fZSfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPk22-0000000AFuy-2fGe;
	Mon, 23 Dec 2024 15:07:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPk0m-0000000AFgj-1OM4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:06:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0120F5C594A;
	Mon, 23 Dec 2024 15:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0253C4CED3;
	Mon, 23 Dec 2024 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966383;
	bh=A679kTlYojo7x9OfNYdFDbtrZYj0+xWlOjYQiM02wnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=es/OwD+d92Hyd2m9/Z2qlYS9V1p6fm0dQprrym0TrJjQalkXVFIxdOeF4Do5VAVI5
	 Wchm/OMUMv0hSJZHcxXBByn3ARMVP1H8F3YsSwo0Zxfk2nfaw59yMhHvWKkckf+iUN
	 MOp5xT6SYzm5TDhwm2wUzO1fE3mNPUBzO575MYyxQZrHthTgR8Hofi7+3gnFx0MACH
	 OovxctEdq3pgc/GDxWD6HnfYXIklQb07SLnjwDTma9ITChUhQFDe7dv6ktmJRVFlLa
	 NRwv2Q8Bfp8T4Zntoup+4d2+zZk7WSXqP+LLTsN4EsndUTUR/emrFwVZp+jklY3ggj
	 0fFzWYtQzgxNg==
Date: Mon, 23 Dec 2024 16:06:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 05/18] dt-bindings: clock: imx8m-anatop: add
 oscillators and PLLs
Message-ID: <n5v5y2mhsqrpirw6ceck22vi2xnawk6k67j4tdotu24iqk5j4v@bcvmmuqkuvib>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-6-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_070624_417276_43CAC0CF 
X-CRM114-Status: GOOD (  11.38  )
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

On Sun, Dec 22, 2024 at 06:04:20PM +0100, Dario Binacchi wrote:
> Though adding clocks and clock-names properties will break the ABI,
> it is required to accurately describe the hardware. Indeed, the anatop
> module uses the input oscillators to generate various PLLs. In turn,
> the Clock Control Module (CCM) receives clocks from the PLLs and
> oscillators and generates clocks for on-chip peripherals.
> 
> Furthermore, as agreed in [1], this change represents the first step
> toward the implementation of the anatop driver. Currently, in fact,
> there is no dedicated anatop driver, but the CCM driver parses the
> anatop node and registers the PLLs it produces.
> 
> [1] https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


