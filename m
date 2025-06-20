Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC0C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZzKv95/qPQLk4dOIL8/uUJV/xuG6bhVSFJOYUTBAoM=; b=4dE83CyF7sH4p4SEP7JF/oknaG
	1OMvo56Qkj0stP/5m98+Q6PKCsiuD+bSk5mDZm6RJJLFSWPEHCgJlGHGLk5Ws+DUEjkVNezeUTZ5v
	kJMs9ltsTXbgUDRb7QOeyoKv80F0d6lJXx0brUqvQA/X/ZwEOpXDCRtBzymlTrJSYuqVMsiBtw8xE
	auwsKuUMF66350MPcwCy46qk4A+Qd6kHgfK2aSRuuZOrX6sPJWFcVpN4R5tPx6D9tbe8AwSofa4hz
	vLcC4oCS4sXwO/u/4gS0Yd+vm6J7JR6e6ZJJqGIgAYMnyZ26b9ZTwaJ7J3+O71+T8OuHNEYd/4plC
	SGNBslaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfc3-0000000GFLH-1tJ0;
	Fri, 20 Jun 2025 17:33:15 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfT7-0000000GE1U-2Epz;
	Fri, 20 Jun 2025 17:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1750440204; x=1751045004; i=frank-w@public-files.de;
	bh=jZzKv95/qPQLk4dOIL8/uUJV/xuG6bhVSFJOYUTBAoM=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y75w36KUGxBxAvlr/ia4dk6Kfo/AcCpsmbzQM9pP2G2YjNxYzk/5Gw2Z7UwguDt1
	 xMmGN9HizcSspCopryykWAHYXJZZuQgfkltueB5aKbmbCypMXLgskAfgCVBLqC+GB
	 xGlAZxAsZQQM9e8+7y1WpH1FxqI99VtcKkcODEMG2a7MwZaxolhLr6ksnSBTG2UHs
	 yOb6MDa2sN4+is83ufCx/2yKO9LM9CCF9CZRb29JhU97FyjUIs9pP+9+J/sM4KjnA
	 d+AArFFU55s/Lud6VNeAW92DSNzn2XbxIwIyAkqAYzRqXLkam2ruqoJRHQq9NrAFw
	 vReBGfYLdLDiqLT7SA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.67.37.206] ([100.67.37.206]) by
 trinity-msg-rest-gmx-gmx-live-b647dc579-p5cg7 (via HTTP); Fri, 20 Jun 2025
 17:23:24 +0000
MIME-Version: 1.0
Message-ID: <trinity-f6d57547-e653-4444-bdce-48975fab0f55-1750440204231@trinity-msg-rest-gmx-gmx-live-b647dc579-p5cg7>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux@fw-web.de, myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 cw00.choi@samsung.com, djakov@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: jia-wei.chang@mediatek.com, johnson.wang@mediatek.com,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, daniel@makrotopia.org, lorenzo@kernel.org,
 nbd@nbd.name, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: [PATCH v5 06/13] arm64: dts: mediatek: mt7988: add basic
 ethernet-nodes
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 17:23:24 +0000
In-Reply-To: <20250620083555.6886-7-linux@fw-web.de>
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-7-linux@fw-web.de>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:LLXkIlgtAkWlv31f/hwKzDWFIFD7uJCQ7JVO3uSoGjB8MaqlfHEWiN8bymQPoCHE9Rkr9
 gQRUfMcQMdq9w9g1SxMZPnMrdg6cdNs1vUiydP7WUSb52ReRk5IoHDL38qaysgQub/2UTeH3Ke/f
 D3Djl6851xSk0t9I79P6EdxWUyblB0+zjJomuwdUzKQ99wAJLx6w2pn8Ft2D5Sao1rHTbB/7+i4k
 18pnFAGt+jQOMNEuEdPi0YUuo+eVIIPTNDPskO8geEgdbuI9kLDmtEJJ5C1WqjxoLkmEWy1oRU41
 w0dKMufwwbGxLFEsQY08CaFuBbYycS/vBnT1l2ms6DSRkOaANk17T4LFD0sy8E8oRE=
UI-OutboundReport: notjunk:1;M01:P0:vCoJMTloeCM=;tIllx58HLY+UYiXc3pq3eS/80XW
 oaaZAndwB4w5dOkGRVn7N2YkAmaz+Lw/oZcvryJhb+t2Jy/+9LZkrEyq1VzxZmrv4Z6FRcG2P
 l+v0qNMwWdBxhKIBaDqD1aBqS8M6AoaQSH2L0ty2Lv+rcux5agsY1hWHSxBeFTHURUbka/xLt
 RLqaVAC8hvYYXAFEHdWnSd2FlWi1nUjHCO3nUunmR5AyBo/W2luQvPKAb9WmVd0z1J9/omx0/
 y8aqGa8sWk626kNA0u+gwsOozox7atHy5KDhlj2aj4ybx7XOLl9QIlmJ4vlI7Q8rF7ZsXZQR+
 lBqJXRt9rKeVe1RnBm+qOGJ894wvi+aVwrzJ0ugxZJp87i3LEffeczZyYG2Fj3AsBbtrNB6pH
 lUVtm22Y059u9brzIqCI9WZuFZmvkfKp0yDlLRCSlEuH3lzUOG4B6QQZ3i1T4MJbo29Xnbutr
 LqE9zt4TsmxEN096zgaNcCVR/tkypSI1CR4J5HQspAFx5+vAA+ITh0G81EjcFfX42Y6Wdrsv5
 y0VvpFNtdnUjDUyyWnii9IFhWdgVFH4gxz+y2PV26g5ncgAotEb6gxMW0Aij/rIStN9PlwoCX
 sdGxUtraiE9CaONMU5yoRJABf356QDJKPUbykuCNMS3jruwlw3K+G4cprOQwkNl9YPMvBJfWg
 tAtm992pGw0VnGGgOkF5ejWrAAmhvjgSZ+DBx8VWd87BCjbEKbemJS700weYVdIYnRA0YbTLd
 m9fDZD465UOxsGrBWX1PRU3yo133/36b+RwgLSVsp8RUdpzcjMjZAzBQF79PNH+M23o58oeHH
 pk1catg3AzLjStZL/Awi3j30AlO3v6jx+KTeNUjbz2lr2m7asbyvqzUrVP1g+rhqZPKZnMePE
 xOsSrukD8zf+cD1vX2C2ZaXq/UtX4IiBiIZWrkJguTP4Mrtd7ud8b2S/PIf5QeD9VLY47ylIN
 0+J/JUP1xAYL6Xnyb2fE7Njd2pUt5JJsxJElSfnbUvNdNLs/f7qZlB15C35Se5UnDAfOgwWlu
 mXJRCM2TOk5V6hCYTwMKcIFbDnsxx41lrzVr1ZeFLU62xka58gSqZM9mbYAgFG8BHy81Rgb/H
 kI1Y7oG2Acl2Mgj6nG8GKldrb0S6YdRt2dTlcQkKeR4oCKz4SUIAyySw7DaKTx7ZDMk70y0br
 /ce2GwLheHyclvyVvV39C9EVuZQRIQg1msU7lRDIZCHw+7Iw4bn8FTW2e3MCsdtf2/CRucG0k
 nA3gNnqOLnZBc3FRm0lcKK8YSN+LoMJiQSIHyKQWOl+J2iMc1NQumOa4iOrT53XYCemyWAjHK
 ALtGmppXMwK6CD9nrAmeDXhgTfnJ4q3QU8VfM1tJF2p+S1y8xZ+9j+XutZXhfEggNDKz8k95H
 j0URihQC26i+Kaf1ZbylPTDP1YCvkZcUg4pYvvqFL4Y+3efufHjaaKIJeVmO73jMUqVbPvxjU
 HHPpPsQ5BFgx5bst5k7lZuz6VqUpucUUNDRdWGHjsZ37mSaadSsSt+LDE2bPCTjH72yeTnq5b
 fhtC4dR6g/J2NP+iwmRvrrCC/+F5OkHp5IWt9HUJsd6qpEKW73SzC2p7804T9ASa+ASuwEn8t
 flHppZeHE2AH8V4CLLCsGqbCgSPInvlj7Yo5DCr1M8NpjuqPDMO9v5ZOniHucmK6tPpuS6hGo
 xXB/62UP5NK3vIBPPaAvyB/prRyaKdjgmlp9uyusHXf5bqoh80Bxqg/apjvtT8tpnflXTkeSS
 MqG9Tcz2rA1fMB9myZHACMOZF9x/zqojx3QbMXuE80Z5iQNUBt849Ec8zldqy2zLuUNQ7BDH5
 1Sgg98o+xE5ZEuixFI58XdT0JeBYXzfEAfSGNXFNdb2TagtIG70YFY6WiDX1owF5tUK7H8raO
 +6inlQc/ModT1vSlUt/JQgEcCdYQb6lyUrnpgbzprKtSCy52Yu9c0k49e5Mewn32G30+PG6r2
 Bw5aosY9Gj3frHK0Jh+384XQnfAZHzNv6sKJWVbunaLHP7SPURVDLiLYDfF2aTTaWJ0WbYZaZ
 LkKqb+70DnrL22WDIstawKN4FuRwNKBfhArvW9s5hET/fx0Z9l+g/lev21PpvPPBIVBGoDDfQ
 zd5iFp+4SY0wIc0CkfTMIQsllO5z5w/eDB072gtys938TTwmloMQvZOS13iO0R3drDscvCTVu
 Of/W5xiMz5xI/ejr3XZQ07UK8u/fmjgyh6QodcIiedwb9SVrX97sEX73Mv/0ViNuGfpz5qiJx
 Hp0rH20fN9sNv3m7BwWy7wH25v1L7ywfoqmuPB8ymzDWtpZTxb/NzkCy2u4WqytwmQCaHlIYW
 QYPXJJxDt6gWDgmwqTyzid3Z/IGcQ0ekhVINcRWX86pOZAEpa0t4/Nxo9nWZIRSJm/yxKYqEt
 uS7xFIlDZ4dbkWyi1vpTp8qaqqf6XMJeVk5pyduPZ1KrSXmZiqZAxcjgENk3Gja6D+9STOlRs
 ltxXN9Hvq6y8gzrvoSArLqND4kJJxyrddsVjIfSWOeByOJyGPa+wEHjRCmq2x3o+hziYv80Ra
 WxgVqZF9F26wBDvOlODrYmDsLuJtp590+Lygjiosykwa9Milg5Alav0u+Fi1cP+XKHMgZ/R09
 cdfCWODeYHv5JEyeH2Tr1iqGMC2Jn51AiwFZehARn+GtQ7726M/uGb30aex6KIu+BmtbnY488
 x9vNldJkqIIMu8iAUnXkEtA67s+DN2P0DO1kPr1ankOF7Q8q69kP1hEPBLFDnxQ+pBuQv0POm
 d583zCj9VFJUh+gMaBnsTIe+CMZElo6eRUNzz9V0UevTUIzdhzUGgsmWsTRF3qPu8eZGtxLop
 Xa/+IaTcZ3C/sV51Gsfky6vAfwToBeQP2UKhHgKOaKtBk0Mii0CigzKdvWUsFPovsIeL95
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_102401_861920_26ADCBF4 
X-CRM114-Status: UNSURE (   6.04  )
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

> Gesendet: Freitag, 20. Juni 2025 um 10:35
> Von: "Frank Wunderlich" <linux@fw-web.de>
> +
> +		eth: ethernet@15100000 {
> +			compatible = "mediatek,mt7988-eth";
> +			reg = <0 0x15100000 0 0x80000>, <0 0x15400000 0 0x200000>;
> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,

sorry, i messed up the whitespaces (spaces instead of tabs), fixed it locally but
seems not recreated the patch-files (and not run checkpatch.pl again).
I send new version when net-binding is reviewed, ok?

> +				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "fe0", "fe1", "fe2", "fe3", "pdma0",
> +					  "pdma1", "pdma2", "pdma3";


