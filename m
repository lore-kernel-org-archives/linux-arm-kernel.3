Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2DAC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OaKhFiB00xjqySRGImAjGRQu0wV6ltp8MN1vlNG1AY=; b=uT0JY+6RAxcsAW+WjnTxFKXil1
	IaEMhGuHxwRhOlo+Z3Wh53VHI+R13yHVnJt2Y3+/egfkycKkuQ6d0e2TMiuNt2IdVW9UOwoSCNpfw
	Y6S5Ql4LTyaq6pPUZGGRINfa+6KIR8tFKpr7m5ItZWOHfXl3dlcfx69+SZyj2igcdljZUAPkIJWKe
	G0EPtte506iZgFiGXXiK/hNgbgjLV52OYarEPMs/t/ZglhqqI6oJm/WMtWb6CyqotIwz0FkJmNGLH
	iRgBHsVmRkY72gjHD3QOS3eAGmu9fOFPf/okCwURLo6vA0M4O4GtDHauAdK8IsBUbu8ADxtb1wh97
	uJxS1YNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0g-00000008FLF-3mcv;
	Tue, 08 Sep 2026 07:12:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0Z-00000008FGq-10ig;
	Tue, 08 Sep 2026 07:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851561;
	bh=daxllI3Nm3NoXGMZW8Gj9EOQy4qBvKg3QVIwlZY19/I=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GOnZIyq+PdpMkKc5k9z8DneyxdrbVpG3EMtBtaI+hXqIZJjLJOBVwFh65uK1tkQBr
	 GuVamnf9hQ1qPi48dqNcLfqOJCzGdp6g1Y++PIM/tBu1aoayYSiwRh77nfKgswTw8Y
	 CqQuIr/4K/n006UJd7o3jmcSrn+srHlFzn1pyWUueR1PmjdIequNdSxI6mKmbsEcZA
	 s5QGsRxHmaa7Vkke6mkpaIgqJcy9JFe9jx8gV1Yg/cPwa9v9WdliBCwY7xz6PmCkTC
	 1eMBTehGAl95ahYMM8ruOnEXlIDZMv6QtL865vtpCMBl5/EMCMgBPNxvFtpgvjzcXY
	 x1kodxHg5WXkg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB0C417E0D0F;
	Tue, 08 Sep 2026 09:12:40 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829193910.107418-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193910.107418-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173: Replace spaces
 indentation with tabs
Message-Id: <178885156081.9724.2549176710128041306.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:12:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_001243_455689_60349D54 
X-CRM114-Status: UNSURE (   6.33  )
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

On Sat, 29 Aug 2026 21:39:11 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs
      commit: 41891a30aed15910e1157b218f7f0397fa33ea4b

Cheers,
Angelo



