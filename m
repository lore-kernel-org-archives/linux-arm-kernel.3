Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC1FE9A741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD+G4Xs0HkI3cn4nOAJhRh3+qK7Kh/N34u7QtAazG8c=; b=f4PtVi7371LU6eCWy3x/aws+ef
	mV4X75pzHSOw8jiMiWyjJJuv6D9O0j21URiYTOxlObDqInyoWLnP/A0G/K7KxXoJmLvdxxsQNdbPe
	f1QBfmwhqonxtgy0rGUD3iRdgUlxpp3lMkW3MibsSYVr1OjH36vpF40x3V1dpMqfUINV5At3qfwIR
	IMzhb0v461jn19K4yNf6HdLelaf4iaR8uKJKQvJ6FPJHIMT6BHXMlRBKyLznn96zZ/xuZvNkIT747
	FSRxtsN395RDPdVARqY3JFEwI+HlcQ/HtH0Znz913wA+KRJqh5RU68uiGtGj4pCpSa3rgEG/M9AxR
	y4pZnlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xru-0000000142V-2JxY;
	Tue, 24 Mar 2026 09:16:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xrs-0000000142J-3ibC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C958560120;
	Tue, 24 Mar 2026 09:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED606C19424;
	Tue, 24 Mar 2026 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774343767;
	bh=+RIij9NEuIuPQtqJ5P/rbM6Rew0JlQNlsK8q3ZzlVV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvbLWtsyRGOYeoAGVckAfF3ELImNKX+HDa7zDf4l9Oq9nCNtEMlxFfruyiYwe5eLV
	 fJgWujeUclti7Gs3nbxuPFQPMxwF1qU0wIVEeMjwI44bnU/iUvDm0gQR7Lf20d7qhH
	 FeaeI/WHcFFQ8KvhljnpPf4UjoTuNPZBJN7Cp46cbKwQqvsN7FYSTlf/2WJ2J3GtZa
	 GhBNOfavdRm5JTlMBUpufETsAtiAp7TUxZ4Q1uigwC/oWZ5mRjCj4bVU1Qd8SR9+K+
	 ckhIfJ2yhVccZDO7u+CRzmVj85CDiRA7m9vJjdqMXjjYDva8dEd6/kHmBb8z8USIT4
	 EUEbBV+J/oNDQ==
Date: Tue, 24 Mar 2026 10:16:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Convert TS-4800 to DT
 schema
Message-ID: <20260324-transparent-lemur-of-emphasis-f3605b@quoll>
References: <20260323175948.302441-1-egbostina@gmail.com>
 <20260323175948.302441-2-egbostina@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323175948.302441-2-egbostina@gmail.com>
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

On Mon, Mar 23, 2026 at 07:59:44PM +0200, Eduard Bostina wrote:
> Convert the Technologic Systems TS-4800 watchdog timer bindings
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


