Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7D6C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgYHhAZVJRwm5Z/EQR+PLrb0QmEddFGRe/Yn6CQfksM=; b=OI3ebQqtGODBjiMcU3o5V+gqwt
	Y2g4YZFl7zFeinOic1I3vPRni/vUpoMcTmgnoJutRevZx/ElNUYG+sqYc/1RgEnMrHdmC+nqQrTVO
	x8NZh0wH7DTFAnfTMFFqo+PbI1MeM27lCbz12HdRn3mf60phEK8RVlo8LtWeA0HNIuvWFig3QYfVy
	SBCIGLTHtuV6+QQcn1iJHI1V5kj8ncpi+oGGuaTdiYxdrM+0gIf0Pm65U+frpJmlmrg1ymx3+2k61
	oCorsMq8nUk/tcE4cRgGolOiiAGWHkOcglRD/vacbamQpdWTVFjjwU+Hx18D0oiSjdMtWGT/E7ZzR
	NHQRepGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8XK-0000000Cp9C-0aON;
	Fri, 28 Feb 2025 22:08:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8QV-0000000Cnkx-13XK;
	Fri, 28 Feb 2025 22:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NgYHhAZVJRwm5Z/EQR+PLrb0QmEddFGRe/Yn6CQfksM=; b=PlrK+k96DuLGQzw7NjEpVOUJ6v
	JoBKzGgZivPTZRUDGlag6YiWjnaS9iYUxblEtP+7YPmx+NkrxeMHOEmbBnogoUUSeF09G7DNHw4QW
	7HzCi+sYdkh0QdYNKwAmbmapLHevXgwnTF8c0hgLa4yAwAU8q4KpTKV49Gc+cfi6hjf7vX/gwpxbQ
	OquPlSitgcLDgCYKWm14l1THW+FyWWeob+EOgwkafmXg9uI37gTMw5QwIZOeR2Ewrk7SC6IrWEUiW
	BagJAa4Xfe8SW2w+7C1S27HpG61Ia5h4KYkeSaUyrQ6w5IuaWLFqpe0cy9KPKFtuInszvCR1aG2tb
	H/3hsMDw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1to8QP-0003wY-FO; Fri, 28 Feb 2025 23:01:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Wenhao Cui <lasstp5011@gmail.com>,
	Yuteng Zhong <zonyitoo@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Remove undocumented sdmmc property from lubancat-1
Date: Fri, 28 Feb 2025 23:01:29 +0100
Message-ID: <174078008222.501190.8063852889534506568.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228163117.47318-2-ziyao@disroot.org>
References: <20250228163117.47318-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_140147_288045_07B6D3A8 
X-CRM114-Status: GOOD (  13.06  )
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


On Fri, 28 Feb 2025 16:31:18 +0000, Yao Zi wrote:
> Property "supports-cd" isn't documented anywhere and is unnecessary for
> mainline driver to function. It seems a property used by downstream
> kernel was brought into mainline.
> 
> This should be reported by dtbs_check, but mmc-controller-common.yaml
> defaults additionalProperties to true thus allows it. Remove the
> property to clean the devicetree up and avoid possible confusion.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Remove undocumented sdmmc property from lubancat-1
      commit: 43c854c65e47d2f3763345683b06257b4d12e4e3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

