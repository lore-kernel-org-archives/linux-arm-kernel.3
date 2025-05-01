Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D40C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTNwb4rImB7g18TxsqHFcDnqMMLrX8555tm+zk++cj8=; b=nGv1W07fGhLSUCcneM12bdh02V
	ZB8bScN640PIXzZfv8QNVbfrZhKK/iiym8DGkIxcNje9tCUxnDMothKRsSBHYMQrOyDOtz0dwSlDs
	StFOtjxDv/9LTlz2EIWV5NqMMh8c3HyjK+m96d6TjesNdIHEh3t06bK+qiI3bht68Til+J6bH6boK
	nsH3bjlry/p1qe8FZ4tYEqvXCNut5qqqzGhETfDtP5qUNRMeI7rnA829BtTifQyTzfVhCCA7UrAzI
	kOwMRAaIoWZ4tDXZC5abzjnM7JdQXBpP9vZx81+npVARUietHgQ7rR7isRt78ez7wceFqx9n+rpKc
	xdzZfk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT4P-0000000Fg5x-3sm3;
	Thu, 01 May 2025 12:31:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASaK-0000000FKoA-1BJ9;
	Thu, 01 May 2025 12:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 586B768468;
	Thu,  1 May 2025 11:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA6CC4CEE4;
	Thu,  1 May 2025 12:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100810;
	bh=z2F6Iq0+hrQEpIkV1fcg1WaUZezRhDU2gz0ArU4vrno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FYsGrvFLffhiha4aqHkEGShXosDNpziWGUHgvmVDigxpuGtwUNOvtBoSTZDyYxdep
	 SZSx8/9SSh3vE39cBtXXqVDlyjm3+eLy+BoqTf+h5cIVkcJkwYfx+odlikVY+hgyfd
	 wXoOc71APf3R7yHeCOFcur+WgJq4lOF3LZIBavk2ngkmdxUc/SKG5eqgG6h+nzYTlo
	 VqREdJ/WFQXkkV52JcMGsj5+dtEAGoQIlh0H0KiDq0T3jqgCco3uXMTwXpQHb86Pth
	 l5ggML4+v6nvlahSCh2YLw99hh04tQdqnqOHwAQt+adta+U2bLYP38Bj0IsBvj7s4t
	 +bTbCajpFU7aQ==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20250422132438.15735-6-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-6-linux@fw-web.de>
Subject: Re: (subset) [PATCH v4 5/8] dt-bindings: mfd: syscon: Add
 mt7988-topmisc
Message-Id: <174610080698.3792828.16129247055603832189.b4-ty@kernel.org>
Date: Thu, 01 May 2025 13:00:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345
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

On Tue, 22 Apr 2025 15:24:28 +0200, Frank Wunderlich wrote:
> Add compatible for Mediatek mt7988 topmisc syscon.
> This hardware block contains 2 functional blocks
> 
> - a powercontroller which is not needed (switched by atf)
> - a multiplexer for high-speed Combo-Phy
> 
> This compatible is only for the multiplexer part.
> 
> [...]

Applied, thanks!

[5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
      commit: 4d54ce40400c215127ce24aa3a684a20e7d8493a

--
Lee Jones [李琼斯]


