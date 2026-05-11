Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A07CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dwf12ip6UG+LNgJuh5Mqj1nOxF/Y51tVz3s5lgZUC1o=; b=HKpQdm7XkmIAGQb/5h7ucHigww
	zLuFC+SBrP3QiAeyZSJQWyP1w5hZbXl5d1hJgpS0nQjNfTfgm9TkKs7r4HcRnfsikl2zEgES3OpL+
	3Grs01R7yuGVKiZc94UFJ6dlZZNR/LJouXGXLG6OXS1ZmiH4nvXs3pxEcGCutCrfBS3Rl+vtq9HuZ
	arIGahstSOQPxQ4l4bY9uv9CzrZWfW3liP7qYxbeiXnbY1F4Z05u1GZzM3tPW5Sr7XYBvrn89nYGk
	NakWYlZg5YUb0EPJx5cg3NJhWKW2v9OfXVAMQ3wguFVrhZSO0mon1EIiABPqBoxdxOwSEVoqcXHZ0
	bv//XsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNEu-0000000CzkR-2gK8;
	Mon, 11 May 2026 09:47:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNEs-0000000CzjB-1BHm;
	Mon, 11 May 2026 09:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492868;
	bh=S9RiWN9NgxPJbRPcZDB0Q7SHNr9me0DBWxbBSKteiHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FGBzNP1414puPCP2spGk7cPLW3m1YCAMiMjUXPTCHcUn4ZnH6GXTHArAvV4mXf+Fs
	 2VXPWUbvWkbZXqkMhrhyzHWskuBcNIA4/xbkFacj/X1y7Q7yqY+QYI+oPYplsv/ewW
	 1Gp8fW3I59qyEsfZMOZzzXZ9y0EgFX2mB4xTVOoMvLhGb73Q+UCijkUUNediBYJ32T
	 G8bRG4AuaAvNunaFSjSUioMqadblh7t6fufvLH2o7oU7gUhkRdpOgKos9S7DMFhxv0
	 JHBxgMokwcWfSWQHjF4PrRIZ3ml97R0e5eeIeGXnOA94q/+wEka+LA21dgFeXJ9mmc
	 baiLw9vdv939A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9D4517E13B2;
	Mon, 11 May 2026 11:47:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
References: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
Subject: Re: [PATCH v2 0/3] arm: dts: mediatek: fix pinctl node names
Message-Id: <177849286783.117937.17925857758688096977.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:47:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024750_672049_C9540F43 
X-CRM114-Status: UNSURE (   7.95  )
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

On Thu, 05 Mar 2026 15:03:15 -0600, David Lechner wrote:
> While passing by, I noticed that the pinctrl nodes in a couple of dtsi
> files did not match the addresses in their reg properties. Here are some
> patches to fix that.
> 
> 

Applied to v7.1-next/dts32, thanks!

[1/3] arm: dts: mediatek: mt7623: fix pinctrl child node names
      commit: 23d304b97e8e20b8d786b82b4d56257dde95139c
[2/3] arm: dts: mediatek: mt7623: fix pinctrl controller node name
      commit: 85fdc6458535d234e54d0968cc816dec9003d341
[3/3] arm: dts: mediatek: mt8135: fix pinctrl node name
      commit: ba6afff1d9b70028a5fc3df2d3acbee501c20a53

Cheers,
Angelo



