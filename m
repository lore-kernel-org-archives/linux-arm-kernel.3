Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC36DD4114E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSoMJgyUM0V7X4H/myr2OxM88Dt+xUMW8c1Mz+6vyis=; b=CG/BpFyDps07/MSujgq8syYzRG
	EFNHbcq3i5y9qodKAT40gtzSFgu+zQKSVXB5ol4nBHriOgrAxVw3vcQr+UmJRgrjNL5X4q2H6Ca+3
	XgzXSiXfeiMA02V9z1nn0iSyrnpeSiwFKQzLP8nYZdrcFmL1ZIuPGxeEK6D6mpeI1fZdv+4JWOeku
	UjSj2TyD1T7z81Ya4zhkbFxPArnPVestKNwHuCajqW/Yt1LMjIrg501Xu0pddJm7z47J4Yc8ErFkQ
	2Fjy0eWC6CGXKba/64dpR3mZZwifxL6FpAI2jcF43uZvkgm0bXqJZraZFG+eBWeeFCz0i4H/SlJwa
	17CaoIpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJkd-0000000C4kn-3755;
	Thu, 15 Jan 2026 09:34:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJkc-0000000C4kR-0ImP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F94443DD;
	Thu, 15 Jan 2026 09:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D8CC19423;
	Thu, 15 Jan 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469685;
	bh=TJJWJEH9cBep2QCio7p5rRyRMMqXshoNHerQDcCsLEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rpq9QmXEhO1Y/mmywYZKcLHYqrS4Y9udQggyp3JxZuN3eEYpGlx8CO2eKzUt4gf4R
	 5ZUzEhkv8s8+cEMEg/pXboVo55W8N4ZbHQKBrdE/E+Fne8PpAmXjre/B+lelNaiWOY
	 Szsr6VtslznA0YPtjTrkGVj7YqDaI1tp2+tFfRTTtgS0nO8D13V/y04fioC3Ti/8uS
	 xC/HD/0JLc31B6coh22NuUxnPkyWsPpA17P5MgPDrHvCVsviTIYO27+ymW1YDTaJTe
	 yR+ZKwpN71dYJvcTfY6DmDxGsXS2zbi23T+DW0lpRS3y3MnB0RuoOP+OjBtdERuPfl
	 VTjDhmKKVH1oQ==
Date: Thu, 15 Jan 2026 10:34:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add Asus Kommando IPMI
 card
Message-ID: <20260115-illegal-sweet-skylark-bc2a92@quoll>
References: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
 <20260114-asus-ipmi-expansion-card-v2-1-12b72d20a9b9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-asus-ipmi-expansion-card-v2-1-12b72d20a9b9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013446_154877_59E9FF5A 
X-CRM114-Status: UNSURE (   7.03  )
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

On Wed, Jan 14, 2026 at 11:31:07PM -0600, Anirudh Srinivasan wrote:
> Document the new comptaibles for AST2600 based Asus Kommando IPMI card
> 
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


