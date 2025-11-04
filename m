Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59407CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjgsfMkrLaZXeX2KsYSs/abzxMl8bXYbsXOSIwq34Qk=; b=zWxiZrbXmYCW/Qu6vsKDdMKyOU
	Z2oV6bauIMOBSiOmk+fuUtrospT5n9dOk5Dr1grcUOKxMRfOY310dvGnEv5RDlx+JArlEJhgGLAIG
	w7Z8L3PB4Ckqie28Df49PVz57jnlqb9sxyov98JaT4/RHg2VuDisVBd7qWt5d0EdmglsNrkZ1fyMQ
	NlDAssRik9+Idyav4yzWOahqAAACapylQyiWiAfwJ3AReSyU7uBse8/t/8GN1Gj8tNstwOnXcPBem
	4iiz+Yons4H7S0cfDAcNYsqh3sFpdzXhMPEK7FMrlgQNIDPk9x2zi4WNi0nZ94dv/H/c2E/4Y+N24
	zEocWNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEVN-0000000BdHI-0sKY;
	Tue, 04 Nov 2025 10:43:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEVL-0000000BdGd-2b24;
	Tue, 04 Nov 2025 10:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XjgsfMkrLaZXeX2KsYSs/abzxMl8bXYbsXOSIwq34Qk=; b=PAi+h2Ejyq4PpTkpTOO9TwDrvk
	hkAhoy2Oz8VEBgy1YcJ7fqmqV6aPcONiQ70PhnC9z+f6W7MdFesbfVJCoRBJzXKVP7RpayOo4qyZB
	qzdazj0fw5USxNsk3fwetilyjkhAY+nuTW1JTnEFsM909zdVYuIFGDzltIiYZQKNDNEFsEfWozAkc
	6kj9jiyMuegVsPBHePsQlTieq/91B2JZSZFdgxHr7LMUvtA+cos9iPGTIvvrDIgAHH8CCYekQOrm+
	uZ4AX5utJy6ylo6frILGyuZLFUScACdr71z7QHjzWBX+1lyFQPJxrxMCmZy8v9CBNq8pJWyB49n/6
	jS3jrGJA==;
Received: from i53875aae.versanet.de ([83.135.90.174] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vGEVG-000405-Au; Tue, 04 Nov 2025 11:43:06 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
Subject: Re: [PATCH v1 1/3] dt-bindings: pinctrl: Add rk3506 pinctrl support
Date: Tue, 04 Nov 2025 11:43:03 +0100
Message-ID: <3705122.LM0AJKV5NW@diego>
In-Reply-To: <20251104021223.2375116-2-ye.zhang@rock-chips.com>
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
 <20251104021223.2375116-2-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_024311_701510_CA0D22DC 
X-CRM114-Status: UNSURE (   8.60  )
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

Am Dienstag, 4. November 2025, 03:12:21 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Ye Zhang:
> Add the compatible string for the rk3506 SoC.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




