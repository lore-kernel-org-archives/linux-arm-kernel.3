Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC0DCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdidUHHaw9wa6g9W7a3mjfR2MSS9GT2Fsx2RaFzHYK8=; b=x31k/jPcwhK4vf8gTL1b4ueFX/
	Kx04VKCRxIwP0pyWMoSUg3gM3bcdFPUO4rl3imesdxl47wnPf2gsjyvRTOuUWzPbkA6N/NDi6EEA3
	biC6wBs+o9pHLFO8aYbv6JE/gD90EqhXbEDGwF/73AISY4shxjDj7tdf+Fr0Z0lFB2YnbhddFVbDe
	4LgJH90S1ziWwL8xrqfE/bFi6XyGcnJWagzYyKQSKK/AuC5uVmBFpRSNwr3fsUydcT4xpc+7EPIBK
	z7uX2ieDTWztJyivs4+7PLO4SXSJRS1BQ5VQby08HjnOzHbEXabUwbb4WQYW1d6fcLKLaC9WWKjYw
	a+YEtCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlGF-00000003VcG-15Ed;
	Fri, 16 Oct 2026 16:58:27 +0000
Received: from mail-10697.protonmail.ch ([79.135.106.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlGC-00000003Var-3s18
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792169900; x=1792429100;
	bh=sdidUHHaw9wa6g9W7a3mjfR2MSS9GT2Fsx2RaFzHYK8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UaxTjVaf7U4SI48KUi4MOxnLqzHm/hraLYRWrE+n6HazQNRkS1M0liTFs4qwSQjNq
	 VmNMp0gjwFnYYhdNXMbtzu5tRm8z0gqIumic2EWyjjo20DmstDiW9DpZ+yXcQjL+8/
	 2XXmNOrsar0M6QTf8pp461fBbsBvYtJnJX1Gmc2rRj2wLuE89QpUCOTFFOEyYqls+f
	 ou3Zao0eCzyzpJ0OcRF51Lk93g1YefbRNsgOUJQm2BIsVu+F6VgZuZP/odmsa1V3mm
	 fP3JAeEBuo8Bgk8QPsyCS+wHMJHupl3PgCX+6K+p9FLu7d8xJan8x8MiRwCSPNO9wJ
	 wFeFcRM3pxTIg==
Date: Fri, 16 Oct 2026 16:58:14 +0000
To: Ryan Brue <ryanbrue.dev@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in mtk_dsi_poweron()
Message-ID: <5YDZiRpFJP0aWb7TVPf0B1RZnD7z_d94cL8JhkMGSFrplp49jELQy6a9qKP4NsVXpqlTzh20O8pRoR0S3XBB0powa7ajhNmLIupt54ldTIY=@protonmail.com>
In-Reply-To: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 67cb0910836930895d2ef1e4849652f6d1d2aa8d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095825_111982_8B69A215 
X-CRM114-Status: GOOD (  12.57  )
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

On Sunday, October 4th, 2026 at 11:49 PM, Ryan Brue <ryanbrue.dev@gmail.com=
> wrote:

> mtk_dsi_reset_engine() does not touch DSI_MODE_CTRL, so whatever the
> bootloader left there survives power-on. On boards where the bootloader
> lights the panel for a boot logo and hands the DSI over still running, th=
e
> leftover value is a video mode, and the first mtk_dsi_host_transfer() the=
n
> takes the "already streaming" path: it stops the stream and waits for
> VM_DONE, which never arrives, because the engine reset has already stoppe=
d
> the stream. The panel's very first command fails and it is never
> initialised:
>=20
>   [drm] Wait DSI IRQ(0x00000008) Timeout
>   *ERROR* failed to switch cmd mode
>   sending dcs data 8f a5 failed: -62
>=20
> Set command mode right after the engine reset, so DSI_MODE_CTRL describes
> the state the reset leaves the engine in. The video mode is programmed by
> mtk_dsi_set_mode() when the stream is actually started, exactly as today.
>=20
> Seen on the Amazon Fire HD 10 (2017), whose LK bootloader draws its logo
> over DSI in video mode and never stops the stream before jumping to the
> kernel.
>=20
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

This is useful for quite lot of mobile SoCs, at least mt6572 and 6768.

Acked-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

