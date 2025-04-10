Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B770C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/Eq3oO6cAKqd4CF4xM3K5jQF+XUdMLxEdRDr+rjO6Y=; b=xIDpVo1v791CZv2J9qsW76s5Of
	xuNI0bugk6P0JYGJTfSnwHXMJiTKJiZtnaL8IpBfwfLYydxYk0/AXOijc2Ao7/ANA2U7cgaIbTqJe
	1L4CgGNqi2w6wMyw/anrdcGjPEK45JKnPV0trXENGAjB66JAvlJGabR0HTf9mWQrvFSiyKdXcSHYH
	IH8+UNUMOySqxgMc3Qee/IxhnTHaEnN3mXss8KkmBYohoj4EWEDiPNeQmXH93f1PcJe1WN7upWgx+
	btxwWp6kxnIyIYfm6diKHRQrRETy2aAPeUdEBqEFkiQuoqnwdAyJmE+dmglIrnEp1CLAytTNgUOL4
	DnpPc2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lI5-00000009M2h-2RvH;
	Thu, 10 Apr 2025 06:21:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lFK-00000009Lgb-43st
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF1CD5C2F22;
	Thu, 10 Apr 2025 06:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF988C4CEDD;
	Thu, 10 Apr 2025 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744265914;
	bh=N/Eq3oO6cAKqd4CF4xM3K5jQF+XUdMLxEdRDr+rjO6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgzaIHlHHtE0k8XMPIzNNeKxfWMEWFu7Fb7zdKLcQserP3WkyzcrpRmhCueuk2Rlv
	 M7RQlkWqOlBxJl/Okb0KGD1CfZyFjcANp0maFk15EgzE94lmCUe8QW6syR9i6rP/fs
	 19IBb8kqDrFCAE4RnLNRegJp45caw01cAbwgibsXB8BlIEfE4i8QAmr/Pisxur8TqH
	 c6ct+7hdJVB7RhLaqvRTePLViGfRT44QLIAY0bCnSGkedQ0vjy9MNTGiFeFWVkNZfD
	 jCMG+6SVA/KaBUrW41KOowuiwPqc8AamB4drQgT1T2I0rnBUEY9YFuh68hERIRpzbt
	 d9I4YXgKYqkkg==
Date: Thu, 10 Apr 2025 08:18:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250410-dancing-free-peacock-536c24@shite>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_231843_169500_D28B5B45 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Apr 09, 2025 at 09:37:21PM GMT, Andr=C3=A9 Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> *** dependency note ***
>=20
> To compile, this depends on the Samsung ACPM driver in Linux next with

Are you sure these are build time dependencies? Do not look like. Also,
if they are, the patchset will wait for quite some time.

> the following additional patches:
> https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro=
=2Eorg/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.=
org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@lina=
ro.org/
>=20
> *** dependency note end ***
>=20
> +++ Kconfig update +++
>=20
> There is a Kconfig symbol update in this series, because the existing
> Samsung S2M driver has been split into core and transport (I2C & ACPM)
> parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
> the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.
>=20
> This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
> talk via I2C, but via the Samsung ACPM firmware.
>=20
> +++ Kconfig update end +++
>=20
> This series must be applied in-order, due to interdependencies of some
> of the patches. There are also various cleanup patches to the S2M
> drivers. I've kept them ordered as:

They should not depend... although actually not my trees, except the
firmware.

Best regards,
Krzysztof


