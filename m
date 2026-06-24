Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F5CCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO0hgqE9Avytw8qlzJRPWePoOJiVJlIHiSjn9i+FEbY=; b=QNArcjE1Xu8uAzdeBQQtWhFDYA
	mAXZt3CJYn+MxRFg0rfaG0SbmL2+TeYfIldRzVPa9fQxKLmQYFBbXezAxzm0b+n3QbIW6LyAgp1f1
	5XAE8JOmx7lUSh4j/ImHaZaUQiiDl7xQ2xT5MqxJKw1CrfMJQHsdKe49Q5QP5+XZLp2d9ysNtVToF
	CWbE4HWuTah7IzELQQAN3XxMJW2FBtS4Fz0/oYmtCtL+z8fhT8XUVAuEKF/ofrQeyNIpyrmkWM/Zc
	7l72WApCKUB3znP2lHEpdF7QNjCneYKcfeYfuurDMRKhLEc8AcrGc+AdNYDIuo/o+8VR+nuyGFpdS
	YW2rgVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM7g-00000007i5u-0sCv;
	Wed, 24 Jun 2026 11:50:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM7e-00000007i5B-1Q6a;
	Wed, 24 Jun 2026 11:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lO0hgqE9Avytw8qlzJRPWePoOJiVJlIHiSjn9i+FEbY=; b=JS+xJ88sBGk93oWMEscysoluuC
	658s0tG+Eb4BXXO3akz+agVe/Jt+aXOYv2fXFLbrdICbc+MuROfcLS3A/nh3BBKYkgEuDGb/WFDDG
	PATyEu5Fnzn8oWGgZvdczD+JRj5myMae9Mz66E4XTxUE0lXwVL3nqes7544YKUN3wgh/pKysIX99R
	7ev3OruvWpvTIqHLBkN90QmQTLzqyml9JRnFcPZfbWaUew/Y+KcMHuaGTPre8O7357Rj9QJjcsBO/
	3cvZJbi+WdsmL5vQiofJInlGVAc7GDPseiPSKDh2HyhsipnxgugUCx642Gpkk+R/qzRwbV4InFP5M
	5TDFFbvg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Wu <david.wu@rock-chips.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yanan He <grumpycat921013@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Yanan He <grumpycat921013@gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: net: rockchip-dwmac: Allow 9 clocks
Date: Wed, 24 Jun 2026 13:50:18 +0200
Message-ID: <3779785.hdfAi7Kttb@diego>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_045026_375091_B1F66E8B 
X-CRM114-Status: GOOD (  14.81  )
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

Am Mittwoch, 24. Juni 2026, 10:44:40 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Yanan He:
> RV1126 has a separate GMAC Ethernet output clock used as the external
> PHY reference clock. This clock is described in addition to the existing
> GMAC clocks.

AS stated in the driver patch, this is the input clock for the phy
and ethernet phys are perfectly capable of handling their input
clocks. See reference in the driver patch.


Heiko


> Signed-off-by: Yanan He <grumpycat921013@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/=
Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 80c252845349..86a7e83675ae 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -71,7 +71,7 @@ properties:
> =20
>    clocks:
>      minItems: 4
> -    maxItems: 8
> +    maxItems: 9
> =20
>    clock-names:
>      contains:
>=20
>=20





