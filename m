Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD08E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+f911D+eQDhhAKgndCKzylxqIY/jTsHdMnuTBrx1ak=; b=BE/qtGhOdMJGrAl4GN+jKKKiap
	LdYUpkLSMURT/6g6FzqBt58Lz6n45MS8FzaUXVp3mv+W3CaQLHGmB0T+fMZvJkZVolajbqxzEvcaj
	UifjiAyNxL5FGtHTSLMz7FUUU3a1mANLm5aWvfp3i2z+4HrFaBE4h0QWg/wStaAjSa6ZPvI4imj9/
	ZQuzmyBTwCoRVwaDxrSU/Uz/nQpbBFVEsyeWgQc2VSp4Qiq48lra6UOljXRGhxAFu/AmyR598s2RE
	L8ovUT6XdnP1BJCBZ6lsdy/UfvT4olhQxVmwM356Jw2851GhJ7CnziQIA89A5ybUm2nIix73I7UIs
	FSsuGAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZLj-00000006y1g-3d34;
	Mon, 09 Dec 2024 08:42:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZKh-00000006xvc-2enZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F046A41041;
	Mon,  9 Dec 2024 08:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DFEC4CED1;
	Mon,  9 Dec 2024 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733733694;
	bh=jDoyGXxmK/hzl0isoHA9luNOBfdMCevCyeKzjRCxhn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=px0ajlkX+RWhpzoWf0XnSPdacFYK1kom66O+AlVv50CPAukyXsdeAqALgbzLrBRum
	 jyxWRlUzrMVZITF9SAaMmjVEBmzTmKSQ/oPBktsZxWussWgbDklQV+HIf6Hu2iVapI
	 UqbYqi9TWxIr1uT2KyivgjbVYt/Ast+qQiD4k1JQNkwhz9MABCQgYO9Xn0wWbmeNYH
	 spaEmGulCJV6excleuOM13iRkDQiwBMPrBIMizfsavKVucIdnVIVF4l41y0JaxKQKN
	 BT1T5T4fzzrrVBVZePvYut1MfCc5f27tgKJk5X8Rm2QxsCsR4/jS7IYFb3tL43l9br
	 Z6Fy3ikuygFTw==
Date: Mon, 9 Dec 2024 09:41:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add Exynos990 SoC CMU bindings
Message-ID: <4thu4plnvcamln52tjiuba74nwxthj5aqmgwo4eliqipuruh5n@rz6boaywnbsw>
References: <20241207-exynos990-cmu-v3-0-20c0f6ea02f0@mentallysanemainliners.org>
 <20241207-exynos990-cmu-v3-1-20c0f6ea02f0@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241207-exynos990-cmu-v3-1-20c0f6ea02f0@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_004135_734390_3D520F86 
X-CRM114-Status: UNSURE (   7.31  )
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

On Sat, Dec 07, 2024 at 10:25:38AM +0100, Igor Belwon wrote:
> +        clocks = <&oscclk>,
> +                 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
> +                 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
> +                 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
> +                 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
> +        clock-names = "oscclk", "bus",

One per line

> +                                "usb31drd",

Fix alignment.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


