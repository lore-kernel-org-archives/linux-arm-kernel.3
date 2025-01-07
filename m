Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594A5E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHUrq5ZWxkPAqB4aN4YB6TIL1OistaY24Lhe1rY2GKE=; b=lbtXdq/RyuTIz1hoGGUwOITjSM
	tERjSm9+B9kzSdcaCojG2DabhB5SE2ll4bh6+QCmhsJp9FH/C1hEeWmY1NYih+219XZxBNVaYnXH8
	Y+jTmqSv5j2YOBX4VXkoPMk5g/+amSY/vud1L8HabFkerw6F1dW3lwgF3i0b67fBYZ77lIrugcvZH
	2zbFmIFBZyonzVBcgnCrad7LEiVBl73Gd1pnLQM/R4GBdLcVmswspM6AKq3LvNX5bT1OUyEZp2Pk7
	a15ysV4QFDBJY1MuGMlyNpYKhtWg5/c3TsjJvG5u6wz1hrgISPHxym3097QPpBy6H8gopyAysKPRH
	XL+8EB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3lQ-00000003jbf-1t8I;
	Tue, 07 Jan 2025 07:12:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3kD-00000003jRh-3jvB;
	Tue, 07 Jan 2025 07:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 438D55C548E;
	Tue,  7 Jan 2025 07:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC1CC4CED6;
	Tue,  7 Jan 2025 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736233876;
	bh=oVzbTsDLgefB50txfb216cLON17wOYvCaNrqmAHQkP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCMyI1Wb+iprQ+nkKWGTKrkpcuAHe0ZlZ1oVveWfi0D+5ctNTc7W/E+fDz3Q+eyCw
	 zjCen/nSb7ssXXANkY0pVndKU6LMW/HuNj1HSuQ8zsjp2bUQLJhCuSzUGtGMKqOZmp
	 4qetV3tZ7aN6l3ykpfIUugddWgkjehyyDkX6BDagapdCH2uGj+U5nKjfdraegFmm45
	 VfJDYzxImL5uB6c1OAARqGXlA8KTDc1mLnLA7+1RfrhGtRaHalCBT4GaVwvhJS1b2n
	 kwe6KiZiJwLcV0pHmgVY3wBgg3ftCjkEfDtU+SfwQFffdjRSlUDk7TaXM5+IGEcxKs
	 WNNXKnwsZoyZw==
Date: Tue, 7 Jan 2025 08:11:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add H96 Max V58 TV box
Message-ID: <n4p5ixqoqm6innjzqk5wlcugok737f6yv2zto2sdgpm4ew2bhq@3bhqk3mkott5>
References: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
 <20250106-rk3588-h96-max-v58-v1-1-d25255f851fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106-rk3588-h96-max-v58-v1-1-d25255f851fc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_231117_970584_D98B7AE3 
X-CRM114-Status: UNSURE (   7.26  )
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

On Mon, Jan 06, 2025 at 01:07:17AM +0400, Alexey Charkov wrote:
> H96 Max V58 is a compact Rockchip RK3588 based device that ships
> with Android and is meant for use as a TV connected media box.
> 
> Add device tree binding for it.

BTW, this can be written shorter and clearer:
Add Devicetree binding for H96 Max V58: a compact Rockchip RK3588 based
device that ships with Android and is meant for use as a TV connected
media box.

Regardless:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


