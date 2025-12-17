Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBCFD64088
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlaVYxVYajnQejm/HqAcTXGLLfqNed970uLCrGII7a8=; b=X0atEo8qKhiCfKny8iespVgviY
	Ka+klBOZXns+xdU1wc06v7awTiqq8FjCbhkqPSQ7Pvd+Y7zbUvaT3Um1hyIkshp7FKMdP1has4Ky4
	Lr+I+Wr2Ae0vjkBojPXf4oCmRL2Tiv7vRtGtRC8Ke7mbbaTzvzs6N7ekJf99sG3tEVQQf5amUwgec
	jA5kWFqXwGWBTbZRwuch0Pc6p9HpkkNxfWyDkY7Q5pfImZRDA+3Cbk4p5m6iziCIp//IVuCFQhqjj
	n9kp7R8LwlnUm0MTEh9oR//soK/7CN9QSoV270+9F4pxt67NOd5UKiC9IhoyhPlhnD+dH4gdwSDnp
	zH+B8hmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmkG-00000006Kk5-1c0Q;
	Wed, 17 Dec 2025 08:18:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmkE-00000006Kjz-1sBn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:18:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AEC76018C;
	Wed, 17 Dec 2025 08:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB8FC4CEF5;
	Wed, 17 Dec 2025 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765959529;
	bh=hzq+qlfrm/XHsPUHquJSzRmimdiL8pDjtXmG8is3c/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRX5bDilyC3cJ2UuW/tbAlCdHYCfsWGhDwTcN3Ufd1dQ4NuPR4X92Ebc3n2jPBMe8
	 MpF8JEMa0xf/Ll0Hp/fx07+utYT/FKIXIKqmtYkfP5o5Vui5svM5TS6K5NJDq2L3vT
	 1zrSdapoSQLr6//VhCVPZHjgLkYGpyKTMo7v8Ib+XaimdJTay3SrREYGrL2AnbOtmf
	 pZkihWhtu1CtlxtFU7vWdC/dCke7F4os6/GAW2rezjW24S8GSTdZ7NIpY1Vpk6vGZ9
	 O4aRJQrDPgSZVQx1JE6LsMnaybLM/7em66L7dfRIAoVB7arRR1/PH+EeuLpd19Z5PF
	 zEN21PGEppjKw==
Date: Wed, 17 Dec 2025 09:18:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v3 0/3] Add support for exynos5250-manta (Google Nexus 10)
Message-ID: <20251217-placid-taipan-of-fascination-20e002@quoll>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
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

On Mon, Dec 15, 2025 at 04:05:21PM +0100, Lukas Timmermann wrote:
> This patch series adds initial support for the google-manta board, known
> as Google Nexus 10 to users. The device is powered by
> the Exynos 5250 SoC. The bindings for the notification led are already 
> in the kernel mailing list, got recently applied and can be found here:

$ git describe
next-20251217
$ git grep ams,as3668
Nothing.

> https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/

That's the posting, if you wanted to convince me, you could link to
actual commits in maintainer's tree.

Please ping me when this reaches next.

Best regards,
Krzysztof


