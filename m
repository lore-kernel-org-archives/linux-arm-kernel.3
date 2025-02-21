Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016AFC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDCkWAeu0gkSGqpXvjwxat20GFOUJsg1qLRR6khjf6g=; b=TtfF6dSyj/DcBONOe6J50b07ga
	8b9w6fLdyGrV0C7Xyj9x7JLsHpxxJYqwIyiJgnCoTS6/ljC6Qw+1akXfSy/PzjjhCPHsvxVu45MWw
	YMbbKXxbbiLkRuhskw9yALPXhKUXJ0kCbOUj/WA3iLRAo/isDMu/Hk+4Nl3drfzSwoPKG2lT/iXzk
	C0M9EakeL23BU6+SOqq+IkBxr2Gw+R5CzmOVe+f2a0omL75pcm1WEGP4ZeWcsR54RlR1q3cU0tk9o
	Va5W/VLMvTQKI+IQRGdnRIvt4M89rq2xTJPwjFgSQiS442Jqsbsiv661C+uDBzRTWSgRjck/bUN2b
	dE0F+0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOnL-00000004nOy-1Hdc;
	Fri, 21 Feb 2025 08:54:03 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOl1-00000004mrq-40Ou
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:51:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E89B561126;
	Fri, 21 Feb 2025 08:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02025C4CED6;
	Fri, 21 Feb 2025 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740127898;
	bh=HRPaOfyt1hWwbxmZ/KhgRgx6as51nZnrdfLsa1K/2f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELrQVGRUnBceU/QKxQX4FRiuvV3EnBTn4zEKg8qPJvvGWg1FuEUcuCRD7eUl8prnP
	 hiVoltNSf7NyGoSd6yX34swKlj9vHJZZ/JZ8z+rxW9BACPWtvfgxu8C9QUuConnmnM
	 7dYXfpV2tasqDl3JWmt1rs3FyK6FMANuWbwDcHcYo3ZI5FOMPJTtH3jpzIy/xScXZc
	 yPH5srNXLrGQhRb4BwPsgdPenqvwhuPErO0L0tNNTZaP9qncZlMkswPBGSRpujJALV
	 SOFheJbfbc9ncHO6U91igI4u7AT80lGN+r2Fb/iZOBDoxMFpbZ3l2eUCpcwcEonIrr
	 Uk4pFi7WYFYYw==
Date: Fri, 21 Feb 2025 09:51:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v6 05/10] dt-bindings: arm-pmu: Add support for ARM
 Rainier PMU
Message-ID: <20250221-bipedal-cobalt-eagle-d31ac3@krzk-bin>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
 <20250220180427.3382482-6-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220180427.3382482-6-vincenzo.frascino@arm.com>
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

On Thu, Feb 20, 2025 at 06:04:23PM +0000, Vincenzo Frascino wrote:
> Add support for the ARM Rainier CPU core PMU.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


