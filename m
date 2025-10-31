Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77B4CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRpBRBWaIHX6eIuECYCQwXUzbJ82+e6Wq9lqx2nwbRs=; b=tkEGN5Z2TzH7JyQXoSo6CNYeBh
	+kYN5GGcso1sUjN0JWmmN1UC9gGsJ2n2/qSjm+31xY2QEy4MpAXBeijeoNSLdqyHje1StSb0isfyI
	5ogkXyT7Mn+jaN/qNOh5En4VX65f2+LElXZ82CsBHsJ0vo6snp5TD3hwNr4qNsY19b1iVT2M+wuMM
	BctpBypmoDgpq57dxDqCGcTtGXEywj2kyAsMlLSNswNCGpg3ZXDoBy/VQaonVslkfo/3X7mLxTgk8
	MGjn+N2mWbPaP0ESkiKepnISLNO8FtKaiugnUpgGhhxzC2jAa3XaoE5rLVGgwtvzXf8KLN2kZNwvs
	ZaHyG/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEy0B-00000006suF-171c;
	Fri, 31 Oct 2025 22:53:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExzw-00000006soU-0kIp;
	Fri, 31 Oct 2025 22:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lRpBRBWaIHX6eIuECYCQwXUzbJ82+e6Wq9lqx2nwbRs=; b=xgwXqGFKSBKVZuxYEma799JQZb
	VtGDMgxEaTNZkC8hCr3EtN+fkIsXPNlUXkO+ZVxF0HRWOI2b1tLYZs9PMbD/WwM5/qZ7JF+njeAjS
	omAfGpJ/lnK6jd5sTJWwGl6xJAu/OUbq5gYtc30bOwCd0KSvmt2jogOGyrxtFAnostK6GMadnx7p7
	7bbAPXxj4qBZiJ1v9Qu815We0SytOFeR+VvypBqcydkwbGhfPnOOjjyLkNZTyUEiXsQlFS53YFErw
	l0/xxoZcErsEvGT+HqgTwr5jwYeoi/dq13RUHcBrm6niYxUo2ewiO+K725p033wnavkobNLzZB14z
	Lz7nG8Zw==;
Received: from i53875bca.versanet.de ([83.135.91.202] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vExzs-0004vM-CO; Fri, 31 Oct 2025 23:53:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm: dts: rockchip: rk3288-veyron: add spi_flash label
Date: Fri, 31 Oct 2025 23:53:23 +0100
Message-ID: <176195118795.233084.13649684258296887756.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <8a423a6f-bfdc-4947-aef9-35ee7c4f6ca2@gmail.com>
References: <8a423a6f-bfdc-4947-aef9-35ee7c4f6ca2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_155332_213512_242E0DBD 
X-CRM114-Status: GOOD (  10.27  )
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


On Thu, 30 Oct 2025 18:52:34 +0100, Johan Jonker wrote:
> The u-boot,spl-boot-order property requires a label at a boot
> device node. In order to migrate to OF_UPSTREAM more easier
> add a spi_flash label to the rk3288-veyron.dtsi file.
> 
> 

Applied, thanks!

[1/1] arm: dts: rockchip: rk3288-veyron: add spi_flash label
      commit: ac7116a626e00d3024adedb43b74bdf2ce45efc2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

