Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE3CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTtYdzt++o7LNQkRGgVLTZCgurQsuIlVwwxoXNqgWvk=; b=Mub8lTfvpkz64VTdS9Eb3P9Emj
	hJpcnPDe6Xsxq+GclFti90F0TuxGbwGnPKPjc0M2+1TZppxsu5ml9A5UylXSjutnjxm8FWLEL3Zmu
	oRDuvtJfVXfnJgCNjSadT4Rl3U4j4x0BTG+KYXblFc0n9U2aGmJAo3HwcGpbJo5EiUvOIxWbhp9Il
	ktPpYxo9WiJkA5J49EslVF0lYT9KgbsM3xCXEIhnfu0WxEeO2I3lrWqs1TTHVLWVe+ZuCPUKQHgNx
	47nEndUUupAzP9oXL+BM6LCNDwPPaSjM4V+0ooYc4ThsUF5aSb+4GcdXLm5U+oqJiX1iayV6/MEA8
	rjaeCu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluc4-0000000Bp4J-31B4;
	Tue, 12 Aug 2025 19:24:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uls44-0000000BS8d-2kjf;
	Tue, 12 Aug 2025 16:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11508601E4;
	Tue, 12 Aug 2025 16:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4A5C4CEF1;
	Tue, 12 Aug 2025 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755016891;
	bh=RpDjRJiLb5VsAKP90NEwluXA2g+8CuZTXLDSu6vFNqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sSpQX7Xqp3Ga/zn5ks20ncAR+XkGXgnA4nm1swQ99t9DNtzMQOHvN76Q19gay/zVQ
	 C2iEI3Ufb1kU58Ox0VUh/MrFNdKvSyHCTCS4s442NkDAcD4Ci99ML5WVRGfCtXszzn
	 7TdgajRF6rJQqnEauVPpNpRluXlM+Z3bAhEfq5KLRi8FyflnSY2ARCWVS+LYHxP6tm
	 VL2dXpiXliH+I+s8u6HK3mJiLqqnMvEdpr+IXHzOe51srWLJff6HgeGK6VmgkkUz0O
	 Yp6THY57GW3zSm7XUWmJ04nYK5O7WsVfaLZbv/ehptzPhnPsp9BtH7hk7+nmmU3NsP
	 RDlbB5ihTZ7jw==
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
Subject: Re: (subset) [PATCH RESEND 0/2] dt-bindings: Drop 'db' suffix
 duplicating dtschema
Message-Id: <175501688581.633310.2083661450340253592.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 22:11:25 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Mon, 11 Aug 2025 15:54:02 +0200, Krzysztof Kozlowski wrote:
> Resending because all dependencies are merged.
> 
> Please take individual patches via respective subsystems (phy, leds).
> 
> Previously:
> - Link to v1: https://lore.kernel.org/r/20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org
> 
> [...]

Applied, thanks!

[2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema
      commit: 78a474b5a31a25e0a77e50df42be925f7cb575e6

Best regards,
-- 
~Vinod



