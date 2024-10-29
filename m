Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EE1D339A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhSq7mS/QM1Fe8k3SMYjLxLnY7oALu+rAKFh93YXef0=; b=ahCyVfKCFJ4hCPEYw+zabyRNh6
	BVksVM677tWCfOQMKD+fszw+b84oOusS/Ar/m+7hZDVdJWWQCTo/5/rR5HknVozRs4OFJzeb907Fu
	lGj4bgUpnwR5i7jmEblqgHqn9RwI6OvzTKLApsQrn3WhoCT04GLz/Uk7HyhraMI3+UAuvabuxRLB+
	AlMhZpY4dIC6Rg99OLN9Wg5yJo69PR8Sw5sW/WlHODzuvFjHHwKcyR/YQziYWfeBg49u2eOM+6a/I
	7u8+bfFVvz1TnFLDUi4rr6ojw5ia/B69VhzYgFsILdrG/hsKjUasDZK9P8qhIvlUCpVjM0T7VuS5b
	x/Moz2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gxH-0000000DZHJ-41ZE;
	Tue, 29 Oct 2024 07:47:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5grD-0000000DXe6-4Bat
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56531A413FA;
	Tue, 29 Oct 2024 07:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1029AC4CECD;
	Tue, 29 Oct 2024 07:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730187699;
	bh=IQEh5EussygJgUUzWfJeQ/FXr/FcOcbs/szaZmJBHo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njc8eg0uqZRauuWTgMREq2+3I7fvICMvCytUBaD/jwew7xxd5bgg8a7910TU+wX2n
	 kiyTZNV3+e8S/pcF/U01MPhOPstYT3tEZop20jisA5cwaOLHAXAvwHY/UgCLgiOjTu
	 cxMfs6vllDscfNutuo6b+CsZkyzrjxVAW3U7p1kW5j/iKK4SFHkdFGGP2mqMYgJpLv
	 W3DVWga7+Zkz1Xa0Y1TAojKBasRXBwQkA5jEEf7ZqKiuXk25JE9rQudaRzrtKqUCNV
	 vL1zc3zVA54QF8GKsfuBaUEx1sR1zc9sFrHdQrRbN23ruSqFqFfnrSfrdCiTfb/sGu
	 VaQhZ03dg1EZA==
Date: Tue, 29 Oct 2024 08:41:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH asahi-soc/dt 02/10] dt-bindings: arm: apple:
 apple,pmgr-pwrstate: Add A7-A11 compatibles
Message-ID: <hz56qyjzjb5ah6hpp3wlpiewmo575gej6nljomgy5hdtacfuk6@7azefzbmokcl>
References: <20241029010526.42052-1-towinchenmi@gmail.com>
 <20241029010526.42052-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029010526.42052-3-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_004140_120180_32EEA46A 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 29, 2024 at 09:04:00AM +0800, Nick Chan wrote:
> The blocks found on Apple A7-A11 SoCs are compatible with the existing
> driver so add their per-SoC compatible.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


