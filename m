Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0582C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQseU0INy9pAnalCdu+SB5rFioWoFzf8Tu+vrW3+RfU=; b=ghsMlqYXSUyBGLOY74MsahLJnk
	uw4XWeTv+c3X/BUhJ3ZvNM3tfcEc8pmERSl9ngsVd79GJokIfw7PUOmwz547CtK6xSo5Z1koWz6f6
	iWf6y5/Z/piBWZjpLky0p3R0U3IPtbmgtNAhQKbnThS67eUxVLc9sJCKKBarj0l16e0vCpNzPS3zM
	yJwD7DKeNCADxIwbGyiLxvHs1A4AvZ0/WkcBrpeDKYpDvE1Heuki4bWE1kDfPhH2wPb+ZnPQa3Juq
	xy9kqSQk63A4JiSEX/6qWyzwf+Ghi7DUwTDXBYBE7rVT/lyESS7zirZbcX/DvvWGRhJmYfEmQuGk7
	ZzTz4oiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYDV-00000006a58-3j89;
	Fri, 21 Feb 2025 18:57:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYBd-00000006ZtK-0uqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:55:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F53C1C2B;
	Fri, 21 Feb 2025 10:56:02 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1BEE3F59E;
	Fri, 21 Feb 2025 10:55:42 -0800 (PST)
Date: Fri, 21 Feb 2025 18:55:40 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 04/10] dt-bindings: arm: Add Rainier compatibility
Message-ID: <Z7jMLCd4i_jtpAA5@J2N7QTR9R3.cambridge.arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-5-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221180349.1413089-5-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_105545_297835_789C7B53 
X-CRM114-Status: GOOD (  14.69  )
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

On Fri, Feb 21, 2025 at 06:03:43PM +0000, Vincenzo Frascino wrote:
> The Arm Morello System Development Platform uses Rainier CPUs.
> 
> Add compatibility to Rainier.

Where's the TRM? Are there any known errata such that we might need to
know the MIDR, etc?

Mark.

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 73dd73d2d4fa..2e666b2a4dcd 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -177,6 +177,7 @@ properties:
>        - arm,neoverse-v2
>        - arm,neoverse-v3
>        - arm,neoverse-v3ae
> +      - arm,rainier
>        - brcm,brahma-b15
>        - brcm,brahma-b53
>        - brcm,vulcan
> -- 
> 2.43.0
> 

