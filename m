Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EB1CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlhldOdvaZaZ1srD5ujBcQc7mljH6nOsOP3aJyeImGs=; b=csCQqopH105b4zMKljWuClshlU
	lBeDGy3U1nSasbNfx+9fWqUtxumhoipK9FKxTIi46s1uzcz32sK2JVap24ZTWcG4kaq/W3nZADELp
	KuEzPiaCacnrzvg49Lh8gbEa4Q6kClQQEVHUp5muNCaWl2cWXTRdN35IuV9lNTx9ORWFS5TYcZ4CV
	tPGfeD4pWyfnIoSkXF3Wx7uS39dbyTKAmqijpnNRZuybHojcOqQ172gzRc9KUGseLyjtDxHEci0/K
	Aw74uwj+3JvjvHVl3N9pWqDFgnNEFj9ikA4kF2W540hBhHOrbsm7EzGIQ1vp8ImBTldjYStdPugQ5
	sf7L4BqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENwD-00000003gqD-1PHZ;
	Thu, 30 Oct 2025 08:23:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENwA-00000003gpb-3nYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D41043967;
	Thu, 30 Oct 2025 08:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98014C4CEF1;
	Thu, 30 Oct 2025 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761812594;
	bh=cRGe7WHHw1LCeccNstuWW+P/ZSv12NIwuoWjOgarCIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7zxrP78KLIn7rJa+lpFRnHDGsei5y5pkM56Ke9U5jrC2ifsXej5C5GllJs8a9tQu
	 J/ZDekzbyKARQF/w4JRHaKsjFAzcrmPcaD/YOKGsCyUFktU/LqyBTScliEuD2P8DzS
	 naF/jtNiTJVRaDbLahNkneYi3smJnP/bHSz02jBCCg0V6pVIm04Je5SWBfoSLTOO0k
	 Qxhmr2+tBtjM4LqPLRSHsS8JpBizv/VMqwiqgEc05WGmgRIMO5MvDqtay/0zgkyIH7
	 ehD3qGVX1rsaNeoBVrUGCoho3p6ATff8xItvaCzSkHRsSMgQIgwk41l+CqbUMPIuTp
	 5S4Ok1oBSd1VQ==
Date: Thu, 30 Oct 2025 09:23:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to
 DT schema
Message-ID: <20251030-zealous-amiable-gorilla-b64ffc@kuoka>
References: <20251029185448.2121857-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029185448.2121857-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_012314_963317_562B926E 
X-CRM114-Status: GOOD (  17.06  )
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

On Wed, Oct 29, 2025 at 01:54:47PM -0500, Rob Herring (Arm) wrote:
> Convert the ASpeed fan controller binding to DT schema format.
> 
> The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> rather 1.
> 
> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../hwmon/aspeed,ast2400-pwm-tacho.yaml       | 105 ++++++++++++++++++
>  .../bindings/hwmon/aspeed-pwm-tacho.txt       |  73 ------------
>  2 files changed, 105 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
> new file mode 100644
> index 000000000000..018249f97a5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
> @@ -0,0 +1,105 @@

Missing SPDX. Few other checkpatch warnings like typos. I guess you will
see it in the Patchwork, so just writing here that it should not be
picked up by PWM folks.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2400/AST2500 PWM and Fan Tacho controller

Best regards,
Krzysztof


