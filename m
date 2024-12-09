Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05CAE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj+caK5aZ5/ftdKrJ3uKloxgjdNx6BJvn8vpkE+n4uw=; b=CrW1a6dEqPLk4JCMy2NDdwmBnU
	waeeWLWFWjAhnxlYkj9ia5WJhebJSeeRwP3kdmWE6a6db1Gr8mKzICke34jMC1SJt8DlVQ4qG/HK3
	YO3a/A7/5Wi3AwcaqeC4rwtNUqawB3OhnWdYkV9spoQfDcLYEJNaSol/vLuKj6/5R13m/JUtujMuR
	ccOP6eFUmImeD8RYS5rVM2iGEEiqUIz1aPcEU82Zr8qIN0DpmA3nmbub+6n/5vfTpNgo6Zo5Ynsx4
	RNMjAMWWBYzUzxp4qvtNHEY70R7IEWQvVBkaNHDuueM8l7QmTN3m58gs4Fz9iGehIMlE3fJLRZZo1
	w2VnMahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc6q-00000007XIc-19yj;
	Mon, 09 Dec 2024 11:39:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc58-00000007X1p-0PmQ;
	Mon, 09 Dec 2024 11:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733744260;
	bh=bPplHq8MykZfKvlUO7uKwUjm+86UC7axUXzqSZ31mxo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hga1gDpkDqkZoSHk77663quLfcvz1TXk0qzed7jAT9S58SAgpmGPgUOzpag+EZA/W
	 xmfB/RPQVLkbTUIuXnxE7G0X5TRjRSkpz1exmsrHNsbqAefZ9JT550vdIK7pAC/aTq
	 oFgdy3p8ZzlHJQJnyUG/UIFafVbQrjKN6CHSaWTGzdsoVPzbvrurRe8j99bO9uOc2O
	 tFVX2lAgxw03LaWj9rixfe9uhlmj4uZ/bPZ+EjSQZVZ+x+CLKzlmhls/6OVt5aY/7x
	 itkuqiLetGNghbpmfvu7I3zG1gHrV5gA4ph1zblDqvNs5ZD+leVqmeyo259VKy98G8
	 6+kEHOBQydh2g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14E5617E362F;
	Mon,  9 Dec 2024 12:37:40 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20241209112920.70060-1-krzysztof.kozlowski@linaro.org>
References: <20241209112920.70060-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: mt8183-kukui: align
 thermal node names with bindings
Message-Id: <173374425999.50169.9722221830954876718.b4-ty@collabora.com>
Date: Mon, 09 Dec 2024 12:37:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_033742_285489_51A85ED9 
X-CRM114-Status: UNSURE (   5.67  )
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

On Mon, 09 Dec 2024 12:29:20 +0100, Krzysztof Kozlowski wrote:
> Bindings expect thermal zones node name to follow certain pattern.
> This fixes dtbs_check warning:
> 
>   mt8183-kukui-jacuzzi-burnet.dtb: thermal-zones: 'tboard1', 'tboard2'
>     do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
> 
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui: align thermal node names with bindings
      commit: 4604c989004006cc0c08a9cfe8d80e7544b8e808

Cheers,
Angelo



