Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0B8C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8WurlmhkA4e6m6wqPDqGz0fYjsjwdZG3YnLtCKxAOg=; b=KQ2H1HVenYIE4owdtR3I2XuHRr
	H9DzaLjSB7xyuPJthAzhG+CyZGk3wEORW6LQF+14VJllChAZ09sIA8M8teUI1L+u04hDdezu6VYip
	4+nOKZsWB38T74JLjhcRn4XIgDXmJPdVMXjtRg9Q6UoNLGVPntT8VbkmsTTLLDcvmYo449OnBV86x
	LLqdoyVGgFjX1lKIph9Zovnn4p/XoPdaHuWopqPofAL5nXbJIp/+3B9mS6cwcN0Xjv3NOXAYjL3Ij
	rAt/F6rM7Gaql8O+OOJdBuEe/hTNqQR6ugqULqvO7Fvq93rJgpVUfooarmKldubdKHiDOfq+8LG3o
	k/kqo18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5fhA-00000001WZr-07qQ;
	Sun, 13 Sep 2026 08:36:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5fh8-00000001WZd-1BOD;
	Sun, 13 Sep 2026 08:36:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5318C433C3;
	Sun, 13 Sep 2026 08:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0959D1F000FF;
	Sun, 13 Sep 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789288573;
	bh=d8WurlmhkA4e6m6wqPDqGz0fYjsjwdZG3YnLtCKxAOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YAj2JaJjtipqC9sZ5QQPmMWXy2aHSiCBhyK7zDQ6fMiC8WHqiryZrWSgKSgzNEJF9
	 Q9+ULcFDj+lHGgaMb74R6N/SbSmXnrYjI59pxm8Qrdskdltmw+3aqk2OZSfi8mYggI
	 drjJfatC3GtB7P2Z898f8ECyFKlhpoZOo6uPmVlO8h3JTMs/3yXv9ZfqlSvEupLkzI
	 gPgrQcaOnmNxdV7QMef2MZNI/lE2dWpftedqR4jSDMkHllIDnn0fke7IBeTV/DRIdF
	 qinLfQZiLb+DymQUDpb2Wi6HRA/n7txhXsLIbfCey5HfKxrHodUJ7RDZhLrzl5aFCV
	 FdU0FCfXCq5gQ==
Date: Sun, 13 Sep 2026 10:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 6/8] dt-bindings: reset: Add mmsys reset ids for mt8167
Message-ID: <20260913-moth-of-wondrous-order-4cb0ff@quoll>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-7-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-7-l.scorcia@gmail.com>
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

On Tue, Sep 08, 2026 at 07:38:33PM +0200, Luca Leonardo Scorcia wrote:
> According to the SoC data sheet mt8167 has 28 mmsys resets. Add the IDs
> that can be used in device trees to identify subsystem resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


