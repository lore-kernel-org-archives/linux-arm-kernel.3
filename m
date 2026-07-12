Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6B7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seILppKGTil9XvVHz2w8WcGUv3ZDPAQ7sc+x9QORmZY=; b=WM3atjY1tmENAhe8xdOvK2sPvc
	VfLy6xYcYL6moBbnfMSEEJA0e+MOe9GUlhtEXVX0BK7Ls05tyUOZopnSzIB3WxPubJakvH+2Saoam
	P1bZqEAEotM6tsFIelGeUAf/7XYJGwnEnJPWtkXzjSEYIR2ZtBPc9PU940TJaooyvYyiljbnxCbSv
	C0iJYB9v+IMa7Xp94l1BWZS7VjLBIJhbBkACI9YbgfQouUO4dpH506BMMAYSoopDab0l6/KfLpdfj
	aXeiVwws4J0LFthS7z0D9ftkLuxgD01U286AyHMFYab6F+gInL2/VGbDpS3EB7SPnNf0GARNxo39W
	lIIpCw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0sa-00000007jMy-3BYs;
	Sun, 12 Jul 2026 20:34:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0sX-00000007jLt-1hXs;
	Sun, 12 Jul 2026 20:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=seILppKGTil9XvVHz2w8WcGUv3ZDPAQ7sc+x9QORmZY=; b=oVOaDuhQWudRoQ1btoqyzMjwZr
	Ih8XqMdJdiPg0lwZTHw2qHwAYZfdPgCLS6yDrgOgcy+iLZwgX0OrFM7RGO7Pm63rvjLn7dmUMr0jp
	E7ruvubyhDcJ2+5Z/saUlyVokTaP5XqQ+klKy09x++PUa0qEs7jkpgK27444FapNGXt03v++0IuMA
	OAjQm5GZGJGlHLH0choKlZ3uAdTlmoZNrWqhuVJM25asp8PDZHRpix+Agvxz08QvlmbUcnqsi4ed/
	ev6j2VoyzLP8ortF56dCfvDAPoKlEPWkVT5PKUqdCAoPzmP1EUdW+2Dk3N+VJFBeUbwHER7DU49NU
	K8VVuhAQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add devicetree for the Graperain G3568 v2
Date: Sun, 12 Jul 2026 22:33:55 +0200
Message-ID: <178388833988.1396294.17990564182339450982.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702204628.2407308-2-coiaprant@gmail.com>
References: <20260702204628.2407308-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_133421_506807_38518601 
X-CRM114-Status: GOOD (  11.50  )
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


On Fri, 03 Jul 2026 04:46:26 +0800, Coia Prant wrote:
> Changes in v2:
> - Fix trailing whitespaces and other formatting issues.
> 
> Changes in v3:
> - Picked up Acked-by tag for patch 1.
> - Fixed text wrapping in the commit message of patch 2.
> - Replace the legacy 'gpio' label with 'gpios'.
> - Add the basic WiFi child node.
> - Add the Bluetooth UART child node.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add graperain
      commit: 8885a00d305166fd6e1ba0699228d015424d3bca
[2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
      commit: 441baa62ea364c168dac79b804022154abab2ded
[3/3] arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2
      commit: efca3937b84cbcbcccf88b26a54fb8efaf8bea73

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

