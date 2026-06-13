Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0655BCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eud/G1Fl86jvawvMuS6QTDlOHo85kknsSJQpPdjorBk=; b=uiYVClhagp84mghVcO8oXcWw1G
	WTsItYwAhbLWD5ReB8kHeJWQbOYp9QAhEu8H80iNZNEincPgL32JIQY1K2cLrmKtke3N0cyG/Bc12
	5c9gk+2Py9rtmMqYPl1PPkwwVF7gIzD/bnyj9TyGMnnT5wDba4MhebVQ7eM/VqBnCifYCQt6urA3h
	0eYrVqei4Izg3DvBY8fUjivvxJ1Sa/3do1XePvflOV7ohSNHxIRr8bFYIyS3/SSKybdKUr5UMIulH
	wzu6h+OBJmbgtoAW0OxKRx3MHuQXBmOrgmmdnD8buHGNbMtrguo98ux20y4KxAuEOhQPDDL7oGc2l
	cLmGNwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSyK-0000000CTMj-0HQJ;
	Sat, 13 Jun 2026 18:20:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSyI-0000000CTMN-3Ceq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 18:20:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CE806008A;
	Sat, 13 Jun 2026 18:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4791F000E9;
	Sat, 13 Jun 2026 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781374841;
	bh=Eud/G1Fl86jvawvMuS6QTDlOHo85kknsSJQpPdjorBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPosQfqG6ovGEAQl7kMEIPmlaWB93mmNPu0UBJFDzWW7DFopnFsHqSQtrAXJmtFwQ
	 igF5AXPbaCh4RKRdNlG+I49YeBGq0ev3alLzh8NS9JdnBg3RXwPWnGLHjqZfA1kDKr
	 K4XhRA52GLFd+v1GSRbja7pDKNA+7JnpSGPtaJkA0/SqeYVEmdkGHNX3eHAntC+bxE
	 ENv8roG0QneYzC21zP4DT3FMpmW8xe0c6Iwo4ta90ueW3+srF3GjbyvCsbgoR7koy2
	 u5ION/1rilgvevZ9K5+j0Sbk1ixNRXITz0SRgoBSceB9MC1zdYnp7L1+66/oOewUbE
	 CWUKUROpcDLiA==
Date: Sat, 13 Jun 2026 20:20:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 1/6] dt-bindings: sun8i-v3s-ccu: Export MBUS and DRAM
 clocks to the public header
Message-ID: <20260613-dashing-phenomenal-capuchin-5d35ad@quoll>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-2-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613152655.212490-2-paulk@sys-base.io>
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

On Sat, Jun 13, 2026 at 05:26:50PM +0200, Paul Kocialkowski wrote:
> In order to declare a mbus node for the V3s, expose its associated
> clocks to the public header.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  include/dt-bindings/clock/sun8i-v3s-ccu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


