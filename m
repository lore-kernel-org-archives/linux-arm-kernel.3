Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3A9E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ueKj3h38cfe5YF1eTqzn14hj6GmSLfrktwP6VjHJ2A=; b=zgyo0XFQw+xNKdEKReMZF9ni8y
	uBgtR/GaVNgISp9e85quF1L5AW7OvjMU6NIUC0v8BE2LbjKO+Yu+9dC0JwQ1GfSBx5mjtVlqwEGMX
	NEy8UZ2cDOds31HkdFrLCz+e7io9F1BbAOKS9KMLbVyg+8MKVUCMNfN8xLTZKaPI0CgICIrRnIVyN
	m06UhryCiwg2kAIk0JMZjvf7d4OMjLrn2oIKU6rkdJcMBKLQK3nbZtFL3q7M3T9GcacUdDV+6mqT/
	RUXWDpypnwf5KyPLziOa4vW3fn7iTbwrOaQ3zK/q+IZzjCKNyqBcchM1RIrRYRs8WwMb+AZ2nEjgk
	ULVPZiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzYF-0000000HWGi-0RxZ;
	Wed, 18 Dec 2024 19:17:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzX8-0000000HWAf-2uZ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 564DDA40837;
	Wed, 18 Dec 2024 19:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1DFC4CECD;
	Wed, 18 Dec 2024 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734549393;
	bh=hMHHPgD+Q5TTWWhgNt+yZVrZ1As+Nx1lYcDU7z4dqus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKkS0CwMwa3KIYYecmq4E5W+qExO80uJ+SLr0SM103IkZ4HXSz37aKmGlkigkv/nW
	 Azr8Y9JxygnbptIt/gbrDY2MEJZFo4e9T7e2eQwHol2kYf1xq8OcI0Rs3SN2FXYFDE
	 7Oy2oXLEbd0l7F1vDgmYHGNF5/FFBfG+r0fo9mCTHw2ZWHNbc8ekj2/US+qktTTpJD
	 E7LsLZSvga7RS8wc0Ykdl2cLc1ri9O0mIPI0fAOFzUJBy6ZVGltJRuWNqHnm2ISBcV
	 XcZKtgKCt5hoOg6mfTjtPeSnaRvY78hfYe1O/m5Bk/Nh30rD/DOKz9l/YGEA+1WLaB
	 UR0vvKQ+hKusQ==
Date: Wed, 18 Dec 2024 13:16:31 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6
 & 6Pro parts into a .dtsi
Message-ID: <20241218191631.GA1837559-robh@kernel.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
 <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
 <6e22585f8d374f8e26a2a51153680041ad8b1bea.camel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e22585f8d374f8e26a2a51153680041ad8b1bea.camel@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_111634_801922_59B22A45 
X-CRM114-Status: GOOD (  23.73  )
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

On Tue, Dec 17, 2024 at 08:34:50AM +0000, André Draszik wrote:
> On Tue, 2024-12-17 at 08:38 +0100, Krzysztof Kozlowski wrote:
> > On Mon, Dec 16, 2024 at 01:06:28PM +0000, André Draszik wrote:
> > > In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> > > we have to be able to distinguish them properly as we add support for
> > > more features.
> > > 
> > > For example, Raven has a larger display. There are other differences,
> > > like battery design capacity, etc.
> > > 
> > > Move all the parts that are common for now into a gs101-raviole.dtsi,
> > > and just leave the display related things in gs101-oriole.dts.
> > > 
> > > Raviole was chosen as the name because Google uses that when referring
> > > to the combination of Oriole & Raven, keeping the familiar terminology.
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > > 
> > > ---
> > > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > > ---
> > >  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 290 +-------------------
> > >  .../boot/dts/exynos/google/gs101-raviole.dtsi      | 297 +++++++++++++++++++++
> > >  2 files changed, 305 insertions(+), 282 deletions(-)
> > > 
> > 
> > This looks like move of the code, so -M/-B/-C format patch arguments
> > would create better diff.
> 
> Ah, yes, forgot about those when I switched to using b4 instead of
> custom scripts...

If b4 does not do that by default, then it should set the option. One 
less thing to get right for users. I sent a patch for that.

Rob

