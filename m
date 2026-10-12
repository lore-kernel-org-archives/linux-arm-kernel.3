Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC38CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBwh44fL/gjgfNRTCrTc1OzzJYt8b8Lxx/wkIXrk3BE=; b=OfQ0zPy9I/ftLQz356Ik6bnQUm
	tLmCRseF+OhGFqT3j7ocVJ+hxUYyJzoQsMDQFJZ+iiyXTDEVlZGZ0/gxzFCdINKGUnQ9zI72BrGx9
	C3VXnoBSDR/s8fQCSEMBgSNeFJmx6Fcs2hpGILZ1mGfOIxkkOAklY39RWdLH3xmC2i+4fQ3iN4QNU
	RxmB4wL8UFuZ1CjiMI486+jdJ1TGOQ1ddWmnh2SuPJoJje6g9h3/35b4ujy1aeOORQIesmpKIVJfS
	P8mjgtPD/mMEb9qV6BUXko2Vow1BzP+zwBFt4Ym2kpoiqBVuZKevKVVJllAUDP+GEC/7XSrxI0vc4
	s9/Z/HZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9QB-00000009iqY-0XXt;
	Mon, 12 Oct 2026 06:22:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9Q8-00000009iq0-4772
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:22:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4541E60AB0;
	Mon, 12 Oct 2026 06:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B061F0089B;
	Mon, 12 Oct 2026 06:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786120;
	bh=hBwh44fL/gjgfNRTCrTc1OzzJYt8b8Lxx/wkIXrk3BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M2y/TdHEddwpZzLkvsfs1kvuqz7H4h+T3zY9qSkl2oiaZM/MO0GaO+z/Tk+l0BV3o
	 qG043hAD5UX37fkmNSuhyJIp79Np9K6mMJlsy8FhsInWIQLFX6W3hOrp4LzHgmbiQd
	 X47tjdOHmt6tByLBIcwcUwaEsfGIRahQucFFNJYNA0dKwsv4WXSvBdCpTzFgBlOOaN
	 DC2YqnuawFVDFueQdCF0mZqzJXkmS2eiflj28NCoBMpkeHzoXDQPT2SiAl8hHrcDFM
	 Rjd1jFzHVhdYHuuHKhsUbSFlt7JAbl8qXvjSvE2k+YzfV2vAFwMTNh3xHOT7tIhNfl
	 UsTXs/tPLqPtA==
Date: Mon, 12 Oct 2026 08:21:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 03/14] dt-bindings: clock: exynos8855: add peris clock
 definitions
Message-ID: <20261012-inescapable-tactful-sawfish-0fd72b@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2@epcas5p4.samsung.com>
 <20261009120137.2801911-4-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-4-raghav.s@samsung.com>
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

On Fri, Oct 09, 2026 at 05:31:26PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_PERIS
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    | 11 ++++++++++
>  2 files changed, 32 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


