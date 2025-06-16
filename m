Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A27C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX6xHsAZt0PtKiXJvcYGNWCSJAKCZDeVPjlN1P/2qAQ=; b=ocfo8wDpNRqnMHOtw0ME4pRAb+
	Z3EJ9dyIp0t9m3odn78B/BYlstJG2X6nxQIql73QNpDv0yukb9EYhymBN9q+UuUCP420PSj6hDoKN
	8+0PgnZiRC5S6Ur92idP/bPCuI6j0GTk9dQBKX84icPKF3KKGyRIXPnPtZ7DlhRlxh/oy0ac5JOaT
	4u+iehHsqKKeDCpDD9jjJTkB83THhkb70BrA/6NqCuinXaFENaR8Wp9dxbHFOcE8idBzKalWlb5Gn
	Euq8OIDDKOHY1Wxo6JEUX7svdgePK4WLDEMjaTK2BBobpQzsuUDbOymTOcegVBkplBOAJbqJU7JO4
	FaV4IYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5lD-00000003sCh-3uiT;
	Mon, 16 Jun 2025 09:04:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4zr-00000003lNW-1Ekw;
	Mon, 16 Jun 2025 08:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9757460008;
	Mon, 16 Jun 2025 08:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B573AC4CEEA;
	Mon, 16 Jun 2025 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061714;
	bh=NX6xHsAZt0PtKiXJvcYGNWCSJAKCZDeVPjlN1P/2qAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4VmhLwqcp2Cx6Mf8DWGmSeldB6aP+9zrK0qLKCDVt+vSzUuwrVfCBd2Sq3gt073a
	 f/ynsXzdEwkx4GiF9nfAkhEt6dyHpwVMepx6HgXioSRyWGGnRX+rQuanOVSzwCELVv
	 5abS44EzFORuLShdkQiyt2q1/eBcBqdxHTQl7cdJgFiCJF54Li7sT4RbTFUUxWEHP+
	 f7TQWhYrAWgwQMsSUJtGgP/+4sp8nthzSR4/Q7a8TADSYr7lFuq1gg14ZoPTQlt/Vk
	 JU/QBUybZ4pLrackeC3kR4Wh+pGIj3sk1ToN+HtGVZIcN2rKD1G+5A0JTZAvkowDhT
	 qpxmMraB071oA==
Date: Mon, 16 Jun 2025 10:15:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250616-resolute-ocelot-of-shopping-1c9c4a@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>
 <20250613055613.866909-2-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-2-pritam.sutar@samsung.com>
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

On Fri, Jun 13, 2025 at 11:26:05AM GMT, Pritam Manohar Sutar wrote:
> Add a dedicated compatible string for USB HS phy found in this SoC.

You add HS phy in other commit/patch. This is just confusing.

> The devicetree node requires two clocks, named "phy" and "ref"

No. Explain the hardware, not the DTS. How many clocks, supplies etc
hardware has.

Best regards,
Krzysztof


