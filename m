Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB234CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAvr8au5jXx2j4KwWUXT+ieUZwz0pxq8u0e8g2/D1FQ=; b=pqrIB8rePFRCS24QlRvghPEov4
	ukET9wlz9d09kEvtSnSGZ1bLB1KG9dmocwiYiLtiWzBpy63NaJe82Vd8JMPg5gTEmJp1vk/V8FxG7
	vHd4OPSMA0ce4YDKHGiafFEYdUC1rJagmqc2pb1UJHj/DzytkzuZq9bE2RDq+DT41RPCVfrCmHwbM
	HZLZrTs0p/DGS4yXBF7hdKAwOo701VidfljSsQns1h3j5NT8NTnOtM1kShHwoKWweUqNGfR+gnoNl
	sY9VkMQkodTov4kl/knkhMYMItuYhU2v/cHJ134hBzlELbcTg+3TEjS+M/K6qGlSXKgi8KLx/s89s
	UcDKEcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9QS-00000009iuq-1ZVF;
	Mon, 12 Oct 2026 06:22:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9QR-00000009iuZ-1MWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:22:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D73314385B;
	Mon, 12 Oct 2026 06:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E231F0089B;
	Mon, 12 Oct 2026 06:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786138;
	bh=zAvr8au5jXx2j4KwWUXT+ieUZwz0pxq8u0e8g2/D1FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nSOds2w7z+8rJmHn2mqIiY0ZKhg54PNCMXUlPK+Op83b6r6RIna7a9USi4aK4XChL
	 xFHm73+LjbCiUjjmpJR2L13EcJQ3szmcyrzP4G3R+bu2p0kTAJQ76qMO0e+y9LAYp4
	 /QXZpM2C9CZGzJ2sItlIdMe3iOyQXSo0dzdsMUJoq5oWgnz9AyJoe7bWqFxvMpyX4d
	 ruAgSCs8yiy3WXljLw0B6CAwZxpMII/YMQOwuV8GvjTFnYmOKXkGa32v+UhZMB5S6+
	 /1/TDDcKu4XGz4yA7b4Bmjyn2r53YXlJb4r55VT08w4+Yr/W1mt6GCBo5TEoLFHur2
	 S2mhmk09hh6Gg==
Date: Mon, 12 Oct 2026 08:22:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 04/14] dt-bindings: clock: exynos8855: add hsi clock
 definitions
Message-ID: <20261012-furious-ginger-rabbit-a6fbf2@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114342epcas5p4345e99027177004b612da6fc103ba80f@epcas5p4.samsung.com>
 <20261009120137.2801911-5-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-5-raghav.s@samsung.com>
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

On Fri, Oct 09, 2026 at 05:31:27PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_HSI
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


