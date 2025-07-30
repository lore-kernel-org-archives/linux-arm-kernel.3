Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD651C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 22:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iO9RYEMjounlf7B9Iu+6tM1rmYhk9c5Mv4VgYq1OqyM=; b=C4dZscgrnxKqRA5+zEcz7GZEQi
	3P/bGMF+1BiKU9a/RjI2fbtuDWU3yrqbY/5nKdnWZ9avXBZwwiJfP811TB0DZAwLo6nK3AgAWw5Zo
	dMHUrpZBhk2iuQxCqGZGFw1l6iItUbAZFIhgH9Ek1jCMHSaViAt175+DhlkPwsD8yLfJ5RBdZ99zk
	Hc7Y2XZaYy7necZte05yimY2kWjIGprxufd09dJ8kLPEv9ilLp0xlftf0vjXky5l/bTXCP29dEXf1
	ZE/yt32LabUUS9PKYdHpFWHPp9dt+d7rUf5swPhj/La71dH3SRc1SPYe5ABt1fAYn3PKZ5EP+kMre
	V495pBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhFLr-00000002ZDA-0oTv;
	Wed, 30 Jul 2025 22:32:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhFJP-00000002Z7G-1go6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 22:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63B1E601D2;
	Wed, 30 Jul 2025 22:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A7AC4CEE3;
	Wed, 30 Jul 2025 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753914613;
	bh=Ty5hOFOCnqR3+TxmVt5Wrhxdf9KjsnmTgra0uxnT61E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiFik3lQlYH2t1kf5pDvKffiyH4xQp6wAKUJXocuXk+lCYMGQbQa4XtSu+xypdwdG
	 Jx4sou2B3FtFAGUbTqwg84DbujP7thW2iLlQGf2J1rpGBEXiZFWWdokkK/5suUYjtd
	 mi9aRETfoTE9z2gEJMS4yh+mmP4W3K1X7/RowZMIYWjs804Sg/WtiQhclewhZE2mfV
	 cxqaJGhsnlT7LLgyDJljkVrlrIDF0PkAi24p+vwVjO2XeIwpwImwZNbYz9W3efJtYe
	 yB+jk93/JQjJN3pBnY9WxcR2VdhfWl6l5apwAQE18V//PQCHSBW12o08HjnRtoYcmJ
	 ZObIs6Kmneh1g==
Date: Wed, 30 Jul 2025 17:30:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: memory: Update brcmstb-memc-ddr binding
 with older chips
Message-ID: <175391461181.1819073.14169607307672802524.robh@kernel.org>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
 <20250729205213.3392481-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729205213.3392481-2-florian.fainelli@broadcom.com>
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


On Tue, 29 Jul 2025 13:52:12 -0700, Florian Fainelli wrote:
> The older MIPS-based chips incorporated a memory controller with the
> revision A.0.0, update the binding to list that compatible.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


