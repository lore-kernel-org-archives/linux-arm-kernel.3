Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB2CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzsDWOOYvpaUy8TXIH2yV7CTdJ93Ilwd3B4S+TiEyrU=; b=t3WTjA4MPvGsfQdym8gzPbP5ES
	06pH7Mbidqb/YfWUzYetbrtbreAyPqE675LGkOHEdLLJq7V0P2q+c5QcIlNwOSsAKvuDnAUZ1h1Gh
	D0BfVvLEmW0C6gCGbv4qw5rHxaEkbIjI1GayDc8Q4hj8nNdYXOcTt2GKE24/hksr42Rcvl3I2UTJA
	2Kk0AVHObkkPXxyXX3c7R26yH/gOSDYk2sCGN2jtqgsQcsnMOvpwzMN/mHdfaz6UIVpeJlbLAA1dn
	lDSb/CluPD4YVGlckoHQHMbRSkyaj0C+HpwEUB4J+ta3A8BJBWK80sVfu5ITUEIihqaMDWkVz1+P/
	kNs/qedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwJ1-0000000FSwj-1aQs;
	Mon, 18 May 2026 11:38:43 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwIy-0000000FSw0-3cRe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104318;
	bh=nzsDWOOYvpaUy8TXIH2yV7CTdJ93Ilwd3B4S+TiEyrU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z6pBIkpgVu7nBeQyqo8FXqPA4g6Igx7OajR/dadXsp6OogcgWVhRx4wZ28No1SQTd
	 lRAHCuby8EYWtCq4wI11yf6rNXUpehbiilnIkoZvZzxJwRVh9ep5FcxMPRNBoPYzhU
	 lGFNBMvANxjU9q+4x7RRYR5IDDStHPDlqYkQ1cuK45Mz4lXVvtLvbVhyTTXAVjlSTS
	 Q/iFw7YKvgq4ZUJSTMMEOSR6sLLDEUiiSwVQUvuaJL5fOxeUGKc1oa5mfcCrSgPt/2
	 Qx2T9cg7QA54QEL3Ot6JZHQJSzWgB7uxD6x8OpWrSLwQdLUVSCuPNRYwCgOOTOVz1H
	 +sCDeIZXrjWBQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B0D66024D;
	Mon, 18 May 2026 19:38:38 +0800 (AWST)
Message-ID: <26a62f67c2aa5fafb019b59893d374047d2f5e70.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/7] ARM: dts: aspeed: system1: Enable video engine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, eajames@linux.ibm.com,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>
Date: Mon, 18 May 2026 21:08:38 +0930
In-Reply-To: <20260421224551.1611818-3-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
	 <20260421224551.1611818-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_043841_093800_9017AB72 
X-CRM114-Status: GOOD (  11.31  )
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

On Tue, 2026-04-21 at 17:45 -0500, Ninad Palsule wrote:
> From: Manojkiran Eda <manojkiran.eda@gmail.com>
>=20
> This patch enables the aspeed video engine support in ASPEED BMC for
> IBM System1. It is crucial for facilitating the BMC's video capture
> and redirection capabilities, which are integral to remote management
> and KVM (Keyboard-Video-Mouse) over IP functionality.

This is a real nitpick, but: The commit message seems a bit too
grandiose for my tastes. Can you make it more succinct? Writing in
imperative mood to avoid "this patch" is generally recommended too:

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

Andrew

>=20
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index 488d0b3916a1..0ca799893791 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -531,6 +531,10 @@ &lpc_snoop {
> =C2=A0	snoop-ports =3D <0x80>, <0x81>;
> =C2=A0};
> =C2=A0
> +&video {
> +	status =3D "okay";
> +};
> +
> =C2=A0&i2c0 {
> =C2=A0	status =3D "okay";
> =C2=A0

