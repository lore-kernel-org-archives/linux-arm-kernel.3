Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3UzT76cF2mP0c32oHerloEV0RO3l8wjuU9BUBUSWiY=; b=dXSjadBKLNYnJiW9oQS6EqDSTP
	PmW410MHrlJNLgxAUjfzxVTll9wAaJsOC+s95VZmsMyXpfz87x5A5Si0+hqPcpD7JG0Hty11zpDkg
	/iNuzRlJqMHuAdwCq2fYZqB2QtTHHEne1DYzdkY0w5LUHYTX9mRAiWBGP2p44eh43AGBBJeGh4mP/
	IvTuWySm1eYzX/88o3ezYX4atQm+3hK2jJTH1IsiK42wyAfhgg2UYpGA2aPuDTI9QXr71QOuEP3LM
	wnuwdetEgm3RFywrUyO9DVtqqi570A9UfMRFiVD8Z9pULxu7g70CrWwBbVS4tyRsyY2+dQa+vrOSF
	ecZd2T6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbYc-00000004c3G-1pYC;
	Tue, 15 Jul 2025 09:02:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubav8-00000004VO2-1G1c;
	Tue, 15 Jul 2025 08:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBAF55C5C85;
	Tue, 15 Jul 2025 08:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065E6C4CEE3;
	Tue, 15 Jul 2025 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752567709;
	bh=ebyRrw2T66Vzg5kyH0139ZzFXfnA3ppd4smjTMuCtCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yyk0S7eOz/0KbQcEVcC5HVGT72qMwkR1B39BAzmJtFx98gqSqwZ4cYEgYVtBzfVC2
	 3LUSs4MzmTyUthDeusmxzQyPAnItNXqPDSAaBKGncGsxf674KT3iPqjsNMH8QJF50r
	 uns7xxoYXavnWYAXKTs5ke1MooR+1YlpXF/d4IFkViu3sQYGMfTC4R167CnyCrP3cb
	 OBKhOQA8y3xL1n+i6OobBanD3L+f9z5hM3J90JBoCLiFFV+dvjL7KIouxwwUIC0nQ4
	 +sBbdKX1FQ5v8tLfgxCXp1VLxKiZKu/aGa85eNPomMFjn+FlTuilFKATMst1z1SvvE
	 kyUrS5zSO/XCg==
Date: Tue, 15 Jul 2025 10:21:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <20250715-hidden-marmoset-of-serenity-dcbfcc@krzk-bin>
References: <20250714201959.2983482-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714201959.2983482-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_012150_379569_591333FC 
X-CRM114-Status: GOOD (  13.32  )
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

On Mon, Jul 14, 2025 at 03:19:51PM -0500, Rob Herring (Arm) wrote:
> Many simple GPIO controllers without interrupt capability have the same
> schema other than their compatible value. Combine all these bindings
> into a single schema. The criteria to be included here is must use 2
> cells, have no interrupt capability, have 0 or 1 "reg" entries, and
> have no other resources (like clocks).
> 
> Note that "ngpios" is now allowed in some cases it wasn't before and
> constraints on it have been dropped.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> We could also do this for ones with interrupts, but that seems a bit
> more varied.
> 
> v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


