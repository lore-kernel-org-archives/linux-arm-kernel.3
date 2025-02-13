Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019B2C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jATwY5YWrt8c4aHpGnAYVPYFJquyZVmC0QHHiT0w4Go=; b=v8VN6USV5ZP6lZU1DdhBre6W7A
	07Vh/gZIwsK4r4ZYw0TfU+HTIJcylUT5/Xj3QcIkWYkxfIpkPlD8R0Ibj0YgIbeqQkIgSqtzS6zx9
	4m7tn16uutmgqaSB6pcHF9nwAjClL97G3aNpaYzK00Taq6U+8D51XkfZyPb8kliRv8gJmGreslJUk
	97bNOlcm9str4iGdU7c17p1BF6V/eaUgQ42AXh1ne8n8VPAvAjtQLj3n2peCIRHg0HP/jCzUkFlIY
	VtfH4WMWQYHtEZwxZ2zX5M1do4m3tVodNalove0h+A6jJHbmo43Jcn3YXC38XrZ4+zyhpKnMSbYPM
	X+KItdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVO0-0000000AQtE-2FM1;
	Thu, 13 Feb 2025 09:19:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVEN-0000000AOSm-0T50
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 013A8A41F66;
	Thu, 13 Feb 2025 09:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1E3C4CEE6;
	Thu, 13 Feb 2025 09:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739437798;
	bh=yzTo+VSqdbP5hYD2auan7a+l2E2+Wwt1B7liKWHLG5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4xw9V3nRsRa6ghT9q+jymjVNL2RKfNOZ2YBFCEGAkzEyQWHExLusTZusYF8k7vaF
	 kIkkKWGJEIZUucKG7cSvSytTwjgRa6WiLUGWQU9LX8JLeVoFewPLUv+ZIvDahdhSpZ
	 E+k/ZRDjgWb0+NwPxPjtHcJuFMxFP3uwgeCBkI+nPdVsrj7vAKNw9LUrMXz3KWvzFm
	 /qf9TC0syXuIecZUGTaFX8/+QF4Ug6oVsyAVx4sQ4uNP23Wj7HKcGu6dA0PkvSyHUQ
	 mFZXoKFadv37t+Cdqk4Kb8sBcTAnJ/3kPdyGqvgCKEVDLwSEDPCLHPCzhnrAxoLAeJ
	 Jl1FczADjsROA==
Date: Thu, 13 Feb 2025 10:09:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Marc Zyngier <maz@kernel.org>, Stan Skowronek <stan@corellium.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: pci: apple,pcie: Add t6020 support
Message-ID: <20250213-faithful-ibex-of-feminism-3aea45@krzk-bin>
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
 <20250211-pcie-t6-v1-1-b60e6d2501bb@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250211-pcie-t6-v1-1-b60e6d2501bb@rosenzweig.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_010959_212788_3FAF8283 
X-CRM114-Status: UNSURE (   8.01  )
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

On Tue, Feb 11, 2025 at 02:54:26PM -0500, Alyssa Rosenzweig wrote:
> This shuffles some registers versus t6000, so requires a new compatible.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>  Documentation/devicetree/bindings/pci/apple,pcie.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


