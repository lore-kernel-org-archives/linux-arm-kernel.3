Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42585103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YhADhX7Sz9BQ7Wqa8aMFwEFW+N2GWWEEHSgVax6KyQ=; b=TY7zPLKbWQ6oxAxlNM7LPLorYT
	DUzv3jWp/5FZgE7lOLAILm5TI8Yrpdml7LsNGHEdbUlY5TIh03pAgEP533ctHCnh/utpcl5MrU8AY
	1dMeHzOCQYSgnqX1PXLAij2wzmeKa3bxb8Q8Up3fX9ax7Zf0ba5LZWQyewQhFY6XsbgiV08Y+QeKY
	7f0mW7Rps88SsJLG64RSjp7NAkMiswZrPnOGAG1W72HUXsjLms4yYscvYg0R62o2+Z0OvBnP6ibuq
	VpZ8NevBo6jJvgzI9WdL258ehRX+xgOU5BuQdSgCGQ/m42SiTooesmyNfjDhcC0mmyhMCTk4kCyjo
	CtlbctRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14lc-00000000a2Q-1YzJ;
	Fri, 13 Mar 2026 15:49:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14lZ-00000000a04-3bmT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:49:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D26F4C4285E;
	Fri, 13 Mar 2026 15:49:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A76060027;
	Fri, 13 Mar 2026 15:49:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 014C010369F3C;
	Fri, 13 Mar 2026 16:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773416969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2YhADhX7Sz9BQ7Wqa8aMFwEFW+N2GWWEEHSgVax6KyQ=;
	b=x3/jANCx3hppF1BDxPaPmihwGUWLq+jTGH/W/iroy0KMO/k5x5C6fcFPhyDjlaFBEThUwc
	93kFLp4neJsUg/LlYoiPph1x8mApbyHOozwLT29w41ZrNFhuFHTaDOcVsFoWsMC9q/rW4D
	smxK0zQWhgdOCCbzyKpR6An0dpbns3qYxVxxGBhT64kyNjIQndk8EHXllhn6IObOubCfux
	uZ60cAwP0eXxtBQsmRWkLwoOySlqAWt7khjLDrZcUpo8WIODnahgujm2zGV+caejq0YN8Z
	btleRVHhkABfign4jGrnvXT5qZ0y4eS1VXqEaCGiymDFZKecpsAVlsNP3sdhHw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Elad Nachman <enachman@marvell.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, pali@kernel.org, mrkiko.rs@gmail.com,
 chris.packham@alliedtelesis.co.nz, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: enachman@marvell.com
Subject: Re: [PATCH 1/3] dt-bindings: arm64: add Marvell 7k COMe boards
In-Reply-To: <20260122165923.2316510-2-enachman@marvell.com>
References: <20260122165923.2316510-1-enachman@marvell.com>
 <20260122165923.2316510-2-enachman@marvell.com>
Date: Fri, 13 Mar 2026 16:49:28 +0100
Message-ID: <87v7ez686v.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_084934_042336_9023DE3A 
X-CRM114-Status: GOOD (  10.83  )
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

Elad Nachman <enachman@marvell.com> writes:

> From: Elad Nachman <enachman@marvell.com>
>
> Add dt bindings for:
> Armada 7020 COM Express CPU module
> Falcon DB-98CX85x0 COM Express type 7 Carrier board
> Falcon DB-98CX85x0 COM Express type 7 Carrier board
> with an Armada 7020 COM Express CPU module
>
> Signed-off-by: Elad Nachman <enachman@marvell.com>

Applied on mvebu/fixes

Thanks,

Gregory
> ---
>  .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.y=
aml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> index 4bc7454a5d3a..7e77310da626 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> +++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> @@ -21,6 +21,17 @@ properties:
>            - const: marvell,armada-ap806-dual
>            - const: marvell,armada-ap806
>=20=20
> +      - description:
> +          Falcon (DB-98CX85x0) Development board COM Express Carrier plus
> +          Armada 7020 SoC COM Express CPU module
> +        items:
> +          - const: marvell,armada7020-falcon-carrier
> +          - const: marvell,db-falcon-carrier
> +          - const: marvell,armada7020-cpu-module
> +          - const: marvell,armada7020
> +          - const: marvell,armada-ap806-dual
> +          - const: marvell,armada-ap806
> +
>        - description: Armada 7040 SoC
>          items:
>            - enum:
> --=20
> 2.25.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

