Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BB0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AKHd3nNyOcbXAMrk2RZR9YeluYyWtoTErb/MLCvWlU=; b=YuPAzOUikcU5raSm0cIhS/tzy9
	Z8HofHh9sTsMZeiN/RhYda6Qg43q86nD18wtGhBRrPqq2HbIRzQMYZ0vKB5WzTAn7GkW+EwkCW56N
	ofb8wn8M5kageZ2WDd73hVSDK3Wnokv6UlZpK3S90ZubUqueJArT8JXl0zx6xaIYs/+X1KQIZYQtJ
	/VEDt8HOhnn8HQbJfi3U3arOTyaVns1eqTHfC2SopyERBCL7GUNP6fxbFA66KUxzc5jERkRGL0lHb
	LFjkoJtug4H0zBI/N2uPfGeodJXTk0SMWoG0QLPoS3XKo4ThFQvCkgO0uB3+1BSmGmPTquH5UMik5
	OeudsyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDJs-00000008n8a-3s2S;
	Mon, 13 Jul 2026 09:51:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDJs-00000008n82-0MfN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:51:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F1FE42DEF;
	Mon, 13 Jul 2026 09:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894C31F000E9;
	Mon, 13 Jul 2026 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783936283;
	bh=0AKHd3nNyOcbXAMrk2RZR9YeluYyWtoTErb/MLCvWlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hU+5nyPrf7EcyakWXdUVFQ6RrZFpynBBgPhKGzI0bmlDEsYU5oIrzcZ45EHtmyUOB
	 XYSXbGRNdmWICNG1JU5+UnGwPp/tT0UKA6IRPSNDwzOBDvGCKDFm3TeC+MaKcTbHL2
	 kKSp6bgM0V7giPdBmc+GH2+HRRsoTsO+2M4+TweJD8wOOfDiV/WMffXAcNXIIJ+Zr8
	 KX0bsXMWd8vnNscnRGPUGtl+QYGqa0zmL+SnNYYVdAdgLlL8L2D+wrwJlk3DZR7DE4
	 bSQXz4pvNo2Y+ZDfhPFp8J7KagRm/DrcgOwyHkMx1+/Bw68Pv8F7dVvhxs1lASWhtp
	 WOLc0jPKAuZRQ==
Date: Mon, 13 Jul 2026 11:51:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: thermal: imx: Document calibration
 offset property
Message-ID: <20260713-powerful-academic-pronghorn-e895ab@quoll>
References: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-0-69405c306c6b@cn.bosch.com>
 <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-1-69405c306c6b@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-1-69405c306c6b@cn.bosch.com>
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

On Mon, Jul 13, 2026 at 01:51:33PM +0800, HaoNing Cheng wrote:
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements.
> 
> Document the optional fsl,temp-calibration-offset-millicelsius property,
> a signed offset in millicelsius that is added to the calculated sensor
> temperature. The property is optional and the existing behaviour is kept
> when it is omitted.
> 
> Update the binding example to show its usage.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>

Now this causes a warning as it does not match the From. Well, that's
trivial thing, but why did you change it?

Best regards,
Krzysztof


