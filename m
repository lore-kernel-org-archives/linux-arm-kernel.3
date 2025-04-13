Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C838C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 22:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELFV3JvlyIdG0dHylOEzVHDFuigymB4ugwlYXX5Dtqg=; b=HTy6Hz6qlAMa8+VS7H09Hnfbpf
	Ja9mHLio7JMvM5+sxrJjptiW3xldCACUuWe3lXtIfkdtvLRi3P8suAAqgVxsSkngyhg2oOYhaa6v8
	ZSmIpeFn3QNfOYNZ63aHP8wcUPsXbxULMvWbbS/eKX35YISXf+/DX7/IDcDoDv4x/1raKgm3fRYMw
	lSbd9k0FzDtxUU74VI6anDAwiJsOxv9s2UzmSn2VrPNR7YTs6Q07DMK7jWKTKoCA1CY4xOFYZ2+SC
	3KuZ0OkLd7b1hKoe5dpa0KDuhoOiArMA6mOVHKdCXO4XKAr75ZDoeQ4FFiA2UMxmoNwEo4VWUDe8+
	j4vPTxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45bA-00000000ETA-1eTq;
	Sun, 13 Apr 2025 22:14:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45ZJ-00000000ELS-36H8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 22:12:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C820B169E;
	Sun, 13 Apr 2025 15:12:44 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0F7D3F59E;
	Sun, 13 Apr 2025 15:12:42 -0700 (PDT)
Date: Sun, 13 Apr 2025 23:11:45 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 0/6] Add support for A523 Thermal system
Message-ID: <20250413231128.75983a60@minigeek.lan>
In-Reply-To: <5084c2dc-d268-4268-a827-2ae445782a4e@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
	<5084c2dc-d268-4268-a827-2ae445782a4e@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_151249_826721_E7B7FB9B 
X-CRM114-Status: GOOD (  14.27  )
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

On Sat, 12 Apr 2025 03:53:08 +0300
Mikhail Kalashnikov <iuncuim@gmail.com> wrote:

Hi,

> On 4/11/25 03:38, Mikhail Kalashnikov wrote:
> > This patch series adds temperature sensor support for the Allwinner A523
> > family of processors (same die with H728/A527/T527)  
> 
> Based on 6.15-rc1 with dts patches from
> 
> https://lore.kernel.org/linux-sunxi/20250307005712.16828-1-andre.przywara@arm.com/T/#t

Chen-Yu merged those patches already, to the sunxi repo on kernel.org,
under the dt-for-6.16 branch, so you can reference that instead, and
also base any new patches on that.

Cheers,
Andre

> 
> > Mikhail Kalashnikov (6):
> >    thermal/drivers/sun8i: add gpadc clock
> >    thermal/drivers/sun8i: replace devm_reset_control_get to shared
> >    thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
> >    arm64: dts: allwinner: A523: Add SID controller node
> >    arm64: dts: allwinner: A523: Add thermal sensors and zones
> >    dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
> >
> >   .../thermal/allwinner,sun8i-a83t-ths.yaml     |   5 +
> >   .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 145 +++++++++++++++++
> >   drivers/thermal/sun8i_thermal.c               | 154 +++++++++++++++++-
> >   3 files changed, 300 insertions(+), 4 deletions(-)
> >  
> 


