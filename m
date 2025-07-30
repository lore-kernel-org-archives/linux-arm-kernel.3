Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B19C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xwym8ZPyeCD78WBbowjHHZjt146CBwMq7OuJ/UiDTo=; b=nGYowhj32hVlV7boKEjUyMnehX
	OPXbRXwvOq86Pbbv4HXIk9ZJFKn+E6Ok75Ew017inno0vX2CowVSMvJDScsLns0TH+O7W071xK4lk
	laSpUVnfU7Er1b/u93kwerU94ocYm5S9haJ+sK7iaJ6phs1xLk5vbeNQjIvcKMetEwUsq8H8cTIFS
	mL7yuNouk80tunI5YEqVr881oS8Br5bfeprBhHgdd6VV2b+o7c15B9+MRjWpL45FRepg3TFvkGFQp
	oKlCEP9IMdQginB2voffcjGS9Mg1T2/pOrhpRmBTsFyaIulWVRNdAeaetgNzHptMA7eVsdiSIGiPD
	N0oO28+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDsD-00000002R7H-245u;
	Wed, 30 Jul 2025 20:58:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDpk-00000002Qog-0rhL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 20:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C9A0A54F02;
	Wed, 30 Jul 2025 20:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF61C4CEE3;
	Wed, 30 Jul 2025 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753908931;
	bh=cnyTzK3feprCwNlOU0zkPyf/P/0P8BcXQw0K55GzOBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slGDFdxdi08cRmRyNENFkiSH1AYvRWEkK4vAlxRHLpYoEg3Yh2D6G2S43O/rSu1p/
	 u6bs728jC8qyfx30MGzhpwYtGRhzNY5A2wKFwRwXDQ80gvnqmHhNYXvJT3gK4MGPuE
	 Y23E+nc6AbLuAAcZnSCcGBWvtttw/JspjkFzSuI7JpIuvsBNTgqDh9RLY0hG1DtfUd
	 vpRRfUp8XSrjJtYxDYbnsIzUvuFXGVzszKV2AzjLO4mUaV2RXa+AsAEAZ/WAU07Nn2
	 0G4iw5bfIwXWrV6U8JSm9qPm5Ozo3FRLYq14pfZVOVZv+EvYleMYqJXh2xadDujcyg
	 STNa6kh+335Yg==
Date: Wed, 30 Jul 2025 15:55:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: rentao.bupt@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 09/13] dt-bindings: arm: aspeed: add Facebook
 Fuji-data64 board
Message-ID: <175390892978.1732171.6656964708595304137.robh@kernel.org>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-10-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728055618.61616-10-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_135532_307437_77922A46 
X-CRM114-Status: GOOD (  10.38  )
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


On Sun, 27 Jul 2025 22:56:11 -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Document the new compatibles used on Meta/Facebook Fuji-data64 board.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
> Changes in v4:
>   - None.
> Changes in v3:
>   - None (the patch is introduced in v3).
> 
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


