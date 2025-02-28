Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BE8C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trYA0HLMxP/9HUv7jNZRroSssvWuXd7Q6GJW/fSp/Kc=; b=PiYlqq7OiWtFNMfzcAg8seRVTU
	9z0ZPkYOozBFrb8hP37oHdjhLaiJUwv1o6+BarF3E3nVs3tsaj0JzyxW9HqFmUEM73sQMpieuK1LE
	ECOeHJIutHVbszrlitJiR8NqVoSkGU1D+PSCD+yPwa3rqAwKnYc6n+iSuzpw3hhnFa9FH4jFjGhYU
	/c7juC6qPqFHarZks+GJX1U6yV16mnpQN44zC+vM4dQXcQ+7wOyioXedvMWwt0GcifsNNoep5mUAr
	JMpQ89vyjKL3Y8tysr/Ix0x3F+Q7lo1uDaGe25OJ1h4ZGdOT7J5PensfS4id6/sEWvxE81TmuUfOl
	ekZxBn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0DW-0000000B2rk-0Fgw;
	Fri, 28 Feb 2025 13:15:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0Bw-0000000B2UX-3YPx;
	Fri, 28 Feb 2025 13:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740748450;
	bh=21m3In4wCH+q/UoEDYx7ymPFrvABWf4Rd32gUSleQA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNabF+okts2wj5dvZqEBsxkC50bHNM+f5w4lqa7moXIz4uTrl2Dwht6hOqGiod1MK
	 yrrwclkFsnIodC7SDWabOXUO3KABtHYviBa3il6GwIrYgwLH1s/hT7ISUti/D3SMy2
	 I+fy4+hm4Sg/qB4K5PCskuRuHDn2TNybZUYToHnYwKxd/1QU0ldBXskBiTgmqL0Ipg
	 mKxcYEzHxnzBDfv+RguYfrrK7hCZU09YDF3GPxBBGxVMOJcXbQGd2bHXiFKEGKMWKH
	 bAhOirJHBRJ8C00gWbsqCRO83L4G0d4KGf2d7+IJgDWSEEMdUhkN/fV2iypTRhWoaJ
	 azj0xU0CSrUkw==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 733C217E087E;
	Fri, 28 Feb 2025 14:14:07 +0100 (CET)
Date: Fri, 28 Feb 2025 10:14:05 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt6359: Fix DT parse error due to wrong
 child node name
Message-ID: <59f79e0a-c99f-4b30-b0dd-81c4889c7807@notapiano>
References: <20250228-mt6359-fix-probe-failed-v1-1-64941d387b2c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228-mt6359-fix-probe-failed-v1-1-64941d387b2c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_051413_041241_9A991554 
X-CRM114-Status: GOOD (  11.34  )
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

On Fri, Feb 28, 2025 at 11:32:19AM +0100, Louis-Alexis Eyraud wrote:
> A recent dtbs_check error fix in mt6359.dtsi file changed a node name
> (from "mt6359codec" to "audio-codec") without modifying the mt6539
> codec code that uses it.
> It leads to a probe failure after devicetree parsing returns in error:
> ```
> [    1.354025] mt6359-sound mt6359-sound: mt6359_platform_driver_probe() failed to parse dts
> [    1.355066] mt6359-sound mt6359-sound: probe with driver mt6359-sound failed with error -22
> ```
> 
> So, add the child node retrieval with the new name and if not found,
> try with the older one for backward compatibility.
> 
> Fixes: 76b35f59bbe6 ("arm64: dts: mediatek: mt6359: fix dtbs_check error for audio-codec")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

