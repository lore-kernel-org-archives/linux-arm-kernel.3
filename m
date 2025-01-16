Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63DAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaKpFIxDYGMLiKezMC+NAvpTn1fvyXtB7QN/3r0CqT4=; b=pNmk4/x2mAkjcnKYzmqYibvaXN
	Gn7dRf+SZ+DFarawaS0qOsaScGoBd5dL67lySHnX3Joou5nlugNnVUrtGTCIiSMkOaaMzWVZ8BC0s
	aUyX2sbvSJ/OXRdQal5sHkXLZdok0VOVwwwGTdBNYg9Y/xraiZsDVjXjJcFqUVbGMtKoqBUHD+6lQ
	ZbjRYdUr4Klrcbc7C+SF4I4FFhBUoSQEd0WosZyq8XsU3z2AnPXc0wLflJXGp//jQUt0M05KcMRMM
	YV/UBlG4ifTcYGiDZ7qm2vUj+eOtbmD/AqWdlAsS5vyvbOimd488CFGDVaO3zm3d5nxoOvOV85b4c
	oxVi6z1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKlB-0000000E8DQ-4Als;
	Thu, 16 Jan 2025 07:57:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKju-0000000E7Tl-2bir
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 07:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 015615C4357;
	Thu, 16 Jan 2025 07:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732A0C4CED6;
	Thu, 16 Jan 2025 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737014188;
	bh=4+3nAGVh/uPX2+IHp5ayZL30DSWxzNqR/sh4yXvJYk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJ4o7ap5LJxVK8XrbEFOmAjINzZFM8vE1o182z6WXu8uEcZxGaeGzPyTvjKmo2Xsy
	 ssthYPGwkfbrlNXXMCegfzMZ/Z5yGspiYIeRd/2X9WTBKOHV8jDWeGslyIDZ7T9ml3
	 tuYWHQoC6K1QvRgG/xglyewFP0RTBH1ziLabZW6bIKGtvwMy3FE1w8KerW+E593gCb
	 LpeE+dn1OlViMVZNsib18UHdcsKUsAW5uERjEr7ldnWTccqyATsZg8tB3X1WZmDF+O
	 42Zr0dkDqjJzx3FXqN3AoC1tFB9poYZMtjHAndPzVGKdjVmztJUCvSrJIE0qfXYVhs
	 EhekIY6+Jk+Dw==
Date: Thu, 16 Jan 2025 08:56:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Wronek <david@mainlining.org>, 
	Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v14 4/4] MAINTAINERS: add myself as Marvell PXA1908
 maintainer
Message-ID: <oapsqjdop3szi7zfwiyy65ty65gz3uid6cc4lfao22o4d6amjd@bmfkt2wnmlom>
References: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
 <20250115-pxa1908-lkml-v14-4-847d24f3665a@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250115-pxa1908-lkml-v14-4-847d24f3665a@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_235630_701935_E89586EB 
X-CRM114-Status: GOOD (  15.40  )
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

On Wed, Jan 15, 2025 at 09:35:57PM +0100, Duje Mihanovi=C4=87 wrote:
> Add myself as the maintainer for Marvell PXA1908 SoC support.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26f28ffd0f3433560d6db1518f9f95..caa5f6b96251a3da0f3f9d2f7=
60b38288eb23ab3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2624,6 +2624,15 @@ F:	drivers/irqchip/irq-mvebu-*
>  F:	drivers/pinctrl/mvebu/
>  F:	drivers/rtc/rtc-armada38x.c
> =20
> +ARM/Marvell PXA1908 SOC support
> +M:	Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +T:	git https://gitlab.com/LegoLivesMatter/linux

Not sure if this was mentioned ever (it is v14, so it is likely) but if
that was not clear:

Pull requests from non-kernel.org repos must be signed and your key must
be in kernel.org keyring. Please get your key signed
(meetups/conferences/keysigning map/video confcalls) and submitted to
the keyring.

Patchset should be sent to soc@, as expressed in soc@ maintainer
profile.

Unless this is not going to be merged by soc@, but someone from Marvell
maintainers, but then please drop the repo. Git repos here are for
managing patches.

Best regards,
Krzysztof


