Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72C0C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hym3gl4gErWlJLQp/NpSUVybx4xS8SkcA5rqgzJ2CJU=; b=BjXWJNetK8zfbh4xBRkEHe8K1X
	RgSD29uiDNi1qiG/WGrnbW2HwnXHk9kGgEki32vzixC5jnVZSBLRJVnVtp1ivnk2Nne7KqzNNMYo5
	u17kPcdJiOx8J7AinDeek50n4Ckd4voncuBpZRGUvsf1RKuCQRn4QmjxSBOkgVvLSK82Gqpn485qA
	Cw7Ag8dqzzDkUb1UO2I/MvwAmry77a7bSvdCfbEEcY2VTDrp6ltTOKbm8UNgVSrWxdoisAX6QWghK
	dyGHoLxeIxisqpKUwy1OjiU/0cx5zTd//IpjJSLn2aqbkKuj/9FqblvztJ0IeHtmE/AJdjmZOy6SA
	XwDQmQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XbG-0000000ADUy-3amj;
	Wed, 23 Apr 2025 10:45:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ww3-0000000A6Lr-22cp;
	Wed, 23 Apr 2025 10:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745402549;
	bh=ktV0WTPer3asI6aYq9UAR47uR805GI8B92zxNTsMtn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G8dgid8oB/Uln65s3r/q+ZfQYLOBCybERkwrw9drzKh6Lel2fcpNt0XucNtrDaEEz
	 xWvAldiHmhVo4DvfvZB76gBu+x6JNL5DrxFYJ6dLC/b4/AmIYZy4B9xj3rV85mLhhy
	 UapOt6TsbWw7mAxwMPGltm84Jorfhj1CV6YIsA4PChAmpCRI3c9MjrqDz4ea+W1N+K
	 ElSLFEAPkLpsDuc1WzJKPw9S96Ogo39Ema2RZ0wNVJPRRsLGgRk8Hft+Aziyg5YGlO
	 eQDmaWCgq6wZBILdOWnCyGCm30c/Ks2g24FRKLlQOtJ6ySwrQQGNcVtDsQrDiQkv0q
	 RKG7ZGY0ovw6w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4F9817E0702;
	Wed, 23 Apr 2025 12:02:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>, 
 Nicolas Boichat <drinkcat@chromium.org>
In-Reply-To: <20250423040354.2847447-1-treapking@chromium.org>
References: <20250423040354.2847447-1-treapking@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: mt8183: Add port node to mt8183.dtsi
Message-Id: <174540254879.65934.8631292816995667484.b4-ty@collabora.com>
Date: Wed, 23 Apr 2025 12:02:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_030231_703658_16D07E7C 
X-CRM114-Status: UNSURE (   6.38  )
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

On Wed, 23 Apr 2025 12:03:39 +0800, Pin-yen Lin wrote:
> Add the port node to fix the binding schema check. Also update
> mt8183-kukui to reference the new port node.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mt8183: Add port node to mt8183.dtsi
      commit: d15059f7be59f887c1a370037cc2337c2ff2ad56

Cheers,
Angelo



