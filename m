Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EFFC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bFxSJUtoDhVL62DJfCXe3Dinu50IPeIL+flIXU/z8o=; b=IHXYFvgZP9U7uy7ol2kgIKshh9
	uVSxiSIO2YaFyCqAZWJ+7I9kDf51woz+ADFIC9BLSApq7xAHos9lOKwia+IOD3hnx9l0k9wHp4luS
	em9p7P6FvI3IDExMJk9yxNQbDUno6tSQl2TJjpYlaBunmm4eTro01gKzHjQ5Stjo9lMjbBB3Ipj/D
	6lUf4sFMqrO9eFNcaSme98naPTC+hu8w2FJnX55yN5IZPEeDbREZFct7Qfx2UHwd8WpBEkV3gLLJ+
	Qcd0AMFO7FxF1saV+sEBrSm/R1/1PN7xXkBI5N5HgT2VxccTPWCe4rf/btANuZBKzpsAXBx1U4R00
	/OqbUNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJFh-0000000H046-1Nc6;
	Thu, 16 Jul 2026 10:23:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJFg-0000000H03t-2oIK;
	Thu, 16 Jul 2026 10:23:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15EB140451;
	Thu, 16 Jul 2026 10:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740BD1F00A3A;
	Thu, 16 Jul 2026 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784197416;
	bh=1bFxSJUtoDhVL62DJfCXe3Dinu50IPeIL+flIXU/z8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V/c+G04UfE8KzxJVV1UfaE6JXSz+1NcakKL78kfzp4LSpN1bNflN+gYYoxeSSOjpW
	 C8eSLE1J0VX6Bxd1QLuEiTmHtvg9fHO/rauAJxACoPFgVuMwJ0UpKpQkValBB9nZAI
	 wauOc3xIAXCn6u/hLBZHbMdLf0LfOMBnFF2g84eEo0XuFVaYknWcai/8ETNZSHSB5U
	 vIy2COx4S4pL1weDWSe1ktAFTvoC8BvnL3bM5tn6yRTH51ARxtGJcE653pHWOA2M8q
	 Q7GkHs7qGo+51cZBOKkn+pRFBvJ97zCtWYnN1CfZyX6gxKdq9HGehnsDFX1EWAzYE5
	 NphU9LtJwzqzw==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>
References: <20260711192842.845048-2-samuel@sholland.org>
Subject: Re: (subset) [PATCH 1/4] dt-bindings: leds: Document "gpio"
 trigger
Message-Id: <178419741320.1254511.5387639969436982664.b4-ty@b4>
Date: Thu, 16 Jul 2026 11:23:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Sat, 11 Jul 2026 14:28:25 -0500, Samuel Holland wrote:
> The "gpio" trigger is used to control LEDs by the level of a GPIO input
> referenced by the trigger-sources property. This is already documented
> in the trigger-sources property description and is used in at least one
> devicetree (am335x-regor.dtsi). Document it so validation of those and
> future DTs will pass.
> 
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: leds: Document "gpio" trigger
      commit: 4d8da7e3dc0d4512e5e6f29df3ca136d7a90d464

--
Lee Jones [李琼斯]


