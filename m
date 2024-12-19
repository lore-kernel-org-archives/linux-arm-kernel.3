Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB53AE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoWbNvEfKW9HkTtzrieVH99M/lDdJtC5UBvwBvDRtS4=; b=n0KBQDoxhTlLRVc+yBNgMD8XqT
	k5ogBSdx05QsWeJF73d1hW0bW4dV+KKtaKXlnkwdw3NzuRCFOwjdO1xfzyLhaPEvO526Q5jo3556j
	orprQ3I1xXBDR5/KjO8qJUwCTUCNRXuGj0RPMAk30dGNvLYrUDHvi0F/Al8pNfLvriDrELNzM/pgH
	6HcF9przjPMl/8rqUoEU8cd2kY8Y8mMjGWlFt5fWYRL6A70Db+x+mGkl+hRMK6a8hIx/Bis22GEzv
	9sfPOz9g2ZW4IgzjB5ids3DzNsF2NHb/8dQkEXY5bd9RzOL+yw7xp3dtX2RSL2uTPhAuccmbrroNp
	ZkyyChig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG2n-00000001sbA-1gBm;
	Thu, 19 Dec 2024 12:54:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG1g-00000001sQG-2kGV;
	Thu, 19 Dec 2024 12:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0AF35C5F02;
	Thu, 19 Dec 2024 12:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103B0C4CECE;
	Thu, 19 Dec 2024 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734612791;
	bh=chkDZbIsspED3TbjbtffIlaqUyxh0yo/Es2WKYz1qUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMS8FWqKyvMa6afamNOFkiOAg/3lQgy4nID7D1MD7TgC7HYHJLUBw1B1gnpUtKq+Q
	 5le9KWvnL7WAlq8t0a+VLoryqMkVSHlA0A9NH7An53oNwJeW50ztWcU8mBxU//Pb7L
	 PBUwKNR5wXLWq189DUc6xInmEVlnxMQYcRu24mmwtbHbMKgdUGEaq2bJk2yR+OF+wT
	 rqH8VO3OVZoEHy5Sd6BFjHroi1BYItnP3T8bsWr7Md1itamHlIjLgkgfHJxYwW7U4V
	 NI4xG9xUjTxzgsA5OHsVsluFDmnYoow+fPH1IseoF1rvAxC8osX2/T6g4j5aj1iA60
	 XG8TfGFpCzSbw==
Date: Thu, 19 Dec 2024 06:53:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <173461170218.4026495.15441109866406999660.robh@kernel.org>
References: <20241217085435.9586-1-linux@fw-web.de>
 <20241217085435.9586-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217085435.9586-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_045312_732411_0674AE5A 
X-CRM114-Status: GOOD (  15.81  )
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


On Tue, 17 Dec 2024 09:54:28 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> changes in v6:
> changes suggested by rob
> - remove quotes around mux
> - use const instead of enum if only one value is possible
> 
> changes in v5 (so not adding RB from Rob given in v4):
> - do not use MTK_DRIVE_8mA in example
> - add _0 functions for pwm
> 
> changes in v4:
> - dt-binding: pinctrl: fix dt_binding_check fixed-string error
> 
> '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
> 	hint: Fixed strings belong in 'properties', not 'patternProperties'
> 
> changes in v3:
> - limit conf subnode name with optional suffix like mmc on mt7986
> - match mux subnode without wildcards
> 
> changes in v2:
> - drop gpio-cells description
> - move ref in mux subnode up
> - order uart-functions alphanumeric and fix typo
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 575 ++++++++++++++++++
>  1 file changed, 575 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


