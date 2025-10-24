Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D754CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCS3u+p5/mBX/+ng03ATa6a8JxRz1+ui4UK+ezTN610=; b=C2uqwlaNUgbi4e3qAs7bnJuRS0
	5Ooko2bj9RBcqASih6jYcLbATkNK1wh7F08RftVpqcpmyP0fqqdcx05tYoQqOSR+RDxAE2zNNeiry
	ex4XNwSLn/SvhNUi//bPdXUzGr47+SLt61l7Jid8szHD8nosmdL9LcxW0DRa2OGrQKRCnMMV1f02m
	H57y+8QWFuo8QF+h01kVnqyi/yLjEQLBJuClGLbrx1mJhc4g640NWaqf16oW4EPpmb0y5NodBP1TG
	HAjjhs9SyvNT0Olq8lWCN7IlEvFLYS+84wJuUuYu8ODMoMYOz3sR65t9/xEUSH9wckVkDERksiNft
	zTYuHsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNLX-0000000AMkf-3dBq;
	Fri, 24 Oct 2025 19:21:07 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNLS-0000000AMkH-44Wq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 19:21:06 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1761333658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pCS3u+p5/mBX/+ng03ATa6a8JxRz1+ui4UK+ezTN610=;
	b=SsLORBQ//u6ocJ1PZbfaCSFlOEa1lQEQISN/T6O5M8v5zAaO8wNToSmTGA8ITDWaGKCn+h
	q5bH5cBBlrinNwDIo6go56m9JI/JdcNHj5ZVFTxIaihBCyoZBXDdGpur+ZyheGWtVZWum7
	/FvAlHrmPVvM7blAbflY76Ig7XXIl0z5/d7WTIoh+xEt4ND+JKbbGYVZj81sfxzVToGFzW
	9rkwwVLEkSPiZpsC9ioZ0bghwtPBeXVU8LOgBpHCLPpl4PMVw5kWNuv4m9dBytuct258YW
	cXKx2G/zhKG/1dO7QBuyLcl50TEzPN+SxJ9eYv+NLdwTO3Aabo+eyXgYRpRX+w==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 21:20:45 +0200
Message-Id: <DDQSO2HR1BFU.2JONNHRBR0LR5@cknow-tech.com>
Cc: "Heiko Stuebner" <heiko@sntech.de>, "Shawn Lin"
 <shawn.lin@rock-chips.com>, "Kever Yang" <kever.yang@rock-chips.com>,
 "Chukun Pan" <amadeus@jmu.edu.cn>, "Alexander Shiyan"
 <eagle.alexander923@gmail.com>, <kernel@collabora.com>, "Dragan Simic"
 <dsimic@manjaro.org>, "Rob Herring" <robh@kernel.org>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, <linux-rockchip@lists.infradead.org>,
 <devicetree@vger.kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Damon
 Ding" <damon.ding@rock-chips.com>, "Chris Morgan"
 <macromorgan@hotmail.com>, <linux-arm-kernel@lists.infradead.org>, "Patrick
 Wildt" <patrick@blueri.se>, "Alexey Charkov" <alchark@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Tomeu Vizoso" <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add vdpu 381 and 383 nodes
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
References: <20251020212009.8852-1-detlev.casanova@collabora.com>
In-Reply-To: <20251020212009.8852-1-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_122103_489586_0650E35F 
X-CRM114-Status: GOOD (  17.36  )
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

Hi Detlev,

On Mon Oct 20, 2025 at 11:20 PM CEST, Detlev Casanova wrote:
> Add the nodes for vdpu 381 and 383, respectively RK3588 and RK3576.
> To keep compatibility with older variants, the reg ranges order is not
> in register order so that the function reg range is kept first.

This is a great comment, which I'd have preferred to have seen in the
commit messages themselves.

Especially since I'm getting DTB validation warnings:

  DTC [C] arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb
arch/arm64/boot/dts/rockchip/rk3576.dtsi:1292.30-1314.5: Warning (simple_bu=
s_reg):
/soc/video-codec@27b00000: simple-bus unit address format error, expected "=
27b00100"
  DTC [C] arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb
arch/arm64/boot/dts/rockchip/rk3576.dtsi:1292.30-1314.5: Warning (simple_bu=
s_reg):
/soc/video-codec@27b00000: simple-bus unit address format error, expected "=
27b00100"


For some reason I'm not getting that for rk3588, which I need to
investigate further. Technically, I ran my DTB validation script on your
'add-vdpu381-and-383-to-rkvdec-v3-on-next' branch, but I don't see how
that would/could change the outcome.

My validation script does essentially this:
``make CHECK_DTBS=3Dy W=3D1 $(get_my_dtbs)``

('get_my_dtbs' returns a list of dtb files I want to check)

So it looks like the DTB validation tool is not happy that the
reg ranges are not sorted in 'proper' order.

Note that the ``W=3D1`` is essential to see the warning, it does not show
up when ``W=3D0`` is used.
I'll leave it up to you and the maintainers to judge whether this is
problematic or not, but wanted to mention it.

Cheers,
  Diederik

> Also adds the corresponding iommu nodes.
>
> Note that on RK3588, both cores are added as it represents the hardware,
> but the driver, later will only register the first one.
>
> Regards,
> Detlev.
>
> Changes since v2:
>  - Set the correct IRQ number for the second rk3588 core
>
> Changes since v1:
>  - Set node name to match first reg range
>
> Detlev Casanova (2):
>   arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
>   arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
>
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 36 +++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
>  2 files changed, 110 insertions(+)


