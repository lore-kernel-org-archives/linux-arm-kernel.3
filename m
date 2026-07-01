Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2505C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jTAoyUtrQjC4pFI5xTAx1xnY1v3m6f+Afx0jq4MXsc=; b=g2qCli3YL8pgJZug61Ydm9Jd6c
	Z5oV0dqFe3uXwaFkPocs8TCiSXo42kQT3tf7EX+G1Y2OZsCIUA7VWcuXcIXRobJ+lwiDtFSNnNluV
	7RfYr7KnP0RlCTVu6hXpKeJz0oj5mWBMuxL2uF5WNrCR9BxSO/VOakGDKM14j4Z2aSnyUdDmoG+hs
	ku0dxboll+JNpjfJimt/r5fa16AjEM76naEC+E5MQh1jB4/JcB2DZH5klYKXaCD/2CjhwNZQa41LR
	fAg2DfPWgpTFS2fnTynR8u3IHejnaKW60uHnPyXhVy6w++SA7+nggmGRfUB0HSDzIwDM4Ivu9yIGe
	G6rTXwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf12j-00000002vK3-3L6p;
	Wed, 01 Jul 2026 19:56:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf12i-00000002vJk-2nL4;
	Wed, 01 Jul 2026 19:56:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1AB843310;
	Wed,  1 Jul 2026 19:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F451F000E9;
	Wed,  1 Jul 2026 19:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935779;
	bh=2jTAoyUtrQjC4pFI5xTAx1xnY1v3m6f+Afx0jq4MXsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZ2woGJe4vn9Ab6OV92QZ4f0vhzNjHtuZwvK3w+7qyQBl6W7VQjdAgWthb6JWQOa/
	 Upz8WC9KYSdFIzWBNrfcWGi1XZW5NkJ2u2IpLWl6AUju+I+JxAz+TvoPTeHvlLkWfn
	 xO7IS7/srzSQ+/RPUq0dcrO019g2QjNTtUIcCxeWV2iSkfKHa3P9yoF6kalO+LZPg6
	 AX0Bws0OUdNBhEXSh2h+qXZzZwcnKro0iqu18zxE6kdkekf7i1tfQJDkR2jZ4xDCfi
	 geLClcY/HHr9l8Ugf0qYCah+K2CdM1Wy0w4C81mr0E89t7H9Wn4ssyYdXa8hR+bhE0
	 7DrmzPmp/HIJQ==
Date: Wed, 1 Jul 2026 14:56:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH 2/2] dt-bindings: rockchip: grf: Narrow allowed reboot
 modes
Message-ID: <178293577838.1640591.14450570055545790463.robh@kernel.org>
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260701105849.197086-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105849.197086-4-krzysztof.kozlowski@oss.qualcomm.com>
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


On Wed, 01 Jul 2026 12:58:51 +0200, Krzysztof Kozlowski wrote:
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


