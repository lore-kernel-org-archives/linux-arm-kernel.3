Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A329C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ketzb9Adr6+QGYEQNjeX9dSGeDo7D7mBDoepvOOpwqU=; b=dXIPVFZpVdLhEJLUnnN4bk+GRf
	U/dki1NOYsN9VzFWlNwkv9ABHostLB//tzHow5yduXwrnItJvFays9gOhMdiDiajVOLKC1FrEoAzC
	dDHfW97p1WdxOU6sFHWC0Z1UBx3EoFCpNyA0qvwT861RYZMsXJYxT/sR5ivnmrJeZNDQjOaqA14tN
	D73ELAkKy8uFxv26M9Krze1hQ2iTPDJFhJIx0l3maL6i5bPdEu31hGk16zXUPCgPW9COEHTr7ga8z
	WoZS7kfxUKqWgL++lihrnaHSp3Y1wTZlgnUSZhlQZBfpHLt42/unKB1TRXQXsDL/y2zWGSsUFK96t
	AtIDs7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbZy-00000006jb1-3v76;
	Fri, 03 Jul 2026 10:57:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbZx-00000006jaZ-264e;
	Fri, 03 Jul 2026 10:57:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BB2043FB6;
	Fri,  3 Jul 2026 10:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3040D1F000E9;
	Fri,  3 Jul 2026 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076225;
	bh=Ketzb9Adr6+QGYEQNjeX9dSGeDo7D7mBDoepvOOpwqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lU+bcICRyFLUs3CEon3n3s6Zm+xvSNTq+w5omKNsrJ0zBsQaRlZpUSALqpSDvlDz8
	 qH82a7z92zU4vov9slIcmIyo2FW4s4uCVM2KoQcXxp+SZe/xzCY9vtFFI8L4pyeX/J
	 BTRsjJR0EXEqo8t8TmzrZX9e9HeblLLZwLwZFXA0IUQLReGtYw8WC5/oNlVvV7/szb
	 45sIGrvoYJt6HVvUCFBy2k/4VDxDL1AF4IxyCTTki2Rr8yO76kE467FnDydT8HbH7C
	 L0TSrRa/ExVStEFIknJmeLYV/Vm4olTT0qcxyb1cnrEfnQV27p+GCtm/4u3IE6j5qw
	 gEcWhuYMl405A==
Date: Fri, 3 Jul 2026 12:57:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: rockchip: add FriendlyElec
 NanoPi M6
Message-ID: <20260703-polar-tidy-pony-6ba8d8@quoll>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <20260703-nanopi-m6-v1-1-8344a1559519@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-nanopi-m6-v1-1-8344a1559519@gmail.com>
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

On Fri, Jul 03, 2026 at 12:07:16AM +0200, Joachim Eastwood wrote:
> Add device tree binding documentation for FriendlyElec NanoPi M6,
> a single-board computer based on the Rockchip RK3588S SoC. Very
> similar to NanoPi R6C and R6S.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


