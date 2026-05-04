Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C39AFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRELStU0P7h6MNLBC0m6z54SkJvqk3Mt5xdojOaDdHQ=; b=tTgmpeB+bmMm1g/8LcsBK1uDO0
	SaiCocvMVRqqIdePpgJsBNW9mpr3Ko6gWUrcmuB20boemqp93y+ka762jhvEDicOMlzScybIKo9Zy
	9M+qrXaDwwKmhgd4Tu57UzbGHmwf1FEPsiU79BdY5aL2hacvYc0aUnIZ8+LXdUDmuis6Q70e9zPxK
	o1opm82XZgit0eWi1WzKQBfC6ssyYZdbelCzNIag20EyGoO63VSKKMWGAEs8G9/cYDMqeH4OAB1VI
	rwV0J4e9cMa03nhstT/vcmHYIGoYBHBw4ncjWnj36TBGpnjeaPLB0mKcNZNTcKE7skWQEZesvqO3N
	YPxI/Myw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqXi-0000000CvuL-3OdJ;
	Mon, 04 May 2026 10:28:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqXh-0000000CvuC-3BDL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0057C60125;
	Mon,  4 May 2026 10:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9D7C2BCB8;
	Mon,  4 May 2026 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777890528;
	bh=C8xErYLvhPi3/y5PT2xKoQR2XSjSO6oonC2p86NBA50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ditjBDesUUK94v7TkQQRnjRwaJ732nv/8eUZqEi8iRb2kdbutLnnnqFgN47QwqQ/p
	 0phoOneGTIIDY0Vk+TXrJTXbKPf+5Yyn6Hiz55PDQRqNLZ3t6KvKkaPlwK9aDvt81T
	 dAApoGze9zzDj8XfUkbqYpuKRgYAa5/QWL/nh1cDLNmFj+ahpR13f22w0R9pyLzF0O
	 lSHV/Y4jFKRhelvRTOgzuBdmBUvCVwALjoME4rr8Y+nOU4CL5iqSlfEKGWhgnfA6/l
	 Ac/nXcoI6ECHc8+xDEl8mmt83TWDWBpFhYyqnWgc0JqM8jBHQve2WG/3tUP4on87ZD
	 wCJGAOVM1XtfQ==
Date: Mon, 4 May 2026 12:28:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: ukleinek@kernel.org, thierry.reding@gmail.com, linusw@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: stmpe: convert to DT schema
Message-ID: <20260504-urban-judicious-buzzard-14bd50@quoll>
References: <20260501073305.5866-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501073305.5866-1-manishbaing2789@gmail.com>
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

On Fri, May 01, 2026 at 07:33:05AM +0000, Manish Baing wrote:
> Convert the STMicroelectronics STMPE PWM controller bindings
> from text format to YAML schema.
> 
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
>  .../devicetree/bindings/pwm/st,stmpe-pwm.txt  | 18 --------

It is already covered by st,stmpe.yaml, which you were supposed to find
with git grep.

Instead, drop the TXT file.

Best regards,
Krzysztof


