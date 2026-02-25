Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE0BF357D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNMVkjvjTkGu6Co1AY6EibRDsFuq7g4XqsrPhF5h0L0=; b=D8m2dFpCPWQWyNrqmK8XHpUnsu
	4Ss3cm+1PhBa/lK/iJd5PB3joVP9QSgC1ie+HsKhMAicfk2BT5miOH96mYSUMzZpaAdW4XS0/MrWe
	1bRMfS3970RzoRSmJa9rEBoZvq+gvneej9sQ8wSfXi+mtYJrXb0AgOaesOzRGB7wVTOYKxRPbXNtJ
	vu5rHnwos+b8Oc4/KcAfIAhqW43y6OIyWvBJTk/I4aW0/8IOVoWdszZpX4muzu2XBNw/SRkGZhHU0
	dP8/+ofrrJyB9ClbVjwmWvsJi0dISvZ6jNC75QHsVXRZrT3+rhX/r4u29ddbxyc4fjfxayjEHZ/oX
	NvXx+oVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC8j-00000003md0-3OwB;
	Wed, 25 Feb 2026 10:29:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC8i-00000003mcM-1kGW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E6DD43FF3;
	Wed, 25 Feb 2026 10:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C09AC116D0;
	Wed, 25 Feb 2026 10:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772015347;
	bh=zP3eqqtqujdWIQF6IceuD3l5Q6WDeaRV9F9LtPq14CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=furmogx/wRI0s7EQcUD4uc1groAANoK2PzJT0/vtvFuel6kae92du3xIfWIO8FXGL
	 ty6mbQq9u1R6yhBZU5wPI9itx92J5JdSwUzZtCp71zrhdSS9fXjxl6Damku7AHUUuh
	 Q54OcXKZtTNx1EL4OCUUL8zN9Hb22JJ7angSQ4kiASECY/tsJkqMbLObK68eK4Vo8N
	 ZA1IiKIIwDc/8HqdviAa6exIsA3/Cp2ZdZl9McFC8UxGUl4c6MZxIsqMub3JI9qbPO
	 swjW2E0etPEVILdHRXeb7LFbY7WjBUiO2darVGFdZs+1qf2HPkv+H4nNwbPsxmSygm
	 yaXOdDCxZBJ4Q==
Date: Wed, 25 Feb 2026 11:29:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, peter.chen@cixtech.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v9 1/3] dt-bindings: soc: cix: document the syscon on
 Sky1 SoC
Message-ID: <20260225-subtle-caped-hyrax-dc99c8@quoll>
References: <20260224092111.2198005-1-gary.yang@cixtech.com>
 <20260224092111.2198005-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224092111.2198005-2-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_022908_570587_6D182F4E 
X-CRM114-Status: UNSURE (   8.79  )
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

On Tue, Feb 24, 2026 at 05:21:09PM +0800, Gary Yang wrote:
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@16000000 {
> +      compatible = "cix,sky1-s5-system-control", "syscon";
> +      reg = <0x16000000 0x1000>;
> +      #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/reset/cix,sky1-rst-fch.h b/include/dt-bindings/reset/cix,sky1-rst-fch.h

I am not going to repeat my reviews.

NAK, I mark it as changes requested in Patchwork.

Krzysztof


