Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739E9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lG5R/p5siOYmkmUTzGIXx9ibFjo8pId/1JrU6IbK10=; b=GwlGxesf5IL8Vmva99wXZrUAo6
	4n/qtK5eJYjvl9W7PU8aWch9rYoux+xW0+5FB6TdTaUDf4pZJOJbkA3+IPpy9WjiXzgXWSvTrZKgQ
	H2hnnJR5bK6CSq5GYQV6vYnQJX4VWsejS9eJCrp0bOdhZzN21sd/8UohQg+U2pecXxXVU8H9zjN4X
	xlriAc4G1CZgsNbUoUeDkHY6zujYElhZNK1k4TXjVqsScHF0HHKWiBhh8w4zbXhh3+umfnvivyT9C
	szTkRg9InxlMDm9NMOLojT+3F1aeMjBKSdZgXRSuDQ1Yv88Zx3OMDt5AOcPN30nAoalixT0sRhRaO
	G6w4acHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuBO-0000000HERA-3WAt;
	Tue, 25 Feb 2025 12:37:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtbm-0000000H7mI-3JVd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26D645C7126;
	Tue, 25 Feb 2025 11:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11974C4CEDD;
	Tue, 25 Feb 2025 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740484817;
	bh=zK/7OWHlisi7f+Mu3OhLXwcUr3ILVz4O5JpSU16Ic/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCgI0O+AW1ufry6XCxhLZnBkO/EIRWBB9+fpXUvOoB2Og05FcNmNF6XsmNZAITIJZ
	 IthKvYlg4qNweF2PF4+CEB5YnBgjJS/x0WrBc09DkHfeuwtV8piSExb4CuzuAhqA6s
	 BlqEbi3dTM4B/0g8F8qqM/UoXp9cjyDDJCyctexQV3P0AUlDQAo59UcJiR1LA92GUE
	 isP9t1+26z50TFacj3QTYLD95vbEp3OrQbf6qiIIUvyM6tIb2rqWCJa5yRFZuSNQgg
	 MYJpM8DrGg7spkhykh3AhAZXDbslZ3csNxTKimUk/GCojokiG9ifHBIm3B8FJ6YynK
	 DnG0GCOY4d4gg==
Date: Tue, 25 Feb 2025 13:00:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wbg@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	olivier.moysan@foss.st.com
Subject: Re: [PATCH 7/8] arm64: defconfig: enable STM32 LP timers drivers
Message-ID: <20250225-vague-tuscan-shark-ebec44@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-8-fabrice.gasnier@foss.st.com>
 <f76a3a6c-795e-4fc8-905f-4655115ea99d@kernel.org>
 <696ac9eb-f223-4993-b288-b6c3e07f4ed7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <696ac9eb-f223-4993-b288-b6c3e07f4ed7@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_040018_871301_C782ACB0 
X-CRM114-Status: GOOD (  16.07  )
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

On Tue, Feb 25, 2025 at 09:43:58AM +0100, Fabrice Gasnier wrote:
> On 2/25/25 08:48, Krzysztof Kozlowski wrote:
> > On 24/02/2025 19:01, Fabrice Gasnier wrote:
> >> Enable the STM32 timer drivers: MFD, counter, PWM and trigger as modules.
> >> Clocksource is a bool, hence set to y. These drivers can be used on
> >> STM32MP25.
> > 
> > 
> > Which upstream board? If you do not have upstream board, the defconfig
> > is pointless for us. It's not defconfig for your downstream forks.
> 
> Hi Krzysztof,
> 
> It's going to be used on stm32mp257f-dk and stm32mp257f-ev1 boards.

The defconfig commit should mention which upstream products use it.

> I can add the relevant DT for the(se) board(s) in next revision.

Does this mean there are no upstream users of this? Then this defconfig
change is no-op. We do not add enable things in defconfig just because
there is some downstream/fork using something. Defconfig is for our
(upstream) boards.

Best regards,
Krzysztof


