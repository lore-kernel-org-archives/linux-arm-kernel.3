Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EFBFD5F8D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xfx9JuKzWhhroqiG47wBMboQ6r1fnrfhvlBYpRGNLxw=; b=bVEBMWWmdFPqaOQUyoKiHD0vHy
	zyxU2BpYexeLhreEP3UGDhCnlVSRmmgnmZbfH4t6/JKwA659Gi4qBgHxY96LnpDhMDtvv1Ej3J2z2
	u32gdpyjo1j6trpadgwiIyk9oUSbtjrMO5tMuoB/1nml2t7VB6ubEbtE9E+OSyvWP5EINvkQyHi+R
	5x/ZtnOWobWuo9ooLWFfTKPkhUndASNwQrwjYRCmeyFqkORI1V++0y0CP65NuoCPN4v9cPCa62v3w
	Qv6ywjQeSvo4iPNsSJ4GaEnkUA8uK6TzZp0zkPOPaa4pR1FZF9qrSuwanC95uvUidPHzzEiBucgjX
	35hwK0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAN0B-00000008OP9-0GMR;
	Wed, 08 Apr 2026 07:07:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAN09-00000008OO4-03gz;
	Wed, 08 Apr 2026 07:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E5AC438CC;
	Wed,  8 Apr 2026 07:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593A0C19424;
	Wed,  8 Apr 2026 07:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775632020;
	bh=VAqtM596fTkblqBx3Tz9ML/ae1nqwvaQNrNp6yDtM8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7WioZITLb7TUZbaCmvNgfZSxzDFscADhCwHweiyBI0mPDleF+9+FkGbAzTd0+ofx
	 0+8wBQvAqIDQaMiWAgnaHBz9uq7NBPBbCXloOBIeMILNX3UQc63pe4dYt2v40c7caX
	 gk7JYjJuubcWlaxnz5o6FMNS2bWRaeA5qgGPjedDbJy+n5JcsUqtqAyx/Aoy8IckCk
	 xi7iqEFGH1z7mCpkYS7NXtcv2SKVe8+463vgmf25N44cd18QWCqkkkiHZtx01popOi
	 0oNvwcywv0QZP1TLrqa85k30ofyobzeFQE4VUyMwHBTSsqTxqBdywv9sCafepZDzf9
	 /Hb0h7ngh2czQ==
Date: Wed, 8 Apr 2026 09:06:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v4 2/5] dt-bindings: phy: ti: phy-gmii-sel: Add
 ti,j722s-phy-gmii-sel compatible
Message-ID: <20260408-umber-boa-of-expression-09a29c@quoll>
References: <cover.1775559102.git.nora.schiffer@ew.tq-group.com>
 <b67c8b0bc9cc918667e9329d79f617d033d025d5.1775559102.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b67c8b0bc9cc918667e9329d79f617d033d025d5.1775559102.git.nora.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_000701_066482_399D8E2A 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 07, 2026 at 01:42:34PM +0200, Nora Schiffer wrote:
> The J722S gmii-sel is mostly identical to the AM64's, but additionally
> supports SGMII. The AM64 compatible ti,am654-phy-gmii-sel is used as a
> fallback.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  .../bindings/phy/ti,phy-gmii-sel.yaml         | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


