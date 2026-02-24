Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4823E9B243
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXSKptn5GCfikKIor4Moi4g7R6oFJLnK/A8E3OAVp4E=; b=OO7d7Ssp+mx7xcf2glVpuEPoMZ
	+ySx3dKy/h80y+nB8d9paGfDNxrfN0V4xk4/Wi6d3FG5HWqRpLlHeYcEfdHvAGfE4++3o4bc7kyhP
	Lupm42MhGAT/ZWs0v3CiDn/2wPHQEYmnWIfyk4Cj8KOXh1RCJbORcYE4mGdWKh0g0qko89DT0vO+4
	XGd/RG3RpzI1tQX21h/GYqa/nfuQIW8HMjLTNs7nOp6mhvKgZAwPgHVPVJF5E+OI1qjK3auhxlCYv
	BmjBbADN+qX+nkaS0ICn/Je9uoTx1PZbyzQUcpbpfoJXBNxatrurSEcsDi0eYQ1h7ZhZTJUr50Cj2
	lol6mBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoon-00000001lxW-2Hzt;
	Tue, 24 Feb 2026 09:35:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuook-00000001lvI-0TV5;
	Tue, 24 Feb 2026 09:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771925695;
	bh=s6DByzrLUIdVl8l63+05mVX9KnRO5e6G5hkZDJSrnDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KB51Fyh6baKM+BEpam7jGsEifDVhiEq/7HbfZ3uebVGyGCQwpSrFwuCLyayZYpy6n
	 rr8IIarsYGp/kgwJSzhxhrhuUQ7LuH5mOhsph9rVIXrEgNsK8QhVXH8Jl9xgvn0aMp
	 YxKhWk+RdEP8HTwRTlZK5lzih8O21W86La2i1FI3xNK+6e3plZe1GX8qt0BfUiXvEp
	 sKpcEPKRsLfkWKFG4Sg/kAwaZcO/U9WP6eJ498GmTWzZgnpg91xpd9UXKJYMt3NOJm
	 wlxwxnqwRH9LpIA6XSSB4EsS45V5hlsoAb23hH41Bpa48z0rlHv6l+9rsDgQMynspr
	 LT8JXQr52U9vQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A5A417E012E;
	Tue, 24 Feb 2026 10:34:55 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20260224082541.7938-1-zajec5@gmail.com>
References: <20260224082541.7938-1-zajec5@gmail.com>
Subject: Re: [PATCH RESEND] ARM: dts: mediatek: mt7623: fix efuse fallback
 compatible
Message-Id: <177192569539.12050.9762878225171356081.b4-ty@collabora.com>
Date: Tue, 24 Feb 2026 10:34:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013458_330355_680111AB 
X-CRM114-Status: UNSURE (   5.46  )
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

On Tue, 24 Feb 2026 09:25:41 +0100, Rafał Miłecki wrote:
> Fix following validation error:
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
>         'mediatek,mt8173-efuse' was expected
>         'mediatek,efuse' was expected
>         from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> 
> [...]

Applied to v7.0-next/dts32, thanks!

[1/1] ARM: dts: mediatek: mt7623: fix efuse fallback compatible
      commit: 5978ff33cc6f0988388a2830dc5cd2ea4e81f36a

Cheers,
Angelo



