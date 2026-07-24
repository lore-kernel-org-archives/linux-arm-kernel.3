Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4875FC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQv1+G5oirBut4YJC2CdAmnQ/6ebRZfo0xfDBjUlsP4=; b=ltQmH9UJYuPNPa3BZkyljbxE3k
	ePeWN9nVw8oi924+fiwwVZhs0MDQYQB6MXRcu4BXhjuqIWqCLOTnZ3RciQ9jKPQw1KeOhdw9oF7bY
	H9yV4bALmBpcvpebnLGN4jv6hkJ9NLWZDQOXVQHNZ7/8ba1co6BIl+5l20fml6d2uwmjejY/KpBe8
	3YNGe/l/d8a9eVjYJLvnaYZrt1kdC9n9Y2UcWlvsbefyOdzNGOsvZSrdeVTvQfFUqZtvNc9VSfHXm
	vpSqdhHuuazqnR+gLVboqddSg8psw/jnSplM6kejHid6cEWn1pCa9HAv9MgZVMnXQCnecfAWIXW7t
	+XO893XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn915-0000000FY51-3YBX;
	Fri, 24 Jul 2026 06:04:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn914-0000000FY4s-2e4Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 196CF41A52;
	Fri, 24 Jul 2026 06:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11861F000E9;
	Fri, 24 Jul 2026 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784873054;
	bh=TQv1+G5oirBut4YJC2CdAmnQ/6ebRZfo0xfDBjUlsP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpuPW9/cpcZ4ce1lgG5riSlqnGkFS3P8i3x03DhTYcTJ6Q5T27ZnoWif3e0+cKOjx
	 o7J9liTipUaSbCfWr1M3j5+nwhw5Km0vt9B7rzJ0y/EL84if8M7FBafoysfrR392EO
	 vxwOH7Kz+5cmL54DYreYpdVw5xwtrfhSri7M9rEt+KkpiLdRAK4ZtjdgXNmOt0JIk6
	 7Z/3Gzn0uZwQX9Zbvwcapj/5/0n1WYd0UJG4jtPgmxgNlP41x3SsFzjazb46ysbKPY
	 IKHhmG2iGXh8VnoZtVq6TAKeM/LIUMzNCziKy6knqC9fJqbAeRKV1pKSY/xNL9rNw2
	 nmCc+nzRdmcgA==
Date: Fri, 24 Jul 2026 08:04:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
Message-ID: <20260724-jolly-pistachio-jackalope-f9c770@quoll>
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
 <20260723-add-coresight-nodes-for-shikra-v5-1-fd5494471b36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v5-1-fd5494471b36@oss.qualcomm.com>
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

On Thu, Jul 23, 2026 at 04:26:30PM +0800, Jie Gan wrote:
> The CTCU device for the Shikra shares the same configurations as
> SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
> the compatible of the SA8775p.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


