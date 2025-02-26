Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD21C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Zu6li2IHa5X2/vOy9d296UL6l2EX5jlI0+m0peJ2gc=; b=FoS7Qwezu/rAUfipDpcHR5Neuf
	fIMQFnfft3WguWXoeyONt/7+eVwtNX3Dy7j+zuIKfaYbbM5C5vmg/DBoLmzegREcFNk/c4tZCqv9Z
	rncmZsjZsM72r5A+WeNfTsuwlb1VTiuRQuUDbkOyeG4HufFU4UGi+kHPjVmgO4E9si/ZbYkitBUbX
	E9s2ogSu1k3qNVN12kQJMAwknmc27padT7AfB7ONHgmQZP0x2MFwNLGdaHTSLxz+1O/k8I593ij8p
	YgktMHb7bTuKPC38AiqpwfijMlVXa/w1UYXaTJ4NgHxyxrZQYBLnpFtcvW9HDMgQdlZbmRvaJEy7m
	auTrlGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJoR-00000004R6N-4B3f;
	Wed, 26 Feb 2025 15:59:07 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJmI-00000004Qgz-1y9e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9616612CA;
	Wed, 26 Feb 2025 15:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F6FC4CED6;
	Wed, 26 Feb 2025 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740585413;
	bh=stzHx3sKz2tiJVFVznhRiupagfywamOVXVJNu4JJFHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzaxZ6Yf6h5bMF+VeRz8m6lQz6WzyWxLA2XynAUIgJGh/nVD+sOvHrgtB5EvjDDu8
	 mdwtlxF5LwfLsTsBOAmbdAS1LnrBCfBX1Q5630JqLubrnZAGRTMVDW6PMy5eW95eSQ
	 j3rLN6gj+JKN+hD+N22Loq+8L+miHE4IqKVKeIu2l6A5anquity9bBS4u/Ky/waDOw
	 Yf5AyWbG6cZHaYk2s+LsGoHiJZZABq9xNj5v1nDn3+H4eV5Rb+L/CEDJ+5wAXOsP+w
	 bBTPmNG+LAi0mOA8FYCzihs7jro9bRxqi58EyWzk3iciLiGdnGXWMEqeyyX4pHcOiw
	 bHWoWBOe6fxHA==
Date: Wed, 26 Feb 2025 09:56:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: ARM: at91: make separate entry for
 Olimex board
Message-ID: <174058541106.2503140.1386703564408101770.robh@kernel.org>
References: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
 <20250226084938.3436-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226084938.3436-7-wsa+renesas@sang-engineering.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 26 Feb 2025 09:49:36 +0100, Wolfram Sang wrote:
> The Olimex board exists with only one SoC option. Change the bindings to
> reflect that.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


