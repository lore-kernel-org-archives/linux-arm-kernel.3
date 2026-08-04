Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1CEC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wq1FlBG/lmdz66O0zMM3OsUFUL0A2mg6NpdxD4ZZDek=; b=EPA/9xGAdNg5MbJkqC6wYkmsHU
	N3939C01ff7GuMFeYnGhCHky8DVO+qQ3Gncc23lC0/LBeYvaXcuuZbY70vyexIpUQcLIRe5Sl9ENR
	PO9IhjMcvDAdAR9p+GNNoxOv8w5q2zjmLQdVUkVxIbJf5ry1ODiEFduQ80lLrbQCED9CIWwcAhLPn
	JxGZu0mvuoq8iDAJ9jQfOiG+J3v5TX1pQlYzH5ZuDbUspr9CCOUhtu48H/emd25XxFH9I2jhgUJb2
	XMzJSdiF/DzmuZ1RAYNpYOWGcCzF86q0W4rwqajCn+MyPSzS/l+IkWhxE/f9Nh/VzTZuExZnuFWIj
	+rxtJviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr93i-00000001ABA-23Qt;
	Tue, 04 Aug 2026 06:55:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr93h-00000001AAq-29qo;
	Tue, 04 Aug 2026 06:55:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 211F840F64;
	Tue,  4 Aug 2026 06:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F37A1F000E9;
	Tue,  4 Aug 2026 06:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826529;
	bh=wq1FlBG/lmdz66O0zMM3OsUFUL0A2mg6NpdxD4ZZDek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oQKrgxrHMigV6DuOp2o4WRqi5lpTPCF8jZ/FtoRGBEvWrN2slXQDigfeIvpjCVS0N
	 iFvi44VURJvsuMAN3oMNokVPsVm2QyIy1nZLpFwSRjkky/KmRCu1wac7o/AiUTb3SC
	 ju2kPCQ6C3rnMPy7Q+OPA/kczwol0x94IcIXMk3i2jk1vymkyKKbQQ4Q2yxzJ1RmAP
	 idDDD6NkW0nxCeeZ6fGUL+nP8jQDfOjUwNe2MPFxG9wLxwQauYvMpHkiPBbnD2uole
	 nMeD++ByDvmrvLlOh1YWNzj1ZWfhSLlGq5VOGn2b3kyWnwJihrnEUXdDadtQxs8ri5
	 To0ZUN4+6zt7A==
Date: Tue, 4 Aug 2026 08:55:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Fabio Estevam <festevam@nabladev.com>, linux-rockchip@lists.infradead.org, 
	Jonas Karlman <jonas@kwiboo.se>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Albert Aribaud <albert.u.boot@aribaud.net>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Jeffy Chen <jeffy.chen@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, Rob Herring <robh@kernel.org>, huang lin <hl@rock-chips.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico Mini
 B
Message-ID: <20260804-precise-mutant-termite-c0c876@quoll>
References: <20260729133609.3465563-1-sjg@chromium.org>
 <20260729133609.3465563-6-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729133609.3465563-6-sjg@chromium.org>
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

On Wed, Jul 29, 2026 at 07:35:52AM -0600, Simon Glass wrote:
> Add the compatible for the Luckfox Pico Mini B, a small board using
> the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


