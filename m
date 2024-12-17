Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624FBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgNrHb4I4ZiSK/b1r8jE+ZYhYIIIypBuSGPd1Lskgzc=; b=B8PVwVtUOcS6gOv/cM9QXXoAF6
	32+mbWe9S28s/hdGM7/aDyyJC6K7EVDqy4+Ck8acHdAWmfsVhYqcobSsv+2ug7IAsdXOxHZQS/jV/
	lnDCwfJo2hUOlXf7dbe4w0L0szW3wYqi9vzluujHTH6+bpoKeyNo2A8tNPGtEWfJAbYPfoFtDdUxr
	CyS2aBfrQcjpHCv//H/09FUlKQBuc5EFpbtUiHROIw+4mvkHrgtg413B/p1UnjiSQPFqgh8hg/Uhu
	UrTf7MUJJ+rE+fl0qzEXg1K9uSsy7dZHpemKR5v1w0Qcw9HD0BlNQb5cDcMQjlm6/F4p16lRVxkNx
	CoYX4q1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSBV-0000000CbIk-3j7C;
	Tue, 17 Dec 2024 07:40:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSAP-0000000Cb5Q-2P9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:38:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A5C65C5C74;
	Tue, 17 Dec 2024 07:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D886C4CED3;
	Tue, 17 Dec 2024 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421132;
	bh=tNHnx9DVG5hJfoO2tUFgXbCyMPBkjZoAyxqDuz8uz6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0evr5sGGa5QqC5BW9/gKXf1MZE2aOZ9mU4WpN+8BCRd/iJGFbWiiUuHAe7irkost
	 Lg5P4mDLIKVyOY4wODXqHaOKe2D6G2Zm2loLKKZGIta5HuqPOmFanAxOSxpDWPvVcN
	 ZmuOfy6U02IiKuI4TVCw9cnWfKn+a2rz5BZin6cPp38y7aDGilU7e5cMYQcNIBrPY7
	 24yWFECXtMF17Mk3oPRH97CI6GuZQV2kNRiBEAo+glLQA6clbHigr7TewOUxw9Zzj1
	 6NB1TnXhJGGb0sxien9H999MPOudYCA0brnO0zUKNZfFtEluUA/tZLka9WQERCxbNC
	 S+uP5kjD79bTg==
Date: Tue, 17 Dec 2024 08:38:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6
 & 6Pro parts into a .dtsi
Message-ID: <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_233853_659784_286CEDB8 
X-CRM114-Status: GOOD (  14.62  )
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

On Mon, Dec 16, 2024 at 01:06:28PM +0000, Andr=C3=A9 Draszik wrote:
> In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> we have to be able to distinguish them properly as we add support for
> more features.
>=20
> For example, Raven has a larger display. There are other differences,
> like battery design capacity, etc.
>=20
> Move all the parts that are common for now into a gs101-raviole.dtsi,
> and just leave the display related things in gs101-oriole.dts.
>=20
> Raviole was chosen as the name because Google uses that when referring
> to the combination of Oriole & Raven, keeping the familiar terminology.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> Note: MAINTAINERS doesn't need updating, it covers this whole directory
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 290 +--------------=
-----
>  .../boot/dts/exynos/google/gs101-raviole.dtsi      | 297 +++++++++++++++=
++++++
>  2 files changed, 305 insertions(+), 282 deletions(-)
>=20

This looks like move of the code, so -M/-B/-C format patch arguments
would create better diff.

Best regards,
Krzysztof


