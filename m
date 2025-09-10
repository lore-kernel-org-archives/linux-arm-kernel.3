Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93143CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 11:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxO4YDQMYwEB7BCJ+ZrMjfMVdzg7wLU+b3lSn7ddBhA=; b=WZ2XGXY80MYlMSinMueUjCPM9W
	/mWmWZ2zAKLe0jl1s5/Rhc7miK2bVWrXTU0XIounyXomTLM3RmXfib2uHtYhW/fQPMBRbvpANNSuf
	TEGY0+vh2tLWxUr95WGVoJDmtbj2zB2XOHb7uO2r1KOyy2EJL18QkX5qmoHedc9nNCbRtYV0TooNo
	ZqeIyk44Io06lI8tw7vqIGWgcUM2R/U6QNxXBRMjkMtK+5Y8VGEYP/kI0+gO+wcEDRawGGHdEchHy
	ZKy//iPVPxKg7k+aLQiyThOVVPhGHnd7msrofTXsAF7gDwqPUwJmmk13XbtW8UKTQuwwELF0UBC1b
	8B0KM5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJA0-0000000Dsnw-30XB;
	Wed, 10 Sep 2025 11:38:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJ9y-0000000DsmT-10Bg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 11:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB75940305;
	Wed, 10 Sep 2025 11:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE9AC4CEF0;
	Wed, 10 Sep 2025 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757504325;
	bh=CfDP9NnOJJ4XePyfe8vxmQejIgGJ0Qdeqb1FNfRZmZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvEKwMyYoI6KNd8d3uhEdSSM6OPwToO2EECRmEowA5aAqOg1XoJx3TG5hkEdSlRvA
	 QjZsQ1Nkd7v54hDO6mtBrQ7RJbvrci+dOGU6qwPKAsIp7ILvApFPa+V9bBFSjS91wo
	 R7EKGfVwgv6xKSQYIIQTZDBy4YQBYwx6mPI/GRsTNRIbOyIdTBV93Ob0W+b6+lKCW8
	 v3LXrbV6SGWsyhKBh7+6BrvcA6DS572J9jy3Tcxhp22bIJfwYMDUSr98CNjYddjc8z
	 a3guo0jykFZE2a+5Y+tONtYGC5nA6s+W1jHTXzasBqsZXeJeNrBqBACI0BozyXx/Uo
	 wHpea8Aaoj0/A==
Date: Wed, 10 Sep 2025 13:38:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250910-crafty-adorable-sheep-f6265f@kuoka>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
 <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_043846_297790_C4D1B7D7 
X-CRM114-Status: GOOD (  12.73  )
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

On Tue, Sep 09, 2025 at 10:33:02PM +0200, Andreas Kemnade wrote:
> To be able to fully describe how the SY7636A is connected to the system,
> add properties for the EN and VCOM_EN pins. To squeeze out every bit
> of unused current, in many devices it is possible to power off the
> complete chip. Add an input regulator to allow that.
> 
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> ---
>  .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


