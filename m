Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCF8CF2567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJDWerBWiN+yVAGOLUEvb9SRDA96atabibByy1k5Piw=; b=SM2lk3U5NlNCZ5ftAaFkAtTFcV
	097IMjUxeKrxJOX5SU2O1wkJrxGMIaGSdGL3EKKe8RLfLPKi5foZhC1uxQavEnRJyPLhmurQm02Fk
	XOLzSNEb71RKWK2U4pXaN2Xlz+e1QyRtLaGnW6dNZmy3GJAn8W/b97oJ7gfV3g8V2uDCT6UofCWq7
	yF6gER3ssN0Qq24L9EqjF4YwnNo0d61OG8vy7T77ZNZc7BSL/9IihLp/0zXtoqiVOrdeLfsR6HWK1
	f3uQTY+oDNf/syXJD/DR/3OjbiiJUodGQTJ0+i5ULUmkXiQ7/Vz45oD7oBp7EmRSxAOo+7V1nYTjQ
	tESWxW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcau-00000002hWz-19uk;
	Wed, 19 Nov 2025 07:27:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcar-00000002hVf-1yne
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8467C405B4;
	Wed, 19 Nov 2025 07:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BEDC4CEF5;
	Wed, 19 Nov 2025 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763537226;
	bh=VkvhOm7Im9NgLtpOPK9Ghu9qT2h9mz/GyVCt//vfA7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhO9mwHDxV98gAchLiwpCG+KlIE2c1uS/9x3vAEoRyZPn32WURzsAUQgF/vAAv5xu
	 KhSA1PATm9Oe1JjpqrFNIWIk3NYvGS6/+Rc07+w8xphZUVdSrq879yAlTfl46ex9dl
	 AHhbmAvvMASzQPgZRa/e5kE8ccwirjMzxst/kzoglsm/siP1DLuoU5ABQGvH4gUKM1
	 aK0LhtRX48pvKCN3gRGtB/aHTcyKaXSjIFKzS5EW9MaE9FsZk2GXtj0+tixwZ2S51S
	 GcM7goKQVm/v+E4yD5Gw7tDGgatsA6SQ2DuZllJ8Xpy9CoVpGDhpiv7QNqWJ7vEM6+
	 0xgw1gJByipUw==
Date: Wed, 19 Nov 2025 08:27:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use strings for
 enum property 'st,package'
Message-ID: <20251119-ambitious-tuscan-scallop-ecc1b5@kuoka>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
 <20251118161936.1085477-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118161936.1085477-3-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232709_545885_F5209AE7 
X-CRM114-Status: GOOD (  13.77  )
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

On Tue, Nov 18, 2025 at 05:19:23PM +0100, Antonio Borneo wrote:
> The property 'st,package' reports the SoC package used in the
> board DT and is used to inform the driver about which pins are
> available for use by the pinctrl driver.
> It has historically been declared as an uint32 enum, where each
> value is a power of 2.
> 
> Deprecate the use of the numeric value and replace it with more
> readable string values.

The "SoC package" is defined by top-level compatible or by soc info
driver. It is not the property of pinctrl, therefore if ever touching
this, you should deprecate entire property instead of growing it.

Best regards,
Krzysztof


