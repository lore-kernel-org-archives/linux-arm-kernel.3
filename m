Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MYP0bubzDlJe9Hoix562dbjWYH5t27MyyOtIckOjXU=; b=r6J5eRfO5eHrWFUokLWCweY7YB
	E6PR7BkAaA6qi81uzEl7UvOzFDmRfMXwGGMqr1Ochpg9/a21DaE42I7nvZNIh23DGt7I4FqN5pwF5
	pX9vHedVCRoJVSHJHSkPibIErJ6UO228bCMGArwYBlN1BdDeWDFKr9mPNv2JagBEj1AycQJVD+tvB
	csDLcT5xsK++MWiZLJZvATUi4Ov9GRP2tnqnN0BhKoZSEO/fOzNJnNkWo6MklANAnmOXHmwli+mff
	tNuGvcRbqQj4uNsU7bjf16XiwGVbG7Vxn+CcFpabCn7/pVf+KS3+qBJxF5z0BwfjBQDS/QPO1fsIF
	FdjggVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whY2R-00000000H02-45AL;
	Wed, 08 Jul 2026 19:34:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whY2Q-00000000Gzs-33uc;
	Wed, 08 Jul 2026 19:34:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05AEA6001A;
	Wed,  8 Jul 2026 19:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B90A1F000E9;
	Wed,  8 Jul 2026 19:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783539269;
	bh=5MYP0bubzDlJe9Hoix562dbjWYH5t27MyyOtIckOjXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VXgsmCr6+1zyHKnhwPVpRMyofjDwtUrpKfW4mWrHLHBd+7M1mSJ7QIOMlRGM4VuVf
	 0ZrkL4bKD79HDaTlmDUUT3zNDQ28iUnkCryP/UOUnYOcSj28XzuaxL+OqfKzpDYwdO
	 8E+5e+wDLoWNPNYG8RfmUBMzI93Cw3ltjYiU91dioJdfWbD8O4Bz+s0TfJYo1Q8Hc3
	 VW8u7Zd5XQAWI7OgOOHBio3yWlyNw/lu5IDeuKjEujFPrCVVQ9h74JKYG/LnSFIb33
	 9WDj/a4o7Oy4276ONxZuCiOgmrX6GHS0EAOaO9pVx5uwp2edb+6imHXBSgbNq4jHAg
	 JgBv1eiwgyuOw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
References: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add
 support for MT8189 SoC
Message-Id: <178353926731.1746530.6791830888599668019.b4-ty@b4>
Date: Wed, 08 Jul 2026 20:34:27 +0100
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

On Wed, 01 Jul 2026 17:14:06 +0200, Louis-Alexis Eyraud wrote:
> Add a compatible string for the scpsys block found in the MediaTek
> MT8189 SoC.

Applied, thanks!

[1/1] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT8189 SoC
      commit: 0a87570f42adbce6cf4b6a74158ebac495859f35

--
Lee Jones [李琼斯]


