Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46239C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIYjbUZnLvBNVQCSh9PBikbmBkITMd7u0nxmcQUl5sk=; b=ngY05+0G/VbJ/Bp1tXtGO7THqy
	EHAk7lS8eDGcZkyOJC9+Nhb0DQKKhARbJKoR8PoVWScsIj638DNb+nv1QALMluF/7j5oYIuLUS1ly
	2QgE+oQBxtqyb2a0gLUgLXe4R7yM+REbfGwp/CZqrIJjiAqXwlD2/WsEKR2zFtWZHuRhjnNJLn+pt
	gVY0SdLnuxq6fcRZhSwM6Ig7Ko7kDkyZH9T3Qjhkd3BDteRqKAL7Nj67JTtkFqXc9ZIWQoqttg5OL
	FpfK7PUP2BcsijX8CDOpvO8zkCrg54pE49a3comYHfS9pwvsL0P+GJBlG4aAjRaB6uYnTEg9BsbcL
	tZAChQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBIo-00000007XhK-0V4B;
	Tue, 21 Jan 2025 10:16:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBHW-00000007XTg-0XEK;
	Tue, 21 Jan 2025 10:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F29F5C55C5;
	Tue, 21 Jan 2025 10:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2341C4CEDF;
	Tue, 21 Jan 2025 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737454488;
	bh=04qTz7CSMOIP18CaQqgrluBBwkB/rAJoEuXBAFg3YkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMAHmT0tgdndgvuTud9TuSW3+uFYlpGuODPBCtIS8u9ApjfzfavBgDzjSPUeg6ESJ
	 m6WiIiPzW6pvcuu73g5lke6rPMHAbcPSHjNcQeIO5s16aXUpInT67WYsbN1SJ0rq1z
	 e0uxKxZYydAgI86Ii/q35px09lpL+TXBG7XwTuImfxmPsR6VM1aMjxj7Mk9hNxRZfZ
	 4Qytrko49EMYDe/4HNOx8jj6doCEYzY622iU6pSXMfBdiNya74jZp41FOQL72mavBC
	 alT0z8BKbLAeftH8CP/FsN5srb2oO8xiyIc1wwSIfQtVoDyNuiQLGvBN1StGn+scv4
	 RIY14/Qu/5skg==
Date: Tue, 21 Jan 2025 11:14:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
Message-ID: <20250121-alluring-fractal-toucanet-c3b1ab@krzk-bin>
References: <20250121064934.13482-1-friday.yang@mediatek.com>
 <20250121064934.13482-2-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121064934.13482-2-friday.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_021450_207263_CA8A9C0F 
X-CRM114-Status: GOOD (  13.71  )
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

On Tue, Jan 21, 2025 at 02:49:26PM +0800, Friday Yang wrote:
> From: "friday.yang" <friday.yang@mediatek.com>
> 
> Add 'resets' and 'reset-names' properties for SMI LARBs to support
> SMI reset operations.
> On the MediaTek platform, some SMI LARBs are directly connected to
> the SMI Common, while others are connected to the SMI Sub-Common,
> which in turn is connected to the SMI Common. The hardware block
> diagram can be described as follows.
> 
>              SMI-Common(Smart Multimedia Interface Common)
>                  |
>          +----------------+------------------+
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>        larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                    |      |     |      |             |
>                   larb1  larb2 larb3  larb7       larb9
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>

SoB/From mismatch.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Best regards,
Krzysztof


