Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07A8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q191W+TkvMQuAiLSaT3kKCUFTz5z3Epx8qGTpsPXm4=; b=4nXDsIGByLefjQxkgA23V1uVC/
	XN0S1riKkSWYr0gKCofYu2RXcKqWas03Kec5X5kfbHTVww4UkpTODSxwTjmXfRdl9KACzfDK1VKjP
	iNQkOpNBCIN5GHdeEeO/iLvxveNtO1ORRHmgS0YCRBZXdI0DTH+J5kpHQs61999IwWSSWNeJ2rl/N
	0uJNEcGMLceV2V7SNqEyPT+JNqBHtGi7/c6XSlEbH7F2MvXAeIHSYpg1yOOl/Kp/yWIiV+ZebMVae
	O/xObxXfC5P1C66sjKNBF2TCdbOWY0yKaCSnN9FzZ0FjkSTUrX+4xw8VklQEIS0RMUNN8sMj8HG7t
	NHFdpUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJeB-0000000DgC2-2uTi;
	Wed, 28 May 2025 16:28:55 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJMb-0000000Dcia-0Kl4;
	Wed, 28 May 2025 16:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1748448615; x=1749053415; i=frank-w@public-files.de;
	bh=6Q191W+TkvMQuAiLSaT3kKCUFTz5z3Epx8qGTpsPXm4=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ITtL7Z5xydq46gv8vCiSn4S29en9ojbs7J7C31/m6Pq8+AdWcyzV+EoTZt0qu9yr
	 PRFa0716x/P72KlqgVxM+pxAmvDZgIxNPOAVunGc6lxkkw9kFg8bKr68mfgGyvUTz
	 O+slikYz6nm/7j5zVF52+o1lGVv7y1YHpgzlDoe2axISvTF2cFS2vu1TDHc+IP650
	 oe/NY4guxKCErmxZXVNVa/PFWqEqmDVFFnM8h9XhTZYHPylHBhDBN3IEPX/hZRdvf
	 Tol6wXzCJmuk0IvJ9P4PrWMXlF1ZA6Tzvvo0O9bMifkwpfDO4Ph+rYwFcezsLH8By
	 j7Zy+oG4I78AJVMg8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.70.157.0] ([100.70.157.0]) by
 trinity-msg-rest-gmx-gmx-live-6995845bd-wzmz6 (via HTTP); Wed, 28 May 2025
 16:10:14 +0000
MIME-Version: 1.0
Message-ID: <trinity-319df51e-2ff3-42cd-8efd-139fda159824-1748448614514@trinity-msg-rest-gmx-gmx-live-6995845bd-wzmz6>
From: Frank Wunderlich <frank-w@public-files.de>
To: mason-cw.chang@mediatek.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 jpanis@baylibre.com, npitre@baylibre.com, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, wenst@chromium.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
 steven.liu@mediatek.com, sam.shih@mediatek.com
Cc: mason-cw.chang@mediatek.com
Subject: Aw: [PATCH 2/3] thermal/drivers/mediatek/lvts_thermal: add lvts
 commands and their sizes to driver data
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 16:10:14 +0000
In-Reply-To: <20250526102659.30225-3-mason-cw.chang@mediatek.com>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
 <20250526102659.30225-3-mason-cw.chang@mediatek.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:r4s7fAPYduxRwOpa1obpS+TgDXzNX3KP73Q0ler72PRS0ni+NH8hAI3xufYHMVPlsxUvL
 4/QNggD2jAtAddbPtMXu6xYzUbazWda5LZddiVrFTxZlJBRPMYueP2CICZTDUcSmVL9ctVvIltGS
 x4VkO2giZdusJX+j7oAY5zhyCqxCd799MHUvrJu1Jl8HgMGuwBoCoXDobZTdeS7fqyBNcIo2ejvp
 1Qhes25AiOWn1VlbAFSO774IDGdODmeeC7CXNlqKPPqS+TMOsBArKvG0C3D+35g61+E6WUt+kkT5
 1csAcgNsx/O2iAIrrF9XCsm3rDcOSlCKPGWCT+9ZGzsp/6+dl7TtYwcumgyEO1frRI=
UI-OutboundReport: notjunk:1;M01:P0:ncTckxJkCSE=;eQmxolSWvMg9GWECUxcyVvgHRbY
 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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_091045_430323_4C404D9D 
X-CRM114-Status: GOOD (  19.15  )
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

Hi Mason,

thank you for working on this.

I have not yet tested the series, but did not have the issue (which should=
 be solved by it) reported [1].

So just my thoughts when looking through changes

> Gesendet: Montag, 26. Mai 2025 um 12:26
> Von: "Mason Chang" <mason-cw.chang@mediatek.com>
> Betreff: [PATCH 2/3] thermal/drivers/mediatek/lvts_thermal: add lvts com=
mands and their sizes to driver data
>
> Add LVTS commands and their sizes to driver data in preparation for
> adding different commands.
>=20
> Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 65 ++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/m=
ediatek/lvts_thermal.c
> index 7e4f56831..5b7bf29a7 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -96,17 +96,6 @@
> =20
>  #define LVTS_MINIMUM_THRESHOLD		20000
> =20
> -static const u32 default_conn_cmds[] =3D { 0xC103FFFF, 0xC502FF55 };
> -/*
> - * Write device mask: 0xC1030000
> - */
> -static const u32 default_init_cmds[] =3D {
> -	0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098D, 0xC10308F1,
> -	0xC10307A6, 0xC10306B8, 0xC1030500, 0xC1030420, 0xC1030300,
> -	0xC1030030, 0xC10300F6, 0xC1030050, 0xC1030060, 0xC10300AC,
> -	0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E1
> -};

could you please move this block in part 1 to the position used here in v2=
 to avoid deletion/adding again here?

Maybe magic numbers can be described a bit?

>  static int golden_temp =3D LVTS_GOLDEN_TEMP_DEFAULT;
>  static int golden_temp_offset;
> =20
...
> @@ -1446,6 +1442,17 @@ static int lvts_resume(struct device *dev)
>  	return 0;
>  }
> =20
> +static const u32 default_conn_cmds[] =3D { 0xC103FFFF, 0xC502FF55 };
> +/*
> + * Write device mask: 0xC1030000
> + */
> +static const u32 default_init_cmds[] =3D {
> +	0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098D, 0xC10308F1,
> +	0xC10307A6, 0xC10306B8, 0xC1030500, 0xC1030420, 0xC1030300,
> +	0xC1030030, 0xC10300F6, 0xC1030050, 0xC1030060, 0xC10300AC,
> +	0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E1
> +};
> +
>  /*
>   * The MT8186 calibration data is stored as packed 3-byte little-endian
>   * values using a weird layout that makes sense only when viewed as a 3=
2-bit
> @@ -1740,7 +1747,11 @@ static const struct lvts_ctrl_data mt8195_lvts_ap=
_data_ctrl[] =3D {

regards Frank

[1] https://github.com/openwrt/openwrt/pull/18750#issuecomment-2877554514

