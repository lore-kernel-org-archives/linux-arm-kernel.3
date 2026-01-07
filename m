Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13177CD5854
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COs6X+2bm3X9FPFfA1KKzQjUTbxOVGv7Y4ik/Uliu4k=; b=kZ+CuZbcM/9h+l6LT6QotPX/Kl
	iepC7UZv3NNRr20PyWYcTnaxS4tINNG8q90F4vvC+g2ZIB+w63I9DE/JsKy3aOxne3w4AvVLSRk8w
	G44dKrHdPLfk5qmKrvAJQEpYpB+5TnwlJsWWKjMt6bNspHO8/3bSBOMU5j+zC7dUjtFYlQiNz+rt2
	3I3vS3HksQc1sDT8GkJH+zETuLg0T9QSG/K4SG81I7jjceKFKX8rCy4fIc9ND01VpPgdoIFnqKxAr
	8pSegsgNkuQgwvB9vez+9oLWItZsHQj9F1EAKI5tiNX5LUEJNYBdiWq7OANbAdlb27JuIyg16YKWJ
	2w0M8cKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTJ-0000000En70-1URK;
	Wed, 07 Jan 2026 11:13:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTF-0000000En3Y-1Ndg;
	Wed, 07 Jan 2026 11:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784371;
	bh=hMjy3lEeXeDO5nRVZQIN6TVF65B6g+XqBUFMamxA9q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ViwEgA4nWX8LGJFqhF/l4DDs5+k5XVSUTvKyHLm8lKzbynh8mV6PSQb8nrWm+ozer
	 W9XchbZWhbjTTdD0A5wQqHJ2IWw8f07iDGgta7Yr0q5qRPMzExUVR4PR0OiuGahz/B
	 /Y97kTOQUG2/EHp3TlirSHMKue6JAMtCsB16wtpwBhRDZSWQKOSZ0HH5P55gBJi2HY
	 N7+QZy5qDAMMOg7J5WNC2YvkfQjEQB1S4O4v4wBoAw0lGnvXAFPUSAdiRIxZl/kgvf
	 d/8lIyF2p4BOyCCZS5bLPpTt2bi4jzFkH8lU/4tMoW2h20ygl/HoN1bhdaWT/Up09P
	 dR4fOG81O5xbQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE58E17E150D;
	Wed,  7 Jan 2026 12:12:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Evans Jahja <evansjahja13@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de>
References: <20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8183: Add missing endpoint
 IDs to display graph
Message-Id: <176778437091.39195.13022724446632883232.b4-ty@collabora.com>
Date: Wed, 07 Jan 2026 12:12:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031257_529061_45353744 
X-CRM114-Status: UNSURE (   8.40  )
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

On Tue, 06 Jan 2026 11:11:12 +0100, Otto Pflüger wrote:
> The endpoint IDs in the display graph are expected to match the
> associated display path number, i.e. all endpoints connected to
> mmsys_ep_main must have reg = <0> and all endpoints connected to
> mmsys_ep_ext must have reg = <1>.
> 
> Add the missing ID to all endpoints in the display graph, based on
> mt8365.dtsi as an existing example that does this correctly.
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183: Add missing endpoint IDs to display graph
      commit: 6c9593bd4560750c7f862af5ce13b2802272c6ad

Cheers,
Angelo



