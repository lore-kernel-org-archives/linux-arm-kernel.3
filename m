Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1727FCA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 04:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNrVsnb4FmKFTXfrSdVYo8TWlLsGj3AF2yF7SV7KZcs=; b=c1fs8JfPB8khoOWjImWQnMrRNp
	cYEJduGwLtZAZAzWvSzRwWaYQvSqGm1U+qaHZ70h8Z0j0p8VWfNJOs3viFFq27X5EHPFy9ZmsaHnH
	GlKQ5uOKPYf1HibRg4Ee3JbL4pGvsk3ZrqAT3XUZVJIt5V33fSHbN2+UFJyd0ou9qSD0+BMmuo7VS
	yEsgLQqEvwT7NouPSt0HdPMlywv/jeETJ3KXjaahxHNVNqlNL53z2OPisoRcYt0PYsFh48XZSqQMu
	jKz0Gu/+lLNY82sVgfvMEdIuYGrzdQP7DnpvheFfUyG2JjhVCnNYrz8xUvfQeUsgln8bZiejhxDbc
	FlVV4JmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFOtR-00000007WKK-44FN;
	Sat, 10 Oct 2026 04:41:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFOtP-00000007WJO-17wd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 04:41:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2dd76b1361dso1848845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791607266; x=1792212066; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNrVsnb4FmKFTXfrSdVYo8TWlLsGj3AF2yF7SV7KZcs=;
        b=dWfaccRXCwAX3Y3HtDxZGN017YbRwuZLV1wAuFoicmR64CnuuPiYarePiL3Xd28ZDQ
         3/ve/zawbuYov+t9aMhA/vUz1vv8+RliYXuA9ZOQSSZSuLVEva1z99jDHdFVQn/VGNkf
         cRD2qEo/jAbIxztfX5n7QxkcTjCMikH0M70ToEvC049xJWSrq5tIbUDfXMCAQt8IIagV
         JKsdM0O91shx+1e/BPti3kV0pZc5rFy2lz3PVmL3aK3YFXfUKlbKT+AoFAIfS+g5tYAk
         0AnYcifE3VMXoN3pN9Jvr/q8pFcNGRbCsE+nnllWrPI0j6QLT2KWe5rG9dcHcsGRmQNk
         u3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791607266; x=1792212066;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNrVsnb4FmKFTXfrSdVYo8TWlLsGj3AF2yF7SV7KZcs=;
        b=kf4kdwJtAF1Uf6FI1SY2QQlOYfaab5FEJbxqWJJHXR/uxdpciBwjFhX484TMkyknEa
         HT/P95kopYWYMZ8CJFEdPZk0if+nppEcMPH6Y142cSfav1Mgxe5s2w1ZuKpvKprKbCfQ
         EK3yHtisgRNC4JI5EpWx1prEdV3UPsCpP8MNSRSd/fcpifXCAISg+XW61WDX0RtjpUPa
         LH0SMgrJU2+UPD1dK/c9RnHX9PiVaZ0YXvQs1zy93wY1EdvKGm5UTOgmHQNpjK/PiWWD
         6xQ9bptuIYUb4Y9xv+LJ7vKZ9qj8ywHjDpk9U3RSqHGahqsZW3G+qd6n1ZkdLrGGGB7R
         JKsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcSHlqRuJlGjOmTM59FcU09c0BlzgOA5HeHGXkyee3hc/OxPFTnDzBo1mamEDK4vq+XULiweniC/7/IWrNg3Gv@lists.infradead.org
X-Gm-Message-State: AFq9FYKeHmL93BdZvn7dPr8bR57W6LrPIZFfgiWYePF6qyzOLX8EdzuT
	L2fm5Zw231igxZhIZnSPo8qsG9Y0j1ZhOvq+QPgEVejVuC5P+YgmSiV1
X-Gm-Gg: AYBFou1fqgIt47mufuMPYB4w5TFiiizvKH0phP1+pwDpG/EuvaEvZBO0DXPt98AJ/Z3
	w/7P6Foz6Gx8t+rsPIcv31LJE3c4ITwyQJhHPZczIgLG2v1ufxy0D5zAUFOg8mE4Fd/zOxetqNq
	PelwZdduuTJpVdMPxeHb+LTpCaDLRlDaSP7uImTdlnR2bPSIhsUcHzi8Pn3PGmgZuDVo9FgM/+e
	QE3Lgg0A+w4gTjzfgMLCns59NsAoZW1Dcp3SJaxei1txLrfg1HaTlMEK/77KCafLdJM88YJiEKY
	MyBQRii6Ok7wBJiBqF9MrxoLRspo9Wg+Kg8AAM9TrSpK1aw5Ff5mu0TDUdiKvZLzdGQsGS/TJ1k
	21fvrb9SliQOLz5/tRigBSb+HgiLraKb/C9EHTslwghLPSHTY8CKzvqx2DY8p7TnIQ3lxrxU6rr
	30fA7r259isxoavQtzBpbn4IFFNPMWXF9FdksGv1dPw0rG4FZrYMoD6bCzmhfMHGxf0a+fe1L3+
	WX5uIknRj+fEcwJtw67Lj4XVdmnjBRjEbR38taY2oUixeHvgr8rVQMhVQrZabM5xAZGUOOaQP5E
	weFTrgQXsa6wpDmeu+YdCCAmYHx8TAWGgzvHrLd/MvwaimeQ2l8=
X-Received: by 2002:a17:903:1a0e:b0:2dd:8639:9931 with SMTP id d9443c01a7336-2e842ab8200mr30793065ad.19.1791607266248;
        Fri, 09 Oct 2026 21:41:06 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e171bsm19910975ad.73.2026.10.09.21.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:41:05 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
Date: Sat, 10 Oct 2026 14:40:54 +1000
Message-ID: <l_pd6lBHQaWNYoohhfxhFw@gmail.com>
In-Reply-To: <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
 <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_214107_363390_EB90F7ED 
X-CRM114-Status: GOOD (  17.64  )
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

Hi,

On Friday, 9 October 2026 9:52:09=E2=80=AFpm Australian Eastern Standard Ti=
me Cezary=20
Rojewski wrote:
> macaudio_dpcm_hw_params()
> macaudio_be_hw_free()
> 	both can access the card from the substream/dai without
> 	relying on the ma-context
>=20
> macaudio_parse_of()
> macaudio_parse_of_be_dai_link()
> 	called in context which creates the very card

I have fixed all of these by copying what rockchip/rockchip_max98090.c
does to initialise the card, however

> macaudio_vlimit_enable_timeout()
> macaudio_vlimit_disable_timeout()
> macaudio_vlimit_update()
> 	called in context of delayed part of the trigger() callback.
> 	I'd need more information on the trigger() implementation of
> 	yours to present a solution. See the comments below.

are slightly more difficult to deal with. These are called from workqueues
which only have reference to the driver data struct. Other than keeping a
pointer to the card around, I'm not sure how else to deal with this other
than keeping a pointer to card around in the driver data struct.

> Please correct me if I'm wrong but it seems the scheduled work does
> speaker-volume operations only. Moreover, it seems that
> ->lock_update_work may schedule a follow up work in form of
> ->lock_timeout_work. Are you sure trigger() is the right place to do
> volume-control in delayed manner?

The intention here is to activate the timeout when the stream starts
so that if speakersafetyd dies at any point during playback, the speaker
volume(s) are limited to prevent damage. We only want this running when
speaker playback starts and we need to disable it when that playback stops,
so trigger() seems like the natural place for this.

James




