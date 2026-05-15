Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B246BCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 06:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVTmkClbJIs6FWn5wYARwlEDELfKdCMNpazJz3bPwQU=; b=ehI80za3r9DaECQo9X1n2aT7GS
	1yFVCCGc75qU5wNYhxp/NChgBnstp1poiLdYF7Ql5Q7fEJ2XPwfF+nw/tfvNYfYZqxu9B9oqyzjzI
	8zfOWCjv3+JulLRqFPbwrr91Bg4qe80LoabosMqfC8W42pGFPHh5QHXdLUXSIPS3uILYL4nPBTRNN
	HhBUJxmCTxn4+rL/NNtXPCWmFIh7E+qTUYkLKGuBY0bsS2P3AUJ9/yREIHrXY0MZj4VOKluBlKjq/
	PuvuigUWbym6yCCP8htK1jFuQCtpPdz0NXNhZ+6UeTKxwi40LmZbghP9Bd1pBKBLE0x5ITkEU9QuF
	XQk4nZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmOz-00000007YFH-11hS;
	Fri, 15 May 2026 06:52:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmOx-00000007YEQ-01oR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 06:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C8CF43CFA;
	Fri, 15 May 2026 06:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04812C2BCB8;
	Fri, 15 May 2026 06:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827922;
	bh=mu7cduG3fQLBUX3auUinfMi71dfcpyVQbNUxXr6BxdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ha7Strj96CO+u39xR7gZFksLweh9aWYnG0XX+mjmKzpO3bLSQPxVHRHRUm04ZcTHk
	 sAlWxNSeJaEXnzo6inxmR/QOPi42ALeDJeDk5qJmpZFilCUszhiQELdtBZ+5yMii56
	 OACJfDaSJJRn9HV+YkOuAG27cz3Q/wCukpfhAVzY62OPuMo+l6Uvmu3wIJ4KRPB7xs
	 SlQb6wv/QwACF33hyI8nDhRaTSDMT4Q5CadJ5GDxqRpvxeptIu7My45CzfVRuUMtor
	 qqfsZU/MFkhb+jMe/zx4HeA7Rvj7VNeL0ID2p+h2gqGLeFGN4OZn8ZuXT8rqX6Qlj7
	 TZUATjZoMN+og==
Date: Fri, 15 May 2026 08:52:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/16] dt-bindings: display: ti,am65x-dss: Add AM62P
 DSS
Message-ID: <20260515-certain-honest-wren-f03dfa@quoll>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
 <20260513-beagley-ai-display-v2-5-9e9bcefde6bc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-beagley-ai-display-v2-5-9e9bcefde6bc@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_235203_069114_745A72E3 
X-CRM114-Status: GOOD (  18.89  )
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

On Wed, May 13, 2026 at 04:17:27PM +0300, Tomi Valkeinen wrote:
> TI's AM62P, J722S and AM67A SoCs contain same implementation of the
> display subsystem (DSS). There are two instances of the DSS (DSS0 and
> DSS1), each with two video ports (VP) and two video planes.
> Additionally the SoCs contain two OLDI TXes (OLDI0 and OLDI1), a MIPI
> DSI TX and a MIPI DPI output path.
> 
> DSS0 supports:
> - VP0: OLDI0 in single-link mode, or OLDI0 and OLDI1 in dual-link or
>   clone mode.
> - VP1: DPI
> 
> DSS1 supports:
> - VP0: OLDI1 in single-link mode, or DPI
> - VP1: DPI or DSI
> 
> The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
> between the DSS instances. Thus only a single VP can output to DPI, and
> a single VP can use an OLDI block. Note that in single-link
> configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
> be used by DSS1.
> 
> The DSS IP itself is compatible with older SoCs. While we could use
> "ti,am625-dss" compatible string, we add a new one "ti,am62p-dss" to be
> on the safe side in case the driver needs to do something special for
> the dual-DSS case in the future.
> 
> Original patch by Swamil Jain <s-jain1@ti.com>
> 
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> Tested-by: Swamil Jain <s-jain1@ti.com>

Same comments.

Best regards,
Krzysztof


