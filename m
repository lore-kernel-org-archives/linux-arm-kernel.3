Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D309AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozrFJSH6wnJI6HBf0GGRZJdc+g4xFJ+GJKX9/xbMslY=; b=fl6TxSF1jyE72UBFc4SpqOeHr7
	NGaXM2MWmJgMA3fY0fpkp4lFcCbTJ/yhRAzgsGMi24LaOR3KCj7unRDZIt8sF+4l6vj0dchKuki0b
	5RIdli6LwruIwu/6Qccm8kZW+Snmg153DFRnIxP5i4BrphJz1ACGMtSFCB5Gx4yyN17xZDXTM6A8T
	SqzUloMNkhBSwD0V3REegeqiQ2r55IWwsLuYSqhQMQ3SpF/Xp6Z546mrPw3FLDvexi/KfyTWfjpis
	znExhpJ9S/hEHyjOL4HpFQhe8gz2b0xWr2LDJxsBRIhnCHR8OQ/Za0ErPPA9bTQ+jNIxCyY3SEEkR
	+oVdPGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUFz-00000004IER-0IaO;
	Wed, 23 Jul 2025 07:51:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU7H-00000004Gjh-3s8q;
	Wed, 23 Jul 2025 07:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 072EB6691D;
	Wed, 23 Jul 2025 07:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A78C4CEE7;
	Wed, 23 Jul 2025 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753256538;
	bh=fYh2NB4GUoqzaRVlaz/dvGLqiathfR8O8zqZOjCaDRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUW962WOw9nxieE72WyF/Yus+q+umq2odPt2oyw0iM1A7fwa09VWCK+HgAINsLxfm
	 4YyFn6tk1wLrFdpYoTtfFn6rGQ+/f2RslTqft+ne0kRbuPLyO0Uy2f8phKammS3vnA
	 KkmlRCluerSgbYsDUjnOfYyOo0kXEcb8RmxffmqO/FCKPKIJMrKVGbHR92AGtRGDRf
	 L65KJkOXNIqEVcH8tB9/2VSIwZ65prnYCxwtbJw8W5n0RERvyIHCXw9sHKse/xjhTN
	 8Uhw9gYdJuATIypdsx1w+TY0YgFzGgmHBrcC/UrIbSZD9eT5LIPcC+HHpzmIx4n4Zl
	 3iK/XMnPmBKrA==
Date: Wed, 23 Jul 2025 09:42:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-iio@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
Message-ID: <20250723-foamy-glaring-tench-561fe2@kuoka>
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
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

On Tue, Jul 22, 2025 at 10:35:13PM +0530, Sanjay Suthar wrote:
> Fix minor grammatical issues by removing duplicated "is" in two devicetree
> binding documents:
> 
> - net/amlogic,meson-dwmac.yaml
> - iio/dac/ti,dac7612.yaml
> 
> Signed-off-by: Sanjay Suthar <sanjaysuthar661996@gmail.com>
> ---
> Changes since V2:
> - Corrected the subject line
> - link to v2 : https://lore.kernel.org/linux-iio/20250720182627.39384-1-sanjaysuthar661996@gmail.com/T/#u

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


