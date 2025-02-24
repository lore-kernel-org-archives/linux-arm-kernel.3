Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEC8C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G09gMfcqfpgHiddZLQ1kedAmZ3aAU2WNscdLfGcItM=; b=DX0G/oOsr6TQGZkj9mWvRMO2xh
	HHQ46bcyUFRx7hLMCsJIemepH314w26XiV4YYzThRGQ3M0koW/X44JsLMVZiO8Ruht5tcY5SYSP42
	mtN5eJUYya+DPl9KJt94Z8oCpRh6gUBw7RXUYwlDfhEcvr/FfLj3lul4QXDq8pU/BNdMpwj9bwVan
	TvjrqrE26rK3V4smSY8cySR8T+fPQrEeHF22qprB3kOtd1wHltkfsUWsWbFXBGtUDpYKTYdL13PpC
	mDZmK8pJY9MhWaxl6UDJl1FMXdQlmuJWjc0Cq5irzSiD3E/6UraTIsxpERzm6R6n14Yvsz9xrQzyH
	rgNNQU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeuf-0000000F4IQ-0fnx;
	Mon, 24 Feb 2025 20:18:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmemV-0000000F39g-28n3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0D0B5C660E;
	Mon, 24 Feb 2025 20:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE86C4CED6;
	Mon, 24 Feb 2025 20:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740427822;
	bh=//I4s2iMr9J6rEdDAzVgVvZ0bgv+PoI6wUAC1Ve268s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLh1QEjvRNIcuhtCtWxYwMeqdndZeuETHVY2Zuyp83rJDJ9eYOnSB+RDITXFc929h
	 jTaNDmQGFUIFWzu+L5lT4DBF5Fkz9w9vup88nYgrb1Oo8OlSn0CpncSwSK5dBiHu8D
	 5/LD2tsNm+maVu0/2Ik4OkbcA5dOojRMyuqsrlp9hdS2Fr0PN8ZcokvGPvD9G5Jd4S
	 +Xk+7l2PWOxwnVyfd+75hMRTgvwyE8gYtcCTDOGDNWCAkUZzZoZpXXqazTFY4ZMUWV
	 maLviKqCVoJTYK9667ObN1pKQsUfMp31WWjyQd/+pbW8+pk/2jOi8/vtQXpVQxKXl3
	 aMNRBiWr0Lh7A==
Date: Mon, 24 Feb 2025 14:10:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: imx@lists.linux.dev, shawnguo@kernel.org, linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, festevam@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: fsl,imx-asrc: Reference common
 DAI properties
Message-ID: <174042782051.4022847.1009470798524846957.robh@kernel.org>
References: <20250224090413.727911-1-shengjiu.wang@nxp.com>
 <20250224090413.727911-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224090413.727911-3-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_121023_587174_8D1AB6E2 
X-CRM114-Status: UNSURE (   9.11  )
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


On Mon, 24 Feb 2025 17:04:13 +0800, Shengjiu Wang wrote:
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> "sound-name-prefix' to be used.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


