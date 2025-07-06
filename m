Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C3DC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8BGQC3EzZGSOI3FyUhUCrX+ZNPQ+odHc8p2fXNTVV4=; b=EOX3BapzwSv6nN105vJU2xLVZx
	+0skEFzMNIRmOxnnTznebH2L3pwCC4EXpYnr2NSbAphzjYEo8UL3by/4KxVV9jX9LPLc3kda3Lf5D
	JwKK+y3bMTJAWYGNhGN4YUN5fxhiSpK6eMH67yykmhcT7wgUUhmysyETkiyQ67nazD0yzyEJWAdJF
	lUfeyMh6j+nr9T3PLrv47J/gxOUUZEdzfJNu+ez80cxmLxgLdodtC1siqbDoC7dM5OBqpNq7Zw6YM
	6X21lMCbdHsgHYk/sLAbEmfTRq/SxN1o6A2BC7KsBFZyV/69BkBAwo92pVRjTv8GyxDJNWBqmTeeJ
	qon8SHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLyM-000000004fS-3CeD;
	Sun, 06 Jul 2025 09:47:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLtF-000000004B8-35cf;
	Sun, 06 Jul 2025 09:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CB1943C8F;
	Sun,  6 Jul 2025 09:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D50C4CEED;
	Sun,  6 Jul 2025 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751794947;
	bh=o8BGQC3EzZGSOI3FyUhUCrX+ZNPQ+odHc8p2fXNTVV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cosgfw7OD5N9f1YO5bJbOa83XZ4JMVkSbkguRs80O69y3GGteo9tWkzcOirgCf7Em
	 jkHuJ4elK4UKgwYJZIv9c85KZ17eqtqhc9TNi4vWVaUQWZYIIhG0Loz1g3KBUm0r0O
	 4vPLvs/9gvUO1VX6/VAgfPHg8s9cbX2x7CC5YdRpSArBEKj/cs74U3cnpMguV6UCmh
	 lTo+rJn9VR8CYCAFBKlrAeUBGGQOSTMF3NuxpgnHj9ql8aslnrrdcOGKpE5hrAcqh/
	 ISo2Gp0Xu00Qxl2xozTcFBcvYOqzniK78rehprmr7yQzEY6nkxxczLXTQTovjhBsEq
	 zycQmYuci/gnQ==
Date: Sun, 6 Jul 2025 11:42:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, neil.armstrong@linaro.org, 
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v4 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Message-ID: <20250706-grouse-of-pastoral-bloom-7d79b0@krzk-bin>
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
 <CGME20250701120002epcas5p2c4d728d599a819057bcc40b724881276@epcas5p2.samsung.com>
 <20250701120706.2219355-4-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701120706.2219355-4-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_024229_794700_7E9F5E57 
X-CRM114-Status: UNSURE (   5.55  )
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

On Tue, Jul 01, 2025 at 05:37:03PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards

What is "this"? You add here HS PHY, so HS is 3.1?

If this is the same phy, why are you adding another compatible?

Best regards,
Krzysztof


