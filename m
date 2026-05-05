Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61348FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3REQP3S0rlRNl9D6gHBMbS634zLr2TpPMtubYOZQt5g=; b=vcSQ6kYrz/mo5u
	LvXPkk160oCJLfmiPeY3rin79x5THzu246YzIkrYvXz252c1XQeWdYji8/4WqL5h3fMAxedAL1QTe
	EECAabsO+PYnRj8bsmWHlFEycbWmrIl2Bj03E9mVRkh9Ib/P1RojMjY+F7+kQuRaOy/nxbHCHQY1p
	/G58jQ39h92qCQR/wzgSHA3vqB/258IVFYz06QHrfM10pokdDlqTHJHHHii+bFqIdQlKsX99ZhnIo
	Y2hZpVH/qPJBSYNuPFjofbQY1b/TWH2hmP/EACwaGSMO6AzEX19WG6icGidEHhkhARB0g162qqXTu
	5IwqFVbovRerQYmhqwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGq1-0000000GWLd-1LUH;
	Tue, 05 May 2026 14:33:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGpz-0000000GWKy-1aiG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B28056024D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68628C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991605;
	bh=VafAjM9GvmSm0WQZv3tSs+xJooJUV4K0MGUPgbehomM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Ay+Y3f8iPlrX5W8PmBYs6ssvQMWApDuxR/tV5klbIc3PT318plQPhrq01UF4ZZ44+
	 T6SlSW5AcYUK5rBrarqApdix2hpXlgdIGNDDtSGsJHRuigIgCYSznjbm0JPS4qbsNP
	 4+kt7B9XWAn1b6rvUTJZdOd1bbEQPrqRX7wNf1fQmlhP9KuYexCI13EglkdHkI6r3z
	 C2Gm4Zl0/raqIjzG7/+FWMJtvN1RD0nhhuLqoHuvJ4DamuIWRDelBgXx7DibnlEg7Q
	 qBEmHtTt+Tsu3c7DN09AaJml6CoDSq0ZWJbhyjfCJNkNIXc0M7Bva2mjlKYv2Q/iBf
	 2jtRpmYCd0T8g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3938d17d6c5so26310921fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:33:25 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy4xpuQQHwKfKwQOu++SKzV7Vl3OrMlLZLfkxEH399OeP5nsH3o
	rOyGrfYBlGC+DIFT0I0tPGqU3yolPRT/Hva7WC+5fOvfEtcCLBzCvrg3MwM8NzVqgOF0SGlJhnY
	ZYP4lh2kBGNr+cWNC8i09qIZQkeIhNRY=
X-Received: by 2002:a2e:ab19:0:b0:38e:2fcc:78fe with SMTP id
 38308e7fff4ca-393783c5ceemr71395341fa.3.1777991603808; Tue, 05 May 2026
 07:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:33:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v66hSwJ4iLw0NVt8nBEJrxLDEkEG6RY5AUPk4xCNaCPSqw@mail.gmail.com>
X-Gm-Features: AVHnY4Ifto1Y_uT3p-KRM-eZu4UBL0La2pOqtqu9YFPG7dOw9V0seprSTLn-VlI
Message-ID: <CAGb2v66hSwJ4iLw0NVt8nBEJrxLDEkEG6RY5AUPk4xCNaCPSqw@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: allwinner: enable overlay support for
 sun8i-h2-plus pi boards
To: Nisarg Rajput <rajputnisarg17@outlook.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, May 3, 2026 at 11:58=E2=80=AFPM Nisarg Rajput
<rajputnisarg17@outlook.com> wrote:
>
> From a0c7eaa6032748bb79953282a984064a922c916f Mon Sep 17 00:00:00 2001
> From: ixnisarg <rajputnisarg17@outlook.com>
> Date: Sun, 3 May 2026 15:42:38 +0000
> Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2=
-plus
>  pi boards
>
> Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree
> overlay support. This follows the same approach used for H3 pi boards
> in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable
> device-tree overlay support for sun8i-h3 pi devices").
>
> The -@ flag populates the __symbols__ node in the DTB which is required
> for applying device-tree overlays from the bootloader or firmware.
>
> Boards affected:
> - sun8i-h2-plus-bananapi-m2-zero
> - sun8i-h2-plus-libretech-all-h3-cc
> - sun8i-h2-plus-orangepi-r1
> - sun8i-h2-plus-orangepi-zero
>
> Signed-off-by: ixnisarg <rajputnisarg17@outlook.com>

On Sun, May 3, 2026 at 11:58=E2=80=AFPM Nisarg Rajput
<rajputnisarg17@outlook.com> wrote:
>
> From a0c7eaa6032748bb79953282a984064a922c916f Mon Sep 17 00:00:00 2001
> From: ixnisarg <rajputnisarg17@outlook.com>
> Date: Sun, 3 May 2026 15:42:38 +0000
> Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2=
-plus
>  pi boards
>
> Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree
> overlay support. This follows the same approach used for H3 pi boards
> in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable
> device-tree overlay support for sun8i-h3 pi devices").
>
> The -@ flag populates the __symbols__ node in the DTB which is required
> for applying device-tree overlays from the bootloader or firmware.
>
> Boards affected:
> - sun8i-h2-plus-bananapi-m2-zero
> - sun8i-h2-plus-libretech-all-h3-cc
> - sun8i-h2-plus-orangepi-r1
> - sun8i-h2-plus-orangepi-zero
>
> Signed-off-by: ixnisarg <rajputnisarg17@outlook.com>

Please use a proper name for the author and Signed-off-by.

