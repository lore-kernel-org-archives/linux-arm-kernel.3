Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEDFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZzAaGpNJQnNH4596dN2jZE4+Wk1VnOd5wMlBtov1n8=; b=y7wB9FTOB8M6d2tjQazkMGil9x
	wV0hH4nkDN0n9FwE5A89gcNCBjbnJsu5fDI0wkgFzmteispm2NJ8VRXTVbihbV+90pE4dKly92EdZ
	XSHwYdkihUm52HfjEZtbu73Zj7nU7EfjXUUyLuaXrW3IxjJrVIM2O1wZy+qd4GZQhbou3PMrbvkwV
	56Fvs56zvQwEuCmqiGtaZnCJ81hFfbCxg3kYMss5NFuxf2mQVP2AIscbe0h9yJif3KmhCrNsKOJvJ
	NNx9ut54xdQ9XanSJVKrIXPM7t74/eXb+SrVDGYBoJuiEdnA5j4a3TiazP2FB/TiBjWHSGhR3rUIU
	ahRbssTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz8r-0000000BAa9-32mY;
	Wed, 15 Jan 2025 08:52:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz2A-0000000B8r4-2bYe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:45:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6C7DA4186F;
	Wed, 15 Jan 2025 08:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8FFC4CEDF;
	Wed, 15 Jan 2025 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736930753;
	bh=BO+3m4FMfOEG/15U7sR7NT9LJguDOTS3576NIxYCBC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcxC6SzVOVwXLkfQSuzJsVT1MbWuFE4DDr9Lmivl1awzuPTfYhtERml6+ZC1PhY3i
	 E05cAcYI5oEg/VnRWQwfJZhslpuwCsVVI3K3k/uH9xtXZ7yCJf/5xe5/SSeF+o2VHL
	 LGu3WkcCOtQHu6Ri0NKZ3oPHPplPkBr/4CXAebb+bc8YuF3ncvIlHJEwrk9T15/Rjc
	 buCSPyl8nZjxCkJZcNuOjphLNrOctF2hhaPnSO5T0AS34Ii2KHquycjySlvOPxZYLf
	 vDksmIIexXrJtsr0S+gzVQhn15ZIX7Y4OYAJ+S989RAHX80XhDs8Y76x0V8FycvmmZ
	 lK2QqzNmRTNXA==
Date: Wed, 15 Jan 2025 09:45:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, 
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	devicetree@vger.kernel.org, eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
Message-ID: <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114220147.757075-4-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_004554_720565_E784647A 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue, Jan 14, 2025 at 04:01:37PM -0600, Ninad Palsule wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> index b9afd07a9d24..b9bc4fe4d5a6 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> @@ -46,6 +46,12 @@ properties:
>      minimum: 12
>      maximum: 232
>  
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":

Choose one - suffix or prefix. More popular is suffix.

Best regards,
Krzysztof


