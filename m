Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96819C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOMPz5OsS26T5Tc4JhmiBLzcnjBJf0XRvgK3JSJjXgg=; b=cfPron7ooqG2H3MB2DVUPKPnjF
	WK8nDuAxCzkHIb75xrDFy9eOZ9oixCHfJ5lao5Hbp7N26XciKdyPjK5WngpyD4TfYkM5pbZtISLOA
	PERnuW1U2dBtpLHYZHENPmA/qp583tGUWbIM6nEiN951dMwZB7/bwdoZQDVXbBD6deNINMfl0pkW0
	rF0ZK8IJC06YdH8STNQtcfrbS9EVtitpVCh+DLfAPpYA3q7j2g/jlVqxNcXEzudZXC2YxERVLA5ar
	6WbRWQTY4+sZZT7t2u/uPUpL/deQjkLjSyR6NR6IYXJOfRB5aUzp6b/g5VV7CDBhncwPLwedYAZ0z
	PkpBDPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Qv-0000000GtZP-2Pck;
	Fri, 13 Jun 2025 15:35:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5X5-0000000GiOS-3X9W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91B8C447FA;
	Fri, 13 Jun 2025 14:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F96C4CEE3;
	Fri, 13 Jun 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825447;
	bh=i35Blln3gEa4SQHbL2VvB+ztpaiUcqNUVdy5ebPitJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EObp1vTwmIjdcn/t6ZGh1gZJC4KwqSfesjWJnZfRt8ARYLRrqALgK1azomN+h6WVI
	 j5t2crKErpAUJ9tYg8dMfe7H9OORa2MvGrFTUsSm+nq+Kt8dnA8UWeVO7Srnhp+eIT
	 3mKPnDt3ZY+gVqaeRCwZy4kcvtPp4O9iosGNELdqx9Ilp2r81m+EM0kNDBab6S7Oab
	 LDXkijQNgiPuEitbm/OLqvTBY3Kb/ZkELC70doQ0ZyLyQCv20EntCvUudqtcPyECVr
	 cItT4FkqPxYc4xbWUCuru9EUGI0sD6uxecIO9mNe5MCo+zBeVX3D/N6P1VAIJtnm2N
	 Gz1DOJTnCT5Mg==
From: Sven Peter <sven@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Marc Zyngier <maz@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
Date: Fri, 13 Jun 2025 16:37:13 +0200
Message-Id: <174982533895.547352.6090659751733022479.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
References: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_073727_905003_B4AF22E4 
X-CRM114-Status: UNSURE (   7.03  )
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


On Wed, 11 Jun 2025 22:30:31 +0200, Janne Grunau wrote:
> Fix the following `make dtbs_check` warnings for all t8103 based devices:
> 
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: $nodename:0: 'network@0,0' does not match '^wifi(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
>         from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
      commit: ac1daa91e9370e3b88ef7826a73d62a4d09e2717

Best regards,
-- 
Sven Peter <sven@kernel.org>

