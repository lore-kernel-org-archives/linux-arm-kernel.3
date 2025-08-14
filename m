Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E29FCA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM1G/c39uEqIVKhxwV8fJqXZsNf9cxuXzgjWjd3QebQ=; b=mwujryii9DDi9fAW9v3SpByvPJ
	UPz+BeRBufNtSJknuCK0lilQknv+OLq++sU4nwW9zoul4zW9tOY1PPeaM9MUOhI5j3/QAnLB4YTlV
	nSIBoF7g/Bv7hLNKZAngysJI+hUmVQgxQr1ZolOx6OJv2GkDy9bm4EucVpMdI1Ey8JquZEB7yZEzJ
	QLPCiScR7EhIsMf70i5H3iCJciabtVzJ0on1Gnh8V9XcjHuNgyoFgqpGSaZdK8G+qpk19lTkaROgy
	qm6lhFJdAnOc6PPcmrDBSnKX4irtzWKCYfVO5PE9WmsmDyGAdJYqOxcGt5euMN01ElHngdvKKlfUx
	/NZs+dmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTOS-0000000GG5V-26nw;
	Thu, 14 Aug 2025 08:33:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umT5f-0000000GD0n-1e2G;
	Thu, 14 Aug 2025 08:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B247D60209;
	Thu, 14 Aug 2025 08:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC14C4CEF4;
	Thu, 14 Aug 2025 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755159218;
	bh=2D1OOFtNbdpnycHdnojgPyCPrVecspF1AWE0YpTc5Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmDFlGeuPH1XfHlUH4Z3k2aCt3AaRHbvrNWNEngpXoKELe0G7p8j9wn597XTJ6iRN
	 L3uQCWlFV7V11dHkYcctJnDXVUiM/pnqLIpHn5b6459R2ZpjsJfxczmbkz0dyiIr6k
	 lRmDayR2Z4PLhL5m8hChhnNuaQ2eJT6crOpObWEpHB59dqLxSjv7imEUReeqZk4Z3Z
	 vWNlmem+zPdfiStTM7Gsgo9euIJOjnoSjYx9dEXDLUFQ84fUlCDU8TYPkepLsnbB0n
	 VYJJgnTxtFcVsbm1BqiBT7BQtfg9fASWovDCmdB+MXojxqkC+WjgOCGfrg4DLdXPZD
	 4qmMis49DPJYQ==
Date: Thu, 14 Aug 2025 10:13:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org, 
	arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com, 
	pankaj.dubey@samsung.com
Subject: Re: [PATCH v3 08/12] dt-bindings: phy: Add PCIe PHY support for FSD
 SoC
Message-ID: <20250814-refreshing-watchful-lemming-4feb03@kuoka>
References: <20250811154638.95732-1-shradha.t@samsung.com>
 <CGME20250811154729epcas5p456ddb0d1ba34b992204f54724b57a401@epcas5p4.samsung.com>
 <20250811154638.95732-9-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811154638.95732-9-shradha.t@samsung.com>
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

On Mon, Aug 11, 2025 at 09:16:34PM +0530, Shradha Todi wrote:
> Since Tesla FSD SoC uses Samsung PCIe PHY, add support in
> exynos PCIe PHY bindings.
> 
> In Tesla FSD SoC, the two PHY instances, although having identical
> hardware design and register maps, are placed in different locations
> (Placement and routing) inside the SoC and have distinct
> PHY-to-Controller topologies. (One instance is connected to two PCIe
> controllers, while the other is connected to only one). As a result,
> they experience different analog environments, including varying
> channel losses and noise profiles.
> 
> Since these PHYs lack internal adaptation mechanisms and f/w based
> tuning, manual register programming is required for analog tuning.
> To ensure optimal signal integrity, it is essential to use different
> register values for each PHY instance, despite their identical hardware
> design. This is because the same register values may not be suitable
> for both instances due to their differing environments and topologies.

Would be nice if above (or most of it) would be reflected in binding
description. Please do so and:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


