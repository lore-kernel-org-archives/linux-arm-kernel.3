Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E4DC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZX52qQxRpSTE/icEZ+p8z/t5LMqvFN85Nnzz74nG2U=; b=R3ubp0t2PVCrSY8A6m8cA0iTS2
	GZoQtKTSctZv0BZX5fSWgJO3JOz0tm7rPbepAALFQXmRxLMeh0dJb3bpTwGWQbh73TcPKOh4/U9EI
	5b5f61hLj9N0QDXRyqMlRT88VX7JN570ewTI54DTBbXkq+v239+DK9dnxDkqA6feFK4pFzBbB2Sfq
	qCQRqyCjgal5cuqmKQkJbMZubFUa4Di3r3LOHzsDaKLhId7zc4tvNOnqTx2lj6KhqpAkbvcmPD2nR
	jtXM2NjqoV5ob4wscug3ZorA1iUiYupd+2kLCHvM/ytsHK0AdM4fZbdVba5NLxBd8zb4SmFtKIb3r
	gsrxfBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqu5-0000000E5at-1bGl;
	Fri, 14 Feb 2025 08:18:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqoB-0000000E4Br-0U2C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC60CA41657;
	Fri, 14 Feb 2025 08:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35855C4CED1;
	Fri, 14 Feb 2025 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739520741;
	bh=BFuIYIhdWv+oib3oeVpmwSBMF68TB7x1nKJsh5h41no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjDJMVPmIFSSXfqhSnAU05CyQWeBQxeb5+aTPVpgC44aqfr5Pb7FkkpLaHIAYegiI
	 WRYXuOYPJZR2a1m0fF1ebE1VHjsaEy53j802tlxPYc/8i3IuQVkdwS95/0pwr7Eujj
	 OLe5VQkt+22ytXrR9KTAyv61Mcv+QXsFFy2d2vFq8lvcrgheHyybmJZ6fl35B4mPz+
	 KOgZGxbx4wVU/KYEhBFrH7u+mXw0K6Y1M7+BNuCPaQPnSxwm/zeseTnFAJ/GABid5n
	 VgkD7qPKhRm9agLM1Ns9ZGFgYyOn6O0BOSH/+JG2oYAZqKCeGc0Y/MlqPX5BQDUb88
	 nlYzu/y1zCwKQ==
Date: Fri, 14 Feb 2025 09:12:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: arm: Add Rainier compatibility
Message-ID: <20250214-dynamic-gainful-monkey-fbc0fd@krzk-bin>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
 <20250213180309.485528-4-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213180309.485528-4-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_001223_213873_08388AB1 
X-CRM114-Status: UNSURE (   9.96  )
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

On Thu, Feb 13, 2025 at 06:03:04PM +0000, Vincenzo Frascino wrote:
> The Arm Morello System Development Platform uses Rainier CPUs.
> 
> Add compatibility to Rainier.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


