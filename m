Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9713CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvbj0muutoFrrSYaLtH+HJMAUuXs+sGQEBNl5sYck0Y=; b=fYxyLTXJZvYGE2cywbnySGjd2h
	Uoe/vQWw/T89oxJtGfDbDa18lrfJwELHAhGgNL4Ssadk1LZonbj/Wx/Spz6NEAKo2vQM6cPsEL2Ss
	I5z8GmjrojDcVgyMD5xjaFu3FLUWx42/EMRPOcKhC2MTQySM9bDGdRM29wFlfdoIOgTTS0NEEN/B/
	uGtiR/+k+p9VmFyibhfZFSqsBsTignsizX4vI6BFJN8Bl6gvB+RyGicTaJQXDkAfULcrAUiHJ9VRc
	0weOCOb666CPROomqiRuePkrvQ4PtzjcUblu6Ol2UpVi7CIRCLkTyLaeat29HSzjGoZpVW+4dQblp
	yS5npJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvu6-00000009IIX-0xBS;
	Wed, 05 Mar 2025 21:03:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuI7-000000093XP-1a7K;
	Wed, 05 Mar 2025 19:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741202425;
	bh=XOUlA2EIonuEnAi4OeuApJmrYbcpD0KJp5zdbmXvXnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CazWhOYvrHhnEtvF1PwYHRvH+OY8yDWzLiTcrqpBdSnKQy2p5DHPT8pTjSrNC7UhF
	 0i4KNQXoPBxsbW7yLzBokGm4JkX9UAjdcdQs0qJDBDnqQIQHF0aGuTAN9zKbnnJDUh
	 kcVDSi5SFoXsouHrHrO1/jc8q0IMFn/bE69yxBVwB/gxEqPB6THYrTlEhT+VoTKlYs
	 lHJJtaWGexREvQ9v47Ve68rqxapcnt9jtYAm2LdXO/HXOho7ezLYYqWfYWtdqA1MmX
	 HkS/QdCinOdDRqNFk/RWZraHcoRAKYq4oWXZcCdFi1MIvaUo25p/PanWrUL6ch98Nr
	 G0L3QTDMgXxqg==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4D5E17E0649;
	Wed,  5 Mar 2025 20:20:21 +0100 (CET)
Date: Wed, 5 Mar 2025 16:20:19 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zoran Zhan <zoran.zhan@mediatek.com>
Subject: Re: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: Add accdet headset
 jack detect support
Message-ID: <f3666689-42e3-4fb6-b113-68efbbea450f@notapiano>
References: <20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com>
 <20250304-mt8188-accdet-v2-3-27f496c4aede@collabora.com>
 <59d0d382-1d15-46c4-b9e4-b66c32c188d3@collabora.com>
 <7661b71a-9d5a-46c4-9639-0fba1b118b52@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7661b71a-9d5a-46c4-9639-0fba1b118b52@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_112027_555393_D271558E 
X-CRM114-Status: GOOD (  13.90  )
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

On Wed, Mar 05, 2025 at 05:23:29PM +0000, Mark Brown wrote:
> On Wed, Mar 05, 2025 at 06:18:41PM +0100, AngeloGioacchino Del Regno wrote:
> 
> > Get to that mt6359-accdet.h header and:
> 
> > #if IS_ENABLED(CONFIG_SND_SOC_MT6359_ACCDET)
> 
> > function signatures
> 
> > #else
> 
> > static .... { return -EINVAL; (or whatever else) }
> 
> > #endif
> > 
> 
> It should probably be return 0 for the registration/unregistration
> functions so the caller doesn't fail if it checks the return code when
> the accessory detection is configured out.

Actually, given this function will only be called on platforms where the
accessory detection is present, I agree with Angelo that we should return an
error (and print the error message), so the user can easily figure out that the
accdet initialization failed due to the missing config.

Thanks,
Nícolas

