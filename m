Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5937CC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFPCDqOHeWPpU+c8MCZZpqO6olsVco+Tgh8EIUb6brQ=; b=2Yt2cAQag939xDNyY4o8GWWbi2
	f9i2Z6iAofcop+W6WLMSoJke6JU75VAdDmhAvbrVa1QYDp/J1saYIOpb91lg0JIklsFSA8h2L/vFz
	Fx4BfH3e6aT9haubbco0hf2o3Huw87VxZ6VZHgIC+eHNUZYB2jHgMLCxKEyO0V38mNWSlOGgupkwz
	rl+llelpZksnUbXAtwsvu59kYDmi9NbbZWvbCZHLPgRmTb8Cu3N9sbRzBLsnsUsrf6ePrrFpchPHK
	3R6N03SgqHC/aCh4fCw7s721fHUFfMwXtSuqQz98bgBne6Ha12yvgEjnGdTenvYI0SIfpwsjgRRNQ
	YGgpfXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfQ8-0000000FFvA-1yUu;
	Wed, 21 May 2025 09:07:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfIr-0000000FESv-3SfR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FB9B49CFA;
	Wed, 21 May 2025 08:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF22CC4CEE4;
	Wed, 21 May 2025 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747817997;
	bh=KSr1py+mpv6hL2cVk3wbDpFqUqhgU+ANqE7/KjCj9gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VwLD+kchrJE90JrzGeoR2fSeIE416vCJwOHwFdyzx+ReYM/dHUk8j0xKBX3CLGhQ+
	 YhM5VZiUjCNoP5ynnQp4bRB4uOFkKktQmGpXUzWHDg1yu1ew7o97qo+xq4Wb3J0fBD
	 uaTfz5AD3KKa4LMnYvbdV/omTm3ue/iRaYfXzjo2JZYTeHJemRTbkxPJQ4MSQirSUZ
	 Pul9Oimkbi/9CeSSUMzfJhXjz4V+W8cQyZOVCwOK78oGiSQ+/MP38wlSqzQxdnNk7I
	 1b6F5Vp04vJHD1LSTnUi+GTjc59DrzYmBLN8pw4IXhlXAlktWareFTqKwrODyX/I0E
	 NomKOaRpOP4Dg==
Date: Wed, 21 May 2025 10:59:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	richardcochran@gmail.com, sunyeal.hong@samsung.com, shin.son@samsung.com, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	dev.tailor@samsung.com, chandan.vn@samsung.com, karthik.sun@samsung.com
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add hsi2
 clock definitions
Message-ID: <20250521-resourceful-majestic-octopus-cfaad1@kuoka>
References: <20250514100214.2479552-1-raghav.s@samsung.com>
 <CGME20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a@epcas5p2.samsung.com>
 <20250514100214.2479552-2-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514100214.2479552-2-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_015957_891130_D9F2E003 
X-CRM114-Status: GOOD (  12.77  )
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

On Wed, May 14, 2025 at 03:32:12PM GMT, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_HSI2
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 29 +++++++++++++++++--
>  .../clock/samsung,exynosautov920.h            |  9 ++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> index 6961a68098f4..3cbb1dc8d828 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> @@ -41,14 +41,15 @@ properties:
>        - samsung,exynosautov920-cmu-misc
>        - samsung,exynosautov920-cmu-hsi0
>        - samsung,exynosautov920-cmu-hsi1
> +      - samsung,exynosautov920-cmu-hsi2

List should be ordered. Stop adding to the end of the lists.

Best regards,
Krzysztof


