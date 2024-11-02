Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FF6E67802
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RusafcclKl2RfSXhQjv0aPX9JFTNQs1CwGZazPC8Lz4=; b=015HI4xM6s69KdGpVRCWBc889w
	sM+MsJPDjooH2XyrvVigrJ3/c355NXr/MqS/6t2LOdBasvpI2isQC6sc/J3gm+Z96nU+ERcotz8TF
	KnUO+KGhBBRGYLeVC8gvSRx7Nt5fMsykJC68UGzIzYzceTSxir/gFOeuID/6Q4UlpfnpV2Ewkj7ez
	SuD4pBmMo9KKGr47+bBh8sZ0NpKrXVFCw766h9lm16tlZ/+wndukFyi7pxgmYpIMgl1gMbmAxH7w3
	5Bc+CxOyT7WIBLJzIqFE9dukm5wVLDe9aN62jruxrwQZRgNQLKXGhZzyCHWiyiU7DSgWPQaHPjrim
	zie0veww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7GBu-00000009xwQ-3N6Y;
	Sat, 02 Nov 2024 15:37:30 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7GAF-00000009xoZ-136Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 15:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730561723; x=1731166523; i=wahrenst@gmx.net;
	bh=RusafcclKl2RfSXhQjv0aPX9JFTNQs1CwGZazPC8Lz4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=C9sNYvq2xrGUC1XlLvQGMAcPyvEEUzBCByIebj0ukDQP2J2weoKYfCvrwSzNcN0D
	 FJCvjVH53dIIc7N/99mn8ztCfLWi60LdB/xdx86WA8HzNuqhtWiRgPjvozAlTzQc3
	 e0rDNliJV7mHGYg5qgOrl2KH3JwiE4Q039QYREaYe/WUVAOU6ccq72Jv7PuhUdQ00
	 GuJkNszVLxhlw7DkkMX3lp8O5YSM7+7Mmkz79ZP/nMOWYBut1ARt/vOonkNM9RrSo
	 +aQcuK72QI0ViU8Io8tt7jM40zlLxU8N5F9qpEwKarkr7nhNCxpW3nFozWwns6m8H
	 EdHwesLv24E1t9DSew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0NU-1ta2OB2djs-00gJvn; Sat, 02
 Nov 2024 16:35:23 +0100
Message-ID: <065268d6-84eb-4247-b834-40a9ff32c1f4@gmx.net>
Date: Sat, 2 Nov 2024 16:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
To: Stefan Eichenberger <eichest@gmail.com>, Shawn Guo <shawnguo2@yeah.net>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,
 elinor.montmasson@savoirfairelinux.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
References: <20241030122128.115000-1-eichest@gmail.com>
 <ZyXTFhEm9UCBii2c@dragon> <ZyY41nJY9ghwe-Y4@eichest-laptop>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ZyY41nJY9ghwe-Y4@eichest-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6Qb1kpG3hdxqRE5loRuAnM11ljAjYHICynec0g85WT++0Up49vf
 Sm++8OAke6qdyByODguM4Uj/mNR1qv/FlO9C/rwLM4ZkH5EJpefK+oDQwkQDEDwRz9feXUi
 uMlSPswKmvXPU6SjMbLZURoSW1u3v7zZnCCdgBsWEGYX0oIsvKbHz74hJ7Ybjz/XJzmrU8I
 R3K9TbgTxI4vOWg/D8iiQ==
UI-OutboundReport: notjunk:1;M01:P0:Y/8Yk56S+Ro=;Lw3WHEGlPnaA5VXhUppkFZIUAeT
 M6Y8O48Wk8KftJnOWjKuOtnZWUH/3v3+W9NH4bRlEpZnfFwX+LbbrHfVuKjLK/xp8M3aeN1hx
 grtnYC3BOaphN6FRLDkKGgkuywaKMXJEOmZrfld+XnmnA17BGqDlHZcggxV1DDW2SS9lA/OPh
 QSDP5AxAvkMjl6PtBefW8+KJrfAlDuHtE22yaOE3Q5EIRZhAJKIzEZmimhi/UxtUVftcw6hxo
 svTAN90/miodusPK98g13FX91OFJLVUqM+8v1/rlW18OKqEb5sRPBSXipnjdtPtBu1yRR7FeZ
 PFk+l8RVpCsgXwBkXgGN+JGq2GehlnM5WgYxLDz1QsPLtLXHUgwCu+mB2E1Ot9/7PqXuYGGQ1
 8G4a1KWFSehEUto9xafil78hJo/WKur6f60XsYm+2L/0WLi7p/zSeLIKm+QHoRBbRw00RKxpO
 TgeV7Ulx6b3VC72Nh0z7Xrmsa3bzVU89LhFQKIxA/XIG/rM0aGq0ih8OrCxjpQVb+RORs0Nrp
 hcURzc1JfMQ5+0VXjBbFWvgnCeiRmwYVH8Ae/LbexQ/dALlLaIAU4+f5EHu8ELIid+2ZPsFuO
 5Z8CNtXXF2B8OekVgqsxWEXcOrpPmZjLYxcdXSpqXgA+sL+96M67rXqhc4FdrthxeZ6v8My8c
 SU2X9BiY8ysNXa+KoHMwccqnaQROqgCzu2hNZ9PMoWnBD8S6qriSrwjAUITpnvtRPCuriVkoX
 pJbFm6m/92q5qDzJ3mA9W5CqT/beB0h9ycwXp30IjRTVCllJkSzP0LwWvxh7pJdm/PH6+k33K
 jEuFTK+amGVlHTWjKQXz7nXQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_083547_606244_4FF3C3B6 
X-CRM114-Status: GOOD (  16.73  )
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

Hi Stefan,

Am 02.11.24 um 15:36 schrieb Stefan Eichenberger:
> Hi Shawn,
>
> On Sat, Nov 02, 2024 at 03:21:58PM +0800, Shawn Guo wrote:
>> On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
>>> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>>>
>>> Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. Th=
is
>>> change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sou=
nd
>>> card node properties") which moves away from the old "spdif-controller=
"
>>> property to the new "audio-codec" property.
>>>
>>> Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node pro=
perties")
>> It doesn't look a fix to me.
> I agree somehow, it was just that before the referenced commit our test
> succeeds with the imx_v6_v7_defconfig and after that we get the
> following error:
> [   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-ca=
rd: snd_soc_register_card failed
this error should have been in the commit message including the
information which platform/board is affected.

> So maybe it is not a fix in the sense of a bug, but it fixes the error
> message. However, I'm also fine with removing the Fixes tag.
But this patch doesn't look like the real approach.

Could you please clarify the impact of the regression?

Is it just this error message and audio works fine or is audio also broken=
?

Regards
>
> Regards,
> Stefan
>
>
>


