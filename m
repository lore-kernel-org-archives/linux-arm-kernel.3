Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB8BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7G57MBBgwmHcxmcMqRtIxBuKOiHfjxyItxFaFc5ITt0=; b=d6vy7TMXvxWoOkT4yR8PVjmDg8
	ESiTCyLgcnoYuZtvgRSHOJjLq4609xdD9lSLpXcISG99DrDKCLkVmKptOmSA0h8LTCingrFMbIa0P
	u04MaOieiSl9852n7FqgXCsQUoMPotsgjcJWcIKzsvApqkkP/wKzXGS0u1G+olcwzpASAe+B76G/L
	FX4CP/CMFQPE/UtVsLzPi3/yS3J0qwfPDlogoX5VZUCMfCc/lbh4a3WOOCTLD2pbWw6fX+wrEBoEK
	Nsq31Cv4o22FiYPACDvqI5rIU0J2YD2JGePdMuwHkvSpMaob7K0yjwKywBtWLs0xr4XsQHy+tsL6s
	FADzae5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAz4-00000003eZz-1Gjy;
	Thu, 02 Jul 2026 06:33:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAz3-00000003eZd-0PIU;
	Thu, 02 Jul 2026 06:33:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8576D43612;
	Thu,  2 Jul 2026 06:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB381F000E9;
	Thu,  2 Jul 2026 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782973992;
	bh=7G57MBBgwmHcxmcMqRtIxBuKOiHfjxyItxFaFc5ITt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dsWq5/cof9r30xrYsmz+so6wHaSJu9bojEgXWYTI7nby9fyinRcLI8BgVqVwFLIh8
	 +j16+M0uui5OlPg2ii9h5YvAyi1sZNudy3uRqEmJTXQOdjkUqwaaNicfvpAeyWZp5H
	 TsBNdl9iN2H4dA5LjQ6ytjMg7RYPPbJT+23VDbiJQYT1t9Ox4d0ZYZ6Bsqfw6C7w5C
	 SjGvQuBGG07XEr9tulrM4b3eYswcmOMbur07XHRv37cVfAJv4RgDULcTH1xUu1k0cb
	 CQ13ZEVrEuixgFbuf8qO5Q0c5Kv1rNisqeU0YdQ+gK6KFabKwaz9QXt9TuUuUo8NjC
	 WlVZnQmuvULjQ==
Date: Thu, 2 Jul 2026 08:33:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Graperain G3568
 series
Message-ID: <20260702-belligerent-dormouse-of-glory-cb0ee0@quoll>
References: <20260701164543.3967388-3-coiaprant@gmail.com>
 <20260701164543.3967388-7-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701164543.3967388-7-coiaprant@gmail.com>
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

On Thu, Jul 02, 2026 at 12:45:45AM +0800, Coia Prant wrote:
> Document the Graperain G3568 v2, which is a development board based on
> the Rockchip RK3568 SoC.
> 
> Graperain G3568 series also have an SBC series with the suffix "box".
> 
> Graperain G3568 v2 belongs to development board series, not SBC series.
> 
> Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
> Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
> Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


