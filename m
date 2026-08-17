Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F5C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wwrt1tSO+ObTIAvJDiC+q9v5Mkn7NyI4zZb78Q+U42k=; b=FedJwqFtAjbj9fMjnfMHNIns5H
	xIqAyPH7isZUA6HjiUCYPcVIbGi9NNzvXzJKS09JAoJ1W5jQBjRpa3RiaGYAbUGKtd0Gv1x/DLpNM
	8V/ljslS97l+yw6lrETuo1G+586a1vcL13CxQJpqxhqcKEOKGtuk14JXuo0cMBWyYjqKlOqG+p/9T
	ktteEPZmapi+IEO4zY06YRoUKj6K/JRNQ4ufGC4QPz4KnozAKCNZMxzmRk1rLgLvZX60uDBKgrBNu
	FDWMvGCC+FuNW6JJ6qoLvSoKqqrvJdSV3BxC2eUxC2aPq0ohyeQpucL/jNVs8LW5z34/qOj6gehay
	9MZ47zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvr5J-00000005UjM-3Ehy;
	Mon, 17 Aug 2026 06:44:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvr5I-00000005UjC-0Byr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 06:44:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 555AC40A8F;
	Mon, 17 Aug 2026 06:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6731F000E9;
	Mon, 17 Aug 2026 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786949075;
	bh=Wwrt1tSO+ObTIAvJDiC+q9v5Mkn7NyI4zZb78Q+U42k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0B4p/lgNkDwPetEXebupGsNQaL4XvaxLAu3lKaITjbIshxEm5JE8/kUiDJfX2OQo
	 jfLKyhkvQs9w9HyOmzNoQ7poc8Onwuoa87u6brIkoO8+fdtqEnDif5wVkVVtvR86/Y
	 OI7Ef7HNxyBmBylcEaSBls3zmUy90u0duHvhp2rZ/J2MALsIjSKMTloI3WnZG/ialM
	 DduIC4ztJpSyJk29PoThR/Lk2HxzjeNbH1RAFyZp2RxTkxd+bDzkWJ8IR0ifsZkpoz
	 TMGm3reHioipOVf1ay7erfyiqK51Tsu+jnRdbh3AKFt5AaOiJ2J66850yVqzRB+2u9
	 nBdWDg8TPBqmQ==
Date: Mon, 17 Aug 2026 08:44:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
Message-ID: <20260817-perfect-berserk-sunfish-ef2d5f@quoll>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
 <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>
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

On Fri, Aug 14, 2026 at 02:25:41PM +0800, Long Zhao wrote:
> +          - vin_master_sync
> +          - vsync0
> +          - vsync1
> +          - vsync2
> +          - vsync3
> +          - wdt
> +
> +      groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array

Why are you redefining existing property from pincfg bindings?

Since this cannot be tested by automation, I will not provide final
reviews.

Best regards,
Krzysztof


