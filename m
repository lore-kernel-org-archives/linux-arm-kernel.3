Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8770AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78d47LZjOq+9d/w2OOIhVdsOPI+KnThJQSkHOXTAS5U=; b=JD+UbAHjME8KCrtnGJ3mqr3Mqc
	cJ+asyICf3o2ktbDmsgkET+H9FYqRcYVesOwVmM4CIOYP6RJET8KvbHL3H8V9mFTUj91pr5nZTLRN
	k2Duw+/UfHrLiFsiPn2zcbIsSLsX7wh7zDTPVsgn3e8pKwPBAKZJhW4NzPBCc/2CTTLENCenk2gZv
	dgLR0TkzGJsa5VpfTXbTc58l1UAypb4iahPrnTprVXB8v8EL7zroXP8HJE/UakD84+ZfGEs+96rha
	PI4p1DCGuy2yNsXTSgi1zST1md8YkEUDSn+neJzuLz02WUtDhep39ZFfAXmzeWHBldW6LER//Xxy0
	8xooeEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7OC-00000009XJW-2UwS;
	Mon, 16 Dec 2024 09:27:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7N7-00000009X9k-1vta;
	Mon, 16 Dec 2024 09:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB957A40DE8;
	Mon, 16 Dec 2024 09:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A707DC4CED0;
	Mon, 16 Dec 2024 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734341196;
	bh=AH8G7X2hBjteL80emlIx2HkMUhq8o72V7loxAGG14fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+wi8k04KRi2PiKyun7RzEs0cgkcKZA3C/60OlT3C8fYH++hljJ1pkaYgs37vFhfo
	 uDmimYXhcGc3KC7WQ5ZhrkKI3Dm4eeNaQxWk3GUoxmWNOsrxYVNyF/Y6iC+KAhdttW
	 OooNVw/VRRiTbp42FKRdN1FPNmAYYqCSd/6u9miMbDR5+fa97n+uKN3Zsx/i4YPPhz
	 RvNggu4qu+7PPC0R/XR/u14v+WmBGqfVJsFRZ1sIzvFuJShN2KGPVojdFG+j9J100P
	 GAq8DlA7Ehl0Sa1j1Hh1yTpWF5orr8TOQXfbctqzZ0M9zhOX4KiW4RQyJDKAyn+Fja
	 A+BmJ3Rpcc3Ag==
Date: Mon, 16 Dec 2024 10:26:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, heiko@sntech.de, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: add header for PCA9555 GPIO
 extender bindings on some Rockchip-based devices
Message-ID: <upc5ctukw3vyxjda7fmpjsqttu4w6vj7hm7vpuezzwytotpi5w@eahfui4kc3nj>
References: <20241215032507.4739-1-shimrrashai@gmail.com>
 <20241215032507.4739-3-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241215032507.4739-3-shimrrashai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_012637_564940_9499117B 
X-CRM114-Status: GOOD (  22.49  )
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

On Sat, Dec 14, 2024 at 09:24:54PM -0600, Shimrra Shai wrote:
> It seemed a bit disputed whether this was actually necessary, but I am
> including it nonetheless. It makes it slightly clearer how the pins on the
> PCA9555 GPIO extender used on the board are actuated than would be evident
> from the numbers alone, since according to the spec sheets for it by NXP:
>=20
> https://www.nxp.com/docs/en/data-sheet/PCA9555.pdf
>=20
> there are two banks of controllable pins, IO0 and IO1, which are labeled
> equivalently to the labels provided below.
>=20
> Also sorry @Heiko St=C3=BCbner for adding your name on it; I had cut this=
 off a
> BSP source file that was longer. Since this file contains only this
> isolated section, which was written by someone else, I put their authorsh=
ip
> on it instead. Unfortunately I do not know who "daijh" is, only that they
> used that handle on GitLab to submit this code piece and I got the
> indicated email address.
>=20
> Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
> ---
>  .../dt-bindings/pinctrl/rockchip-pca9555.h    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/rockchip-pca9555.h
>=20
> diff --git a/include/dt-bindings/pinctrl/rockchip-pca9555.h b/include/dt-=
bindings/pinctrl/rockchip-pca9555.h
> new file mode 100644
> index 000000000..21ca99488
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/rockchip-pca9555.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Bindings for the PCA9555 GPIO extender used on some Rockchip devices,=
 e.g.
> + * Firefly.
> + *
> + * Copyright (C) 2022 Zhongshan Tianqi Intelligent Technology Co., Ltd.
> + * Authors: daijh <djh@t-chip.com.cn>
> + *          Shimrra Shai <shimrrashai@gmail.com>
> + */
> +
> +#ifndef __ROCKCHIP_PCA9555_H__
> +#define __ROCKCHIP_PCA9555_H__
> +
> +#define PCA_IO0_0          0

1. There is no user of these bindings.
2. It's meaningless to map 0 to 0...

Drop entire patch.

Best regards,
Krzysztof


