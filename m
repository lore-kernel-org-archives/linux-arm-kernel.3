Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35528C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEfLjsMWOcY/1xx1MExuBedf8lJgAMiB/kQuvYjhW5Y=; b=WMgYrl5/GSqEHJsx4TH+2bPAZ4
	hiV7CYm31LFIfwToO/mEETAQFc/XLf5ZneJLpuha0D48fUz6vKijHApHernHb9VurxCwyQVoM/8Lb
	Mwo6TIYq/k2tXd7I+f7CvbP9eBM0vE7SDTSXCDLgzXZ6b6TqR1y77lH7bcMUou2mCyuZ8hD3R/7sV
	hMt30dxtTzOgH5PLAyBwi55KR2m1fvvZkhqhK2ktSwUE1zOm/KogNwEPyh0f1cVAhtwaVOHL4hYpr
	QPN5safrnF0BiPNNfCa0vjF14gdQBxIbErGgARMY7airC8XQdKkHJ+p9IwdENt2V3gGsGbMCaQxqj
	art7iMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdVn-0000000Cfm4-0UMt;
	Thu, 12 Jun 2025 08:42:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcnC-0000000CWkG-3YkQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749714968;
	bh=wEfLjsMWOcY/1xx1MExuBedf8lJgAMiB/kQuvYjhW5Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OrgM7fk2giHneU0ZGmbu6sAUqh0o40hFWABuR8jC1UoQ6AMuK23qacFbdtW1PKj96
	 J0bXtMXgXsKDTVzDwKYXcEhpLrP50g+ShbQsfkkMxa8o0+MRQA30dyAUdwx5bV5urY
	 IEf9R48l50xXY7Sq8MyhKVgJFvd+e9IX2URjPXiU2FW5dMGPcsyhi1gppru8foPSMR
	 cs/Lw/ZYLYUKVpgXJzzimXU+faACgixnOiAMf3b7c3eCIs4mUssVDrJARPgkLRM5H8
	 biL1kpIltutmH3L2Qlyg4zbS7rHVSEFfcQ2dPEqyRAWfNJ8dI9lzlc3lU4jQ4xLde/
	 K8HF2RX7ivetQ==
Received: from [IPv6:2405:6e00:2427:47f7:b08d:7091:d46e:c806] (unknown [120.20.31.221])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EC56B65F91;
	Thu, 12 Jun 2025 15:56:04 +0800 (AWST)
Message-ID: <67c89ca729669f55e2659ad8070a154c59ef83db.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/1] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200 UT3.0b platform BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Donald Shannon <donalds@nvidia.com>, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org
Cc: joel@jms.id.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, etanous@nvidia.com
Date: Thu, 12 Jun 2025 17:26:03 +0930
In-Reply-To: <20250611013025.2898412-2-donalds@nvidia.com>
References: <20250611013025.2898412-1-donalds@nvidia.com>
	 <20250611013025.2898412-2-donalds@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_005611_076969_A556F664 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Donald,

In addition to addressing Krzysztof's comments regarding checkpatch:

On Tue, 2025-06-10 at 18:30 -0700, Donald Shannon wrote:
> The GB200NVL UT3.0b BMC is an Aspeed Ast2600 based BMC
> for Nvidia Blackwell GB200NVL platform.

Can you add some words contrasting this platform to the one submitted
by Willie?

https://lore.kernel.org/all/20250401153955.314860-3-wthai@nvidia.com/


> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
>=20
> Link: https://www.aspeedtech.com/server_ast2600/=C2=A0[1]
> Link:
> https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703=C2=A0[2]
>=20

Please omit the blank line here so the Link: tags are part of the
trailer.

> Signed-off-by: Donald Shannon <donalds@nvidia.com>
> ---
> Changes v1 -> v2:
> =C2=A0 - Changed phy-mode to rgmii-id [Lunn]
> =C2=A0 - Removed redundant max-speed for mac0 [Lunn]
> =C2=A0 - Fixed typo from gb200nvl to gb200 in Makefile
> Changes v2 -> v3:
> =C2=A0 - Fixed whitespace issues [Krzysztof]
> =C2=A0 - Fixed schema validation issues from my end ( there are still
> issues with the aspeed dtsi file that are not related to this new
> dts) [Herring]
> =C2=A0 - Reordered to follow style guide [Krzysztof]
> =C2=A0 - Removed redundant status okays
> =C2=A0 - Changed vcc to vdd for the power gating on the gpio expanders
> Changes v3 -> v4:
> =C2=A0 - Added changelog [Krzysztof]
> =C2=A0 - Added nvidia,gb200-ut30b board binding [Krzysztof]
> =C2=A0 - Removed unused imports
> =C2=A0 - Reordered a couple other style guide violations
> =C2=A0 - Added back in a couple needed "status okay"s
> ---
> =C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts=C2=A0 | 1154
> +++++++++++++++++
> =C2=A03 files changed, 1156 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200=
-
> ut30b.dts
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index a3736f134130..420fabf05b24 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -98,6 +98,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - inventec,starscream-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - inventec,transformer-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - jabil,rbp-bmc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - nvidia,gb200-ut30b

For what it's worth, checkpatch reports at least the following:

   167: WARNING: DT binding docs and includes should be a separate patch. S=
ee: Documentation/devicetree/bindings/submitting-patches.rst
   180: WARNING: added, moved or deleted file(s), does MAINTAINERS need upd=
ating?
   193: WARNING: DT compatible string "nvidia,gb200-ut30b" appears un-docum=
ented -- check ./Documentation/devicetree/bindings/

Thanks,

Andrew

