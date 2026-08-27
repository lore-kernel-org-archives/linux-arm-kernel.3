Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6B3C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dc3jY7P9zE1tJZ9onpOYOdmKX6vk4OXUfdwbcLqkpwc=; b=SqG5fK+mrf8v1kMnu2kbD/farR
	H73OD9uClVr13ZS7XGK2JtRecX7XzF8rgC6pf+1Y1x5ncXE/bYps8L2i8EZlgcY/YOyLfGhPxQ5Q2
	SbJCNMPQbwe8DICY57RKMR0OGfCcxvVY16nUEvk5xu9iZyGNtDAYjfBtka9BX+lx0W+G7zuZsXZBy
	247OgN1pu0jfYcZhFSPf9BxB8RfEfuXJLJvuN6VMoT7I8nzYRi+kNCOkynaOe0KD4w/1oyQg30Ew8
	RLliVjEUplbbNmPt0dfRLB/lwNeDU2fPKTwqkAL0tWyPfY0IglFA076ec2mrHzP6Yh1Yl2vWcc4O/
	b1hVTjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYxo-00000003w4S-2HQY;
	Thu, 27 Aug 2026 12:12:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYxm-00000003w3v-3kmn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:12:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EFB5600D3;
	Thu, 27 Aug 2026 12:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0301F000E9;
	Thu, 27 Aug 2026 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787832729;
	bh=dc3jY7P9zE1tJZ9onpOYOdmKX6vk4OXUfdwbcLqkpwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LU+h2O0iP62CpY9efKy5hlR/te82Ux3do6ydw1u2D2GZjjYZ9kV1DVb5+qOTvmMvo
	 zuC+y3dfE7zppjCEpAWbl00nc3QiTxnW3U16cu6GlOyl05Y9hksSYvfYtqti7soS6N
	 QLJC8ZEjTYZyN06JvCsXBmBAKc1fEpw/acpkvaou4kJncKS+j/K4ZcpRmuhdoZYtRm
	 0EBrMcN0/6EF84vLKNVcAPt5WuybQRo15vGqIjSCkgKECPcaIieE/u5JCDCXBPDuqr
	 sMl2eQVIB95lxUuUsFE0LR5qDzcB+7zDEruEg7wSbIykZyENcj3q/xatC6Z1k7U8GP
	 wniRMeEeU9rzw==
Date: Thu, 27 Aug 2026 14:12:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: samsung-wdt: Add
 exynos5515-wdt compatible
Message-ID: <20260827-precise-fresh-coot-b0d17b@quoll>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
 <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>
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

On Fri, Aug 21, 2026 at 04:14:49PM +0100, Aiden Isik wrote:
> Add a dt-binding compatible for the Exynos5515 watchdog timer.
> 
> This watchdog requires a syscon phandle, and the cluster index should
> *not* be specified, as that does not make sense on the Exynos5515 SoC
> (due to it only having a single core cluster).
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


