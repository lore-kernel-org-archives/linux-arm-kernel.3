Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6689C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRvBsyOxjoM7JpMGphXVWqRw3nmtRnJk0afh/8PqTyE=; b=ygmZCTp8XYFFoHCacD38lwjY0h
	kTeIOwqWg4MUpIbPUpMRoGjvABdg2c0KZi6U/2xZuAmImhFB2VpniYUHsg1RjtCK1u00/5fcReK4C
	2mNDl1u6ozTJIRgzMFYvCh+i9yUAI47E9KeXTI97DLq4HwB3d9rPy4YOD+j7k3iupNE/E5slOVpvd
	O1lu65Vnz0VGTI4XOmjHTTX9FkEt0Wj+vmpeTqUU87GWnPnUYAW0DgHXrDW2EsHTmgE4V/kZ0EyxC
	as2rRVUMxApr0vH9xlYPKt1LTJRoloOi1jCU+/7V0NnZGX7/DH03QsmUwx0xyQPHXDIqZPhBUa9jA
	jAx0qb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Ag-0000000FmKx-3TRQ;
	Wed, 15 Jul 2026 19:21:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Ae-0000000FmKP-2bto;
	Wed, 15 Jul 2026 19:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GRvBsyOxjoM7JpMGphXVWqRw3nmtRnJk0afh/8PqTyE=; b=R3tAvy2Zn6mL2TjWKqMx87QUY8
	W3uAEocfkN9IncKeWxVb1X5xtGBhECmRmknAmm2aaXXnvzmICIDGQLo+FBtnB0sfWqkDIhCiTw2lk
	i19Ee3OnmHPgOreZkMCcgvB6Gfq0Bld7FniZ4W0adpUT0NFuPg0vk2SKEHvTvD+izXtVKJ4dpizU+
	f5pMu9pcOkgJq5h9hhrydpOhx/0Cl19MR1XL8yYNTbFkn00TX7DaTcnm8pDIMzah2XbTsRj8dr4rw
	lf6x4j8DaoPpOnlKmLqy/FdKiMr2RplpduZ8dJaty51uRIsBOcqbyXk11FZE/jJFUWtwOkf1/7Cx8
	B7NU7cmA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jonathan Cameron <jic23@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>,
 Simon Glass <sjg@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible
Date: Wed, 15 Jul 2026 21:21:17 +0200
Message-ID: <5684233.Sb9uPGUboI@phil>
In-Reply-To: <20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid>
References: <20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_122128_776939_82BB2F81 
X-CRM114-Status: UNSURE (   7.25  )
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

Am Dienstag, 14. Juli 2026, 21:16:32 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Add the compatible for the SARADC of the Rockchip RV1106, which is
> compatible with the RK3588 variant.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>





