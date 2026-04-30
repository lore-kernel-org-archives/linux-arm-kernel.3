Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9881BFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfLn2iS+FBCi6ciBwhdlqe+rP0NBiVyvlOcEWwFVHAo=; b=dvtuZh9ZhbQu3SXoq43hs8d+y3
	UhSXlCCYpfvG8f0WtwcIqVlIdwYhyccJ7kLMCRJ3A2EMcJagmIDA8KBZYLPeLQFpbFltxjJoibPWE
	7Urk9L5rSEstetigXnza2y9g0RhyqE65FAV7qevlKmj7WsSImmPZr9ll6NC3rit9/ZUQtU8tDeXT2
	awxN49Wc03Vs3ydk0CZQE2CVE4Xw7pCTREignpFYyDZXaPkjr3Vsw3IfzDJfTicp3C9ubg+OPrwGF
	u6ouJrZR/MOvQWcw0c6/QOdRKhTLSqidPVNhJJS3TeEbIND1z4IL0AQrxRthEFaT3iNrsrqtHCpjh
	XqJJUe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINDx-00000005444-2Ndh;
	Thu, 30 Apr 2026 08:58:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINDv-0000000543D-0pSf;
	Thu, 30 Apr 2026 08:58:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7094C40E49;
	Thu, 30 Apr 2026 08:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51C3C2BCB3;
	Thu, 30 Apr 2026 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777539498;
	bh=FKRvXDmPBLG+u9plyLD3bSdEFfuRpy675/I3iaHbLo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcWL/woOe2AFuTD/DaDClgOBoV4m8Cj4B124gB4lVfDzXj97tfLnQDPYGhEt7SiNF
	 YZzUZ5Y2fFBS4dAkCs38JqCDuN0hgdb50tf9MMU4FlHk2f7Z6mcuMnTnuXXza+OCeT
	 TCVw74qqOaIzeQ6E96P5dX/lj1dzfqgJ+jZDSNEwJgdKmjjgeuqc1FxcYJWlVbgG5k
	 EGUDlVbN4AKIyHJWQg00Q0M/dRTTTytwFHIT64Om4DGOA2kVddf06LcyKWInk4lCgR
	 hkT5Cx5ff1Tanjh6pQ0G2NWYedadPlCAnOzm21OTvhya9c8k3b6DXfw2+jerT47W+p
	 geC3Zcz1437aw==
Date: Thu, 30 Apr 2026 10:58:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] regulator: dt-bindings: mt6359: Deprecate bogus
 vcn33_[12]_* split regulators
Message-ID: <20260430-sapphire-skunk-of-acceptance-dfbcde@quoll>
References: <20260429074113.3720271-1-wenst@chromium.org>
 <20260429074113.3720271-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429074113.3720271-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_015819_254525_1F95E95C 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, Apr 29, 2026 at 03:41:09PM +0800, Chen-Yu Tsai wrote:
> vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> two enable bits in the registers so that BT and WiFi drivers can toggle
> them separately without any coordination. If either bit is set, then the
> regulator output is enabled.
> 
> Deprecate the existing regulators, and add proper regulators matching
> the outputs: vcn33_1 and vcn33_2.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - deprecate the bogus regulators and add proper ones, instead of
>   removing one and keeping the other

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


