Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433DCC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lhb/LV0tFywrD4M4T8wdOtimFY2s4NYORoIT5USvYR0=; b=XWmAeFdozPNY2gdkCy/MqbwhdC
	2ufiA5TnEoeqdZM5vaVfpI7wGjCZ5nF3o4Mr6ErMK7BuRBTgKg7PX7nmVLYw3Zfk3pd1QWaqohz2k
	34IzZcfptDQr1X5cc8stbN+TDrkWFYdhFc5sPTK9QsmFTsMdwyU2PxZrmpdzFwYpAGLZDRt1FsIG9
	CoJeY3/aPkTmG0l9gGAWMj6LiqbZ9WfuXP0SnU/pXRm7/wW4inTo/xQWyaUHOjZAsB/+rJktttP7q
	an5k40wGZ2GgG4f7zoe2BX0xDrMHS2hWLDmS5WgGdjQTtAk3CqBrpnXLX4sOkdOw+w8ROauLMlxxh
	N4RTS7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0hf-00000000fT4-41r4;
	Thu, 08 May 2025 12:50:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Zp-00000000du7-3Xbw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 032C15C62CE;
	Thu,  8 May 2025 12:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F01CC4CEED;
	Thu,  8 May 2025 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746708133;
	bh=+PxvKs9oji3vMXT1W8j6+sWv/09YysUiS1p4dKCTMXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nyf/ypemX4G5LVHVYs2v3oFsgLlCudgXGlS/vMzQRaXNOFIefyXm9WVJfbHYYt2bn
	 4w9VVxvriAJVCzlTJftr3bYsA96srBTIYBm1UFj81u9YcHU70cbuNSExJLsjQxohlF
	 yxNy8vw44aGubKxm/svqpytInJ6rarrvlyqIrpRmhgze64pTFUbrsu3/g34mqvHiNH
	 BlltD0HRGdKy0B/5ixW/rLGMwCmxsaw5IbotS/a6vRQdSTaW1gk6LR47R26AlxvMjj
	 aTm+0e8nZNvDH446IIJs6V1Ri/4Qf+QVPV6eJMXT3pmenT9ffAosxjPslNrk3caTht
	 5lGv9IFJkx1ew==
Date: Thu, 8 May 2025 14:42:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <c36emmsymieo5npmv5omd37yumkmmai3hozkypc5p4u3apensh@yb53oh3mv6qu>
References: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>
 <wt7du4fu44sxut5i4ymhmb4akhm46btm7yszz6xbya2sxq7gdp@al24jhhqdz5c>
 <dcd6fe48-9f2e-4bab-a791-a939a32cc184@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcd6fe48-9f2e-4bab-a791-a939a32cc184@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_054213_921855_4BDC0771 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, May 08, 2025 at 12:33:21PM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 12:31, Andi Shyti wrote:
> >> index 16037aaa770fc35efb45fc26555afaa5102e2640..4d18afdaf12bf6a5956793814f8db39b34074a12 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -3464,7 +3464,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
> >>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >>  S:	Odd Fixes
> >>  F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
> >> -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
> >> +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
> > 
> > this has caused some conflict. You are based on -next but i2c
> > hasn't received some of these changes, yet.
> > 
> > Anyway, I fixed the conflict and merged to i2c/i2c-host. Let's
> > see how it goes, but I believe we will receive some complaints in
> > the next days.
> Yes, few trees will have similar conflicts here. Expect them also when
> you send your pull to Linus. Conflicts should be trivial, though.

Thanks for confirming this, Krzysztof!

Andi

