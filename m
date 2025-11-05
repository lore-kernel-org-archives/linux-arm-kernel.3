Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26106CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jT2EchzI1dGe5iL/OI7ioa4vBs3ZY0dWs2gLhSrk+V0=; b=X8NGlvqoFs8M69o3O12UfNLyIS
	ZWCGQg2/f2umoqppcElpSB28zt25OludzV5gWBHP7LPmHEFmV0IuD8MxX3bO/vliVnHTFHoJkkvyN
	dRDNVekb8YCL7MsCp0pkJLCT44uOk/gH4mHfsvO/Ztam1Rs/wANWgOWau7P4SnvGaYvT0Y4SQhG+F
	tqpVF8epthaRxor+YUCf9gD1oABOOyNTSgcIcpRzIBtTd/q58B8ZGYKj4pOtgyrjUuWUX0awPRMv6
	eFBvYEEYfQul+owmi3JqeH3n6geznbWJThmdFb7ajPPum9H1ZcFkiTKBtpreeE9raELWOlPd0xvZr
	7H5w0kRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd4E-0000000DiWf-1Q9D;
	Wed, 05 Nov 2025 12:56:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd4C-0000000DiW6-2dot;
	Wed, 05 Nov 2025 12:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762347406;
	bh=zsnwty4DLcrZ2EUkS8MJ4pcrgNIbrvhUP3gBR7CEr5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UCEL5Tyc+WmgK+8W7uwi4S4i+54SOTgymbKDKUO9kLVNg2pCje+jeIW5t8osCuFmp
	 ZK1CbG4eG3vtGhrz2FUfdaV9kjl1fvxsRyjmw9su9G6iU+7e9XSq9b2mihiW2QZXFk
	 o+7X280FWB7c/ZOrZ4kpRalhlacenF74cxlWJP8hYdF2Fpr2fXidaRpTtI+yA4NM8p
	 YSXMLDluJMiIeK09OS8OSv9zEMEc++8N1KhIDEHOj3PzjZpkEOG3cKYZ1Cmf6imBjD
	 sgPBNCC1rwlebjn6mMdr1w0F27kuq9f1WOehIOa/EkqIMoG53LWRy+NB05hRoYnSZa
	 fz2eTOoidP7eA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B37417E128C;
	Wed,  5 Nov 2025 13:56:45 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251027132817.212534-1-linux@fw-web.de>
References: <20251027132817.212534-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v1 0/6] Add Bananapi R4 Pro support
Message-Id: <176234740545.29963.12296506699287860071.b4-ty@collabora.com>
Date: Wed, 05 Nov 2025 13:56:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_045648_821531_CADC373C 
X-CRM114-Status: UNSURE (   7.46  )
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

On Mon, 27 Oct 2025 14:28:10 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> BananaPi R4 Pro is a MT7988A based board which exists in 2 different
> hardware versions:
> 
> - 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
> - 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[2/6] dt-bindings: arm: mediatek: add BPI-R4 Pro board
      commit: b88827cb0bd1a192855db40494970bbdd7aad939

Cheers,
Angelo



