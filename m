Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AE2C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xdzi6B8uhEDOjcvSLgClkb9Tis7D4GnuKNk7eRpcdEE=; b=WRTLv0qNFY7/rjvVKW6zgjU/1L
	Rzd7kndd9+gSQwP/s1qqjlyPBzcqCGP2OI0JEFtxSICbg9htLqqhD8XvoJVnG8nuSXiqqg86IKMB2
	7eOWyrdT4z1U8oyqWrzNC3heWNjWB8gW0+cQmJHdy2ej9n4qXRd10Sv4mirTzT9l25YdwKJaMN8XM
	pHuWJTggly5tFRE8HpVTnZNrhVkImXW9bBaUzuypMbIgjueEtdkAFt3bki3PPmbPCbSTXPksJ2L9l
	uVR7MhYk3yKGwRSIgwnw6Fv1j7LBJi3Qivg9ygBm4Ex3cVzTyh3vG4f3pNuX6yK0o04oXfYQyelr5
	389zpSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPIr-00000007Fqz-0XUB;
	Mon, 11 Aug 2025 09:58:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPGB-00000007F9Z-2QkY;
	Mon, 11 Aug 2025 09:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Xdzi6B8uhEDOjcvSLgClkb9Tis7D4GnuKNk7eRpcdEE=; b=S+j3TNnDepfKpc5RHT5HClyO0C
	cCSH2YmsWGanIkopeLLLkp0ShOHzxQx8IfLHUcz/EOgnHVAaC96bSTouLa2SsLbtl8N3wzBXFZUkU
	Wd/QHZKQkbgt8yx5xFEJ73aGqbrfo/PoOUjfsXABqV66uq8DjtjO6T3jUGNxQS0s2vW8wF4EuWS9T
	8yoVS9Xc48BN8Q0U745K8yzX4fIA397RvihK2z8VxHCTEG/GWqXpVwZ//jl4m91etWMPNqmirxjxk
	8U1gAGMRG5NF5wxNiJMUbXtz7ndq3QQ/vnz/Zo4ZUV8hj7OR5JUAUyZ/Xu31neZtS2Q+palkdFA4h
	9wSiwbWw==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulPG5-0008OT-Hr; Mon, 11 Aug 2025 11:56:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 11 Aug 2025 11:56:00 +0200
Message-ID: <11040209.aFP6jjVeTY@diego>
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_025607_638798_0ED76580 
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

Hi Detlev,

Am Freitag, 8. August 2025, 22:03:22 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Detlev Casanova:
> These variants are found respectively in the RK3588 and RK3576 SoCs.
> This patch only adds support for H264 and H265 in both variants.
>=20
> As there is a considerable part of the code that can be shared with the
> already supported rkvdec decoder driver, the support for these variants
> is added here rather than writing a new driver.
>=20
> This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
> controls for HEVC [1].
> Therefore, a patched version of userpace tools is needed for HEVC
> support (added for GStreamer[2] and in an early stage for FFmpeg[3]).
>=20
> This patch set also depends on the preparation patch set sent earlier [4]
> as well as the iommu restore fix [5] (already merged in linux-media) and
> Nicolas Frattaroli's bitmap patch [6] to support setting registers that
> uses upper 16 bits as masks.
>=20
> [1]: https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@c=
ollabora.com/
> [2]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/=
9355
> [3]: https://gitlab.collabora.com/detlev/ffmpeg
> [4]: https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@c=
ollabora.com/
> [5]: https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6ef=
a6e9b@collabora.com/
> [6]: https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1=
f@collabora.com/
>=20
> Changes since v1:
>  - Add parsing of the short and long term ref frame sets from the new v4l2
>    controls
>  - Add RPS cache to avoid parsing the same data again
>  - Fix HEVC pixel formats selection
>  - Fix multiple indentation errors

when applying the series, git was a bit unhappy about some whitespaces:


> Detlev Casanova (12):
>   media: rkvdec: Switch to using structs instead of writel
>   media: rkvdec: Move cabac table to its own source file

Applying: media: rkvdec: Move cabac table to its own source file
=2Egit/rebase-apply/patch:535: new blank line at EOF.
+
Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.


>   media: rkvdec: Use structs to represent the HW RPS
>   media: rkvdec: Move h264 functions to common file

Applying: media: rkvdec: Move h264 functions to common file
=2Egit/rebase-apply/patch:278: new blank line at EOF.
+
Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.


>   media: rkvdec: Add per variant configuration
>   media: rkvdec: Add RCB and SRAM support

Applying: media: rkvdec: Add RCB and SRAM support
=2Egit/rebase-apply/patch:200: new blank line at EOF.
+
Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.


>   media: rkvdec: Support per-variant interrupt handler
>   media: rkvdec: Enable all clocks without naming them
>   media: rkvdec: Add H264 support for the VDPU381 variant
>   media: rkvdec: Add H264 support for the VDPU383 variant
>   media: rkvdec: Add HEVC support for the VDPU381 variant

Applying: media: rkvdec: Add HEVC support for the VDPU381 variant
=2Egit/rebase-apply/patch:3483: new blank line at EOF.
+
=2Egit/rebase-apply/patch:4035: new blank line at EOF.
+
Warnung: 2 Zeilen f=C3=BCgen Whitespace-Fehler hinzu.


Heiko



