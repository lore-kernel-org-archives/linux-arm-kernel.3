Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DCAC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 06:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I74YV/Xs1pfjL3V9TczIEk6MvDZlUesCUofNYEE2VhU=; b=LeibJ083SaGdP3U0moJfwVh630
	rEjmiYxiOnOWuKXHgIVk8vBDbq/QAHiGAZc+p6EsL2cmbrEEF2aTFFASBhw6AZfthN/Iv0Q/ksULy
	uydQIfN3e72UefG32n3q+B25w22qJ0iFsv7lpdboS3K9ZdkdkvJ8gjcNOUjWAgumPXEg4FiRJGxnO
	uM62MJlvKkSdTFOnUhT55lN/Bu6fHNDQ2leeLe8MCo31fSijMlQqH15940PfiFqHy/SFbmKcqpARv
	i9RdBVuVXrGbepBIt+3c8jkVvoND/esUqDsUflRL7tru0iT3meSddL+FldYbUj0WLyYaJ56qPeDfT
	ZedM8lyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwhQ-0000000AzNR-0efp;
	Thu, 20 Aug 2026 06:56:28 +0000
Received: from thorn.bewilderbeest.net ([71.19.156.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwhN-0000000AzMu-2uKb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 06:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1787208981;
	bh=I74YV/Xs1pfjL3V9TczIEk6MvDZlUesCUofNYEE2VhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPqWC3k/NUJ4eKfZGmfOlQIUzNo1DZ3fzyENBJpQpVyh0bFNQPUqY9nqiazcyQohs
	 u+b9hnzxRuDqXlLUrUBI0XYImuAFtjNhBO+QBI0xJkjx/XVO/MFsfFV+hpCbdfUohg
	 Uh5yQ3TTQV0pZz4bMIZh87dIqB/4y/1qN0T1/qaE=
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:71d1:5c00::171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 78B814C;
	Wed, 19 Aug 2026 23:56:21 -0700 (PDT)
Date: Wed, 19 Aug 2026 23:56:20 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Tan Siewert <tan@siewert.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: ASRock Rack X470D4U BMC support
Message-ID: <34c111a5-657f-46e2-b963-9876e123f43e@hatter.bewilderbeest.net>
References: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_235625_801167_A3B2224E 
X-CRM114-Status: GOOD (  10.90  )
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

On Sun, Aug 16, 2026 at 04:05:48AM PDT, Tan Siewert wrote:
>This series adds support for the BMC of the ASRock Rack X470D4U mainboard,
>which uses an ASPEED AST2500.
>
>The mainboard exists in three known flavors, the "normal" X470D4U, the
>X470D4U2-2T (with 2x10G RJ45) and the X470D4U2/1N1 (an ODM version with
>2x1G RJ45 that is now available in retail). The 1N1 version also has a 64MB
>BMC SPI by default, but they are all swappable.
>
>There are two device trees, one that has all the config and uses a 32MB
>flash layout, and another one called "data64" (similar to facebook-fuji)
>that uses the 64MB flash layout.
>
>Please note that this board has been fully reverse-engineered.
>
>Thanks,
>Tan
>
>Signed-off-by: Tan Siewert <tan@siewert.io>

Reviewed-by: Zev Weiss <zev@bewilderbeest.net>


Zev


