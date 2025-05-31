Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0244CC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QvtLNBteUL/eoLfwenUJUkU6N99pIrssBMZcazvFXE=; b=F1EncbpPsUp/OMPcsDbdtuQfB/
	NNGwL7CHdOx0VGQngHSEVsIn5kDRgGH67qkrm6uYS9PUNYED6aysF106lIrii/fxAxpk6MaTLvuAO
	q8PcCaF6utd5fpCj2uwEc2pnx28hHPPRcCjwtS8L47oT98QKPo1E0aR4ofkLPl3AjYiW/rVzT6WRB
	cdmipUkvwbREIAYMcqBzyw1I7w8dx3wxnmusAZMBh1jqcbai7Ct+/jRM0OJJenv29EoQ6eAadnI+j
	+DEf0xXF8Qi/fLUe8gSMdMexFYPr054RceCfmkc5huJHC183734riD1Iqpt4zrV2H2zriZQ7lMWFD
	ooL/oupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLLqJ-00000003lCv-2pF0;
	Sat, 31 May 2025 13:01:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLLoB-00000003l70-1Gba;
	Sat, 31 May 2025 12:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/QvtLNBteUL/eoLfwenUJUkU6N99pIrssBMZcazvFXE=; b=qhj/8mZElYbDGGnYnH5ZkSah2m
	r+HVjvfjaV4NJVyvl05yBCjwXMsUNBkYXAC3g6ou8vEpMRh1a03Dw1kNzLw9/5CFnSCMEX2ETxzuR
	xFKMKrhOpPeydmV2oe0ocsYfUVcw/obPOpOzCU8V8mm/eXfhWRCUDW85qieblAwRtv1Cit1jy9Fz2
	Pu6U6b5oOZOKsQrGVV9jfra5Vdvqu2CkyjqEA1kPCPsZCZ0g9I/Xz7pvNho9FjRo5k8psmadmS/wO
	260bSocfh4be5JXcffZpDDoS/Y984BBAN64KBxnfDYemIwh5yW3Q/OlYme6CxFPVBuusLoh9uvGXh
	dnihS9qg==;
Received: from i53875a3e.versanet.de ([83.135.90.62] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uLLo0-0002Xd-EM; Sat, 31 May 2025 14:59:20 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: rockchip: increase max amount of device
 functions
Date: Sat, 31 May 2025 14:59:17 +0200
Message-ID: <23957563.6Emhk5qWAg@diego>
In-Reply-To: <20250408-rk3576-pwm-v1-1-a49286c2ca8e@collabora.com>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
 <20250408-rk3576-pwm-v1-1-a49286c2ca8e@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_055931_364012_1A234CFE 
X-CRM114-Status: GOOD (  11.20  )
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

Am Dienstag, 8. April 2025, 14:32:13 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> With the introduction of the RK3576, the maximum device function ID used
> increased to 14, as anyone can easily verify for themselves with:
>=20
>   rg -g '*-pinctrl.dtsi' '<\d+\s+RK_P..\s+(?<func>\d+)\s.*>;$' --trim \
>   -NI -r '$func' arch/arm64/boot/dts/rockchip/ | sort -g | uniq
>=20
> Unfortunately, this wasn't caught by dt-validate as those pins are
> omit-if-no-ref and we had no reference to them in any tree so far.
>=20
> Once again kick the can down the road by increasing the limit to 14.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



