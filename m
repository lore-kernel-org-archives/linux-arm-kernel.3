Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819EAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KV2r0YrTTL+9wA2XusEM2hZdRtyjt9Q1AO9mppdUNbM=; b=0MVQ7ENaY3Yk4+UB98mESU/tLO
	hlrfQBaUtJrU/f4zW66Ruz7MoRWzpueHq/MVNwOalmJ+sP14FHD+Oo/vwngE7j/eNRCFeYtWPMyC0
	mqNQ93xAh9EfxMXoaU3PSgQUr7XBfvGKYIenYCxBtDuzpnHiFwwl0Yr8A1N+iqcCs4HfRPpQ6RZj/
	BkzBWBgJMkRfJI2y+HDRTKBrhhgX1CH4XRtAjAyerRHLeNLKm1kA1OtMCcVF9NGI3lWq8seEUJVIn
	jL/JhKYzE+NOi4hLYqxlUXeiYnIsUoU3FBkZhvamCjrYjx2lvv9JjH031SkVeJRMZlMDKOOgnLkG3
	bzRF5CoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqsf-0000000E5BI-39Pa;
	Fri, 14 Feb 2025 08:17:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqnw-0000000E49C-0wbK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F281C5C5931;
	Fri, 14 Feb 2025 08:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BDDC4CEDF;
	Fri, 14 Feb 2025 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739520727;
	bh=pytx/AVfI7OMUgpHFJaLrLw4szRT5vok7RmUGdfF/YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJBDnem2G8p7H0wp7/3KdXqCjJvu7jaaFQK7Ubi6wTIVuEn8a1ZdLVWSpw8+3irLg
	 g/0geKZxhvomJAW9EQVE29Oz1SaktEFzJYwu+qiXXqu5/ut/cOLUSVxQIhM8Zs6sCw
	 YWcShuIrnVfL7arjQmuljE9XEli5QDAsReYLIvm47IAfiBVu5h7o7+Fuc876AK5xXy
	 ETS/F54s5TPzmdJ8Vy8WWoa8Wc6XbgSOKBD/UBJOXgoozaSHbIpklaA/LAWC+z7udo
	 gcVRWSzU5zx+QqoTZLA4A/4Eid/8FYQBEkIibgs9oY9+pzgbFfV+vjl0ZwE9gSfXtz
	 PkTzdeC8mMGlA==
Date: Fri, 14 Feb 2025 09:12:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: arm: Add Morello fvp compatibility
Message-ID: <20250214-utopian-griffin-of-innovation-fabc40@krzk-bin>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
 <20250213180309.485528-3-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213180309.485528-3-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_001208_308876_03991EC5 
X-CRM114-Status: GOOD (  13.31  )
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

On Thu, Feb 13, 2025 at 06:03:03PM +0000, Vincenzo Frascino wrote:
> Add compatibility to Arm Morello Fixed Virtual Platform.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> index 40e7910756c8..e71e3e33c4be 100644
> --- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> @@ -122,6 +122,10 @@ properties:
>          items:
>            - const: arm,morello-sdp

That's just part of the enum here.

>            - const: arm,morello
> +      - description: Arm Morello Fixed Virtual Platform
> +        items:
> +          - const: arm,morello-fvp

Best regards,
Krzysztof


