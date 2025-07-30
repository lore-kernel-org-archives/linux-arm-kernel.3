Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1B9C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyO3ELtce+9eVyG+DgOoVdzaqxAq3yhgmexH6An4OJ8=; b=sIe/WmYaf43C1oCIEy7p8qd1+V
	G5/kEL0I/FEhaMawjA1kqZOmXmmVfpbc0DpYD8sJgEbF8wlXMnQANXct8Vgd8K2F6w/QK79klOr/P
	OP+VNtupLFR4ADbMnNgXZyB/3Lne1PKUIGzJUI/LaiWHYIPtrBh39FxaMsi4zITYgPFCP2Dl/e9hi
	lBoTn33YWzVTzoF16yuIiEDmm2gl5qk1GRDaZkkYaxe8KRh2z2JxCPUT0kB7q9D/9f6EeSoA1xk6x
	HWdeJPOqjkozu4VsI44kMdT7MFACNIBf4hq3jsGE4BvygJ+AaV75sN2PbKXaRaKUB245FRmYpoUV+
	+ZMjM6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0o3-00000000px2-39T0;
	Wed, 30 Jul 2025 07:00:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0la-00000000pfA-0lI9;
	Wed, 30 Jul 2025 06:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D806A4612F;
	Wed, 30 Jul 2025 06:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243A1C4CEE7;
	Wed, 30 Jul 2025 06:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858701;
	bh=GHNJMzDwHia/VawDKRP28HqC/Lt9R5Ms0U30Km18fGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJROmsAnlyyJu0kjxDwgser2yC+n3hiMjZJ8H3L6sG9cmLRjyg6bHBzhGRYmH53zo
	 D8u69619Yr6ASNj7gnLXesZHWVHR+KiOaHPDXdMJv9Zv7MFwZADyoQnwxpV2OLkt30
	 T43LtK1YgvedGFSbZLh9n8QscuvP0d2CZCSdxwZQMgcFoyl8heoRtV7ztJVvE3c+VW
	 yDTN2HML4OydjFXGVS77nFzefavnUbuSkznZp9rTWGZe8592Xu4I8caE6c9NH1N/q3
	 NSEOX1POOcdU96THVgzxGz6hldBXruMBSTjyUcE58FFx0aQcuG2Y9MzigdfQnSmMLj
	 dL0EmUQiXfeCA==
Date: Wed, 30 Jul 2025 08:58:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Erik Beck <xunil@tahomasoft.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] arm64: dts: rockchip: add LinkStar-H68k-1432v1
Message-ID: <20250730-striped-free-lionfish-826b70@kuoka>
References: <20250729-linkstar-6-16-rc1-v6-v6-0-92307f465835@tahomasoft.com>
 <20250729-linkstar-6-16-rc1-v6-v6-2-92307f465835@tahomasoft.com>
 <8ef3e1f4-4658-408f-8f46-ee9fc48d7a8d@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ef3e1f4-4658-408f-8f46-ee9fc48d7a8d@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_235822_243696_362C937F 
X-CRM114-Status: GOOD (  11.89  )
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

On Tue, Jul 29, 2025 at 10:30:35PM +0200, Jonas Karlman wrote:
> > +
> > +		/* Middle inset/recessed button,
> > +		 * marked by clockwise arrow/circle
> > +		 */
> > +
> > +		button-reset {
> > +			label = "button:system:reset";
> > +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_RESTART>;
> > +			debounce-interval = <50>;
> 
> Please order props alphabetically.

Why the least important property - debounce-interval - would be first?
This is not a readable style.

> 
> > +		};
> > +	};
> > +
> > +	gpio-leds {
> > +		compatible = "gpio-leds";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&led_white_pin>, <&led_green_pin>,
> > +			<&led_amber_pin>, <&led_blue_pin>;
> 
> And here pinctrl-names comes before the pins, this is my personal
> preferred ordering for pinctrl-* props, I will settle for being
> consistent.

This is not the recommended order. Names always are supposed to follow
the property with actual values.

Best regards,
Krzysztof


