Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08903C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u40uJS+JJhTgmsOn95/Qy87hSNnVXAUAxGCM+fqeuhM=; b=xJhM1T6pJadwj+dfwqxjBQqlNg
	oN9XCpJw6+E+23BK8IScaY4FU5Heleyv1agYCFZw+F3aMdXi9U+96fmRvt9iA+2K0ZwgHgfg+OzPE
	3hidhv/j7z/s0ZKdAN2H6iVk4N0KqUs74jMb8G/bTEs38fxngN1ep3zO8DzxvuPB0empqJUPRi4mG
	c2u4kpCuOgCP6ncqRZtuT3/rO7MLwApoOY/QbmvUTyCWHzm8edVW2YzhL3tyhFqZ8QM/1UkVU+G/m
	ERoO6bd4RDWn7X4hTnfV1KdAT+Q1gS5rQjV/jLHtMtS+EmJvSXh2FfBWriTXJ0kBVdBghcW3/7UKj
	t4dBUUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7Ox-0000000CfAq-0hA6;
	Fri, 28 Feb 2025 20:56:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6pv-0000000CZKQ-2tJh;
	Fri, 28 Feb 2025 20:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1971F5C6989;
	Fri, 28 Feb 2025 20:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B943C4CEE2;
	Fri, 28 Feb 2025 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773994;
	bh=cx6KMGBCYq6n3t5dzNY2lWOPSoiqWzxG3JY9eJ4yn6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0vOO0mOJdgxtFSleXuCWPKumz/sdC+rgI02yMpGAqO1S/cCrsP7wlw1W/Uf/w2ch
	 CzHhIzKiNhZdiUr0O8Xcfc8G0h2Iy9I7BYbr+RXHCfWyGYr+m81yzFC29DvAZghKaY
	 xT7TDVqaZsGBM7XwDL5hUhnlNst7SQPGuEv2qrwVoW1eo8g6PSW2HGx/5wTHBTUu40
	 aOpg80BuowOCcRG7FMMagG4UqpSVsLjhttAuG7DdWrkn9/4BAVZzCrQFJIWncO1zlT
	 oZJrNh1KCG4P7sC0Ooh2vR715dV93+qtW6p+jz48nEgC5b0SScmut7QxX5pGtByY3X
	 HCUvVa51IRC1g==
Date: Fri, 28 Feb 2025 14:19:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, devicetree@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Frank Wang <frank.wang@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v3 12/15] dt-bindings: soc: rockchip: Add rk3562 syscon
 compatibles
Message-ID: <174077399176.3618688.11759633731165710590.robh@kernel.org>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-13-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-13-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121955_781181_16F49509 
X-CRM114-Status: UNSURE (   8.32  )
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


On Thu, 27 Feb 2025 19:19:10 +0800, Kever Yang wrote:
> Add all syscon compatibles for rk3562.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


