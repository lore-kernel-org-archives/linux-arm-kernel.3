Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED73CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0M0lA+uNsymHadLr1LbW2/k9sV2Z0Pr3hO/Nohepajo=; b=cMNf3CTRs0PxaQMAy0tI9wBmWp
	vAGWD8EjV4iDBMHQ8q8k92bNg98I21wRocGJzXGV7lXEavup3L+6IvtHh4Zn+Yw+QMQZk/MfdZPdR
	HnKk4hvq4ujEwCMny+EJ86aVt8I8GjMxLlLoeXUEl8/v0tYuRfSNwpCFc3Y4dwVp4lH4mIZ8p1zbG
	rUa8NI4zaCNlL79pfYrj+8H16YuXJ+Qo7+LbRVB0uezXDRiUtz2esGED26r9hVTHW46IjMc7Dbt75
	G6gHGq2lm1/RvT5lSz0eYY2o3dtxxTdLtJc2rTPcStI4fPDnQmiYL6Zd6VM1J1U/F5xW1+duPIyBV
	nrxRa/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9Qn-00000009j0q-21Lj;
	Mon, 12 Oct 2026 06:22:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9Qm-00000009j0f-2lTw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:22:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BA4843B24;
	Mon, 12 Oct 2026 06:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0D71F0089B;
	Mon, 12 Oct 2026 06:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786160;
	bh=0M0lA+uNsymHadLr1LbW2/k9sV2Z0Pr3hO/Nohepajo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KoDnlBIEr8O41hMTpjpwGw+nkQh96FT/F6WyhI1ZcvmUrgBrcTOLokFRslZwSemJb
	 bakVoXcmtRAOJGQZSPp5mAy2PwfSsRb+JVSvJIzZmgx1ZTxaTHHCGaocRrCeZcjbkh
	 ndsOuMj09B+spZ068F0gjRkqfQFBiCIryPI5p00TOZaTpUrdhwxZSZZ2xSX0txZZ40
	 mQVuG5+m6yLM7CciQOpkjwzJpUAeNc7/xIgjX0rLnXfAd6k7NqcKbHvexFIm48/7jv
	 +bB4I8VoRFop6vfR3o5iUj9tvChy4hyc4XP07x4Q8zZcVnSjpCSReUKbfqi6UorlAa
	 Gl8vH7hgV+g6Q==
Date: Mon, 12 Oct 2026 08:22:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 05/14] dt-bindings: clock: exynos8855: add usb clock
 definitions
Message-ID: <20261012-antique-stoic-herring-7cd2db@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d@epcas5p4.samsung.com>
 <20261009120137.2801911-6-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-6-raghav.s@samsung.com>
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

On Fri, Oct 09, 2026 at 05:31:28PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_USB
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


