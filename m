Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B3C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gA8mn4fOHoGECCHqYXtlx2zwyQnjDL6NNJx/mEGL37k=; b=aMRMLJsyksg8onbAxrU8Js8Lcc
	SzNRLsFi0aT7trhmZCtPYQjMhzONOgqwoNgQss57AbGqvZYbgCHfXRs+Bti+a+jihbfVJt5zLFV+b
	HnTJIA0pCETKeCnYKejBOCI/Q2w2PTbmqFGIyUenVMKomaeZQAm18DvSVh2aw+nh8LzOvG949zehO
	77itkA9jt7zLYtmf2P0neh20pzYqFFBlgkNGN7q6s3XE3sSOu/qx6X4uA63seiHBPsn38NMY9izrC
	C9XhjE/3AOPt9SRpZExJ7izIRp1m24tYg3vHYXenA8If4crGCFOzh9bxDIFaB9EVilgqBOufvw5uM
	+4mXHOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUJM-00000005sPU-1Mz8;
	Fri, 21 Feb 2025 14:47:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUGU-00000005rzL-31si;
	Fri, 21 Feb 2025 14:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gA8mn4fOHoGECCHqYXtlx2zwyQnjDL6NNJx/mEGL37k=; b=BIsxXJF05y1o+enNn9I9aK2SZw
	WROBymDU4IJFrbCw0/LLvFC70u8XBY9dDuh9x0w0erwBooFo0C0UxoB+1Mugg2bma4VoZXEF4m2q/
	NKsi8wUJEg2JDYbFiMxJXiW6MWuS3d85nUEc51xZYlgOIh5QhcPdFf+YBFfj0g4oIK7SJ5tJufyS/
	CJrNM6sFg0NMVOqYR5ar3f5dQNJEnKv2jRt5BKSU0xaFcirKM1N3leU83k61uwfUjXj6A7Luv0Ti5
	3Ysb27KzAT9dGGkdvtM2+kuK1v+dVkhdYq/aOM5NKh/NfRgZ2+ow+krTYOpd0SWx/aTMx/PaeHqhr
	e+4bQIlw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUGR-00000002eik-16U5;
	Fri, 21 Feb 2025 14:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1740149018; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LlJGyGMRQMGa7d1hiq5ol+5x17hrNEGOITinBxi2RfLVUmuqWFvWwvZraOoEpi4OYi1YoOLNyqvnuoBhJv5NjSBAknykKoIDBYOOujNCSffFzetkfrbLL99wcmnReve0li94vUEnRp/md2vSGDu2zRk6o3mUwB3ZXFwJScQUKxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740149018; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gA8mn4fOHoGECCHqYXtlx2zwyQnjDL6NNJx/mEGL37k=; 
	b=SS5CeWfivsYuXpFsx/0MPvpuxMWFRxte1/ddDomWFSwswVstzSnzPNvljfY4htomab7qaxtT3qI+cXo+9mA4ytBNiy2AqaiXhG+Y0rBgX6bKYRLZeo5xmTxEYemz2Kg0vt+8tTa5BgxPqXvk6GWwPr1ADZQqOXGt1rrKGMkXUmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740149018;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=gA8mn4fOHoGECCHqYXtlx2zwyQnjDL6NNJx/mEGL37k=;
	b=Oqd6dpyxZY9ouCf7T8Ku9XIIh2lKIO7kgmqL3aRYfciczdjFa77sxZ12CaQ/izzJ
	3eUDdaUsKGpAhc87xv6+Ln8RjEH0POVBgunMSnnqLqqH0XNLvDk09FnQIz0S1CHOx2t
	l0fX5qeyonfxOLsyVYaCaZsUIY5ALfsn9B5l3MNg=
Received: by mx.zohomail.com with SMTPS id 1740149014815682.0553532876535;
	Fri, 21 Feb 2025 06:43:34 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, FUKAUMI Naoki <naoki@radxa.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
Date: Fri, 21 Feb 2025 09:43:31 -0500
Message-ID: <4988041.31r3eYUQgx@trenzalore>
In-Reply-To: <5E535D58-AEFF-45A4-A1EA-1FA282F366AE@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
 <5E535D58-AEFF-45A4-A1EA-1FA282F366AE@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_144427_750270_B30E1549 
X-CRM114-Status: UNSURE (   7.71  )
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

On Friday, 21 February 2025 06:42:31 EST Piotr Oniszczuk wrote:
> Small data point: on rock5b switching in dts analog audio: from
> audio-graph-card to simple-audio-card (so dts is:
> https://gist.github.com/warpme/349b27e49bc6f617ef1041047e75adab ) makes
> kernel oops go away with analog audio still working=E2=80=A6
>=20
> so maybe issue is in audio-graph-card code (or its dts fragments)?

I can reproduce with your config (I guess that removing the driver for anal=
og=20
audio hides the issue)

I'm really feel like simple_util_clean_reference(card) in simple_probe()=20
errors path should not be called anymore, since
https://lore.kernel.org/all/87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com/

I'm adding Kuninori Morimoto in the to list of this thread for extra input=
=20
(See thread at https://lore.kernel.org/all/B8EF5196-55FB-44EC-B93C-E327C791=
225B@gmail.com/) as they made that change.
Especially those commits:
      ASoC: audio-graph-card2: use __free(device_node) for device node
      ASoC: audio-graph-card: use __free(device_node) for device node
      ASoC: simple-card: use __free(device_node) for device node

Detlev.



