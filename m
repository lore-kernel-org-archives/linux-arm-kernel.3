Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2067CCC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 03:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QrX25FLPsZ0J+eOmZ2r9RlpsAZQRmlu604aZKAw670=; b=j6EsfszTYskfpZnrlzgSR9fvC7
	makFQh9xjM3HDEA8+Reve+WqwAAXUCT3y4/lAUw4mrqotnir0NevfpJqxknp55c/fUBwPOAuevaQi
	dORU16pVlA2Tykt80qGyYU7NAgPTmAivykjwL47FmZNPd0tw5wGmxdFqzn7K5EDKKO8D/Z79+43p8
	MvfkwSx3N2vx/SEyQ9cJymTGNAGFkcLNq0FTAPJQBPVovu53PYyhvTO57/lGmChFRvj/uM8awCbwF
	y/sCMMWOMC68Tbdqr2wGZsT2z+VuejRzm4LCwuB9PlFFE/IL6HCm+g99x4zU992fRp9WOhm6WtqCx
	7Vsy3Qng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBxb-0000000Gik4-0sD2;
	Thu, 15 Oct 2026 03:16:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBxZ-0000000Giju-2Tjy;
	Thu, 15 Oct 2026 03:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69FA660232;
	Thu, 15 Oct 2026 03:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112861F000C4;
	Thu, 15 Oct 2026 03:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034208;
	bh=5QrX25FLPsZ0J+eOmZ2r9RlpsAZQRmlu604aZKAw670=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Jbh4nPhdOUO7p2eW1b22vfeavoZ+cMZF/FYk5L6947Ugw6A78m0Bx7bE4o7TcqZdv
	 V00Qj2MHzlWcb6yr1zCYklA34onvgF/DJwT/XQineA6pKLWwuPm8DF+W3kan+o9xs1
	 YgYdFXbUqzcLhD6vEfJbV+6yANrt2AvMCsQTZAuuUWnKuvmQmmUWEBpoODJmpHPBb9
	 DA1eQobPGzuTUQcZyR9Kbi60ibIYQJE6kTK/MVKI+7N41RfVMMYe+JByh8KvJoxwWs
	 rPkfa7San6kWJ8Qg4ZnqdALjPfaZyKuZjZEORfjQDgjegtsJpEVLF3tDXCJ2OACttY
	 EM3Eg+C7/Qfnw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
References: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] spmi: mtk-pmif: Add workaround for FSM lockup/error in read operation
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, justin.yeh@mediatek.com, gregkh@linuxfoundation.org, nfraprado@collabora.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 14 Oct 2026 20:02:54 -0700
Message-ID: <179203337468.5720.6502878688124731304@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting AngeloGioacchino Del Regno (2026-07-01 05:19:08)
> The SPMI PMIF in some SoCs like MT8196 is affected by a hardware
> issue that makes the first read operation on each SID to fail as
> the FSM locks up after sending the read command, and this happens
> at least in the following conditions:
>  - At boot, after bootloader handoff; and
>  - At every suspend->resume cycle.
>=20
> This critical bug may produce unwanted issues in regulator drivers
> which may fail to set voltages, making the platform to end up in a
> undervoltage or, a bit more critically, an overvoltage condition,
> producing instability or ... worse.
>=20
> In order to work around this issue, add a retry mechanism into the
> pmif_spmi_read_cmd() callback which will resend the read command
> up to 3 times in the following conditions:
>  - Software Interface returns an error; or
>  - Software Interface never gets in WFVLDCLR state.
>=20
> As to avoid uselessly blocking for too much time, only during the
> read-retry loop, the maximum SWINF polling time for each trial is
> reduced to PMIF_TIMEOUT_US / 2: this was tested on multiple SoCs
> and seems to always be enough, as when any read succeeds it will
> always take less than 40ms.
> In any case, this is still allowing 1.5 times the previous maximum
> polling time, reaching a total maximum (for 3 retries) of 150ms.
>=20
> Worst case testing that I performed saw a third retry only 3 times
> out of ~100 reboots.
>=20
> Fixes: 1f5be2d7f743 ("spmi: mtk-pmif: Add support for MT8196 SPMI Control=
ler")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to spmi-next

