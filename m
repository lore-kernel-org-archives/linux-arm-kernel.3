Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D3C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VD2KFnwD9ka8go5Vt6Q2d+aNS5659F2LUTDccgn6XM=; b=VQ2UfcXyRDyPqHuafMBXgG3g9c
	1//yGg4g9WkhXl+NQfa/tY6WQQ+uZ7i7LEoqtmu47lAAmXNZO+5swwCpAfpP5gHThtV3MrU5i2+5q
	VUhMr5BK9SAEhut4IAsJRsGMfgGlsd1aBKXul3jhjPb0BHTrzPnZG3cwGleJk9hl00g0FEtX8vbtr
	V1Ati2kj0gzhjflyZzvSDiPx6rfk526J/SYZzaKMOPhp037+ttncHG+BmZCfEAEvKkk4vMEw/Qbkf
	U+7h4yHeToxJxdhhnzOK9jiFmEUVToEWxL3J344nebNS9stRRK8VLZnVbBhTn7vHko2YkP+dpFrg7
	pozeU3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGrV-0000000FsQr-467T;
	Fri, 27 Jun 2025 21:43:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGXd-0000000FqOr-1fji;
	Fri, 27 Jun 2025 21:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13E7F4664A;
	Fri, 27 Jun 2025 21:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB0DC4CEE3;
	Fri, 27 Jun 2025 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059404;
	bh=eJFxYUVuTiYmn7RP5+jGfs2IdBuQ1seJOqX9HC6rdao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZaVSjkBqdnNT0peaZv6ETmCYkq+FDmct4kamm4Gftide9hPz1b6ZIZ0Z5OAzqEMX
	 LJ3R5wCvC+FxOC8l9kO0f94lQh0mO8lgBZlGr/7cIXeg2BjQEN1/1km6EuzS2Uj6jM
	 QpXp+oiPmpju1r0CZFoI4Gy5BRBn7a6ZBllXipZupSAWKWwbF3gHJFNPAUA+dHufmi
	 HMcVStRTYoSPDZR7IvHSgYkujoFqxYcETVGCHatR2kpIHNjpxo5hM9Q6vR44FDnJPs
	 SQOxL0OOdtyMpZR2g888TF1EcnOjaqdRHO9UTB1UAtGZR1ovHm3AjMnTawrF3tArhD
	 EzJ1QzegVxM8Q==
Date: Fri, 27 Jun 2025 16:23:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: arm: mediatek: add boards based on
 the MT6572 SoC
Message-ID: <175105940347.167208.8424905965473353735.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-6-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-6-f7f842196986@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_142325_455991_5D01B75D 
X-CRM114-Status: GOOD (  10.16  )
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


On Thu, 26 Jun 2025 11:53:59 +0300, Max Shevchenko wrote:
> Add entries for the JTY D101 tablet and the Lenovo A369i smartphone.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


