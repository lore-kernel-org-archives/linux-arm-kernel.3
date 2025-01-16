Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 21:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kH3RcHClvLWKy+O/o5Npjm9FhOjWPnQCjMka/A5bg0=; b=JJqqFO2LJuqdPdU/c447xxm4q0
	GMdg6FzKBVBZ8r3S6hcTF6CNuKkwQs7fFe3BBzUV3b7kn2YPTR1sC6dQG5nvjWVtfF4LL2AUcZgXc
	PtIvDQu+XTH66W4hhsuK+qL+J6Qf2sJZUKuoGGuMB3LKsSdtGewGfL9zRL3ciqDsgXTpawAReaE/3
	2+48lSVrWBknRXiNoZF0ZKF4VLpEEGEr4MHjXO9GNyjGWc6U5ZtcXgx9OEcZZ+ck9iZi1bbJ9QkRk
	51N7NA3n9TjD7bGuObP2IXskOpU8gtF5TIXvbroNyXtSt3pPCyMin9RxJDp3rAScmhdG2kDWqf8NV
	gWqrdBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXRI-0000000G8ys-2fVC;
	Thu, 16 Jan 2025 21:30:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXPw-0000000G8ch-46FA;
	Thu, 16 Jan 2025 21:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5484A5C5E6C;
	Thu, 16 Jan 2025 21:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DADC4CED6;
	Thu, 16 Jan 2025 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062923;
	bh=8kH3RcHClvLWKy+O/o5Npjm9FhOjWPnQCjMka/A5bg0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DA/xqa4WVBH7wp9VxGtnyGLywk3sydajZ0wutylhwpoaUNrojkjls8GOyPH9Kh4u4
	 1a8f1gxUkgzmOdx44hG5gk9eiv6WS6NbTycQLdsfvPG24iB68Af+XQhsXvG74mMJIm
	 v57b/XwGMlba01LELvdzlkpM4j4udg4gAj/sEXvbUKVgF8+nviGGTClrbERGB0cDGJ
	 luETH36vDFYduOdNJvM6P0HrpYjcnjd0uHTQwnJVmk2PMHglTeg3rCBvBIWsoaQhBp
	 KNjz/IlIF9wXS4Axqu9gTbyjcJuTqGFhFzjlnPgfavFTaUNmysi2re8drTsIcXqsMS
	 q7QOgBNHvkvWQ==
Message-ID: <323a1abcf2c1cef2e2e3e002f0a81919.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 1/5] clk: bcm: rpi: Add ISP to exported clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:28:41 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_132845_065067_E8B45E50 
X-CRM114-Status: UNSURE (   6.13  )
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

Quoting Dave Stevenson (2025-01-16 08:24:08)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> The ISP clock can be controlled by the driver, so register it
> with the clock subsystem.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next

