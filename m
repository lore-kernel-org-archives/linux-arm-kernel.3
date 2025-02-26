Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337E0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNEWasKX43FkPqigUC2R6O6uFHOMN2J6gXRtqFUQ4yc=; b=YWHXTmt49EVfseNGNSH7a2WOn6
	qD6/RNi5n6SM6kGTqe0Q++bZS5WqnBN7MSUuZkeoZDrhUkSPAsSdYtR3+Gj5I5VKUmcxEA+aVG98c
	9bOf59mGJTiUR7mKqC4lQ4fA1JeAyEifTqSrii7rgr7eLkdLsdnJqxdUxz+ybi3TB++z7LoVxsNpe
	Mh1rO22EA0vkHKPfUBHuCSUEMUq2WdgojBAPa/gRuEbCslf0vejlGX6b39y38GCXZJ72Wi+hCmhbl
	Q3VbKmkrcULqLySm5PafI9ga8snecfp9U+dQoipUvka9qL3iMGzqDlqVOAm3rbk8BGXh1a3fxLaJk
	hBvizciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEm-00000004FFI-1Zlf;
	Wed, 26 Feb 2025 15:22:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHUJ-00000003wCH-2Ekr;
	Wed, 26 Feb 2025 13:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740576609;
	bh=sCJ6jojoxc5SezhVGVdeO6sZxq4gq9c05ziXwDfmpkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B24RGItMUUWDCFWd7lymvY6aJ7jX/Le5eCguhwra3Hjc/FnVrPoKrsceMDm0N5tw7
	 tsvF10smahGg4io7pJeXc6UcfoWhp78IA+OAJbzE0pzHhwG7bMDKWkm1Dm22+szeyi
	 cnGxha5uPB4hLJSHPJiS4C1tJPx43dkfsP9n0cLCBUhtP71P68LUf88l3998f8TFPe
	 Lxdgeq/lwoRc4L4q/JtOrnY655lYdR+xIky/IJ5KN10q/QjPjGT7F1NCGL2IacQCce
	 vUgtIR+LpTT9PjS/SDrAMIxstCaiG1Pah6P2LaD9g/XAIA3MoXHo9gUORhFNw4Hdjf
	 qO8qW0rZmaBIQ==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A072317E05C1;
	Wed, 26 Feb 2025 14:30:05 +0100 (CET)
Date: Wed, 26 Feb 2025 10:30:03 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/8] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 DMIC backend to dai-link
Message-ID: <9240905b-29af-4ea7-8ff9-a0cb2233da72@notapiano>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-7-3076f5b50ef7@collabora.com>
 <20250226-ludicrous-seagull-of-music-a40daf@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-ludicrous-seagull-of-music-a40daf@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_053011_720231_A7C4BEE1 
X-CRM114-Status: GOOD (  20.03  )
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

On Wed, Feb 26, 2025 at 09:22:29AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 11:33:53AM -0300, Nícolas F. R. A. Prado wrote:
> > MT8188 platforms also have DMIC DAIs, which were previously undescribed.
> > Add DMIC_BE as a possible backend for the dai-link property.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> > index 362e729b51b43ec16716aee70ad736420def81f3..8c77e7f68ad7b6f5b88b53cedccb291139a2eeea 100644
> > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> > @@ -62,6 +62,7 @@ patternProperties:
> >              - PCM1_BE
> >              - DL_SRC_BE
> >              - UL_SRC_BE
> > +            - DMIC_BE
> 
> Any reason why you keep adding to the end of the lists but not
> alphabetically sorted? It's enum, so it's expected to be sorted which
> reduces conflicts between edits. Last commit already broke sorting :/

Well, I wasn't aware enums were supposed to be sorted. That doesn't seem to be
documented anywhere. In fact, in example-schema.yaml the enum is not sorted [1].
So it'd be great to update that example to follow that rule as well as
explicitly document it. Maybe even a dt-binding check that checks for this?
That'll make it much easier to learn about and follow this rule :).

I don't think it'd be worth it to send another patch just to fix sorting in
this case as it's already been merged, but I'll keep this in mind whenever I
send future dt-binding patches.

Thanks,
Nícolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/example-schema.yaml#n52

