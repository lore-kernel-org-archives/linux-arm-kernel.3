Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75729CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kALN3+GPKxIer5m6DeDlZXqvuA3VeS/u1kSKO7mKelw=; b=Xy592yh9llkfVhwGlT5waueSPe
	ndbOXN27G2dJ8N1AA/9ZYH6ldr7aqEAZcSMNw9UTeEmuohKwfFLXY6KWe70CezYdZl++XXqY8n1g9
	9X4i5SfwIZ39FocSD/PMSgTZZUUWAEtS+tciHd7p1/wvgO7/f94o8qjDVg6BUfU9O6mZT+zJl55pm
	XeN4EdWZuY/s7pMyAAjX5Jeo4HBYLAP/+GqUAygHxmh7RetZc9OcQl/bmuPwBKfB5/YgA2NzizMiX
	f1iwuKXicpSFrQV/jSWTMAOfJ59LpqOcejwzEi3MGGAdC2YaMQlmzSuQBFjmO48uLqkloZzjQDIqp
	RoOP+BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqmz-0000000F2dg-23LT;
	Wed, 20 Aug 2025 21:56:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomUg-0000000EWUS-1NeJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:21:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA4DE4689C;
	Wed, 20 Aug 2025 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAA8C116D0;
	Wed, 20 Aug 2025 17:21:01 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 84FE95F870;
	Thu, 21 Aug 2025 01:20:58 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
References: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: allwinner: Minor whitespace cleanup
Message-Id: <175571045852.1650076.3818185651081371250.b4-ty@csie.org>
Date: Thu, 21 Aug 2025 01:20:58 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_102102_393518_55837715 
X-CRM114-Status: UNSURE (   6.61  )
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

On Tue, 19 Aug 2025 15:17:53 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' or '{'
> characters.
> 
> 

Applied to sunxi/fixes-for-6.17 in local tree, thanks!

[1/1] ARM: dts: allwinner: Minor whitespace cleanup
      commit: 06ea48beece831a8447758e5432ad1cd60765363

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


