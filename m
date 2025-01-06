Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ECE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W20Hpo9wQCcQIFLLeltlonfqTa4Q0wWoCnzBw4PzpZo=; b=1x4kNdHq7L5LLGZUCgxobGiuRR
	Ct9O1dNcWrOTkJVAu4q0tGxw53OtB/UIuqHjWy1TeAMWUL2TT+nQgZsOhpfsLHsmwhbONCaESqqHf
	n3x1ur64FLOvNSMFICWlZbioXJ3eZHw5XBvH3HNzRaucygLX0KAyTcgfBZXrOEFJmghcLuhcZgg3d
	XVYPS9SOQ2RBW3vHcmS7rvbBU7334Pz0jgHs8twUMB+DzJSmTZNZk3V0U4s6QkA+AfNcgcNjz47IV
	j4XhOnZjQXzU+F7ucV6Em/374Xr+CNHEtMSLRw3gygNMs68OfRxnw9pJAOY/Wad69u5N49WObeUi8
	PMvajmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhRZ-00000000ORt-1lLv;
	Mon, 06 Jan 2025 07:22:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhQN-00000000OF4-3Hch
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0EB65C5579;
	Mon,  6 Jan 2025 07:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4512C4CED2;
	Mon,  6 Jan 2025 07:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736148078;
	bh=W20Hpo9wQCcQIFLLeltlonfqTa4Q0wWoCnzBw4PzpZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NV8SptgvVpNqK/EG4gHBR8AbU0WvErYoh4ZDYKbFw7HorgAFRo5JrVOtUD9Y5wX/g
	 h8aknVp3HmD4PTpqHvTTKtvCrv3lq9Ic9XdlNKxSzXFYN98mHEbVJ2ntgP/xSNaAdn
	 ZVLJUt0PfTc9bx52vO4QBhi0DxlaO8xGogQHAUvNUY9CfB5cyp968iHwWO0qmRN8ob
	 PgwprwkvEuXzKQs4TnOLXE98rBMR/He0UbODX/rQf5AwduSM+nLo2m4BWkChNitqXG
	 NstOB4xKZGYn87CTun8Obv+w/uyCQdmpNt7/eZNAk091mUlYG1ZdGbcQXO+Mk0syXE
	 AKPaQYBCGUQiw==
Date: Mon, 6 Jan 2025 08:21:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/6] dt-bindings: reset: st,stm32-rcc: update reference
 due to rename
Message-ID: <53g3kssqc4jdz77iiwxvy6fbwha2ukrjh7s7u3upltmpjtp2y6@2gcbhg7n5kle>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-3-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_232119_898463_B6DDCA5E 
X-CRM114-Status: UNSURE (   9.92  )
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

On Sun, Jan 05, 2025 at 07:14:14PM +0100, Dario Binacchi wrote:
> With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,

So you introduce broken code to fix it in next patch?

> let's fix it.

Please stop splitting patches in some weird, either non-bisectable
or artificial way. How this can be a separate patch?

It's the second patchset recently doing such incorrect splits.

Please read submitting patches how to organize your patchset.

Best regards,
Krzysztof


