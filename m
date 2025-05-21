Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF3FC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DL7ZouAPnZSoBTFOOiImE8+R+TwJYS53YlvNXfLWwQ=; b=fArB2tt6T7ZsorQJPcariauCFl
	Iincg0QdYLEDVKv931MS5Ac9p/WIGWZnYnWMOwVn1iOiNs5Hy8H8RF1rroiS4NKVBvadFE9YD6/lE
	2Xvb5dBVotoyaVAToY/2hi+4UyExQuyV+q2th/wyCecne6Ysmdzhjw8cZiT37o1O7L8ZzNVvuPcab
	rscI9hMNDPfFhBi3bxvFZtTCnSltH7Yy2pcm4+xEbQKsHU/YzKiRzwH73Y76+fP97OWEwSqaUaxQm
	wpMKqJGYCK+xe/D44GVoG9BTj/Rp25sZ7dCDtx8zq9bdiFXF6hTk7E5Ol+F9ORUVRwRVGr+KUcJld
	Z4hzwJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfiM-0000000FJ4H-05NO;
	Wed, 21 May 2025 09:26:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfY1-0000000FH7b-2SBW;
	Wed, 21 May 2025 09:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1B125C5616;
	Wed, 21 May 2025 09:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094A5C4CEEA;
	Wed, 21 May 2025 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818936;
	bh=Ac1qjRLgENN/x/3NhLFz+/OEtJ22b5k//0P8ES5W7vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axkvbxKJYTwsYQU8tUXkUbC3fZodTNzKKfMfzDHrAYOsyJ5U9Wzijd2s2SmuA7joT
	 h/8QhCOthYBrGUuQEw2aZY/6Fbe0tM7Srlr0pdmgODd/uK91IMV/Y285oqnCY51HQk
	 zCdTYsjqdPI781iUP53706ytYhJfql0bwfG/NpAZ8UGuJqA0c2gcHPh6w7fuEKfN1k
	 uFPEQftaSUuC+q7XzglHLoTzHxff7SRhU4Ysw5PNmWa+P/1nFRBe6ZHp4TGfG7XXTP
	 /OzQap1HUhcJE1tweOTL3vKQBfOghkOTcZpNfSRno9TAJgxBabbGnX5bDJZMFUJOId
	 mcVkpR0mbQcug==
Date: Wed, 21 May 2025 11:15:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7D
Message-ID: <20250521-azure-cougar-of-modernism-f35481@kuoka>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
 <20250521-s6-s7-pinctrl-v2-2-0ce5e3728404@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521-s6-s7-pinctrl-v2-2-0ce5e3728404@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_021537_662702_5C529F06 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, May 21, 2025 at 11:19:56AM GMT, Xianwei Zhao wrote:
> Update dt-binding document for pinctrl of Amlogic S7D SoC.
> 
> Amlogic S7D SoCs uses the same pintrl controller as S7 SoCs. There is
> no need for an extra compatible line in the driver, but add S7D
> compatible line for documentation.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Squash it with the previous patch, so it will be obvious that s7 is
documented.

Best regards,
Krzysztof


