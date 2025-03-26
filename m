Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF784C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBYoJUxPomzvyzOlBrsF+JK7muFZEKCY181Mv+AYWD8=; b=eBfKf7y5YhIPce1nJOATSU9Owm
	AuZkYUsXCdZabICAAFab9fhHFM/aKuRxEcn03pi+oyO3zgEbWc0+PpjI5cFxpvyOw0RKqti7DygH+
	Bu/uZxxNVhcUej2SVLQA9YQNhDf/eIPq+uZ616oZbngNQIa45ypCTfb8ddYzldZBFwxV3fKIdAznr
	5cETtYnIN8ZL4QexPYz+tTwMeJKopF1mH0eFMDgljcpeHLR+b4+9ixW3XAX55Gl60H+ig5KHJaQNh
	qz9nf6BWUAYZ7ZeUlTJmPA5YFediLUjbcLBwAdbsufYoso8OKJssnG7CSQm7hQQCka45RWMM2gdaE
	pMfU5XAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLWm-00000007pMe-04rS;
	Wed, 26 Mar 2025 07:50:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLOG-00000007oLg-2y0y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DF266112F;
	Wed, 26 Mar 2025 07:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B83CC4CEE2;
	Wed, 26 Mar 2025 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742974891;
	bh=rBYoJUxPomzvyzOlBrsF+JK7muFZEKCY181Mv+AYWD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TpOOq0ygoWcU+9ocYUPGZPUHhxtn7eYhnGmPnuOuG3IwEkoYzdj2ti1l9Q75EpHxy
	 yUs43wWCbgNJe8CEq/f4QX/EPR6V0R6ekwl9MrULXZjhvJc46Ha4SHKH9GjqwzV6+F
	 yLBcG8p+aOpkShjnAE59Rv+C+YmEn1wXyS0HZhfUsOKmxmhADnQjmUHk15Az6lPVNe
	 6oJoE9CX2q9QeCGQjR/Je8Qxz+zUnpjds4rFpuqSXmyiTfGE/bQXbQqsH4gr77eE9L
	 qapP6teilkDoP/l14TnPT5PG0krFX0EQ2mB+RVg73PTFz6yt2Sy1eqpChp256KBk1M
	 5R2rzlUd3poeA==
Date: Wed, 26 Mar 2025 08:41:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: stm32: Document Ultratronik's
 Fly board DT binding
Message-ID: <20250326-cherubic-puzzling-jellyfish-872ae6@krzk-bin>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
 <20250325110409.2323611-3-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250325110409.2323611-3-goran.radni@gmail.com>
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

On Tue, Mar 25, 2025 at 12:04:06PM +0100, Goran Ra=C4=91enovi=C4=87 wrote:
> From: Goran Ra=C4=91enovi=C4=87 <gradenovic@ultratronik.de>
>=20
> This commit documents ultra-fly-sbc devicetree binding based on
> STM32MP157 SoC.
>=20
> Signed-off-by: Goran Ra=C4=91enovi=C4=87 <goran.radni@gmail.com>

SoB mismatch.

Please run checkpatch.

Best regards,
Krzysztof


