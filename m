Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAF8C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wf2s6E9F9UXzKSIgWVLTJ7JYYwLfsPztEONV2/prW/I=; b=DS0fH7eizUto41vTDb+qZB/uzy
	mgX5Q0rH/hEREYaH2D1gw1V5+PDLqjPdzyhDxM5IprGhQEFWwLgvap59Ikf9mgaFhmQZaow33OpwY
	NR6zKWJ0yiK2SK/tPNNB7EfvRZqh3ElE1r1iCeWA3POmAE4I+1LA/dsjFSmpcBg1fSdmP5z+Q02Y2
	aiXW6KgtU/iPDSQNupozkE9VrckkF/aWqReMghBvhzyZrHKnTJSJwzpboVLiUytmQJ2JVQNCGS/pS
	ZH/lHC87gR7SP0Dne35N659JGS33mUlnt25kFqnBS3c0HTqfaSR44DtBiKBcl+CUu6wgzhWbVkCVD
	e80MBc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GaT-00000001NMh-0Pfe;
	Mon, 14 Apr 2025 09:58:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GV5-00000001M6w-2UFa;
	Mon, 14 Apr 2025 09:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624390;
	bh=SkXQJw1SrqmsayStjUHaJnoQ1wHII+j9X5YNhZccMPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GWZS2l+762xg950+C1/dFK7ba9yejpqumCYBFr76tfglzxm+43hT7TRArJMvfGLJy
	 GyNm61CkAov0MGbl5k9Kc4ml+Sh/cCg5JmboT9ljrvhjT7ZVG8qXut6nhNAbccacFJ
	 9F+tB104Vi4w4/FFLMAH0vdW3VzAjW0QFMgM8bN9jcQesV9KwNYveKrljxuxOcqbgr
	 8PUmS3+PMs5yVSlqEMB2FSVxR4q8ytD9PduopeSSYK/hPxVuSUTJaPVVaQAByNXLZK
	 YgagwLJs9LEZsSGfUJ9q6QsdPNuwm4+gIWe+brpjyFddm0tOygB6+kaVib3LJtI78g
	 NDD/mG7mKT9oQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B410017E0CA7;
	Mon, 14 Apr 2025 11:53:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
References: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix pcie
 pinctrl dtbs_check error
Message-Id: <174462438965.45420.14201836161335259332.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_025311_781531_79F18487 
X-CRM114-Status: UNSURE (   6.40  )
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

On Thu, 03 Apr 2025 10:05:16 +0200, Louis-Alexis Eyraud wrote:
> Rename pcie pinctrl definition to fix the following dtbs_check error
> for mt8370-genio-510-evk and mt8390-genio-700-evk devicetree files:
> ```
> pinctrl@10005000: 'pcie-default' does not match any of the regexes:
>   '-pins$', 'pinctrl-[0-9]+'
> ```
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-common: Fix pcie pinctrl dtbs_check error
      commit: ec71844817266c8d301f5745126cdbdafd33edea

Cheers,
Angelo



