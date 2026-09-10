Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471B2C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QSctDRSj6GRip8jzNuQeWHWqzGiG2EhaH/zilXWj/4=; b=vzGdj6Hz6vnfl7yR1tlqCXFsyV
	0fynqfWMif2/pSOLBKNhtO6DdzuQOrG7wu1O/X3XwMpo9TFWmWMlTgp2rNZ/uZ3b8g/o/m3F9lr3Q
	gdXKsZESgjb/UiPBKmtX03wJCqAHy0aYW740KvmKnLZ+eU0T5/Vtuks+pRAcj42coiRU8jZglFQiX
	EUDz9QomJXtr4KxX0pDlHPCrdZfeaEuxfFOIRcUjSUyZ53cJoowbykzl59Csv4YRxvO/DUGjf+stH
	hhAM8CYnRIdGxQ94zsCGX7+Kpb34faeiPzU4NUdMs+1k05EOcaUGsvRRuE7Au90KGXnrVaMGbL+lw
	qMfbNFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eEh-0000000ENMo-2zMq;
	Thu, 10 Sep 2026 12:50:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eEg-0000000ENMb-2Ytt;
	Thu, 10 Sep 2026 12:50:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E060600E2;
	Thu, 10 Sep 2026 12:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172BE1F000FF;
	Thu, 10 Sep 2026 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789044637;
	bh=4QSctDRSj6GRip8jzNuQeWHWqzGiG2EhaH/zilXWj/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M7vHTB1gxjOuodiIQbKUrQQoipZtkwAy4MM+BXZnd4QqKuRc/szaDtmU/AqB8MlS1
	 WeQL2VBHTVeCSgQBA3tTWs8F0fqm0VM2nTu9Kt41vuAEEn1fQxpQ1ONNpy8oJ9rdEu
	 /ELbWjj1jtvD2xhQitN2zURh8dF1ef4hQAv/hd0k16Q4YYZf2DfMmTGHwTRsJIKVKj
	 GfWukCCEYathD5liSn2Et4xD+ybd6Is6tFAJ8OLf+SG6xgM42WXB7z3qT+ru0sakWL
	 QS4Qnmp/vvB9c9ORxFLoCic1YLk38vQFnX0LkAI509zjiGGYGQ2C3a1Ogs+0b8bCeG
	 AWwXfKz835tdw==
From: matthias.bgg@kernel.org
To: zkh@mailbox.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [v4,2/4] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
Date: Thu, 10 Sep 2026 14:50:24 +0200
Message-ID: <20260910125024.70078-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-2-e9af5c420ab1@mailbox.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for the MT8127 based Amazon ford tablet.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index cd4040ad3437..180e6e4948e7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -122,6 +122,7 @@ properties:
>            - const: mediatek,mt7988a
>        - items:
>            - enum:
> +              - amazon,ford
>                - mediatek,mt8127-moose
>            - const: mediatek,mt8127
>        - items:
> 

