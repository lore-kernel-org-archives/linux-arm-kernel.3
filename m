Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A2BCA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=; b=dBDm8pJmG+EnhIULD4ULumLjjz
	tRTRxmXTaFlLSdve2oeunJZZ+9Ados5I59DMVZPRuUpppJQlrq1/KoSBSuo9uT0rWay8ZVeCxyhYA
	xCyytRaVFKyv7z54IdG2n11BOXj00mLvKI/y/YisV+LwXHDpq96l5gn6oTzxfwIE1ZGieotV6rBJl
	DwW/6S6qUoPFk3TBug7XtYpDq3Dx6vyPnWPCAnMo8e6ksM7Ss0XzGVedfiibHYGTJXeANB9JSDJE2
	vYjx8OkdKIKpmUp8tiao+S+sOKfO8cF9VEvdsgsHbQ3tl6dp2BagHkAliH8qnfxJxxofS95ye936L
	8nNuQBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCodr-0000000Ctbd-2pVZ;
	Sat, 03 Oct 2026 01:34:23 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCodo-0000000CtaS-1Kcx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 01:34:22 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso48914a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790991259; x=1791596059; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=tDtrdL2gPvokzgF8dJrk/L2Q4Bz4si/vDjdjJQLdguhzKh8j1WxThUyqjZCW5ObC5m
         wVDj5DXS8uFLRpqXlJM4hcoybpfxREfroSvBytsPhaiw2JLmNJ2hbq683yj1cs70lNu3
         o6X26ryOieA/tB629jtW3Bz7r+kV2sfs5pL/o23gQCxh8Qd13GgeZN60ZWJXCBhWZCr+
         87Ur12Z+HBxmGwmTiUIqLLyzie1rcIThjJ4RRUERsU33wtaudQCCwgPQE77R4guUiSGk
         npwQbHKxFK5kEJX4FYqYDbnrXKl0NHGKY2Yra0z42+b3KiGNkN3PrUqWHAebKdwGllzc
         fDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790991259; x=1791596059;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=xHn9q1PLWEqTpM0wk2rwGKVDZByhOSDpcCygCISmHUZ+ob7WlZYcsY//W8lDAoQJLM
         i18ZPbozIzrDy5tc0zbkaKFy3iEh5ONOi0/Sa1kNLV+7XdBOoea/5kpEEIbE7Qwr5r1K
         Fl2zxva9V9Xk26OdWru51cl5iFII2tC4YVTh5HS5czFLRYi9Jl3c6FWtJbJFBUp+BLLa
         pP7V4AHhdtNRvHR949SQIFEgkRKlbmkKAzm8PUXR2MsM8uqDfYSTG8pPUbDj4j17rYSl
         vMA/qy8zkOfWFFTJM+giFu3dOac9ksqSfQvQC2lA9BvbCx1cBQX9n1vBGYQFo8bxS4A8
         hc4w==
X-Forwarded-Encrypted: i=1; AKwUvBzFi2O2/gl8F/qRznfUk7BRkKJhxOYQNkW4LLlCUamcjG49qNcTNNZFIACoUeocYjpqFZbcMMzs0bSYalGdyiiA@lists.infradead.org
X-Gm-Message-State: AFq9FYJxO5SAL9l58LjXV5aDhscOZWlHAccSF0Vts1xAY2DBiLNWNhBh
	Qs6OPtumYOoj71ZFgaqCGJYgOEjn38z4pPQr0h/BqzIodOC/nixUc1vP
X-Gm-Gg: AYBFou2xPuiwg7CD5DTpQgnZuplKC/L0+QrIZAWNFmSVDF8ZjGOYHm2Sm8WRPda7D/z
	BKcnrfwps51VNBU+TJKwWJVPaHGTf779/rjg3w5Kv4cqzwuROArpdbHGxBUbB/zIxlk26ROSahQ
	17T/b1j8b/1vhEgUxGozmyuXUZuaEiYoWAKLjoJXPbp0a90rRuX18gPPNSM/wEc+xRDgNn8mv6s
	ZMRUSi5w9iIALwvCyt6y25kBMB5Zf/Zxa+JLCecowecSQ+s4Mo7ynjq5deUIYvbIXSS4xLMrFx3
	UpKBZ9rlpJpOu2CGCM8l45Uq7QW62JSYRYIiz8JbGbmlQQIZTNBdtoDysz6RSTEOqO4VmdVksJN
	uIck6QVs1YgVjvG1H4D48/IQO8ihL5vreda1eQis2OPttYEHSPmVHu5zVI4ugv421BfPEpl3eOT
	kqaHZqDN8yj2vfjCCHKG05XCUwdmxu//Aby+w11iLXh2y7C3kouJMQqxjuly2hJ1L1n4WXu4jkE
	dC+o+C0dz4VKzrHRML60+aANfYkaLw0Zi5L8zT5IeJQwJX9Fr6cNNDcjXdSWtPOH1njMNDTNR+G
	r3SemN47sfRNhRFZtcO9ydy8dpR0fiEfc98wky/s2qk6fzye3Jo=
X-Received: by 2002:a17:90b:3c44:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a6ced75f41mr3500888a91.58.1790991258652;
        Fri, 02 Oct 2026 18:34:18 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm861575a91.7.2026.10.02.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:34:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
Date: Sat, 03 Oct 2026 11:34:07 +1000
Message-ID: <u9VW29vaRPGENsSTq9RHUg@gmail.com>
In-Reply-To: <878q4k2xl0.wl-tiwai@suse.de>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-8-741cc20a74e5@gmail.com> <878q4k2xl0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_183420_380365_121EB211 
X-CRM114-Status: GOOD (  19.95  )
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

On Tuesday, 29 September 2026 7:52:59=E2=80=AFpm Australian Eastern Standar=
d Time=20
Takashi Iwai wrote:
> On Sun, 20 Sep 2026 06:53:47 +0200,
>=20
> James Calligeros wrote:
> > From: Hector Martin <marcan@marcan.st>
> >=20
> > This allows drivers to implement policy around locking/unlocking
> > controls, such as enforcing that a group of controls may only be locked
> > by the same process/file, and taking actions when the controls
> > lock/unlock (such as granting special access on lock and resetting
> > values on unlock).
> >=20
> > This is, in particular, useful to implement volume safety controls, such
> > that only a particular process (that locks controls and completes a
> > handshake) may increase volumes above a given safe limit. It also allows
> > the volume to be automatically lowered if that process dies (which will
> > trigger an implicit unlock).
> >=20
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
>=20
> This doesn't sound like a good approach to me, and this looks rather
> irrelevant with the purpose of the series.

I'm not sure what you mean by it being irrelevant. A significant portion
of the machine driver is dedicated to implementing safety interlocks based
on the functionality added via this patch. It would be impossible to prevent
badly-behaving users{,pace} from defeating the safety guarantees made by
speakersafetyd (and thus permanently damaging the machine) without giving
speakersafetd exclusive ownership over the safety interlock kcontrol.

Is there something specific about this approach that you do not like?

>=20
> thanks,
>=20
> Takashi

James





