Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADBAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WLCVQsvZMqqfH/K0AWHWpcFwi5Xbu/MV1fA5PKOgWg=; b=GxXlLsBggc19eCbUxrEvr5WZw0
	I5XvEKwDyn7UoZqqSux42MRVFpMIUCDdRpZrd6sYfoeDSgqrb5A6OsgVBOvOigDAMAs6Yy3c+mKR1
	p0YChPa6SSRbaeV1fjyQZHhlrT2rADK+3qjs8E2olfXXYlCzXIZLl+stMEqvXfHGS3yNB87hp3c/f
	YfPkRQbIQnvKhZtKovn1Pu6i0dTWqbw9Y5j1BVG3LhZWRKLzGIYv951dB3CziIkQsFvP4be4NbWwC
	Sv8vt1S8C1MfSAour7woHAHQTkZzjuAIo+kEL8kZjLWHtvZXWzM0+/pcJugDVSSPXFwHXzDfwB19D
	0fyhFfwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whofS-00000002X2r-0Jgi;
	Thu, 09 Jul 2026 13:19:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whofQ-00000002X2U-0mwB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:19:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89D8A60EEF;
	Thu,  9 Jul 2026 13:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42E71F000E9;
	Thu,  9 Jul 2026 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783603191;
	bh=0WLCVQsvZMqqfH/K0AWHWpcFwi5Xbu/MV1fA5PKOgWg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=h6X+tF0/BBXN9PxosE6RenLIymvAa2EGxIlzh1woWhTzEctYLSPkemOfJ9CWorfeR
	 AZzYt6qHNhmxv1+BaxzXyqzNRnivFLnnfvE8tlFi/dbBDUyWf077az9me2KXY+f6OO
	 ODh0JtzhXeaB0KZMSsry32HIdUc9lSY7vENI3ihNHUeAvMxbDIZBjRTu/Wj1aKNOwE
	 XZ5Um8r9lPbPNzH4j4w4IGzT0sDi3gCvpvFlxWpFCruprK1TCAhIMTT4dxeUNiQxMD
	 6BEpicdMfq0Oj/JsA4aQe2OQP4wJU1PrvXnUq10bYG+Ry+iVUDOOJEDhuUCKIj4YyR
	 4xhAF5vIT9Smw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict
 children with unevaluatedProperties
Message-Id: <178360318738.284535.1868657789892551663.b4-ty@b4>
Date: Thu, 09 Jul 2026 15:19:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Wed, 01 Jul 2026 12:57:32 +0200, Krzysztof Kozlowski wrote:
> Each schema for a child node should end with either additionalProperties
> or unevaluatedProperties, so add missing one making the schema tighter.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.

Applied, thanks!

[1/2] dt-bindings: samsung: exynos-pmu: Restrict children with unevaluatedProperties
      https://git.kernel.org/krzk/linux/c/3527091de0feb27e437bce175048b54be835221b
[2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed reboot modes
      https://git.kernel.org/krzk/linux/c/e131ca83dabc8bfb8c1d455d02bf2d7a7bc1198a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


