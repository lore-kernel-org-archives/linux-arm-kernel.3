Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20051E92704
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbZBJroFueUQcPOgoptvd1B4K3BU17Xda3J0of+vnLQ=; b=czukw0/n0CRShkDSMUTsQGbOTB
	tKCjHW/iFT/8kQUlACvMiekeNkA4rBnT7tSt8Bw5QGkdmlljtv4VwhxIk93kZaisi30HA/juW5n49
	5YZVGwuot/pynRNcZPaFCdbPbuVJc3Jf+fH5D9TJ1tlm36wT8KWzGC+tL0HzQNH1ry+roK1KQ9y9b
	z1WNos1mOpfZ/LwOw3JKTkBXaw1kYKqbg4nX/wJ9UTMy2r/xNsXTTRSXYGfI7B5G4zqNKovi4tiSH
	NKjDnwJtvTi4yi8gf2pnrk/Tct91bQYFP03spkp0TUv/2mt3Kpe433bqJXceolyMJC2hFjYXdixuz
	4FvAX1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTVC-00000001yWQ-2pS8;
	Sat, 27 Dec 2025 12:34:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTVB-00000001yW3-1QuK;
	Sat, 27 Dec 2025 12:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04E31439EE;
	Sat, 27 Dec 2025 12:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACC0C4CEF1;
	Sat, 27 Dec 2025 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766838872;
	bh=6HCYp3y/LUjuszjlwAsie3ZUZ6lnUVx7wWALthdwp+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O46vvCR92jmq8E3o4O8MlM/MtC7tWTTqila3KaTLQCJyGNRiTX+BpXbvRjGA4kHrv
	 mXCeaLHX0uIdESJs1qBz7uJLe+IP6qPK62v1P+8CKzaG/fVjrJsgA1CFg8CGIvEYvx
	 AYO5monP/di7bk+oOE1MOzQLdWdzfFhbpeqNkU6qu+Npv7+zp1DCvHfcpEJ+UAZPM9
	 7JumHN3gpyYIm23Wb275g449wOeXCfBt0gu+3SePp8vEgVs3tRCgNKSrh6lV8Auzw5
	 o/ZhFBgy08ZbCs6YMBQMVwoRJoI7T4a25rMGaIbzwvJaGrxVemwIJfzk3NYqXAM4a/
	 MV4S6GwCRhLKg==
Date: Sat, 27 Dec 2025 13:34:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com
Subject: Re: [PATCH v2 1/4] arm64: dts: mt8188: update JPEG encoder/decoder
 compatible
Message-ID: <20251227-overjoyed-illustrious-snail-9323e9@quoll>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
 <20251224031721.9942-2-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224031721.9942-2-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_043433_399037_E22D0BF4 
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

On Wed, Dec 24, 2025 at 11:17:18AM +0800, Jianhua Lin wrote:
> The JPEG encoder and decoder of MT8188 share the same architecture
> and features as those of MT8189, both use a 34-bit iova
> address-space (16GB) and a single clock configuration.
> 
> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mt2701-jpgdec" and
> "mediatek,mtk-jpgenc". This mismatch results in an ABI break,

How this mismatch can result in ABI break?

> as MT8188 cannot function correctly under the 32-bit iova
> address-space (4GB) configuration.

Do you understand what is an ABI break? This commit is the ABI break.

Best regards,
Krzysztof


