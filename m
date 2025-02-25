Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE04C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94OeM48RTPPed5gjDPybGnwIdjCEQvzEfbBCPtxxST4=; b=XSlShxub5/fO+Tt9UGtcyFmgn3
	5dcTUxAkDjB+yWhkEsYfQrtc0UnxTTRsEyJOFJw4+e6jIQtU8iZYL5waYOCj4HK5f71a+dY8gJT4o
	734prQNtF3R/HvEsJ7+bgFQ3tuCL4xXqUxKOrZUdrPZlu2tkuA95LERhWdH+0Kk9s4pEzF7EPpcKf
	thTIT/cQxYq/T/lq169goqBIyhd87NccqCL9x4nXxCKyx6RaSD74pIDK9BMeFPBrL0HUf38656Ae1
	ZYQalwEDsAcRdQIA2p0WMBX879Gqk8LTBb7vjeiBeUc9Lu4epvQl6KURvBE1nGYxF+oakoQJxoF1E
	oL4LGPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuER-0000000HEnB-0f9t;
	Tue, 25 Feb 2025 12:40:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtdZ-0000000H83c-109V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:02:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C94A05C66DD;
	Tue, 25 Feb 2025 12:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7AEC4CEDD;
	Tue, 25 Feb 2025 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740484928;
	bh=yORW2iO3qKiXB1CP0vLEWVQzUX4QPYnSqxUO9k6Ec6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXUECgvxZ6dw2v3p6USt0hLALQJ/AnxoJFTYEWdQ26slxWBaxwNePPXCtZpAiY2qh
	 P0t5gPSdiCs8UNzxjyApcIsaAAblvRZBCf3cJOJMUwbk+Eis69qwl4qesj2Rd4IOA2
	 IDc8FIu4Fd4att6obvi5HD/pmKcFQotVywGSswv9uf1fOTXCdDieWjYjXhJDV4lcdH
	 UgMSQyuLx8LtrM42QAAx8hoZeTKd2wCzXkR8Ns/+Q/GfCmLyE0wcnMCxDLrFN+bX2z
	 8RQ4CBU7yru+Y1gXp7fKzLsvmGF5a40eDcHxbjU6gvhz5JfTnKql1lDqNkHFq+VR3h
	 Tp9oIM1f6veuw==
Date: Tue, 25 Feb 2025 13:02:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wbg@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	olivier.moysan@foss.st.com
Subject: Re: [PATCH 1/8] dt-bindings: mfd: stm32-lptimer: add support for
 stm32mp25
Message-ID: <20250225-outgoing-scorpion-of-music-be0bea@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224180150.3689638-2-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_040209_319405_C6D27F78 
X-CRM114-Status: UNSURE (   8.12  )
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

On Mon, Feb 24, 2025 at 07:01:43PM +0100, Fabrice Gasnier wrote:
>    pwm:
>      type: object
>      additionalProperties: false
>  
>      properties:
>        compatible:
> -        const: st,stm32-pwm-lp
> +        enum:
> +          - st,stm32-pwm-lp
> +          - st,stm32mp25-pwm-lp
>  
>        "#pwm-cells":
>          const: 3
> @@ -69,7 +76,9 @@ properties:
>  
>      properties:
>        compatible:
> -        const: st,stm32-lptimer-counter
> +        enum:
> +          - st,stm32-lptimer-counter
> +          - st,stm32mp25-lptimer-counter

Driver changes suggest many of these are compatible. Why isn't this expressed?

Best regards,
Krzysztof


