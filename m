Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48285C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/zOpe2HngJG23s9QAhN8OFYFXMzqOJAL3nJjlP7+wI=; b=VMmHtbFLo8SKo4lvSmIV8LZugz
	u8V545ZrzsdBcv8I5FToR3oq4G5P/BN57n312qMKXbG1sZE4k0X8aaMU7UuHAgmhXsUNqLYfXc/rf
	7ddSWjg/iNERDtiPN3gvVVB/yzqKSkJ1QJOXmDIBnacYV/HNGoYTdUxwd8DQ9+vSHY+6VYtmOxqyh
	1y+49CAnqNeB742mgvKdPIrZPOGqoDNmzoXN10jTgV909GZAOzHBZnQgYbN+D27fxCoSXhu+sCrFS
	omG4Eu5leBxPaR8BvDZomRu03nJJlW5c0kkbudeVKr0pZwvx3oJ5BigT/gs0HOxEnqSdUZv/mahuT
	SlijWquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcsV-00000009Rno-3T6Y;
	Wed, 19 Aug 2026 09:46:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcsU-00000009Rnb-2u70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:46:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEB1460A63;
	Wed, 19 Aug 2026 09:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2481F000E9;
	Wed, 19 Aug 2026 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132793;
	bh=Q/zOpe2HngJG23s9QAhN8OFYFXMzqOJAL3nJjlP7+wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OZCSjoC4XV+BnBOuj6G9GjNJ0myzhg40c5fWKVejHTYg35wWI/9WvzZmwqoszlDV0
	 IJF5/pUAxcDkEFic86+MC4oDBoWlc2uG+hMwP2DPYo04gIZLoEiikwRBWhiFugjf63
	 u3s8AtYpkYaMFqBiu+x1fX1REH+Z8KriU9ihPrxvXpDFEK2T/Zz0UeaFAyrbJ3rZVQ
	 Flt1DeQ8tysjs58EMmIeItskhGBCc+WHpidTT079W4bjv43Bi9TYmEWaOW/PbryMXn
	 VKxd5NOEkW9LJ1GKGzO2KKwh00Mn35K8BulG0SxvUWUIPTnW7kukeuRHRD29PFl/7i
	 X6sSGm1rKPkMg==
Date: Wed, 19 Aug 2026 11:46:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Krishnakumar Kesavan <kkesavan@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: add Axiado AX3005 mailbox
Message-ID: <20260819-popular-vanilla-poodle-80c9c7@quoll>
References: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
 <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-1-25e713eccff3@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-1-25e713eccff3@axiado.com>
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

On Mon, Aug 17, 2026 at 08:34:07PM -0700, Swark Yang wrote:
> Add a devicetree binding for the Axiado AX3005 mailbox controller.
> The controller provides inter-processor communication channels
> between the host CPU and the coprocessor, with separate TX and RX
> register regions.
> 
> Add the corresponding MAINTAINERS entry covering the binding.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  .../bindings/mailbox/axiado,ax3005-mailbox.yaml    | 96 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 103 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


