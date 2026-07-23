Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6071C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CNvGj7dz891iLVwt7dBaj1OEv/TlmZnFAcX0NW2E2s=; b=m4hZeIPwjYhxKVoiv+9+mciP9g
	1AQCD+z6nO0DpdLeNFOSx8OFcZLusKiaEbVWdwuphVXPvXEolgMNe0q/wduzfdnbMCsmWl3vshDN9
	3wYPWZQdHmZHm6mZOo6b9pNTphOSjti7xAfwrQwWpN1XDvWQTDJbJdgwbCoFiPlCnt2x5922Enzqv
	qRgUuiXKfPyxDI6z/Mh3NEronoCulEtBhim8OORNb2VqZF/VJtolSnxMVZ/4xr2rFMoL0JKgHJ7Ye
	4228hoOQBBTF+Mi1VvVXyHrKPgBDXzJ6/99KwUBV68jVYjVA+NeqKylOZWdJ0BvfFqCJPncT/rZ9E
	ZZdlG27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkoP-0000000DNex-3mTj;
	Thu, 23 Jul 2026 04:13:33 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkoN-0000000DNdk-2A6b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784780003;
	bh=1CNvGj7dz891iLVwt7dBaj1OEv/TlmZnFAcX0NW2E2s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E+XH9OXP/w2dxS8B/KIVBxE36CT1gB6cvXTlb9xoXFDorIlXxfB5A9CiOg2E8TY2/
	 0vJaoMwSwVefDlf2t/b23LkdA5420QSR8v3AnhdxI/6djGdOaySel88Z3w/9cTPwce
	 WN3GciiG88uDC0NM9fHdFdnh89x+UVxuYeCiJq2qOFLtpvJ8+NnCoaMFYveReLOvdd
	 loe383NY4q+pIHEDmqpAKq03RrP+AaBatzLpFV8b8lzcb59Ph4bcdkxSmWh3PrYAx+
	 Viq8vzMA/lANaFmLa03sjl7hqCBNZN7YgoG2jUQRuXsgEoziPdZgSGJiXC3hEIbTKr
	 AKErYsmUxS/HQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 47054662E1;
	Thu, 23 Jul 2026 12:13:22 +0800 (AWST)
Message-ID: <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
	joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corey@minyard.net, devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org,
 	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 13:43:21 +0930
In-Reply-To: <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
	 <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_211331_752304_7D2C294B 
X-CRM114-Status: GOOD (  14.52  )
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

On Wed, 2026-07-22 at 15:11 +0000, Gr=C3=A9goire Layet wrote:
> Add pcie_kcs4 node to the LPC bus in the ast2600 g6 common dtsi.
>=20
> The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
> interface on channel 4. This is a fully KCS-compatible interface
> that is exposed over PCIe.
>=20
> This can be used by the host for IPMI when the PCIe BMC Device is
> activated.
>=20
> While the datasheet provides interrupt numbers for KCS channels 1, 2,
> 3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
> section. Since only the KCS channel 4 is described, only this channel is
> added.
>=20
> The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
> standard KCS interface.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..a93fa4cf5d8f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -617,6 +617,13 @@ kcs4: kcs@114 {
> =C2=A0					status =3D "disabled";
> =C2=A0				};
> =C2=A0
> +				pcie_kcs4: kcs@914 {

Nodes need to be ordered by ascending address:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-=
nodes

Note that we now have scripts/dtc/dt-check-style which can help catch
such issues.

Andrew

