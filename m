Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F00CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34FF/afQY7rryAyieahHIYlb29AbDzpMLTYiaGi6CT4=; b=Em9L+xk4s2bELz3E3Iv64u256q
	F9XaJMoIhjA5xfp+uFFSqc616a7fv6QU4L8aKrewoXzvF9FqgkRbItzyvmKeZw9oPTWS1z+ilHtaI
	ctsOjpf5eUQqsGKFprYM1YiZUK+oTVGphtf2s3wqRWSCTfx+fjRfrMERmHJxk0inHtdaS0kNnkTT+
	YQE5clldrbXPA1RiK7ppnHGjfwNNrQHU4VJMfBOfn68zCDyH6Nd3Y837c46n+/JZOihcu3UyHRvws
	xEGsu8UbDdcD0xm/swSMp5aZZPYUPxl9h98muppD7/DJQJyrKGJG0O3/DxeZ3zEIYsBLNYwuFyML1
	/zW2FK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7hG-00000006qOB-0jFl;
	Tue, 23 Jun 2026 20:26:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7hD-00000006qO2-17ro;
	Tue, 23 Jun 2026 20:26:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D49260008;
	Tue, 23 Jun 2026 20:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E341F000E9;
	Tue, 23 Jun 2026 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246370;
	bh=34FF/afQY7rryAyieahHIYlb29AbDzpMLTYiaGi6CT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OgC4EauXpZBNWLUChjheUpa4V/Iiwcb7qYB6c9bFVNd68X/S6kySvetpAj9rl5BmR
	 S+lJIbLLAM8ffuvYh83VirCj/2inuWQ97ElFLQj2BH7Y7dW3WrSQXJI3W+aFRXsW5t
	 lIPEOCiBb0+eruG1A0M+q8i2bKsEjgSopF0ZH5dWpIAv6tZ5gbDMfcV1tsj/9NT32O
	 kHjUFcSWrUAIqvGNvpYU7Y1GXsgzBseFDBml4R5BXhJj2kn6GUQX/ZJ2TPRWWnuzGl
	 DL05H+zXFRx3Tzvb6AjrSvefPdCwf7XvtNNxHp46XgsrwBxpDgUBO280Vm7W+gSHj6
	 y5NfZlXkB1hLw==
Date: Tue, 23 Jun 2026 22:26:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Drop incorrect usage of
 double '::'
Message-ID: <ajrrrB3EzSuy-JDU@zenone.zhora.eu>
References: <20260623054842.21831-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623054842.21831-3-krzysztof.kozlowski@oss.qualcomm.com>
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

Hi Krzysztof,

On Tue, Jun 23, 2026 at 07:48:43AM +0200, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
> 
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

