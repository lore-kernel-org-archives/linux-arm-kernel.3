Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CBE60A2609
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xz+AMk9d;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYwCaJ0R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KC+tsMxL27T8X/Np0Fb1tWZeOW8IxFTBoi/UezmyYRg=; b=xz+AMk9drwZBZy+dKlyGtVC2jP
	TBHiUWKIG9jghhmm8NQB/GxVJWdG1geIdqdxblRfEynYQXVMsATFDJ9wqFLLMf1OnR6yhgX0B5INz
	tepiGYexVp0etnML0WMYXJ4q75xtRPc69FONIzLqYNelUyMLt2m05BAUrEuk4FS/E/iWsl4YN4e3L
	1MwJK1oZ+TV8ZB/TSoEVXkCSmpC8oyoLbmXEhKEpSY6hCzMC1Gt3ElwdYovysy59LTm/VotPD6VKt
	hIYKWC+f11/Euc0p8IsbRrW7xuzIYsck+faFCeCu+edADXjgcPWp6+hfCNpAhc+GRiAgI7okInipq
	ilxBwkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ87d-00000009Ypm-0cZi;
	Tue, 20 Oct 2026 11:35:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ87c-00000009YpS-3AZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:35:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3539600AA;
	Tue, 20 Oct 2026 11:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2707E1F000C4;
	Tue, 20 Oct 2026 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792496111;
	bh=KC+tsMxL27T8X/Np0Fb1tWZeOW8IxFTBoi/UezmyYRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UYwCaJ0ROq/utWY4xpPuooyxMbQRo0ykWMVu9P2d28ECMV1HhSYPgVJj/ocpbyhNn
	 BU9cWCF8bsTbVQwhv4e/XXWCNjtjgiv1XGb5O4xwR8szS65CDhXevP24Pa6+W8KrC4
	 GvsLZbXEVOuQYl5+5ALmkweqkbt7xd6Pv1Kh0ZXPzNltbAIUZ0+f3acAhEFtW8/bnr
	 /Y4GYmMjF33eUML1zli1IoUMnSmeg1jeu7m/1yMd0xIs5pHtHEvQqAycCYx2liVywR
	 1zrFbzK+sd+BFjhpht6JMXRomiOuwi6m6gGqM0Z57+HQ4DwQYW6Qh8RWkvlzvikg9T
	 ES7n+e/Ea+cJg==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Primoz Fiser <primoz.fiser@norik.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-watchdog@vger.kernel.org, 
 upstream@lists.phytec.de, andrej.picej@norik.com
In-Reply-To: <20260924065044.368341-1-primoz.fiser@norik.com>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
Subject: Re: (subset) [PATCH v2 0/4] da9062/da9061 watchdog timeout mode
Message-Id: <179249610684.1885397.15733265210505859748.b4-ty@b4>
Date: Tue, 20 Oct 2026 12:35:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 24 Sep 2026 08:50:40 +0200, Primoz Fiser wrote:
> This is a revival of a series originally posted by Andrej Picej in
> December 2021 [1]. It lets the DA9061/2 PMIC watchdog be configured via
> the "dlg,wdt-sd" DT property, to trigger a full SHUTDOWN instead of the
> default POWERDOWN on watchdog timeout, and enables that on the PHYTEC
> phyCORE-i.MX6 SOM.
> 
> From v5 of original series this resend drops patch 4/5 ("dt-bindings:
> watchdog: da9062: add watchdog timeout mode") because it already landed
> upstream as commit 382256b219fb, later converted from .txt to YAML by
> bd888a4377ae. Thus dlg,da9062-watchdog.yaml already documents dlg,wdt-sd
> property.
> 
> [...]

Applied, thanks!

[1/4] mfd: da9062: Make register CONFIG_I writable
      commit: db52dc6f9aef97ad7f9738b5f595f42299946793
[2/4] mfd: da9061: Make register CONFIG_I writable
      commit: 630751941b7488912fbe432c2412b8c9fbfaed9e

--
Lee Jones [李琼斯]


