Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7331F94CD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ4lYIsklJpho+gwVJ2tZGCbgPrwwsFyBkAacjdzrys=; b=qlql/59Gez2H42l69U1uJJLGYP
	2poxVC/wJb1gdLeR7LbUnk9PCDRUvDtQ/FcKGfEn1fmEiU7DMXLXK+tayBPac7qTi5pCEpwHsgoPe
	YaEzZ83+NxgZi6zDF4wkGkBYsCDJmaHl9Riov+L+1lePx5ARD02l/flmBzmZdeEHbk5p4eXNcdHOO
	PDzDSmb3ncXt1EYLtmE3jk23wWFppODc6Rd4AGreV7a3aUctTF1gwk2JZWZWmCy5sc1dHIM+UA/u8
	zdS9S2EK4e4GOaDNNCQH2QoIURbUN2Bux/4s2Hb4oSgpJL6ADqcLnYpoF+pdqPjYSD4AOeEDGVHcZ
	7cwSu//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRw2-00000009imq-1881;
	Wed, 22 Apr 2026 07:23:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRw1-00000009imh-2elN;
	Wed, 22 Apr 2026 07:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE3CF60018;
	Wed, 22 Apr 2026 07:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFACC19425;
	Wed, 22 Apr 2026 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776842624;
	bh=U1ij765Jsgyab3m+Pw8LxQtm6XxGjDqoXz6QoaxBu5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2sMocZos1sITvRnYLPtTnqR8duPdHl9cgcOtp6ykjMRmHSZyCrR+zbs++sZEQ1Ex
	 +yR2IS8MfjCyZi/Fsl30hYJJpTqC5mNl0mtxXGhFJmKiq6U0nRXWmWF892rgytsxUB
	 +rfq+yAhL7TyzK7TqlxtDBh1M1vZwgrMxHX2jOkO+3wj9QoQSphxh4gBE/9QrzAa32
	 SOlfPLNZUB+0Ik71N+hUGflS/Ma0wIgqXaveVeZZ7CFX2FlvN+woX30hxBOPWbwwja
	 RcBQttTqKdVeuP/XZvZJ0i3Au5w9p8mDkjRHz4nzDQS+d1xmaklSa22JMija0wIqnV
	 shZWoQyTmDjNw==
Date: Wed, 22 Apr 2026 09:23:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/9] ASoC: dt-bindings: mediatek,mt2701-hdmi-audio:
 add MT2701 HDMI audio
Message-ID: <20260422-mighty-rainbow-porpoise-c98f96@quoll>
References: <cover.1776646435.git.daniel@makrotopia.org>
 <072c4db4a01ac125e9ee5e34f992cd169c78e117.1776646435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <072c4db4a01ac125e9ee5e34f992cd169c78e117.1776646435.git.daniel@makrotopia.org>
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

On Mon, Apr 20, 2026 at 02:13:13AM +0100, Daniel Golle wrote:
> Describe the sound card node that routes the MT2701/MT7623N AFE
> HDMI playback path to the on-chip HDMI transmitter. This is
> separate from the AFE platform binding (mediatek,mt2701-audio)
> because it represents board-level audio routing between the AFE
> and the HDMI codec, not an additional IP block. MT7623N boards
> carry the same IP and use the mt7623n- compatible as a fallback
> to mt2701-.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2:
>  * Fix subject prefix to use schema filename (Krzysztof Kozlowski)
>  * Rewrite title and description to describe hardware, not driver
>    (Krzysztof Kozlowski)
>  * Clarify in commit message why this is a separate binding from
>    mediatek,mt2701-audio (Krzysztof Kozlowski)
> 
>  .../sound/mediatek,mt2701-hdmi-audio.yaml     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


