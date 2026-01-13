Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15093D29DFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ylbTK+s07aeU0l2xyJb3WSMSQ84x36el2OEjXIsKPs=; b=HjzJfWSQ3+37NIyOSGu0+v2SRH
	2frowAEfhDynJ91f6URAceeMeaXuoRNq30/dZR6mscdiMG/IHnW5xf01WRTHbXY34P2+lnp+2o/Hz
	EBaibrw4YMIxpvT3maBwe8VVVYpbRwZHdkV1M1IYr7UdcoBkUnuenoM2mLOvtvJaK37NmA63GB67m
	8fJwODZ6Nc6Yun/Mq4IxkVXXbsM152Jc+Vohn456TLmGM57vLZ3awTLaAUWAno6Y25x3KRRQpuRJF
	0gG3hMJXuYsFx9xxYSszhTco93yn5lnqlkM930Cg/Ojj1wruuOzpcQ+rb3KZX+evEBTyIClXmxVGH
	0YEJPyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbYt-00000006tni-08ua;
	Tue, 13 Jan 2026 10:23:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbYq-00000006tmq-0rfc;
	Tue, 13 Jan 2026 10:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6ylbTK+s07aeU0l2xyJb3WSMSQ84x36el2OEjXIsKPs=; b=1hNETfxyp9S74G3V6/h4ziny6j
	C8e9NIl9LUIJaNkw6aOE8o+SxQJ8J6BRGZELlgT/3PQIpN0Ke3FGfNAR76cuJIiguJseulWU0dviK
	RI+9VIhMF/rFfw67LoxJm48zfdi57d6wdW4eS6zqGAoq5AIhTP55VmA0geP2eiE6vbc2djA5QjpgA
	34UMSos08JFkBbB+5Fp3t0I9yKMurXk0fC/iuHWJrlCPzZYBmnli/g2yXJVHE9o3FWM5hUKhFv28S
	vLEnHGS/nqy12O7DM1MWg5r/1mLqqlv3q2qv6molfxoYwUeg4LO3IpKidKQmpH3yWDUkiEuBB0Q7v
	ca7wudCA==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfbYj-0025LV-LC; Tue, 13 Jan 2026 11:23:34 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 guptarud@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>,
 Kamil =?UTF-8?B?VHJ6Y2nFhHNraQ==?= <ayufan@ayufan.eu>,
 Martijn Braam <martijn@brixit.nl>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 2/3] mfd: rk8xx-core: Configure `rk808-clkout2` function
Date: Tue, 13 Jan 2026 11:23:31 +0100
Message-ID: <2159404.K71DO8KEF6@diego>
In-Reply-To: <20260112-ppp_connectivity-v1-2-284d6e83b212@gmail.com>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
 <20260112-ppp_connectivity-v1-2-284d6e83b212@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_022340_267159_1B3A431D 
X-CRM114-Status: GOOD (  15.74  )
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

Hi,

Am Dienstag, 13. Januar 2026, 07:42:25 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Rudraksha Gupta via B4 Relay:
> From: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
>=20
> While the Wifi and Bluetooth chip are defined in the Pinephone Pro's
> DTS, it actually isn't able to be used. Let's define rk808-clkout2 so
> that userspace can actually interact with Wifi and Bluetooth

Needs of one special device don't really justify changing core drivers.
So this commit message definitly needs a more general description on
why this is needed.

> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  drivers/mfd/rk8xx-core.c  | 1 +
>  include/linux/mfd/rk808.h | 2 ++
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index def4587fdfb8..602218694334 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -282,6 +282,7 @@ static const struct rk808_reg_data rk818_pre_init_reg=
[] =3D {
>  	{ RK818_H5V_EN_REG,	  BIT(0),	    RK818_H5V_EN },
>  	{ RK808_VB_MON_REG,	  MASK_ALL,	    VB_LO_ACT |
>  						    VB_LO_SEL_3500MV },
> +	{ RK808_CLK32OUT_REG, CLK32KOUT2_FUNC_MASK, CLK32KOUT2_FUNC },

So now you're unconditionally enabling this clock output, without anybody
being able to turn it off again?

Please look at drivers/clk/clk-rk808.c and adapt it to handle the rk8xx
variants, as that provides a real clock driver that your wifi node can
use.


Heiko



