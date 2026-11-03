Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB0606D803
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=alEWvYIK;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=aboSFNBS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=; b=alEWvYIKplEK3Fvoyr6QbWDR1F
	Esw0tRpgKV7wbH62x/1UZLN5cEyoXF7Rm37yP2+OOftdg4s9gK+BppFS/ZZRzXA1otkp22c7dotwc
	4T9VQGvlUTu75FZjN4m56I9gqVocJ8LDCwP71YvwzWn1O+LPFUplG+rELg+AKy1+g+aVnGcaplF2r
	JK36hSkH4/bgHCfggfVG7YpjPNnjQmWWPPsavvarmxFZ0A8BvdovIzyYK0AJ9ndULAl5Y3Q1cTFmZ
	hv8XN1BH03ij5iGAg/YqzI45XixefT5ZKif0ukemA4YGEMH+QkiYjznds0gHjYyYlqLrA3DI4BD8u
	IkH+iZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHhB-00000003DN0-3tWO;
	Tue, 03 Nov 2026 16:49:13 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHh9-00000003DLO-2iUM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:49:12 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-716b58a4365so356960eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793724549; cv=none;
        d=google.com; s=arc-20260327;
        b=ByBgSrJOWhWpPTuPLfnOJ4zINEMdsWGtOiDoJmop2/SzKSFi4r/x2k5oKKilvLir8C
         qUl91qBp6DsiSn7Mpw5TyzkNKWbBzB93mHxE8hTbRdyf8nFnm+vfV8XuslMvt4ULmAU2
         AMfqS77CQqIM74yweRctHbIizaADkTGOKm/TDee2AaaWLgh8VoWsVRVgeU66E7dEAE9w
         XEuJBNXPEp3Ykr6463fuFGPWQYME9+iNwRyjtP9dTxu1vssVitu6Zrfq2b7GqgjgtyGk
         Yf02Fw25L/RwZQzCy/O1d/Fo2gk5vAtJfjolw13jmXjDlPS+YRGC/f//MVmeVMTa82VX
         ZLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        fh=+G1spEzWRICbxh0+ECNrpOpqpcc661H+nRLxI2dIw5k=;
        b=Clol5BNkr9fQ1X1IhusdubD8nsWCFJoM6lqRX+ihB0Fm6k7elCIhb6afKLfMZPekWT
         y9qy9CcIrv/osDsLH+Njstqdv4P1lYPGKRUwVjYTFIrakpZjCzyeG/skrk9EeJOSSpXw
         tsdlntFXvyJ72tm0S3zQGJFigniTRhJ4O7lbNskw+C2Et2AW0jE0WYEgQpxubpwYhGnO
         YOZwqtH7zRVn5hpZLVpSABa3ryCl11ZqZ9Y4Ffo2PKKQ2V0CrPexH4T+rkgDpWLjFQRy
         BtSm99/0kbUuMYKSmx6rogdULukXdtM8yzY4Pn/hxJw4di5CNDMNyoZ6osD+DCDDIh0/
         yXmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793724549; x=1794329349; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        b=aboSFNBS0NutOMIVzri9omSAUGD96wZ0Rtou0YwPNBE5RGA/aubU7WkJsK5CcCRaQe
         4GM6JdaYoM6Q6LvWxY5VU0JhKgW7tx7aJYrhI+nABKJnD/awwxzCoPpeDlIF3U2l5Mie
         4baxAdt5IAagdUDEXWPsPqbm8iQiwW7ixfX6TlPUsDCa5pL1VtLh6Y/gu2UCuVkeObIB
         2Vz7CV4HtdxwhcuZZWgKNGVSBqJXiY0h+Xw1o5K0XhK0OUoFTyaKEZMx3PSDTMQLGLPt
         NXSgXbBm8wl7PpshzfyAQ3SCPNHUnkBuGsdBpJBQJf9TiogLG6p3GTgnbC90iVaBDGzj
         FgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724549; x=1794329349;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        b=wCUTbKkWy4oa77L63ZMlGrTIF4v504YlBbeug0tY9TyuiBnDlY+KwR1DEDNYj3Di0o
         zo7eRPiv4KFxqqk8i9/S1jn4q9qArdx8Vkz5yHBRoGfBeLIhmgGAMB4lcVTLdb9IcVPI
         BhWdOr7y8E7sqK1h/AC92qae19ixEHoxKAfA0gJQSMa+7Kkg1LuwKPBhQBSbvkPWF6fs
         E16shLehoabkN2hIlHwcmBI3odgLV+O676WIrCZyFmx54sCvEdEbcql2EPSOPPdS3tMv
         Fvy2h0sCSbZsEIQrW1FVVtls7ZFoyUcUlj4ZABDUjfZgUtMnHO+oTMn+Gv+DvDm03bnk
         s22Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFyLAARoHrSeByJfSOtg0R4216jWKSMGHHe5WT/Lp+vBAXWe9iLLNpepTmv2GVCcdRfPRppC8GQe3j//BFO+p0@lists.infradead.org
X-Gm-Message-State: APuU4Z+zboDYW41A0xgQF76HrfbHm4pPS2SwnTxN1so+n8Pau1NhH/kJ
	AVOrTy8QzTbQq3MkqT1HwXAdFc5Ukn4bVE98PR6gk+rxWtih6TxfHFe71ypeQAgNPxXVCFSGoR+
	q3o7vzln1oOa72ENnxpAX9BUGnm/em3EDT/MzwpQzAw==
X-Gm-Gg: AYBFou3YXpE4iLePoSxa2/oJgBtQ/MkA1NaSHJERlP8RU61oS/z1XCo7odCWYvnDaYX
	ncaXpYd6CeafOyxc/7U/5uAv4/5To+SPVduIf3ehG6QQY4q1bS/ljXLMseIrA4z/hhEbfyXwFi9
	ZbAuPjJ/Bgj4rYrAI6jmnznUlN8xdTKiNN93ruOu5FaJB+9RQoog652xVYemWPto/qkSu9NNMQE
	rT6jsN5UBRD8c8a66rnYomDJKLoRfK3iUSZ7At7G9V8IUIZ97/82Gfx+5nEpFNDIq9YhUXa8Fr5
	TvIKDSOJ7E9UQWB+QWkYSSSaXSZ9X141FafJffgfEx9ucA/e9SYgzcsyKelWtl9gdmk/MkG3tJm
	biI2q6Q98a/qwGwXtrz7pzz0rCRoyhQU2St+f1GjsP+A5CTv1MpOr536GZGs4fRDIRToEYGXV8C
	8YPnSCsC4woOYOQCyIHN4mMXcGJ+p0bUlA38l57fPsjNU2205f5Ha6
X-Received: by 2002:a05:6820:1794:b0:714:b145:a2fe with SMTP id
 006d021491bc7-714f2421901mr8082390eaf.12.1793724549410; Tue, 03 Nov 2026
 08:49:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com>
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 3 Nov 2026 16:48:52 +0000
X-Gm-Features: AclHuK9TxGbcB0r3JV185lrcPtsBTW6TG2IE6iERGadxyS8js5NnWPr-6g7jlJY
Message-ID: <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_084911_758430_E5BE0EE9 
X-CRM114-Status: GOOD (  19.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter

On Mon, 2 Nov 2026 at 09:07, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
> up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
> that support 40-bit DMA4 channels so add support so this works upstream.
>
> The first patch updates the bindings, them patches 2-5 do some
> refactoring and add the support for the newer SoCs.
>
> Finally patches 6 and 7 add the nodes to the base device tree and
> patches 8 and 9 enable it and configure HDMI audio to use them as
> per the down stream device trees.
>
> The series was assisted considerably by Claude Opus 5.5 based on the
> various downstream Raspberry Pi patches and tested on a number of
> RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
> and dtbs_check pass clean.

cc Phil Elwell as he knows far more about DMA on the Pi than I do.

> Peter Robinson (9):
>   dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
>   dmaengine: bcm2835: Refactor control block handling
>   dmaengine: bcm2835: Support controllers split across several nodes
>   dmaengine: bcm2835: Add BCM2711 40-bit channel support
>   dmaengine: bcm2835: Add BCM2712 support
>   ARM: dts: bcm2711: Add 40-bit DMA controller
>   ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
>   arm64: dts: broadcom: bcm2712: Add DMA controllers
>   arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio
>
>  .../bindings/dma/brcm,bcm2835-dma.yaml        |  31 +-
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   8 +
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi       |  16 +
>  .../boot/dts/broadcom/bcm2712-d-rpi-5-b.dts   |   8 +
>  .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  10 +
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  40 ++
>  drivers/dma/bcm2835-dma.c                     | 496 +++++++++++++++---
>  7 files changed, 534 insertions(+), 75 deletions(-)
>
> --
> 2.56.0
>

