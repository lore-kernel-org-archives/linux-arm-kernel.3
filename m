Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AA4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 00:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro/DoIxPTQaYjz+4yPa+Cz8iLKFVM57HWDgrlLw5WE0=; b=2so1x7EeFF9D12KRg57K2a/Ker
	OzGA056B0J3NRb/q+sm+L0tzcNC/LAUp6zLte9SZWtwMQlZ6N99QtabcDh/QAVeEzxbU8YyB/NsKr
	h1y0m8lATVNwpK0m2Tv9spV1abMyLe/UhUqaPbMJZQNItZVSutYGgY88osjystXM6iHjSu7mCtLCI
	HRrtHhyisQ5QDsHIFo5dZtC0pB+u3QXi/Q9sNtoX++WqlQFbi4WLfO6dnPn5FhZSYLY35rh5VtZuP
	sg35rC/i0mWaY/1impEtldI2+RH7z6q0xMjLQSI8T3AdZsxtf4QdDF+TxHLSMsEYglm/D3dfN6V4R
	ylw/pzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQ7g-00000006Cdr-04sr;
	Tue, 31 Dec 2024 00:28:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQ6T-00000006CTx-1Ddu;
	Tue, 31 Dec 2024 00:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ro/DoIxPTQaYjz+4yPa+Cz8iLKFVM57HWDgrlLw5WE0=; b=FnfkFP4CRjvtQmqmAc40YkcvxP
	J8TmBraLy4RSaMLdgd9Ymgkc2MRaxCzf8WVnEle64Hw92iP/focrKILAqTl4U/HiVLlZCRn06Ov48
	zY1s7UUz/64bEYGbsBuVx3e5aREOZmiVmoEPhuvS8U1c5/YqO2g64YP4Y188oiaq6G4OLwliW6UKS
	AZNO7PH7NnzHlMHTBoK7bjrB/ybL1iB4HaCTJyrjKBIBGpVgROb3+PD6/9p8jhk4S5dBSvBuv5Pf8
	8suOo/QjBw8LEDNr93phakpOWEECZYzTbAb9ToaLY2xy3p/4+BAsuA1m5FavvoN2fLbVqW3iCjgLU
	f5SussYg==;
Received: from i5e860d12.versanet.de ([94.134.13.18] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tSQ6E-000300-DH; Tue, 31 Dec 2024 01:27:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
Date: Tue, 31 Dec 2024 01:27:05 +0100
Message-ID: <868000342.0ifERbkFSE@phil>
In-Reply-To: <CALWfF7Kg9HQoqyEYaj9FGPYu3+vAzZNLMVhSr_90SFDg5Syc9w@mail.gmail.com>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
 <20241229184256.1870-3-honyuenkwun@gmail.com>
 <CALWfF7Kg9HQoqyEYaj9FGPYu3+vAzZNLMVhSr_90SFDg5Syc9w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_162721_346183_BF9C01C0 
X-CRM114-Status: GOOD (  14.61  )
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

Hi Jimmy,

Am Sonntag, 29. Dezember 2024, 20:20:59 CET schrieb Jimmy Hon:
> On Sun, Dec 29, 2024 at 12:44=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com=
> wrote:
> >
> > for Orange Pi 5 Plus/Max/Ultra and AI Max
> > ---
> >  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 833 ++----------------
> >  ...gepi-5-plus.dts =3D> rk3588-orangepi-5.dtsi} | 195 +---
> >  2 files changed, 77 insertions(+), 951 deletions(-)
> >  copy arch/arm64/boot/dts/rockchip/{rk3588-orangepi-5-plus.dts =3D> rk3=
588-orangepi-5.dtsi} (80%)
>=20
> Heiko,
>=20
> Should I go ahead and make a v5 including the following in my baseline
> before the refactor?
> - GPU power doman dependency [1]
> - USB 3.0 on 5 Plus [2]
> Do those series look like they'll go in as is?

If you want to do a v5, you _could_ include te USB thing, because that
is DTS only, so on my turf ;-) .

You could also drop the RFC + UNTESTED parts for now and resubmit them
later.

=46or the GPU power domain I cannot say when this will go in, so better
not depend on it. Especially as we don't know when people will return
from xmas/new-year vacations.

So ideally for the power-domain thing, create a follow-up patch.

Heiko



