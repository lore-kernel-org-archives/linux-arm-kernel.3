Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3DDEA4E24
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5xwiPDxpnLRrto5XuQ9eP4pT2QR6waC8wrl3JKLmpQ=; b=HTwi6axNgGqiNGJ/JN4kgoccHB
	Qd9V8ajJoGKFhrRRw0nzoHR/uvSU27329ak9lKOAtdOXGFeEEyw8hZ+76lVBWkZc1RFw7FtCcW9ja
	SugOBKbqk44alRwGWE3XOdp3putGVa3G6PTm4XB8IDdt8mQ2wgvUBkH61dpDDeNbKiCKatCmQ9LNG
	GTRV71Qx0zflKfVeqj8tRls/68TQV09RCNF7DDFABQHifqedqwnBusZ5Cms+7MnAxds678woxmr7q
	6DpWqhNyCdBDUti6F44Y5h9g0nQWLWxnIZ9kY2Mb3RzNN5OJgg36ErZ++nBNEclLHEcFALAEERwDY
	ps2kxssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5RL-0000000DOHZ-1wmh;
	Mon, 02 Mar 2026 15:44:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5RI-0000000DOH1-3RTT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:44:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F4951A1F34;
	Mon,  2 Mar 2026 15:44:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 433085FE89;
	Mon,  2 Mar 2026 15:44:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CA2210369568;
	Mon,  2 Mar 2026 16:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772466245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W5xwiPDxpnLRrto5XuQ9eP4pT2QR6waC8wrl3JKLmpQ=;
	b=gHKEgrGf+6vb22Bi0/bGEo3oh/7e81dAYsSkyWRz7gT0Yis7830W/0KoOfxUPtV75ORiOt
	gpsPjc8ye/Za2Dk3o3uROoZ6Ulw7HdGXbYhY/wwqdXfdzkS96lLcw1vx0kxq9jiTV96TrQ
	/qrijjvK8vD/sg0MQq2FcmsgAjgji4JasOu3eh+u/n2XV7PLvaFXHDOvdFBeDX4UUGOmrD
	zULR79Jq1uR/Yt+riL2JPPXPB+WeMvrbqk57eYd8K8/qHH5yTUeD5uIF69DnxJo1rxRhJF
	6jDkbSCsmcr6exQCfRaYlHUnG2g5Kw4iQE9S5JsJadTvL9uiSqd6bi/do2HkSw==
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
Date: Mon, 02 Mar 2026 16:43:58 +0100
Message-ID: <87ms0qfd8h.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_074408_989097_BFA9CACE 
X-CRM114-Status: GOOD (  11.40  )
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

Applied on mvebu/dt64

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

