Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A44D6A249
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTJTy1SVJgcODsQdD/PKeY87lX5ByR2rSsdTzLOIK30=; b=dYWQCNxy8xpbMnGLqgHUJvjwaY
	WDv5hKMvu94R0XOAikkP4rtwoD+EZVRcq+Jv8MZmVTgN5x7u6rIuySvQ6gVmrtpS0LXHAZNgoj9M5
	l5rDJ1L+plKJ0Ps/iZGznDUdc/cPlCJN1mjZILEboSapVbaGPHhkPqLisrweJnSPpLnzj92uxIZ4a
	RW23jhSyq1DzxGso+iskTMIinTwhR0h6xCzCMhnrxJMvwXn0po4Emxbq6zDtiNUVbnk9GJYcko56a
	S1zqWl3eNDB4EoPUgFqPzzKiXbf5SdlMHtJAJwwZdPPGcl5LiV5Y9k0tzst6GhNt+WLJXqvlQzZnD
	9f5aLqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiU6-0000000104o-0zaV;
	Thu, 14 Nov 2024 22:38:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiSU-00000000zeZ-051M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 22:37:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60F8EA409B2;
	Thu, 14 Nov 2024 22:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDD0C4CECD;
	Thu, 14 Nov 2024 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623820;
	bh=VTJTy1SVJgcODsQdD/PKeY87lX5ByR2rSsdTzLOIK30=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nq9Uz+muqdSCjDBuI8FNwr/KYlKc2NxlES+UX0++X83CjH1uUCPRejvDuKbexNklW
	 SuleOVZY5YZvcbFKlAOzYvnSrZgUpw9RF5zTLNJ76mL5HK3eZXCeDTsK9Z29t4orlY
	 zoH8oyKjc3dUG4sn8cVfbmmZ1tvdkTe4yH9FnNBHE0s8G90WNlMvrv8TGmkfGFyFDi
	 4Ku28jmOncHaYEIGoeChuoqSvBeKmbq6iMH+WPMCtZqp9EEk90KT3g6p1WMWiO512u
	 C97DpdB3b+lzouGILrlAyUIIXJAvXjBJH36StHILNeu2kpy23ylHIqZ3IdRcMpW84c
	 b6Y8YXGrfhX7w==
Message-ID: <f908ceb40d8e77b864794c8b75dfe414.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-4-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-4-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 04/12] dt-bindings: clock: Add Marvell PXA1908 clock bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:36:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_143702_122917_ECFB8D06 
X-CRM114-Status: UNSURE (   6.60  )
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

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:06)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add dt bindings and documentation for the Marvell PXA1908 clock
> controller.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

