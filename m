Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75D2C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB2az2PHekC+lOKLzUf+M1PoQtOaX5ODb3E/1LZ9toA=; b=wujq2ApuK/WObVHuYUphGUvp7f
	N/lyVSh5eVH4ebQKNmLy3KGuTd+sdCfKztn8PNSccuoBUD5ugBNt6cN7JrI3L/Ad102GGHSRiANzm
	LYQxY6FcMN3z1u4vPrRyDvSw+L9gZl/ochs6rTnK4t345zJtMc7z2kyaabvsDKxDH0HbgwLxhx14z
	05sasmuyFquJuUDM0dBdj4sCahf8Age3BY7bE4zW1rIIH3pPvAN9ettD96t56pRKFs8LF+/+xrDJ+
	0oTXBBJAmQb2eGbvXvo/HpXeHC4hX+mBznOUBPgWTFd8CKpHUEMxoM4208vdCN14rIiTHmYPmhVCn
	dRUkfmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvQW-00000000UEi-2ACa;
	Sun, 29 Jun 2025 17:02:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvOE-00000000UAJ-0UtA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 17:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3E9B6115E;
	Sun, 29 Jun 2025 17:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5139C4CEEB;
	Sun, 29 Jun 2025 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751216423;
	bh=MU4Z9EP7bSO53KKFn9ULIwyc9M5DssKRkSghJ8ajuTY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SIW/YDhYp+dpeJI6fDZLC+l+fg8EN6BOop61PFeSyT5y0PuKlkin3yrLEBJDKzdAn
	 EynVJnYZcE4utivRrmcctCTB7OC8OmDabS7bCz68Xb/momLydHr9Rk/3ggDWJo/XlC
	 Nad3mtxazC8VZbnfZOtjRwOpZLIevC0fmXOUJIpdQH58I3biCFmIqtokWOi9kX08hb
	 juuXkmm3Pp1NT0mFNOH8EZ2dAQCybmxo+7DoZfzUDjEz+UGru841b5FLvo3FmwznEX
	 +XRfJy+3bUC1tiy0zZxiN12+Bzh6UQNpIf5VxcAY05nzmVCzgY103NBHldoxzdk7VZ
	 7ZWQC9FxPr2pg==
Date: Sun, 29 Jun 2025 18:00:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: stm32-adc: make stm32_adc_trig_info const
Message-ID: <20250629180015.4aa4375e@jic23-huawei>
In-Reply-To: <20250628-iio-const-data-10-v1-1-0ba93ac792c8@baylibre.com>
References: <20250628-iio-const-data-10-v1-1-0ba93ac792c8@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 28 Jun 2025 11:39:33 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Add const qualifier to struct stm32_adc_trig_info. This is read-only
> data so it can be made const.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Seems to be in the 'obviously correct' category so I've applied it to the testing
branch of iio.git.  Thanks

Jonathan

