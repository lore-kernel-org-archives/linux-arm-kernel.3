Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A1FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6U4ILFAnnROWvWpXm91/wKuzpauoiAfG10LJOtDhws0=; b=UAb/5Ezf+LlPC698TwHYpM8qhJ
	EVxGRnEgol3UPWwlMyN3OEsvJX6Ir46udxW4p8Uw210VHqq7TgqQnAKhWtC52UtVTAlwzaVRWRkb6
	hkU2GgA6W7f8XTcjlTZ9eKPnCTq2622iBiMrVcahrE6hJE0xeqpipuvwVf7zIxk2uBPAq12c8SCex
	i6lVUJfOmPTkrz+ySV0i6oOBTo2M3OxMH/HlUiWWUybrboetsSEBBb2Xmey3dlx1T5u8zpgAW6jHT
	rQJEDUpy2LG8QbtiEso+Ih+NawlepysuEQPrWpX4Cwoo/bMjvUOn8EYJzDHpYWhg3peER3foaq1yc
	BCDQVVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SxE-0000000Dph0-0DlY;
	Thu, 17 Apr 2025 17:23:12 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Skk-0000000DmrR-0oHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:10:19 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1744909795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6U4ILFAnnROWvWpXm91/wKuzpauoiAfG10LJOtDhws0=;
	b=xRrOkl+qGnYLA+AOqsbB9LjK1LWPYQy1oz8Y+rZWCD7iABshDYz1KUdZGcAdgbdurKya1R
	CmI/fAI+abH5jKptTBlaXXuXzSzy6WA+8jcjmfT+qaoYMFx0A0F2590ib3Hghb/4DXHC1a
	x++yxn2UC73tCT1BpT6bXu0j5HzYItmFsvENg9YCryIlHXRk6Fg7QnpXXpzvYxs6IxVc7W
	c8sXsnDjKc4Bov2fkxDKx03WqPOEpfKUFS6Ak0zhV8nC0c2fEoLWUtuyP4rJPeFaeL0Hlf
	VFVppXokdY6+zL3p+ey2gDqA+uAtsN12AQMFYGmk3QCLVkMdtAfVm2vN+mo5Tg==
Content-Type: multipart/signed;
 boundary=9beec6f5477ababb2ae9d3e4220a4e06ab7f2fafa941ec7e9fa069b1c762;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 17 Apr 2025 19:09:46 +0200
Message-Id: <D992W9V9ZH2J.2Z2OLK00N0FIU@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dragan Simic" <dsimic@manjaro.org>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Niklas Cassel"
 <cassel@kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] PCI: dw-rockchip: Fix function call sequence in
 rockchip_pcie_phy_deinit
References: <20250417142138.1377451-1-didi.debian@cknow.org>
 <3e000468679b4371a7942a3e07d99894@manjaro.org>
In-Reply-To: <3e000468679b4371a7942a3e07d99894@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_101018_378617_A1C42DD1 
X-CRM114-Status: GOOD (  24.94  )
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

--9beec6f5477ababb2ae9d3e4220a4e06ab7f2fafa941ec7e9fa069b1c762
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Dragan,

On Thu Apr 17, 2025 at 6:20 PM CEST, Dragan Simic wrote:
> On 2025-04-17 16:21, Diederik de Haas wrote:
>> The documentation for the phy_power_off() function explicitly says
>>=20
>>   Must be called before phy_exit().
>>=20
>> So let's follow that instruction.
>>=20
>> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host
>> controller driver")
>> Cc: stable@vger.kernel.org	# v5.15+
>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>> ---
>>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> index c624b7ebd118..4f92639650e3 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -410,8 +410,8 @@ static int rockchip_pcie_phy_init(struct
>> rockchip_pcie *rockchip)
>>=20
>>  static void rockchip_pcie_phy_deinit(struct rockchip_pcie *rockchip)
>>  {
>> -	phy_exit(rockchip->phy);
>>  	phy_power_off(rockchip->phy);
>> +	phy_exit(rockchip->phy);
>>  }
>>=20
>>  static const struct dw_pcie_ops dw_pcie_ops =3D {
>
> Thanks for the patch, it's looking good to me.  The current state
> of the rockchip_pcie_phy_deinit() function might actually not cause
> issues because the rockchip_pcie_phy_deinit() function is used only
> in the error-handling path in the rockchip_pcie_probe() function,
> so having no runtime errors leads to no possible issues.
>
> However, it doesn't mean it shouldn't be fixed, and it would actually
> be good to dissolve the rockchip_pcie_phy_deinit() function into the
> above-mentioned error-handling path.  It's a short, two-line function
> local to the compile unit, used in a single place only, so dissolving
> it is safe and would actually improve the readability of the code.

This patch came about while looking at [1] "PCI: dw-rockchip: Add system
PM support", which would be the 2nd consumer of the
rockchip_pcie_phy_deinit() function. That patch's commit message has the
following: "tries to reuse possible exist(ing) code"

Being a fan of the DRY principle, that sounds like an excellent idea :-)

So while you're right if there would only be 1 consumer, which is the
case *right now*, given that a 2nd consumer is in the works, I think
it's better to keep it as I've done it now.
Let me know if you disagree (including why).

[1] https://lore.kernel.org/linux-rockchip/1744352048-178994-1-git-send-ema=
il-shawn.lin@rock-chips.com/

> Thus, please feel free to include
>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Thanks :-)

Cheers,
  Diederik

> and please consider dissolving the rockchip_pcie_phy_deinit() function
> in the possible v2 of this patch, as suggested above.


--9beec6f5477ababb2ae9d3e4220a4e06ab7f2fafa941ec7e9fa069b1c762
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaAE13QAKCRDXblvOeH7b
buluAQCEIjcEnqtZwClOAqM8s1LvfqUaaPSSbkWDSy6SYsLWAwEAofWwHxa8G5nC
MgjHBOJT/8MsTjFkhLaeM2uzEV2YXQE=
=VbT8
-----END PGP SIGNATURE-----

--9beec6f5477ababb2ae9d3e4220a4e06ab7f2fafa941ec7e9fa069b1c762--

