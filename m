Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDAAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LlWYDNmqRSwv1UfEcvNIhIkXGlUFqfZvRNkUJMTCUg=; b=GbuB5/tvGeHDassUvUyDiFg7lw
	rAvZfViEIyOuv7/7T8NGUjEkehL6nyKYDHtdfhgah32r584AbNs6hWKSE1mH1xjazGCnqlD1WZezD
	1lmfvrzGevskuUNnPADqvpaM6rUHKJrQt71+NdavwQohDxObCI5JpmoUed8IK4TQPrWlJ603rqEb3
	/7Oopy7ub7zBW1jZlqDeJxn5CaZe6XCxhofqekfFF8t7WBXJm46Dms4pBCcd9AavhsaoRBq6PEQff
	7sb4BC9v+MQvf4VIIRdXBk/iHoeWsoYfRbDRSICi2io64YG8fHtohV9LJ4i2JgY8PypU0mA9o8rwv
	0o95mqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqdg-0000000GAAV-1eVo;
	Wed, 18 Dec 2024 09:46:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqN2-0000000G6Ud-2zQ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4463DA41B32;
	Wed, 18 Dec 2024 09:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BF8C4CECE;
	Wed, 18 Dec 2024 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734514171;
	bh=uMaQBYgrV9ljE06+tLk+AuJ83F3ius8rQBr+XfzzbO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0I9Qd33zvtdsN/mTMLlAOklkK9LWTPCxQFnMrSQs346GFZy6sgeHiyZ4WXSBiLNM
	 vQOXNMj0ZKxht8O/MWag+GaYy/CzxK3bdADBj5MlK1hvs5qGoR7cmz/M0BvcD4r+fO
	 0S2Pw8evoWMTtddKsmxY+fDNzHL4YXvpNg8KWW650FtQeahVpryCiI2GUv+WBzwXOl
	 47IzG0bW8YXUHZHFb+rXJzetR/0lL2VGM92Vv+8JhXc54pyKwgL5OgmAax7l56jHKy
	 Ke3ObkW4fSgX5tvNdDfovCODI9mf/4mw95fwLCTLrGQvUTUQU1xJaV0Du1dokwjwDL
	 I5W9M91ogjdDQ==
Date: Wed, 18 Dec 2024 10:29:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
Message-ID: <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012932_813621_6D5257B2 
X-CRM114-Status: GOOD (  15.01  )
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

On Tue, Dec 17, 2024 at 09:40:20AM +0000, Tudor Ambarus wrote:
> +description: |
> +  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt

If there is going to be any new posting:

The Samsung Exynos mailbox controller, used on Google GS101 SoC, ....

> +  generation and a shared register for passing mailbox messages. When the
> +  controller is used by the ACPM protocol the shared register is ignored and
> +  the mailbox controller acts as a doorbell. The controller just raises the
> +  interrupt to the firmware after the ACPM protocol has written the message to
> +  SRAM.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +
> +  interrupts:
> +    description: IRQ line for the RX mailbox.
> +    maxItems: 1
> +
> +  '#mbox-cells':
> +    description: |
> +      <&phandle type channel>
> +      phandle : label name of controller.
> +      type    : channel type, doorbell or data-transfer.
> +      channel : channel number.
> +
> +      Here is how a client can reference them:
> +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
> +      mboxes = <&ap2apm_mailbox DATA 3>;

This ordering assumes there is channel "2" in doorbel and in data, so
two times "2" and of course the same for all others. If this is
configuration of one channel, so "2" is either doorbell or data, then
type should be the last.

With that assumption:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


