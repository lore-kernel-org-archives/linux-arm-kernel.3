Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85732CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APtU01S/PWy2NIsB8tnCVtFoTCQ2EfX2HKt0Mi2/2z8=; b=a8Mct5W7MTuPkMxNClanP62A6S
	TniZMH+j46NvnILUDzjYS0a01lGm0HHVfrgsi0emDzIVC1yOEOiTHdCEF6WcYNYCqfbekGuV9+96L
	4KwU9WA3XP5IwGPPkHP9VRFSSt8MLdeaU0z7tcgFw2kLj6pGB0Hz0e1v3m7QyS66RQJ6skC/kUhr8
	cDXHdH80etWb7fNdlAfCmxpqgCJVTqIGLSWz24cNkHpdli33ATJk7uvGmoWu4SkpwG3H0O2kYjVr3
	3Zjn6GuLDlN9wQDgq5bk9qlwqc7NPtvpP43MCgy0847G+Wn++GVfmp8xE/jRTdb7hA6f4GwmZkaWh
	9Y51ghOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F9L-0000000Cn0c-2flQ;
	Mon, 13 Oct 2025 09:47:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F9H-0000000Cmy7-45CJ;
	Mon, 13 Oct 2025 09:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348842;
	bh=yyzWwMTNAcACtaKwTd+Hy6q4Ei9iZX7sevim4Y9MBwQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QMtTVT32or9zRYbwMlw5rv+zn4LgwybdfZUUMR5Mq4w4ULIvbGqHh58Kh1A+1449T
	 4NBk84QL3LzzZMy3aJoKoLNLO2AAlBwKgKZKRrZ0NKrtT0v+V4JRBWmwFALc1HWuPI
	 yrXDSaa2vSUhTlIEGln7vUPtwe0qa+ok6Iidn/bf+Rqb7GlZf7TzKH+fl24mAaD5Ik
	 OOVHwvhQgBV58RBOcmViOitrOYWCcFuuY67vmIcxPWBiEFXimiQQmjRwQG5nc5M/Tf
	 hWWAkOlvEUIMkfmTl8lp0Twl1oxe1uShMgdSdMGshpB/QNDZ6gOfr52etu4ET69aME
	 3G5iTa8sGT5Yg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E40417E1292;
	Mon, 13 Oct 2025 11:47:19 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
Subject: Re: (subset) [PATCH 00/10] ARM: Add support for yarisxl mt6582
 board
Message-Id: <176034883956.23045.13247529000134209670.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:47:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_024724_158904_C3DDD959 
X-CRM114-Status: GOOD (  10.90  )
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

On Sat, 20 Sep 2025 20:23:25 +0200, Cristian Cozzolino wrote:
> This series adds support for Alcatel Pop C7 (OT-7041D) smartphone
> board, named yarisxl, based on MT6582 SoC. It also includes some
> preliminary patches. More in detail:
> - patches 1 and 2 add support for mt6582 to platform code
>   (verified by looking at generic mt6582 downstream source code)
> - patches 3-6 do some maintenance work to mt6582.dtsi
>   (I was unsure if squashing timer node patches into one)
> - patches 7 and 8 add devicetree and dt-bindings support for yarisxl
> 
> [...]

Applied to v6.18-next/arm32, thanks!

[01/10] ARM: mediatek: add board_dt_compat entry for the MT6582 SoC
        commit: a9ad357fb2104cc07a64d7e642f6c35b72b16405
[02/10] ARM: mediatek: add MT6582 smp bring up code
        commit: 7f637d718752f1b821f90170bf841c4d924b382b

Cheers,
Angelo



