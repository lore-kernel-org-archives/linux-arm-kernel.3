Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8203DC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFuAbMq1JX4roJ+7rlMFFBBTetRiZxKg42VW15AEyjU=; b=15OtUbEvYCbHmwlyOi/f4HbFfT
	XL6hOyJ4CuRJBgoLQDKWQcRDLB5C2wkFJV03dEXpszzTKlurms6cZolKQuOXD13mlIixO6BUBmWIf
	rhj8CscfkSmUxlq5qoG8ssoDw26/Ytsx6pSw2ChpscyJ7PZXQzGrxD0b3qrIV2RzNGC6GRueSTNgF
	k5AHjVbhj0xEJDdBL+KK/Hi/cWxdU3UNjJl/OVEcWLwmT2uOhpZB8eTJtKxgeRR/EhzKh9QJAmzH8
	GHVdG6FpPDAUZazWd7k+ub75NAnMkKhiOj97TFaV8D/Jr12ZGCiKTDgCOn/QqSYu3Fzdqnq1kGybD
	1Tk/xulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirBJ-0000000E94k-1HgI;
	Fri, 14 Feb 2025 08:36:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tir7Q-0000000E8Qz-0De8;
	Fri, 14 Feb 2025 08:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B612A40DF2;
	Fri, 14 Feb 2025 08:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBABC4CEE2;
	Fri, 14 Feb 2025 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521935;
	bh=tN0i1b2Ryo0EmqvdxJO9z1k6BEAOIIN5zWxqbfV8Kcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfSACwOFvN5KyJiGTJqktnaWcX+SReQU4KYs6iAqH4s+/mrv+SSAVc1pK1U7lNkti
	 gWukz6DpiK91mpEqJ75i9hS2rm6AnQ/RK4ktEz9MlGk8uO7JgX5G9NjtJa9/gV2yPp
	 YK95AGwC0zTSpwC0woI2ZVPHjWqoMGhPrKaABi108etXJ43b71cLsZzDpe0Bp4WbKw
	 58XIztO7Z3y1+lnF2yoYdszq2HMaxd1zPPvlYO0iKDcgEamFah14e+1CT+S8mWnOVo
	 3StLEcFoeUgDPDt5pOmJRl1m7DMK4Ndspc72aN8efgaqqRgaxusNPv/fruSjqXv/27
	 vMJH8H2MTcboA==
Date: Fri, 14 Feb 2025 09:32:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Chris Morgan <macromorgan@hotmail.com>, 
	Kever Yang <kever.yang@rock-chips.com>, Tim Lunn <tim@feathertop.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Weizhao Ouyang <weizhao.ouyang@arm.com>, 
	Elon Zhang <zhangzj@rock-chips.com>, Alexey Charkov <alchark@gmail.com>, 
	Stephen Chen <stephen@radxa.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Radxa ROCK 4D
 board
Message-ID: <20250214-sophisticated-toad-of-cleaning-e9c359@krzk-bin>
References: <20250213145921.133412-1-detlev.casanova@collabora.com>
 <20250213145921.133412-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213145921.133412-2-detlev.casanova@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_003216_152550_A4E25CF8 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 13, 2025 at 09:57:15AM -0500, Detlev Casanova wrote:
> The board is based on the Rockchip rk3576 SoC.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


