Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88885FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFQ16qVxXLp3jIgTIBl58xEsLkWsws9kWBQMuTAKBm0=; b=wZmlnR3+w8eDgMmzhbujHY/WmB
	bDdbM70YkZNkUBEN54eKSxf8Y+mQPnU5SboHFXkLw1BHN+NlBpVSdP8LbL0WR1juByyopkRReDhwX
	zS9AQ9XCC/kY7MOh8nTnY5c7tMZWqZpIvOqnL2hzn8iT+80IGpBJVBvwgMZfRC9RCV8VvW6doI+Fd
	vTYo3CQabGPcMyQ/JCbKGiU+A+/9OA40VSRHUzyJGDxuBsET57cennlaeqICXJCsLISL/ZMTZFmS3
	SxXxTcD39wwNJ27Z1rpG6+IKVnoqy7mW+WwWxKTkERmfwjOL73720USeLDSp6U3xcNetR0hyYfzix
	iZMSgkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINod-000000056LV-12yE;
	Thu, 30 Apr 2026 09:36:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINob-000000056LH-0fEp;
	Thu, 30 Apr 2026 09:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43E8B6015B;
	Thu, 30 Apr 2026 09:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AEDC2BCB3;
	Thu, 30 Apr 2026 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541772;
	bh=avqWV9+1kYue92kdR7R+TTmIfJWs4YivWcb9b5/Goms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5LnLR/DjHcp4w5Rz4EheEwhng3GWyD3y/VkybZmgO3RWj6GKzURAKeFU2Mkk6kuX
	 vG85/xroD0ytUyitvTQjqbQRaxRzY9C0xJDoNB/qqchAkfzkejBHs1R3V1gXMGxerO
	 wo35HfUzlShzsXWqQmuVy6a1XJEhzYHUlD3VGXisAVy6z0P6AJ+NQCWCEeMwMjREBz
	 MgecbET5v2o0SYoLVUDsRd7G8ZD49lkQpez929JmHo0hay2xDhVoQOYDpkOe2zVhlU
	 85SysvrNH8e0j+KRpGeNXs8toVfBPd8s2Dx87f9TCAJXA3eJhjxhuiQPxqPn1PAz/v
	 eAeuAvaGV1Ysg==
Date: Thu, 30 Apr 2026 11:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Message-ID: <20260430-notorious-cat-of-wonder-a6dacf@quoll>
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
 <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
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

On Tue, Apr 28, 2026 at 08:22:48AM +0000, Xianwei Zhao wrote:
> Update dt-binding document for pinctrl of Amlogic A9.

And why it is not compatible with a4 or a5? You have entire commit msg
for this.

> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 1 +
>  1 file changed, 1 insertion(+)

Best regards,
Krzysztof


