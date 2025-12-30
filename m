Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E21E9410A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 03:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8a1sx3itCAXO94VA3HQ7U54YmFfTU2DYVOqXzymjEk=; b=fzxm2jyoLuLZChc+P1K6hjDxAS
	FXwgKq/P++NzCD0frz9M0pezGtN6tNFeteWxtNEpAzTz16MU+XifWTxOSb6hswbbE7q3mISuDq3VD
	HTXQ3yRY3+q1sTRc3XM1VvL0gS4ocvyvSUkyq/Ht1sCftqPOHPJG8g0J4BJ7cAWB+pY0sqxadcqnS
	Lfg6bpfundrVK0NVIeEQNTldYdE9WnvwX7/7xzqjvDFapBsGGDEtgIQTzlxEhYgScoS/EoXzgrQrv
	PYOVto8EwwrhNEz32Sl3zJj6QruOJLCe/xo1pOJyxM59eaqCNnkqsx+DdiT498jSlBd/OMqZIOGnn
	/umAHGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPxk-00000004LHT-2b4w;
	Tue, 30 Dec 2025 02:59:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPxj-00000004LHL-0jro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:59:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B2606000A;
	Tue, 30 Dec 2025 02:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5F5C4CEF7;
	Tue, 30 Dec 2025 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767063593;
	bh=+BmXUEiiyeVcTdYDhJWiItwNydOodkCcStv+E5cUu+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6ZGAiJrPHrIhhO4g4V1dz5F2Gww7i1mwBejaUoWSNhAvt9sbFb441e49xcEjLGK1
	 leNRQPlBzQr8aeRVJ4sDm6/bZX86e+GoSZpeCc1cnX4dVeDqSzxW6c1Ug8Vpa+7Ro0
	 M641v/KT0Qg9OrB6lVC676Vye6SzwZYcmX8ZkMDx6QUHOuGMI93uClOay+FxOLDt3i
	 NNNeylg0ae+c5c2aytrnGj9QlU9ImKfqLUBhrQ/hGDA5mBR4Zq6Qrnl26112BR2Na4
	 JgEpC0cMuXtkKOd+THjC2xSyu0hdJjVvB3d0dDyN4uIaFLtEQtJEnFNKD/xt8FMuY5
	 O/IR7Z0IH9DiQ==
Date: Tue, 30 Dec 2025 10:59:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8-apalis: Add ethernet alias
Message-ID: <aVNAJDTkBihpsmi8@dragon>
References: <20251209085747.39009-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209085747.39009-1-francesco@dolcini.it>
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

On Tue, Dec 09, 2025 at 09:57:46AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add alias for the apalis first ethernet interface, this ensures
> consistent interface naming (e.g. `end0`) and this is used by the
> firmware to correctly set the MAC address.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thanks!

