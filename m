Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DE3E77198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 00:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGtf0U2QWath+kQBWiGScXsK40BA3Bpp91eZ5jHTv+o=; b=cIKwN9dXEchvbpIl1vTxxyVoxj
	DbzscpWn9fTqTl4MMdfZwKhxX2+HK4rWdv+GzMjNVfJixls6l1Xar5DHK21s/I+5DHKpZZpYuBQI9
	ZLONY/OpBOJD4+sdIVM/n64mYuTtA6I7And0VjmV3ytQwPN0MYchs1kFZFpplDkstKdWAwXsINJmv
	4dvXRYzYJbM/oE7VVhetyiGxFYVqXoSDxz04o6MhmXk6c+YFgE7EHHAapmZIILGRl+ps9YYWR+28X
	wYwCWLy4XvkhmBVthzGyPSLY9i4DUrJcqF8BJ5G4ncAUN/EtQKwv0KWPUL6ri6JkBvSmEUv1m9MIm
	5mZ1y1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVK3n-00000006dzt-2S2V;
	Wed, 08 Jan 2025 00:36:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVK2a-00000006dti-3DYv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 00:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736296518;
	bh=CGtf0U2QWath+kQBWiGScXsK40BA3Bpp91eZ5jHTv+o=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LWugbcXwyQ2jmJE0FpuMAzMD5WQrpJxWPGSomgMn6vElvDZGGzvzADUdG90a++wCa
	 ti+EOrg14yaVMAFkiLk/FCoTcpMTerokvinOMT/TZuesb+Ukx66Qc2oYOYVCu39wBU
	 7cTWBtpDi6GYuSYp2nPAwiKge9cCPo3pN9LwJY/77pj93i2eRe3Il6Qj5U/6cfUpF3
	 Ns5leRi97JmVr9IiiBTCfBq/g5eqC94V6zKhaPLWmKat+DBDz+Dn90bySdlpm8H+bu
	 SQ9BYe+zoTct0QqFM7azgR6JydzCvf4zuwpeceC9j00oNR+RjcsemHbbICWO0YRb83
	 GZeHxlfd3QwCw==
Received: from [192.168.68.112] (ppp118-210-64-24.adl-adc-lon-bras32.tpg.internode.on.net [118.210.64.24])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 93F8E70801;
	Wed,  8 Jan 2025 08:35:12 +0800 (AWST)
Message-ID: <cf3d472b843eeedcb718013c38612cfb33cd0cdc.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Justin Chen <justin.chen@broadcom.com>, Al
 Cooper <alcooperx@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thierry Reding
 <thierry.reding@gmail.com>,  Jonathan Hunter <jonathanh@nvidia.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
  Florian Fainelli <f.fainelli@gmail.com>, Benjamin Bara
 <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, Ahmad
 Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,  Del Regno
 <angelogioacchino.delregno@collabora.com>, Tianping Fang
 <tianping.fang@mediatek.com>,  Jassi Brar <jaswinder.singh@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Date: Wed, 08 Jan 2025 11:05:11 +1030
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_163521_007555_2B7EC217 
X-CRM114-Status: UNSURE (   9.26  )
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

On Tue, 2025-01-07 at 14:10 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces
> and
> aligned with opening '- |', so correct any differences like 3-spaces
> or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0.../bindings/usb/aspeed,usb-vhub.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 40 +++++++++--------
> --

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed,usb-vhub.ya=
ml

Cheers,

Andrew

