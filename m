Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34903CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 04:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErEcB/qyD7QsiTGNF9CSiehZrNAUsr2NNSV13bbmFB8=; b=BRIbOFWxBkjmUZgL9a+SDhPhyA
	LmR6LvthfokYy+RFFGdjoJbhqTChDOfb3KTOH6D2X45E1i5ZgymxL+OJ3LrAGbdRKRIyMriKq7k3i
	t4KVVilwIMcFD5R3WFwmgFJfg9r3XbKlWqL/7Kx47OkdhZrhSgey6z8Q5z1EpmmptZxPoGa0Wk4pT
	ytN53HWKim+7CYUgjbCwYvawPw94iD2PdQVran5Y4MEQH935L9CWhnZJQuDnM4WYTBAXyiS2Fmu+j
	sXjEycZaFa22wVy4V8bE7SZ+sc+YZB9KMaoIdMm1tcMYsk/OZekpwgSiVyb1Z0vKujDJ3L3A6vNqw
	z4IUIEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOR9-0000000B53N-0vJX;
	Mon, 24 Nov 2025 04:44:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOR6-0000000B52t-0BdK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 04:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763959462;
	bh=ErEcB/qyD7QsiTGNF9CSiehZrNAUsr2NNSV13bbmFB8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NfOkLKJ9+KaqsHnZz4BA472PHttN4fhTp0lzqpmLD3f2LiHNL0a8eBA7jU2bGuhve
	 77H0vsNtq3RC/SLBwwshj+HzzPieq17dlfn57Ddq0MOcxfAB6Fxf92PhUdXw3oi7y7
	 BOqrossQs9ah0Xgf4hCTzzDqZdu4S+ExzENq88OjAvmdeg1HVcBnQhFi/R62PVeDjw
	 I5whS1LNAETonXmmeheD+8nNmi+U+rpKDRpjf8KPpsiCv9sAoSMNACLnUhD0AWcd7D
	 qtvSKPGNkPEi9qT31pTBLbKv+B2kpbtLiSlzvXelDDVL+Cy30LhpNop+cxhOiJ61W+
	 pHKlgP20xTFfw==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 75BD97BE0E;
	Mon, 24 Nov 2025 12:44:21 +0800 (AWST)
Message-ID: <74b9c09cebac1de0e6e2e712a1374ab5294f61d8.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: yosemite5: Rename sgpio
 P0_I3C_APML_ALERT_L
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Nov 2025 15:14:21 +1030
In-Reply-To: <20251118-yv5_revise_dts-v1-3-fcd6b44b4497@gmail.com>
References: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
	 <20251118-yv5_revise_dts-v1-3-fcd6b44b4497@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_204424_280191_2563D4BF 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, 2025-11-18 at 18:53 +0800, Kevin Tung wrote:
> Rename P0_I3C_APML_ALERT_L to FM_APML_CPU_ALERT_N for clarity.

Are user space components looking for these names? Will updating the
devicetree break older applications? I'd like to see more discussion of
these problems in the commit message.

Cheers,

Andrew

>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 45b8ac2e8c65a4f672e64571631b7f6944f26213..060757b7211a6da777c51d9f0=
c886796cf2450a4 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -964,7 +964,7 @@ &sgpiom0 {
> =C2=A0	"FAULT_P3V3_NIC_N","",
> =C2=A0	"FAULT_P12V_NIC_N","",
> =C2=A0	"FAULT_P12V_SCM_N","",
> -	"P0_I3C_APML_ALERT_L","",
> +	"FM_APML_CPU_ALERT_N","",
> =C2=A0	"ALERT_INLET_TEMP_N","",
> =C2=A0	"FM_CPU_PROCHOT_R_N","",
> =C2=A0	"FM_CPU_THERMTRIP_N","",

