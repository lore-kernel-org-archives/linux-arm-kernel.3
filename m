Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75095C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q+WxJ3NRja0iBPcIiZmImtHqJDLGM4eQtUUFwXaPYY=; b=QefA/NrOzNfuMw8qo9lHl6Gs/Y
	OKnfhblVNue2ql0wx2g9pEoOutheiNrSkXmTeTFDWfH195V4o9tlXXeDR3WCd2vxXYnS6cMiNGwpo
	1/T30+SeosAkJlsemY0j4l1J1Rvf4F5YdzHcrkPzx9qW9587fHz5RUlIi6JNJUQWZ8Lr0165McFQV
	5NArf7CZsCQl5DVudhxH1qccrESkUAdYYMLZVuItMgR1Hpxvt/Cd1DvYEvmwWGOAiqksNC4Eo/cb2
	BQSajNRVV4jOjvPGSnoKAUMHfK0IY9+uuwoHerKxwv9fxoIxVRbbIHS0KCdrmIprfZSqhCQFVVR5X
	AraRp1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wNN-0000000A5M2-15uc;
	Wed, 16 Sep 2026 20:37:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wNL-0000000A5Lo-3Nr3;
	Wed, 16 Sep 2026 20:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22E8040951;
	Wed, 16 Sep 2026 20:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23B21F0089A;
	Wed, 16 Sep 2026 20:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789591023;
	bh=6Q+WxJ3NRja0iBPcIiZmImtHqJDLGM4eQtUUFwXaPYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uh5q2N24aFNHTWnB3epmA4lJx/1BpqXxOK7L4BmjoHwTjr7WZBrDuBJbcer01hS7d
	 fcM/NqYm6+/NvJjcYh1n7uKGG6InZ0Hh0O9mHIBH8b0ZfYQMY64iHK1rzezMZw9mrm
	 ApKQvd4tcoBWBbvvSJpg7xSdTXor2cYCPgsd2jYXwfhFsNZv9B7lrFQAkhsc2MdS2X
	 mrG4ReyXYbmKH4HQkNLS0WuU3QTC2ldbvUqwGv+XZlVqBCIZEYf+gzh0kQ8YrYsDSS
	 qc7cWFEDnQLb9VisRvMzpLvgb7scq20xovhWsQVBFT6AWbmB4vmljcUiYO+ZKcIRrq
	 0FOGWqpT6HbWA==
Date: Wed, 16 Sep 2026 15:37:01 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document
 the T7 pipeline clock
Message-ID: <20260916203701.GA1463751-robh@kernel.org>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-2-tanure@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905153234.133217-2-tanure@linux.com>
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

On Sat, Sep 05, 2026 at 04:32:31PM +0100, Lucas Tanure wrote:
> The SD/eMMC controllers of the T7 SoC are physically far from the
> NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
> in the middle of the bus path to help timing closure. This stage is fed
> by its own gate clock and, when that clock is disabled, a controller
> that starts a DMA transfer can never complete it.
> 
> Allow a fourth clock entry, named "pipeline", and require it for the
> amlogic,t7-mmc compatible. The other controllers of this family keep
> the existing three clocks.

Did the SD controller not work without this clock? If it did, then this 
is an ABI break which is evident by the current warning in linux-next.

Rob

