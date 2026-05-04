Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E3BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gq053oVtS3TSD7VktC6VEOO7yzt0A6zW/Lb6qaxVL7A=; b=Q5eO6VnN2zXu6v6JJWYdCy2FA4
	LgWHrvC22AAgr7u5jOpE2UTZ6iUK2PDGOREgv7JykSqHo8ZSoCdcAHgZhl1Q5D+6gxduT+1/uKOqX
	82ACoJVL8vdtbE+frjgRSPPf7tCGAFm4sguUPewrO3QnH+T3Pj+j3nlSO1Nx7RiOebcVpaMwSBTp3
	YEYmfyLV8vguZa/rbVF2gKD6KbZMpR3Yp7ct15gTCy9Vz+YYj7GublJ387GLh1TrbVdPreSYULNxT
	yG+YBNflO1mFHJR3j76zMJ4VO4iLWEGI4C/RZa2Yg/XW4iQdF4Ah0vsiJkCme2XkVsrZLcMKPVXIz
	FjSWyXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJy35-0000000E0NK-15wu;
	Mon, 04 May 2026 18:29:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJy32-0000000E0Lb-2LxK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 18:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1A68439D7
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 18:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1928C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919379;
	bh=Gq053oVtS3TSD7VktC6VEOO7yzt0A6zW/Lb6qaxVL7A=;
	h=From:Date:Subject:To:Cc:From;
	b=ZudSxXKS3ircpSE1ecMi5elvVnpO+4fhxoiL7TKkKcF6bxP9ZIaobtlyvleAUCZhj
	 G4VPGHdRM9E7tn65F21TFduYaDTR0sWi/IDSZQC4Ags5/Vbl3TGVe6b0SjtOt3EaCk
	 z6rb+Dik7YQTDqVwB7e30mtzRP+AVNpWp8tt6cYidicy4IVP8SvTT1dyw7+2aLbFq3
	 iCFGTaF4GrPZ9PpXh7hHDOVa3LtEGeeeJj5zxbaqyG7h1zjLCJmU2c3KfGGqptXYJr
	 zwosDSBJLrab44dQ2j1NIRvz2KZuoJwXQpWknasEfmz8orkG4TsH/Fz87+tzNn454N
	 2zYnvwB6/ugtw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dcdf60427so3948086e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 11:29:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx8kN9YAOQZE1lpYfBbEuy9AGlWKMWV1LLbX55zLUQgnN21f7jE
	KYfefDH5iquXORHLNbfjUlCWTiMovtXkcdvo90ZAe5bS1T20I0/stpIN2Gyl6/t9y1Q/4KrEc+z
	s66hPZ5rt2qZGrvjYfqp9NV96ZwmZIj8=
X-Received: by 2002:a05:6512:1251:b0:5a8:5ca8:7f72 with SMTP id
 2adb3069b0e04-5a862ebb68emr3363288e87.4.1777919378367; Mon, 04 May 2026
 11:29:38 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 4 May 2026 20:29:27 +0200
X-Gmail-Original-Message-ID: <CAD++jL=GZ3x_pWZ6xYUHH_OFuA0Dyzw2E5ACvo=XDWs66BCeGA@mail.gmail.com>
X-Gm-Features: AVHnY4IuAq5c4lNKdZLiGmzZmHmfV4Bry4dlrtHayxO3--O9zWJ9-sV2BDvEaow
Message-ID: <CAD++jL=GZ3x_pWZ6xYUHH_OFuA0Dyzw2E5ACvo=XDWs66BCeGA@mail.gmail.com>
Subject: Extension of Airoha MAINTAINERS
To: "moderated list:PIN CONTROLLER - MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, abelloni@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112940_618020_770C4AE1 
X-CRM114-Status: GOOD (  10.32  )
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

Hi Airoha people,

I have asked Christian Marangi (ansuel) to send a patch adding
himself and Lorenzo Biaconi as co-maintainers of the ARM Airoha
sub-architecture. I'm doing this as SoC co-maintainer.

Please take the platform out of "S: Odd fixes" at the same time.
There are clearly people interested in maintaining it.

Maybe a good way of working is for Christian/ansuel to accumulate
patches and then send per pull request to the Mediatek maintainers
since the platforms are so related?

It would be advisible for Christian to include his own Airoha tree
into linux-next so they all get tested before getting pulled to the
Mediatek tree.

This is being asked because Airoha patches were reportedly missed
from the 7.1 merge window and while such things happen, I think this
will oil up the process going forward.

Yours,
Linus Walleij

