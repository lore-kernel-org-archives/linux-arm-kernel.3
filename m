Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528DCF01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rt/iJ54BXfSuUj3JlTl1LHNr4lQ+VeL3pLju2PPc4FM=; b=PaAAYUPzJNLmCUq8lKoEzW4swE
	NPiOerjw9tvOVqZi7zIGCYJakNZiXiQsgk8kwZmQfDYwK/rFNvz4HcYAFLx1n5nMhkPOmwMCbI+oD
	2p/8Cfotado1OUh5Zf8NrcTlW7ep8pLDe1PA2+COMQTTK1fPqixmySBm1Qn0Jc7u+CW5JlAkunw9z
	3pD+5jEANWT3ptDW440RROljA4GtVivpa/u19XCNBpkFAOfro8jpo3cd729aGpnD8jzJCnGNXJ9mr
	3misHmJuBRTPtlyZo38RofP9Fd9pf1T5jjYuNVPgMrglqTxbMV6WeNZYIWXvq1Vf0QfcOO/3lokJe
	y961Pu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRJr-00000003Ksl-2ElF;
	Fri, 06 Mar 2026 09:18:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRJo-00000003KsH-1I9i;
	Fri, 06 Mar 2026 09:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772788676;
	bh=1hD4+b8VMh7S3KyWIMiJ64I4vBMqNIB8iASlNyy/O0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k0WT7vE3t0S3dQiDruUXCEZ5tMz5XRoQV64OAtgKDznHM5eH5hPkgSAwix3YoruGU
	 z2hGMCtH3tjjytSA0CARwZVAEpxD4gPKtIRcbPO4wLkSjbu5Oi1cX++vYS06R/2/dQ
	 i4ODKJFVyKZhC+jm0K6JPcXENOQsMz6H4lwuaWMdscXwD/9em1IUL7UZl1Y6iOI7l+
	 VtaBNAKyLh4tQUpvbTeYdikq/U7ZRX1joZQcaFTVgmlvfqEmkx8ONJqufiWzRkMz3C
	 eYVNoiyUMlq1g5s+wrCiF7Fv0UUZzK1RfCLYlwplXglrA2NnFQhmXNUi4kXnBhMr6X
	 tK5sHZ5e25t9Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67FE517E0D4C;
	Fri,  6 Mar 2026 10:17:56 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260303-mtk-audsys-dtbinding-check-warnings-v1-1-e4e1b62f060e@collabora.com>
References: <20260303-mtk-audsys-dtbinding-check-warnings-v1-1-e4e1b62f060e@collabora.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: audsys: fix formatting
 issues
Message-Id: <177278867634.21830.7291005999999398202.b4-ty@collabora.com>
Date: Fri, 06 Mar 2026 10:17:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_011800_539695_12276EB8 
X-CRM114-Status: UNSURE (   5.55  )
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

On Tue, 03 Mar 2026 12:58:05 +0100, Louis-Alexis Eyraud wrote:
> Fix indentation and drop duplicate newline to resolve the following
> 'make dt_binding_check' warnings:
> ```
> ./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2:
>   [warning] wrong indentation: expected 2 but found 1 (indentation)
> ./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
>   [warning] too many blank lines (2 > 1) (empty-lines)
> ```
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[1/1] dt-bindings: arm: mediatek: audsys: fix formatting issues
      commit: 67549df87fff2a3dc7639439e4aff128b814f109

Cheers,
Angelo



