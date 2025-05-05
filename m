Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1764C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6E3Fmt7cfqXOAXJWZj3GI0CXUJV8EUTYEDTm9gMTDg=; b=VgMbGV8e7iyekEe8GvHDfZFiCx
	9soQCcBDr0jkMP9aGSDKaIYP8lWS6vzTATCbh2N5Bwc2lZ5mvVYfJtGcZKkPDZvgx3uW7WvJxYsAE
	0jJQZAYXR2OcT2GAOsvcC7hvCjMziI0Gw6miKuyLLA1EyAedYpr3DmZ9itjnMKwxZ8hRki9SkfnI9
	+RZNrP7+y4TQWB0f9XpDnPPqpmLqxPOCiCeoCal6TcwSMcVd0Qi7qeKos0AfG+T5HOR3xaIRXZa3N
	U+t0G/MYHyIztb9ismCQTYHFlq2V1iGUKjFoVa4JrRTq80CpPi5bMKlUzhzlXwG3pNb1ka4pVjGNR
	ioMwqL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqc9-00000006go9-2mzN;
	Mon, 05 May 2025 07:51:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqaA-00000006gMt-2Cir;
	Mon, 05 May 2025 07:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=g6E3Fmt7cfqXOAXJWZj3GI0CXUJV8EUTYEDTm9gMTDg=; b=z+11W6G6rm+LkV+kCDHjVKwpO+
	tKOxP1CyIwwUl0Qse5Upck55bH9iZOyMOxFQvw8LXXyXbFgCqbWcWFo+KfmeXdURYL5i+mlDlDCwk
	zKDEErGrPdWb3dQb6qp+PvKDgipiboBueGPJUEGM0xVmN99v7LlepjRC5SngXtKh93x58SvcLORLS
	XL5FKwYxRkybBQdVcGszmKFiKnKL3PZibkEXs4PloDGXyg5blkXW0/l1Zw/66Odasjj3aQ1L4BRLG
	ENqn1dvE69j3Q5mL1sqJqQYaSouY76WFBF+AtXae4eTEtRYLvfzKuo6CH4P+0rutUZk3hHzGWYWOy
	WgEGsypQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBqa1-0000dB-Ff; Mon, 05 May 2025 09:49:37 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for
 RK3528
Date: Mon, 05 May 2025 09:49:36 +0200
Message-ID: <4864135.rnE6jSC6OK@diego>
In-Reply-To: <20250417120118.17610-4-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_004946_581674_3061B60B 
X-CRM114-Status: GOOD (  14.38  )
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

Hi Andi,

Am Donnerstag, 17. April 2025, 14:01:17 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Yao Zi:
> Document I2C controllers integrated in RK3528, which are compatible with
> the RK3399 variant.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

do you expect to apply this patch to the i2c tree individually,
or have it go together with the devicetree patch?


Thanks a lot
Heiko

> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Docume=
ntation/devicetree/bindings/i2c/i2c-rk3x.yaml
> index 8101afa6f146..2f1e97969c3f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> @@ -37,6 +37,7 @@ properties:
>                - rockchip,px30-i2c
>                - rockchip,rk3308-i2c
>                - rockchip,rk3328-i2c
> +              - rockchip,rk3528-i2c
>                - rockchip,rk3562-i2c
>                - rockchip,rk3568-i2c
>                - rockchip,rk3576-i2c
>=20





