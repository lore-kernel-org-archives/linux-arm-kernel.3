Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBC2E9A74E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcYBjPeXSOzD9NFafUiTvu5pLEyLFcNdQhAeR7aQyM0=; b=z+zqy3iEcykP53yRExQBi0cxOB
	Ir8X5OUnyajyp4SaP7ih/5MDY6bAQjVUJVvug9f0fwjb75HEdVh0szclC8IeRGZGZ0WmSxbrG74cw
	2ynrO927X6+TeuqoqkmWs+CmT7EHFNh95rNB04DETSuTIhwE1wHNJjwvgwBKUn5AWTdn+TFYBOrcM
	rXztU+LSC15LH+z5vzwJGPLZyBkfmZbeOcepur7KNNkW1olrAWp5v7yGEK6t1lGIHsBngosOEqNNk
	BIW6NsD94m+pG72TeKZCY4qVY3miSbr/6S1foyrf7QMCl+AU2/tnP21XpVTRxLpTkkAo1S141HlpU
	ONuRD6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yH4-000000017XG-0pFm;
	Tue, 24 Mar 2026 09:42:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yH2-000000017X7-1oAw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FE2760120;
	Tue, 24 Mar 2026 09:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3AEC19424;
	Tue, 24 Mar 2026 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774345327;
	bh=w1b6t/WZFJinFZolBARj9oLa4QRP/BXtqXTJ/gXtkSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzEyOhdwxgQz/aZB83aAAqtgug/qNEdW48kuM+517X+KGio6CfBkWpfWU59DdffkC
	 le0xmNP4iHOLh+mhqpdvtgQgXt0ULpkEb2mxjpdgEQ2OT+kj7JKQAHnFLagLbukRBf
	 iAck0oix3Z4AM5lGloysyfA4OSIGCR75xyoScmYYrEmiwSxXJyAZPqVNRmxSblu+D3
	 WOAovnvACHyh6hViLEzVgTPC/zhini8LawFJvprnoL4HMHYP6Z+w2kgK0HUVvdqYE+
	 jgNX3Cn0F11C0HQfXC5WEkRFk56RqeRmbEcao7rI8r0s7KHy3MUV1HqRZWTSL8s3T7
	 M6av+VJZY62yg==
Date: Tue, 24 Mar 2026 10:42:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	xuwei5@hisilicon.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ulf.hansson@linaro.org, zhangfei.gao@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH 2/2] arm64: dts: hisilicon: Rename dwmmc nodes to mmc
Message-ID: <20260324-jovial-ruddy-oarfish-5dc8d8@quoll>
References: <20260323194400.22886-1-rougueprince47@gmail.com>
 <20260323194400.22886-3-rougueprince47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323194400.22886-3-rougueprince47@gmail.com>
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

On Tue, Mar 24, 2026 at 01:14:00AM +0530, Bhargav Joshi wrote:
> The core mmc devicetree schema expects mmc controller nodes to be named
> using '^mmc(@.*)?$' pattern.
> 
> The legacy Hisilicon SoC files (hi3660, hi3670, and hi6220) previously
> used the 'dwmmc' prefix for their nodes. This caused warnings during
> dtbs_check.
> 
> Rename the 'dwmmc' nodes to 'mmc' to comply with the standard schema and
> dtbs_check warnings. The legacy phandle labels are kept intact.
> 
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


