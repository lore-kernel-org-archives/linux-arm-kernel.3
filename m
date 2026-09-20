Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC9AC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCdz1wdJC9OT+zficoFF7wL3rJKkBYpCcd00vySQmSE=; b=o02HZRBHyMP+PzI4AaxuRXbbwZ
	abO3kp59iGq//E3y37tRXTV4p2AGnbR5NZJLRxNv9mh5za1gI5Xknaa86Xpim1gAiRw1wuRgy8kjE
	C/5AMxh6XuBkreezzVlME0MJ1fijsSuVNkJoKg6z6R6VYdWZhSWLRrhBCqCzU+sC+u/FFS5lJTpj0
	n7/dk+0dZYlcHj397Fns2A85S18oEwbrIC+vxOqkp5qh9CCHcQxyuwul2gvOieNdarxtt1yww/Eil
	fN0/y48vUVrutW/xlvxtQm86Wo7lCIQvpa87tfCe1DLTTinASSR8AM08GetqUuUQp8tzBiF7tKHB3
	cKOmqfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8L2I-00000000At6-1gdc;
	Sun, 20 Sep 2026 17:09:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8L2H-00000000Asz-1ZqZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 17:09:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 743FB601F0;
	Sun, 20 Sep 2026 17:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570571F00893;
	Sun, 20 Sep 2026 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924144;
	bh=HCdz1wdJC9OT+zficoFF7wL3rJKkBYpCcd00vySQmSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WTt+FY3X0e3VfK5ZIxtZsFFwfHPXo+Q2G1REdEZuOMqR7YR7YExSSjvGtVrd8KfWk
	 KUi10bPASdWNkO2100raKxwhToUCDf0j0g1SE/4B9z+BLQXmK2QohjinjJpKu3IdQx
	 dDZj0QFRutamod5aohNmg4mBcE7biYaqDmBiIoeXm35Q586Fxo43cLQ/AehjiHQsrc
	 XY7EXp60EqzUYHMYe7BqMUzEvR+C/lQXAX5kpFw1ZzJHi5g1s6KDIV80WI2e9EI3SB
	 qx0emCe+hKGINnF3ejUzsnmZ9/ONOZQ9S52XFB2B/koRwLQW4jIG74enb0GItgxcbK
	 sQTYXlFWZgcOw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
Date: Sun, 20 Sep 2026 19:08:52 +0200
Message-ID: <178992412363.36366.4345126158825411848.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=krzk@kernel.org; h=from:subject:message-id; bh=wOpdMdU3DF1mK2QyVbqdQ3Xb/N3uH3K53tS2Mz8dBc8=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqsBMl/GgAuARyHXtA4+qfMaSKoMGlGdUJEAnYa WJZ1S4bpiyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCarATJQAKCRDBN2bmhouD 112OD/9YYnniZyiMj2BLPJQLkMeB32hp+SuhzEWi3EgUOz4TMHKCgT6wxKoKeGH3AdQKC4AupLa iiKC1CWoHH5bk7ZVEsH7dabLaEfEqtF1+tLrQhDLKC5OtdyUcwKh9e4IfkwrcvoPg2HgLig4e8a qRmMbNH0OgU9VhIFAYSA54a1Ud0Vrg+jXdfNOpH+j89jWNKeNnUBNlflMcBI0UYPhLuSGlpnugy Xu2W1iI+X7V6xQ66h6monxJT1BnzOxaMX0ln0BYnNqzweGaIQrlmcn6pt4T/xDl21hoGkelh8JO P01qpdb3WcUXwXXqhgw4FP2sgpldWPZT25/Msvou2Qb8ez0iNgPvQvTeXdSHxt19a6FxkkIa7gE ktRA8o522xaDWA+BGTEA95yq43I+kLnRpn47u4+ysFwlPz+jYZv2cfT5IogJJA2m6WamVa0nrm2 04jdcLgn6vWQcIF/V/AZrp+2wMHVAK8wRhQ5OPk05xt8KD+iMvkhzuhibYGSLHppbG/8RAaZcih 7/QBdFxPJ91r2IuklYoNXWs2GLpCH45cCGDR1q4CiscdMb0usScYUnR0sasYF8l9OiJrMHqsnnw t6xyHgp9BHoXFVHEQo3YJKIofD3Aiv8SxQdfmqpncfvs0m/jbZPt+dPF9VOoxbYRv9/vGM7uMPi xOb5FC7SDzqNr+
 A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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


On Mon, 14 Sep 2026 17:58:44 +0100, Alexey Klimov wrote:
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
> 
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required, that is why "mmio-sram"
> compatible can't be used for ACPM purposes because it requires child nodes
> to be declared, which are not needed and make no sense in case of ACPM.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
      https://git.kernel.org/krzk/linux/c/ca4fb89e677527e32d16c5eb779eb34bccd2b967

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

