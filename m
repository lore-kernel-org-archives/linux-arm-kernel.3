Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D42DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPLzR8oDPNN23goctM1doHC/4cQsRID+tuEaNIAs+wg=; b=qClLQyNp/hvkpSH28yClJ4ugRK
	RhKveLzReMUBcWRVEe8MXfmOoxrnFTALWOl9s/jgTPMImF12AhSO5b5Sp2BHLYW3X3tHh7OzFwMsg
	4Xgcb2Bhf2DtqzASgLtdhpc3vIIerUuM2KJngmtEOoH9GyhgY1XOHQ/QX4odchNuQrA3NdZ3DkCIh
	HL360cxozXtn8kcUTZqUVhSdqgNxvs9rErorXBHBucsAmbAyDsOIuAZt6fqSUMjkwhi9r1JAQ8RLc
	sSbIhwH8r2sE5f7p8mkRQaNI4uNrqK/Qb5kRThqq6BQ+9pdTPZfn2opGmopHfHMz7z9L3JvWpfRkY
	3gryIVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrZc-0000000ERYJ-26xF;
	Mon, 18 May 2026 06:35:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrZZ-0000000ERXT-31H8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 06:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779086127;
	bh=OPLzR8oDPNN23goctM1doHC/4cQsRID+tuEaNIAs+wg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RImyBGvE1qS7EIaiJ1BCR11W4L35QOSClxXJhV1IEvQbN1ApnxZo+nZitPkxA1/YL
	 XEp9iSRzH18Z00Aw4jK8FjsBf9AVnV/Y5mLoxdzWq/nfooixxNmmQoCy3IwcX9D+Wx
	 Dy5xBMrGFPBFlYImFB5wbNNCpqvBHA4oqUoVQ1QxGulrNGm2vxEIoTHNFTcHnurFg5
	 pX4lg+nZvR9GuWdcLrrvAGRMA1pIel2mpfyQhMfUxmpo551ZBWjsYpkEgEGqfUpcVj
	 4YKGDhwy4GPzuUy0lALTSdqsv8VLPvACasEZVATVX4ySRPj37K7LtOZJXaYZ+FJjxZ
	 r7Dvh98rkbHhw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DC8786025D;
	Mon, 18 May 2026 14:35:24 +0800 (AWST)
Message-ID: <5947248c99e14e59f10b707e7ba523985c7d875f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: msx4: enable BMC networking via
 MAC0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ender Hsieh <andhsieh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Lunn
	 <andrew@lunn.ch>, Marc Olberding <molberding@nvidia.com>, Jacky Chou
	 <jacky_chou@aspeedtech.com>
Date: Mon, 18 May 2026 16:05:23 +0930
In-Reply-To: <20260505050541.3031447-2-andhsieh@nvidia.com>
References: <20260505050541.3031447-1-andhsieh@nvidia.com>
	 <20260505050541.3031447-2-andhsieh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_233529_964050_C6B2D88D 
X-CRM114-Status: GOOD (  13.05  )
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

On Tue, 2026-05-05 at 14:05 +0900, Ender Hsieh wrote:
> Add &mac0, &mdio3, and the ethphy3 PHY node to enable BMC networking
> on the AST2600-based NVIDIA MSX4 board. The PHY is attached to MDIO3
> at address 2 and uses RGMII with PHY-internal delays.
>=20
> These nodes were intentionally omitted in commit f28674fab34f ("ARM:
> dts: aspeed: Add NVIDIA MSX4 HPM") at Andrew Lunn's request, pending
> clarification of the RGMII delay handling. Following his guidance on
> linux-aspeed, the bootloader has been modified to stop enabling MAC
> clock delays on the SoC side, so phy-mode =3D "rgmii-id" correctly
> results in the PHY adding the required ~2ns delay without any
> double-delay from the MAC controller.
>=20
> The corresponding U-Boot change has been submitted to openbmc/u-boot.
>=20
> Link: https://patch.msgid.link/eac09481-0ba1-4ac2-ad8c-d859822ff0d5@lunn.=
ch
> Link: https://patch.msgid.link/20260504044702.2613879-1-andhsieh@nvidia.c=
om
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Marc Olberding <molberding@nvidia.com>
> Signed-off-by: Ender Hsieh <andhsieh@nvidia.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15 +++++++++++++++
> =C2=A01 file changed, 15 insertions(+)
>=20

I've applied this to the BMC tree. I've also applied the linked u-boot
patch to openbmc/u-boot, and backported this change to openbmc/linux.

Cheers,

Andrew

