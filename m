Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE83CD26D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeweFw3yUXjrRcyiy2cr3jMXmJJei7ulqdxDcunsWNk=; b=MCu/19ePyf/G3BiiFa7S3sGtGw
	807txONL4HghAXiyJMJBSz7c+u7hiOGGfDQQeLt5Om5+RPTftLCU6DysSazXSqiXKnuwmZoxAWGZO
	vFTMiYptrffiiOqAF7Fu/n9q1hjJZNy/hL3k6GwPig8VyOWiNoSixZ+Ukgawg6QJb4S9I1aAxnOlQ
	nI6ZPP1zQxRUrLc5Rmnqi7h7AnXSANj2aMCGRba5I1i2lt5xhPVHPszG8sYsiSLQb0TBqldsRA4Qj
	cXepOrYTJI37WphKS+hHzoCYdY2FFYMjtm2YGtJMRNGnBisG8voYTxQZVtkFddIjBVhg3qmg1YcYq
	9ibAe/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHj5-00000002uak-3C2b;
	Fri, 09 Jan 2026 19:00:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHj2-00000002uaE-2VDt;
	Fri, 09 Jan 2026 19:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OeweFw3yUXjrRcyiy2cr3jMXmJJei7ulqdxDcunsWNk=; b=NKlO+Yr+9H5IHftz7yq17xYjze
	1V/k3oO6vssk9e6UPN/t+W5R+d5HhBViDw5o2QDzbVwTqG1H8SS9dQDNR6tEFlGC0AqAKQd5O3U2S
	Cy0Q+q8WYkcZg/Hglpu4Fj4WCv+YmkDKtIiJneKxADsbBYE77MdVoP4xgEK/vTh6hqXH+o+2fCiVY
	qLtLLH5y9E5B0meVXB1wFaqhdcd2mWo4wNVr/AGKzjs6XahWRQ/iwsb0RSiCgfVR0xZc9EfMQS/Nk
	QaZD8DGZQqO5V/siiMsLahLQChTLm8DoGfnGCAZ39q0l2eB/zqob5NQ3n9EtNDAMpa29igzz2ys7x
	A5pi1cZw==;
Received: from [192.76.154.238] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veHim-001fb6-87; Fri, 09 Jan 2026 20:00:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Wu <david.wu@rock-chips.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: rockchip-dwmac: Allow "dma-coherent"
Date: Fri, 09 Jan 2026 20:00:28 +0100
Message-ID: <8189811.4vTCxPXJkl@phil>
In-Reply-To: <20260108225318.1325114-2-robh@kernel.org>
References: <20260108225318.1325114-2-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_110044_681400_D8AEC582 
X-CRM114-Status: GOOD (  13.55  )
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

Am Donnerstag, 8. Januar 2026, 23:53:18 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Rob Herring (Arm):
> The GMAC is coherent on RK3576, so allow the "dma-coherent" property.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/=
Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index d17112527dab..80c252845349 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -85,6 +85,8 @@ properties:
>          - clk_mac_refout
>          - clk_mac_speed
> =20
> +  dma-coherent: true
> +
>    clock_in_out:
>      description:
>        For RGMII, it must be "input", means main clock(125MHz)
>=20





