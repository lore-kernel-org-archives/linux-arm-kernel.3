Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C52C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wn5niCO/L6zQgj0eemljpNDylkhdJtawO5djCFgqo4=; b=uZR4Ts5fghhH3x3/b+xx/f1/db
	us20AsMo9Sfm+CGh/6CdMFSCva3kDhVrB9vp/TWKzqpdf3KDv3c/VcHMcpvPgY4t2rmrOkGveCyhm
	+Vob16Tca8xjxdJAtXMyN4/Y96HPpSOpqu0O2RNdJY7Rg2wElf6ImFeBUdqKoP/zKPirSIEylYSnb
	9UH03JNBt9Tyk4JgbKUxVt5i18xHM1BHWlaCbYXZ8uCnx69tPo3+lBwr7SXhkoBJwmoZCJVkgUJMq
	CD3f4Gs/6oP9xPjiFrjCLZrUp0avsgAiB1A9ZFGBTwBwtQyXa0kU2DTjZWaHSJzsSIh8b1uwGErpw
	QJwZkRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf12F-00000002vE2-2Nx3;
	Wed, 01 Jul 2026 19:55:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf12E-00000002vDr-1jOE;
	Wed, 01 Jul 2026 19:55:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C02E76001D;
	Wed,  1 Jul 2026 19:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B00E1F000E9;
	Wed,  1 Jul 2026 19:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935749;
	bh=0wn5niCO/L6zQgj0eemljpNDylkhdJtawO5djCFgqo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l1hpxxz7RAlyGIKGmgqFfIHJHXTzLLA24GwRODxJtufo1FJp+IKce60UoN+8NVf1q
	 NPfhe5ZVsg7qch7cYViw/hHI26AWZDaaunbfRFXpLwPgV65rZdo4XJowEuUoYiidfb
	 6wPEvvpoQS1LPKdEFprowanstGjaMWW5iWvstAq9U+qc3ogSIL/Nywea/MyC+1djWl
	 3yfWJmwF0QJIDw8QbfRM0h0EffxcIMdARIDuIqVmrNqyqFKZXXalPiRHyguzcpxjNz
	 Cll6WwQTqnPBxUzj3SPH/5OQmrLFMwtDMOYngp5m0BPAwUVtl/wSs0qUII/OlLjDxj
	 UheQJfXCHz+dQ==
Date: Wed, 1 Jul 2026 14:55:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH 1/2] dt-bindings: rockchip: pmu: Narrow definition of
 reboot-mode
Message-ID: <178293574811.1635397.4546983398159311773.robh@kernel.org>
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
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


On Wed, 01 Jul 2026 12:58:50 +0200, Krzysztof Kozlowski wrote:
> The 'reboot-mode' child of PMU node must be a syscon-reboot-mode one, so
> add missing $ref to enforce the validation and disallow other
> reboot-mode handlers.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.
> 
> This can be further restricted to match hardware/firmware:
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


