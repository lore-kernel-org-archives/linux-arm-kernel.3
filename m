Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8427BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2eUGsBV3DT8N/rA7eUl1QtxCjOAMaTFdqEmt4OdrR8=; b=Hhl/TeVLHioDDg2wKdAO4i3aRI
	yRLXdowJ7M5iUGoL7Njwp+VM8TBcXIHqdScoLUKj+AyErwZh3iJlYH9K+B1ge3fFqizsKUEuqmAFm
	xhvmWOGe9UAs34ASRgdQGUeNmeehYKQs35RGz+lp2d8F6N8ZO+HUhbe1ZBBpBfIfSYElzF7ghkjqO
	JYpaIyRZ3jPk7yc074mnyT+tsHiLtmTQe95V4huZh/dsePc/XuockLMLPWdyUGaVuWxBADqr8KPGi
	POYoCaJxKjC52CQE8Cr7dk3aNijjEBmFlT1CfwgMSrDI1tPBU4XOI/ws00lf3AZsJ5NF77z9dHlMT
	KXfL+2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUGV-00000003pvu-3gEi;
	Thu, 31 Jul 2025 14:28:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhThV-00000003kDP-42tk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:52:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58AEA60207;
	Thu, 31 Jul 2025 13:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E67C4CEEF;
	Thu, 31 Jul 2025 13:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969925;
	bh=VVahUZQ1Biwbin4MULCT2k9NK1SumhMf83loM/viyg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjjlSHCStIOMpeo15olXb/biIbvxMM69OjYpZCudIwwOzoPQf1zBLe89/aFhlUOvV
	 3F4703yIk33j41LiugyF4QgiVFY6nDdYD3d+KdMLueqv+pAsBp8izXLVL3QKz969xH
	 zWQnfelBt1oXl7k9zdWL5n9YqchwmJDkyyZRv3ExfRJBfy2GWoK/BjluA6hTB3Y4/R
	 JKpdvvwFD/aI6Glj41dXNcq17R3161h+BtL4ehO9BDx0v7+miQ39KnqiwnE3fR+m/S
	 sY+6oYRrhcWpa6XWyGo7GM3KHVUkdFH6tt1DCOyZRml9dnUj6W6+I5zUWFK4P3f7po
	 11PzPv+LO3guQ==
Date: Thu, 31 Jul 2025 08:52:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Le Goffic <legoffic.clement@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-perf-users@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Julius Werner <jwerner@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 07/20] dt-bindings: memory: factorise LPDDR channel
 binding into SDRAM channel
Message-ID: <175396992348.2137172.17706395913252452350.robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-7-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728-ddrperfm-upstream-v5-7-03f1be8ad396@foss.st.com>
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


On Mon, 28 Jul 2025 17:29:38 +0200, Clément Le Goffic wrote:
> LPDDR, DDR and so SDRAM channels exist and share the same properties, they
> have a compatible, ranks, and an io-width.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 23 +++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


