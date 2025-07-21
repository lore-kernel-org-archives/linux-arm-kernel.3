Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57425C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oS5y/6jd0fyD4qtnb+P6qB7iqB4BOSABE7Dm0lqldA=; b=QdMqaNQ0oEXunk4ht+ksbIG73E
	w3BZ0A4y5c67W30BVnnbZAHJAdrl5XxxcqQ5yVqjA0WjoK60VMAN2uG3TDDU7CbH0P9Z1Pgi1fzGw
	9/z7GlELo55enJ7xuuPvP0KEWgazZgU+MUTWnORjWKhkPjiqByxmG7z5MUR22RU9UxD8pBFPoYgyB
	YwdAqMIpp9XyOBmRoOeMoKR0/4n4ujE4o0blNoHcDk/bPCFBWwS7TkPoencjfLuehLfnm5vOZKX2y
	54bm15RAH0CjezOaa39OaRTKk+0J5JlEQr1t9CMXh5SyDenWC5TLk71IbhvdSlPa1T2WimV7LTJSo
	2uNWKC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmGw-0000000Gj10-2eAQ;
	Mon, 21 Jul 2025 08:53:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udltp-0000000Gf2F-3Cuy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 08:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECDE0A5285E;
	Mon, 21 Jul 2025 08:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1469FC4CEED;
	Mon, 21 Jul 2025 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753086568;
	bh=bkAFOrOZr/SvPe37BUtI1L5AwFmY9z3H9MvIusDOwfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwbDn7ouIaFxMvO+7i/Q+Sj0HAZLinB0h6iXSiEaSNOuvQDO/BAoqTJId9vLma4nA
	 CqjceBdrP+kU8R9RXl097f4i2Kzwi32a+f5JdwvxR7jcM5XCcPG+1yggEq1wiin0yN
	 6SfKuxlBNLrzaDS61079Uu90B4S5FmvrVK74Ma9xOy2fXJqVRyDwURxbFS18tKohhT
	 jPka0lp6B8sQxCC0m0cr+sYsPK5WwyhGUdlWYXIILoRwodvp8DXpzcRKJ9DqpzndtX
	 3pnV69bCidiZdHhvW+6XpkxPMoaaFxDItlbrrKxrThm3mWO11T+l4MYOPQ1SAELlJj
	 3vzYjCFl4XhRw==
Date: Mon, 21 Jul 2025 10:29:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: allwinner: add H616 DE33 bus
 binding
Message-ID: <20250721-augmented-woodpecker-of-warranty-9f59ca@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-3-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_012929_872026_858A2702 
X-CRM114-Status: UNSURE (   8.36  )
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

On Sun, Jul 20, 2025 at 08:48:40PM +1200, Ryan Walklin wrote:
>  
>    reg:
> @@ -47,9 +49,6 @@ patternProperties:
>    "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
>      type: object
>      additionalProperties: true
> -    properties:
> -      reg:
> -        maxItems: 1
>  
>      required:
>        - reg

Then this is also not needed, but usually we expect here specific
children enforced by compatible (see for example qcom display bindings).
What sort of children do you have here?


Best regards,
Krzysztof


