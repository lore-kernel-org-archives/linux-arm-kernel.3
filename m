Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98082C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/aZCDy6+OLc/2oaT1Ymq1VEimlmXh8N0CxTQH58OWo=; b=KLPrRkHj5SQWq8/7/z78HnTI9S
	Euq2Ilp/MVOgjr56KvHY9V7wTOpPsUqeQEZz8p/aBbPLhFfAiNbcd+fmpNMhwlSEuVEqFsrN3yL8Q
	ylcsgOnJRSmE/e9ORsb5zKjg6JBREW4iuE989V+OVe2beG3gVJiqsK3iWACQhQsSvQakqAtDcmGrt
	Rz8flVRRDwEDxddBBh6BZ4a4RM42sjD2lqJCnbHk5a+JNCFQYhZcpbWUfGe0T84EhfvEahUUXNJs4
	USyEXbV31cs+5hj87mZAvP6gMeMBhwqLLg5tqYhZORgeVmtFkNp7u6ewACSD++36Hjv4qZRn9Y02H
	fd9ZP9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9lL-0000000EGX6-2vaJ;
	Fri, 11 Jul 2025 09:09:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua91M-0000000E70J-2uTC;
	Fri, 11 Jul 2025 08:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C44B611BD;
	Fri, 11 Jul 2025 08:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92992C4CEED;
	Fri, 11 Jul 2025 08:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752222135;
	bh=V0vPUEIisTa6mtflTRv2e4S7Ta+SaccNSSFcmicIeeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWfNc/3IX9QBE778jmKcZgu3d3usjMtmaD3yQMlf24TBG+b7vQZw0rRe98p3QHFDX
	 lVvJdsicnnB+XJZSW7mSRjZaM26uF9Pv473eZ3sJaDx5oLYZNXj9EYByBeeRut6zdc
	 2uC3sIeXIKPrk5ixEnX90A0Ethia6GFJfqDGWvLKQJXR3csoTbnaOrCNYmBRFARR6J
	 Wu8FW1o8qbpjJXoO03NY+I/rq4GVR37Lx02kGdu/YrLBuv4PwFMppxlVJWOFW0d5jY
	 L9Hx7ru7hgoG+VR5fOjupa13qEN0Y7V7w1B75Q6vXcmPVsRMhcVXE0kx8JXCWqyRRt
	 iJBMR60kbLZyA==
Date: Fri, 11 Jul 2025 10:22:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: rockchip: Add FriendlyElec
 NanoPi Zero2
Message-ID: <20250711-jumping-macho-pillbug-43fcd1@krzk-bin>
References: <20250710202958.3717181-1-jonas@kwiboo.se>
 <20250710202958.3717181-6-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710202958.3717181-6-jonas@kwiboo.se>
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

On Thu, Jul 10, 2025 at 08:29:44PM +0000, Jonas Karlman wrote:
> The NanoPi Zero2 is small single board computer developed by
> FriendlyElec, based on the Rockchip RK3528A SoC.
> 
> Add devicetree binding documentation for the FriendlyElec NanoPi Zero2
> board.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: No change
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


