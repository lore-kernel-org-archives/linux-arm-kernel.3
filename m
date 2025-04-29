Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D9C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SGSB4/+nlLFVQyK8SYD92uIgww4SyT7f0UDpG1s4xk=; b=oRmP/b86Vc2ZSsIEisURsUyC/E
	MZ42/4VtCjN2qVoZZ8x9NoOec0LmVn2EJTtHX22s5DXFFsLk/6AiL2NJjO4C3uJrzqXKLo6QZ9gbC
	Hvc3UCA02MSz/XIynmMf9kz+ACY1fQTG5uzkOrzyIAHuH9tAg7Z5mXcBY20R5PGr54IgqU9a7CBMG
	L8h/9CL5agAm3FX7XRN5B6wRITO0zL7349qzEbj6s7bJPSXOBdaEfxvc5ZSw2ZEtxOPM5QN4x/ZHs
	IatJdrVtghJJR6t8MwDRppnyB69LRFgENnrh7hStv9jR8lCoZDizu5/ixXnqWfPGZRPed2sTBfxbc
	VYjnqFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sUw-0000000ArBL-2URt;
	Tue, 29 Apr 2025 21:28:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sSy-0000000Aqt4-3L0g;
	Tue, 29 Apr 2025 21:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+SGSB4/+nlLFVQyK8SYD92uIgww4SyT7f0UDpG1s4xk=; b=O8BwmQCopy+yAIs0PC3ozSdz11
	gSfGlzpYnSLJ9S+QMILMlUgY7xpn4dkO36BCISW3XbaY/I9fu3blr6BiMyr1OR4bn8hWkwhob7y0O
	lGvHX7rr8cX9XjQb85McsZx/ZhGjNyl07wtSIiCwe5syx/fJyvy78P8txx2XqB7m2zkpqBIXYx2rp
	F8Xe7UOx27ts9Wt20/QJRRCGSAENq1/e4jI3dUfiWw/wScqIIvVuOWkwMZqAF9OMvTTmRzj39L0fJ
	x+X05eb7aPiYuwYqO8ZbH9konGVSN56TkvNYBkFHQQXV5b1W8WAssroADmFrOmUM6oM08nE8YdeJn
	a49Nts2A==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u9sSs-0008Pg-B3; Tue, 29 Apr 2025 23:26:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] RK3576 SATA Enablement
Date: Tue, 29 Apr 2025 23:25:48 +0200
Message-ID: <174596194661.227689.3642609522784038361.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
References: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_142612_839216_7385D69D 
X-CRM114-Status: GOOD (  13.91  )
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


On Thu, 24 Apr 2025 20:52:21 +0200, Nicolas Frattaroli wrote:
> This is a tiny series to enable SATA on RK3576. It consists of a patch
> to add the compatible to the bindings, and a second patch to add the
> nodes to the SoC .dtsi.
> 
> I've only been able to test sata0 on my board (Sige5), but the
> successful test gave me confidence that downstream's "dma-coherent"
> property here is appropriate and true.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: add SATA nodes to RK3576
      commit: 24d8127d801560c8fa811d554e8ab5db7e51511c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

