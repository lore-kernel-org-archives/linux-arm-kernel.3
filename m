Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECAECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktX8jyaRPc04klJi+nXean0IqN1T6ncqC94qll+qefc=; b=gALFoInOM/zDv8+HP8boDQbQUm
	tOtQgDzlbMHnrB34e9PHry1S9hbVKyKePfFhsIXV8AeC35/em9TApeBKsH3FY3mSDfwRnJXCrJsfd
	/4VIeK29nEcjI1BEUq7oD3Uq8s1eKsj0pPjfYzNxPBh+0Rbd8FXDm5nlrX8Xoy2PUWgm0hP+Z55Dt
	6Rt9qyVA67152kJ0uwdRD8nuW7OhiFQWj9cxCG/M+pXUu9Foi0cxOBJaAJwXY7Wm0DSSMlaBHNH1v
	wKSbvqTc/nE/LXZmWE6iqNgrFK8u9nKASRqijDg/312fGkuGLK3NJKqU4t+33ejYUL8hFeC7eHMOA
	NQg4f+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHgA-0000000Bwws-42CV;
	Tue, 04 Nov 2025 14:06:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHg9-0000000BwwV-2L6H;
	Tue, 04 Nov 2025 14:06:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96BFC601EC;
	Tue,  4 Nov 2025 14:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAFDC116C6;
	Tue,  4 Nov 2025 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762265192;
	bh=t+bos1qh5fT48v/WeQY3yu0tKhQYMh0Nl1CYYmz793o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCqQMJ7KT+vPcII2clkArOHKGWTj0q+SaX8/jpqMaOGsxmF3WLmxjPuGGpqfPkjfs
	 4ZLmzNq5clpZzIFr34q0NbqYFpyLvdMnGcnNnz+j5N600K7nVKzynEhhPnax2rtAn/
	 ASlzAAet5hqaede0cwmTPUwH1Dk0OhRs0TNp8apsfrZehoBjUnLWi84RECvi9eO+0d
	 zYGK7qnVx9ZiAaQRxLWq7GYYL9/zRIRoliWQAj36f8AQ49eTTq8QYWagbryWyj2IRV
	 TgZ4YQdjPSyZe/J8LadiQnqMYF/XWKBuuXljjhODUA8k5e8PilfLpLsOqgN4Vmf3j0
	 QE2SthRbdaGHQ==
Date: Tue, 4 Nov 2025 15:06:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, tao.huang@rock-chips.com
Subject: Re: [PATCH v1 1/3] dt-bindings: pinctrl: Add rk3506 pinctrl support
Message-ID: <20251104-successful-smilodon-of-symmetry-3ecddf@kuoka>
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
 <20251104021223.2375116-2-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104021223.2375116-2-ye.zhang@rock-chips.com>
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

On Tue, Nov 04, 2025 at 10:12:21AM +0800, Ye Zhang wrote:
> Add the compatible string for the rk3506 SoC.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


