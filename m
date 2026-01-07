Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC1CD5858
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcVPtZ5BSuCAT/DHArD94IC4ZPs+j4vVMk8bcgpTZTU=; b=Zm+5G0SdoW1jZdHZfwVPaFc52+
	PgyCqQa0qYTGN09znS1Q8vyPWbcGNUd2XJAWjkE/2nBEbOdAL/lhcQFrs4bPTw+DkxOs9mVUB4HF7
	NUeEEf8b/sLk60SRIbw3M8d2eiBjqmWQ12mCX9KLbfyvyV8FBwbNVukuW+mW3koeDsItSmGYehNQv
	z4TsMDcIcrN6lwoodtzizguL3KfKjP9n6J5LAarc0KXKSiDPyaffg3ivfnnuIZAd2M7IJfT3H2tfz
	zxRGmvGJ+GwqMumN+SAAd1WAGfDkRfUD2KxMsJeniX3WOKRoct0oLdcqTmwhv71R5KkXc1WGlUhSE
	MPYDLCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTJ-0000000En6N-08fT;
	Wed, 07 Jan 2026 11:13:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTF-0000000En3V-17z1;
	Wed, 07 Jan 2026 11:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784370;
	bh=D1zpCI9Lk65yAbm0KzqI6gAuTY2FfWL12mKep/lVWzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rmdze8LQZeeQcdgHpqrUozgTkd/PT8bMIATi3EV9dpCSGDA57g7hjl0xE2xmlsGau
	 BjyHSF3e8kqXpj02CTDVxx9EGkVuC47f8Ybo+Xdel8ST+cdODVszSH2SVz68jM7kYI
	 jWL5njxL1Fq9pK1fTJackmAPJzdpE1IAQcLy7o6SE06aJIWROZmkdCBPbb8qjPPuA8
	 ivVsWalPIkN6/q1owTqBhm1NTwu5qcBQTmaJ0Z4HTLiVbk02mjs5r/zYBajtPqMlRw
	 Lg+iNzcRhQ7xnhV86FOoRw1ARg9TcHbt/7hbi3jCDrUqAgPusi6PDfaxL3vJkANIq9
	 rvD8MRF2Es38g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4B3A17E13D8;
	Wed,  7 Jan 2026 12:12:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20251119175124.48947-1-linux@fw-web.de>
References: <20251119175124.48947-1-linux@fw-web.de>
Subject: Re: [PATCH v1 0/2] build full dtbs for BananaPi R3/R4(Pro)
Message-Id: <176778436967.39195.1901837532049373497.b4-ty@collabora.com>
Date: Wed, 07 Jan 2026 12:12:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031257_462223_EAF05168 
X-CRM114-Status: UNSURE (   7.75  )
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

On Wed, 19 Nov 2025 18:51:21 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Build devicetree binaries for testing overlays and providing users
> full dtb without using overlays for Bananapi R4 (pro) variants.
> 
> It is not required to build all possible combinations, only for
> common usecases and to test if all overlays can be applied.
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3
      commit: 0516c548883bbe58a48d604e81e33b390986cdb6
[2/2] arm64: dts: mediatek: mt7988: add dtbs with applied overlays for bpi-r4 (pro)
      commit: d977b61d38030f50bae9f634049110af0a364d0d

Cheers,
Angelo



