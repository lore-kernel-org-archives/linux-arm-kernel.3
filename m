Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00FBD6ACCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPtKGPOl9qJbpijDRMSMKYMw3q953l9+5izmnlargr0=; b=Eleyk9X/3pgj5L2H382OPWvERC
	xL67KhTQCXn14CMy34Xsgys6QA7wYNO0Mw2dVEk2DedUyCd5uYn0k79m/V3tA9Mcl/8DSm40/esQX
	j02+jkfFeOcJZ8Utyuptz5vIjRkF7RMi5OzHwfnZ+8xHeQteNLHCwYaaUs0FghJ7bHkmugrwnVhhl
	V6No6AMkWTvE0VX+2rUJHaCKuHb2DkMsCAnotZfDGOIcU6nQNuTGziLsTT6jWfsaVSS5AC9SL/c+F
	gRZg/wmXL7JcGCyG7qo4LPLRfbKu8w0+BWv5AMFQEbROI3EeQVk3y002UA/rOdBH86+MGc5R6uhG9
	C4bEAZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGI2M-0000000DEJp-0Wn8;
	Wed, 27 Nov 2024 13:24:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGI1M-0000000DE7s-1DNO;
	Wed, 27 Nov 2024 13:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732713832;
	bh=4PWf5BX25DlYJv4Gy2uPbPq/angyB6Ks1Q7dI2dA/K4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z1by+KWf8JcCPAhP3H2Sq4S/s4XGhgKFM0FoTy6rCKufkDu4xFkp4gNH7iY2tRqnl
	 rGxKpvsDErMi83fPQYj0YZJ2KYrlryVyozyr6C5I2/N+nN0VOYTk5D+Mss9QRV7AZc
	 t3eHO/34tehyxJcYmdhROz5QsBsXpUXHQQ+x4VC3EQjU2nx1ExHvciaDvy5R6wH66M
	 r9bgwrij87X+C2cwFQ93LYegsDfI45LxR9F5C56QBLkolvgbjhYEAaIqd+efb8yxVn
	 QPodYBcMVZgwmkRJOEW5QNwNptoA7UR5UqReLQWOmUV5v1P2ytL7rbrsPRQ9x81VBd
	 X8OZ453k2sR6w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0551517E36FE;
	Wed, 27 Nov 2024 14:23:51 +0100 (CET)
Message-ID: <4549f33c-90d2-4b28-ab7a-1576c587c8cf@collabora.com>
Date: Wed, 27 Nov 2024 14:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: Aw: [PATCH v3 1/2] arm64: dts: mt7986: add dtbs with
 applied overlays for bpi-r3
To: frank-w@public-files.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, daniel@makrotopia.org, linux@fw-web.de,
 leith@bade.nz
References: <20240608080530.9436-1-linux@fw-web.de>
 <20240608080530.9436-2-linux@fw-web.de>
 <trinity-82c94d49-2a78-4470-83cd-3c6747e01849-1719434738199@3c-app-gmx-bs52>
 <726f2ed3-675f-45e8-94f0-d392181e7f92@collabora.com>
 <951E802C-1B53-45C4-B3E6-4A3400F47214@public-files.de>
 <CAPDEroWUeR3iUFnjVr6WFLg3=dkML+5cbRPph9bj64F=zc1UWA@mail.gmail.com>
 <trinity-ef654aa8-f10a-4195-82c8-65b3ea654c7b-1730918975868@trinity-msg-rest-gmx-gmx-live-c75c5fb4b-p29nc>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-ef654aa8-f10a-4195-82c8-65b3ea654c7b-1730918975868@trinity-msg-rest-gmx-gmx-live-c75c5fb4b-p29nc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_052357_297480_7EF669C7 
X-CRM114-Status: GOOD (  11.82  )
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

Il 06/11/24 19:49, frank-w@public-files.de ha scritto:
> Hi
> 
> any new state on this??
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240608080530.9436-2-linux@fw-web.de/
> 
> regards Frank

I had a look at this one - and this is the situation:

  1. Your bootloader supports loading DTBO, so you can indeed use DTBOs
  2. Validation of the DTSO can still be done during kernel build without adding
     all of those possible X+Y+Z pre-joined DTBs
  3. What if your hardware had more than 20 possible configurations?
     Would you write 20 different Makefile entries? "sd+nand+nor",
     "sd+nand-withoutnor", "emmc+nand+nor", "emmc+nand-withoutnor",
     "emmc+sd+nor", "emmc+sd-withoutnor", "ufs+emmc", "ufs+emmc+sd",
     "ufs+sd+nor", "ufs+emmc-withoutnor", "ufs+sd-withoutnor", ......

Looks messy and unfeasible.

However, this is not a *global* no: I'm happy that your bootloader does support
loading DTBOs and, as far as I remember, even uses straps to vary the DTB(o) to
actually load - which is something proper and great... so it's a *no* for you,
but more than just a no, this is "why are you treating your proper bootflow
like it was a broken one?!?!" :-)

If anyone finds themselves in a situation in which there's no way to update a
bootloader (and that unfortunately happens more often than anyone would like
to see...) and in which the only way to apply DTBOs is to pre-overlay them
during the kernel build, then that's fine and I would (if nice and clean)
accept that.

But again, you're not in this kind of situation - and you're lucky that you're
dealing with a fully open device with a proper bootloader and bootflow: don't
ruin it like that!
Instead, if necessary, update the userspace tools that you're using to deal with
multiple DTBOs during system upgrades: that's the right thing to do at this point.

Cheers,
Angelo

