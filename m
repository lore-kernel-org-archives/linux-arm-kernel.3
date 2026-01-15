Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5818AD41149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4So/YwyIHWOzX5GyemhKjwVR66Yc0AEULLE6bDJ8do=; b=o9rSEfK+JDldYYeqFKeL4zDm1b
	9I+GtDDv+86j0JNLVdMmFP2ywGUAjonBNBsyaO7IkRNlSaN36ztc1LO25hi5HR5u1dVBE1Ngtkf2w
	1n5qV4PNQQubZervBwukfsFaeD07ULB8IkKZLgu7/UdFEfVVg8scEg7kL4qUDCNbxnevjFGWthyof
	bACeEz53o2OpwpSEa+2l43dZr5Wq8N5dtGYjcziI71CR22ZBIkNeRUEdoflfpwEib58SW8cgBvj+J
	6J9ammKQtjM216ygp89GPDDrUdE9++TMbhLjUeimdBBSXYfiy6JNC1fq/x/W1/oCEtBr0NRVsMd83
	qYVou/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJeA-0000000C4Kf-1Bx7;
	Thu, 15 Jan 2026 09:28:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJe5-0000000C4K8-0I8b;
	Thu, 15 Jan 2026 09:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 602E540DD3;
	Thu, 15 Jan 2026 09:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE455C116D0;
	Thu, 15 Jan 2026 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469280;
	bh=AE8OschsBHDZ7fd7Wfcbb8XnsmM+g7YOHuxXkR+JC68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCcVLdY2aNq4HFLq2jzUkFSvvBvLL0taVpC72YLMYncvVX39GW5CmoIbcr1MCxOPJ
	 tqlXAY3qM5j5komenfwMSFSiEf3rx2c7GrrzEKB42l1ZRJa5VdbJkk0hknW+WAAHdc
	 VKI2dsTZn50pfM0K/W2jgNWYPPq1Jd+jBVrHhRlp8N16FWsyIZGifgSqcdBXOGAQPi
	 WLEvgxsgxuiYMAtEWUOtPRHYv6iYI7EByprY3lc8DCZtym8igGqBzI1ewtP+CRGD31
	 iqfIU9NagTwfRp+9giT+oHKD8Hw5k1lSSc7l8jsxWKUBT6MhJknAAdyWhqrFtGUzU6
	 V3CELGiNNKsDw==
Date: Thu, 15 Jan 2026 10:27:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, xianwei.zhao@amlogic.com, 
	christianshewitt@gmail.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	nick@xieqinick.com
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: amlogic: introduce specific
 compatibles for S4 family
Message-ID: <20260115-aquamarine-snail-of-control-f87a3e@quoll>
References: <20260115030015.1334517-1-nick@khadas.com>
 <20260115030015.1334517-2-nick@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115030015.1334517-2-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_012801_125950_4948317F 
X-CRM114-Status: GOOD (  10.60  )
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

On Thu, Jan 15, 2026 at 11:00:13AM +0800, Nick Xie wrote:
> The Amlogic S4 SoC family includes multiple variants, such as the S805X2
> and S905Y4. Currently, the bindings only define the generic "amlogic,s4"
> compatible.
> 
> This patch introduces specific compatibles "amlogic,s805x2" and
> "amlogic,s905y4" to properly differentiate these SoCs while keeping
> "amlogic,s4" as the family fallback.
> 
> This allows for more precise hardware description and future-proofing
> if SoC-specific quirks arise.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


