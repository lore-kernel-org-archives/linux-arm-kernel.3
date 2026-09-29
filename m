Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32E9C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 05:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jP7Iz94EcMRlmpH/lYu7Szi8/9fipIFrX8rZMu8ViE=; b=FEfEwtxtqi7gLfiJSQHhYywPpg
	Ls9z4XIuVyLtnTDoI/ie4wkOg3F2EzQvAyhqt9wwoJ5EMMGIcBXzq7p17s6O/j/JwKt8NpFSuHsyc
	671jgBaonLln3FF4rsBDFAT0bZmNg26cR5RnYgcnvK/LTkN0pZUAbxoV1N/wtbPOvzB/wasNVHfQu
	f/5HEaDaIXhHUsbrLAQRpOPWBbQ8fHJc+5Rxjwlp2G/BvLMe9HqxIG1DNQbSxJwHTaU4eXAIJYWFK
	r+/KAKbIs38Am/J3FA6MCsNo9i+wX51nWjrYOTfqTm53DguSLYZyWIj8i0OBbaRC2AhGtI3pQAA/O
	ozvcdcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQiW-00000002OEc-2JUu;
	Tue, 29 Sep 2026 05:49:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQiU-00000002OET-30Ri
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 05:49:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E127260A59;
	Tue, 29 Sep 2026 05:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BE61F000FF;
	Tue, 29 Sep 2026 05:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790660965;
	bh=5jP7Iz94EcMRlmpH/lYu7Szi8/9fipIFrX8rZMu8ViE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FbK2MAkrjBPSbZt4egTf/PpmW5qCI3MqSlCwyQbwLCKwKByspIZ8TrcCle80uB6FN
	 WeyQ3MoroDXx4rsao3WUd+M0tgDY+Ibx205oMW0NSCJ6LUEFzfBvK5isvWmd1Q9HwZ
	 faCAbFC22ows7gG6tcglsFln3h42Pnhfl6PGmYpKUUMuukIBcTAk6R7zq604lz2LgY
	 Jmay+6QZQDaxkElmhN0TnE3qr2TB6IDXhZpEu6andhwcpPke/InUOta2U0WOm5nTvt
	 SQ+lIk9yRdcrAfzmiabQMp1YZkba/TUR8rIrfKcrR1h9xLgGR6r17eMQlWn2ZnJVUR
	 NyTpE5uJx3H8A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Waqar Hameed <waqar.hameed@axis.com>
Cc: kernel@axis.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <5e580526e283d90c2b4c13ef5bc0633fd20e41a5.1790629313.git.waqar.hameed@axis.com>
References: <5e580526e283d90c2b4c13ef5bc0633fd20e41a5.1790629313.git.waqar.hameed@axis.com>
Subject: Re: (subset) [PATCH 09/16] arm64: dts: exynos8850: Add missing
 space in compatible
Message-Id: <179066096156.19907.15266857263274662254.b4-ty@b4>
Date: Tue, 29 Sep 2026 07:49:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Tue, 29 Sep 2026 00:38:20 +0200, Waqar Hameed wrote:
> Tabs should be a space between multiple property data. Found/fixed with
> dtfmt (Devicetree Source formatter).

Applied, thanks!

[09/16] arm64: dts: exynos8850: Add missing space in compatible
        https://git.kernel.org/krzk/linux/c/0e5c0ebc0faeaa52da10feeb159dd8660a0b2f4b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


