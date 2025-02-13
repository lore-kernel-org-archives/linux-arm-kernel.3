Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672D2C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vI2xNo/GJBizIu1upNZTlcqgUBj7ItXR+tzGM0ggwaY=; b=V03wPd7unATptVxlClErMruVZE
	cfBw7AQo7F2XjnSOuIFaQsjO1J6moMNG9jy/VshQ4gShVeexN0z6/eOyoi5hmooaG5PeH0iL8vRTu
	AbUxP7KYcPHvpkzcmuGlS0bgM/0wB+aD7I57lW8pvU6ZdFme2xWEMHwho9rM4iDmNQbq8q9VWGPhu
	NXwv4UPuus+tyw+lNXMdd+w/noeDDMBhilNF9VVhy+TL1+PNVj99xy3jC/XG4ZvsAjFqLbQ0kQgOr
	7aIdpF7vJ1lzxuT2O26dwb490eDnIHv9TneGgqHRA4KeowWZWlDXJpOQmNDp+fxHsMxGlYwQdgwuS
	6w2o84Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUh6-0000000AIFJ-0FpY;
	Thu, 13 Feb 2025 08:35:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUTI-0000000AFwU-0IHx;
	Thu, 13 Feb 2025 08:21:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 062A1A41EF2;
	Thu, 13 Feb 2025 08:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75030C4CEE6;
	Thu, 13 Feb 2025 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739434879;
	bh=G9v08xY6dD/jqvUsCqnqgDn57iuOkY0mCJojX5bXKro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxG/bQ5QCL1I2DZ6atGBnpEEATwXMt1id9AXOam3/XftRoVZaoMHp5WWCXNM4dI5G
	 F/MHe60hi9bEUs6PeqTpcss9cfNxHUSSMKF+wAazXM06ZGhun+oA+/WDr56h/xKMt5
	 D5C9kP+l+5mAQoosKWJWvtZu3f7zMcOhKq8gl++o+Fmk1WqtQYzS/Cz2QMbhcrUzFQ
	 bzAaHq1buv3Jv8dE+PM0m5Iquauo3kfLbKLD8Qf9NQDb3RG6imgu+kNm+lL+UkKJiT
	 USj1Py+ccceCZdgpslL/RlHE7298iFOgZJuc95WDHRiFl4z6RaT2d92wGmWtDt+XPI
	 UH6rKtJE41gpA==
Date: Thu, 13 Feb 2025 09:21:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrick Wildt <patrick@blueri.se>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2
 (RCORE)
Message-ID: <20250213-dazzling-beagle-of-bliss-e4a70b@krzk-bin>
References: <Z60MU05JLtI9VzuU@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z60MU05JLtI9VzuU@windev.fritz.box>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_002120_171430_1F368828 
X-CRM114-Status: UNSURE (   7.43  )
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

On Wed, Feb 12, 2025 at 10:02:11PM +0100, Patrick Wildt wrote:
> Document board compatible bindings for the MNT Reform 2 with it's RCORE
> SoM, which is based on Firefly's iCore-3588Q.
> 
> Signed-off-by: Patrick Wildt <patrick@blueri.se>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


