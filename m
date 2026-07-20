Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DD4C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxE83okyCU1Z19kWUkQur9dh/HYvgoAFGD83U44qp88=; b=ZaZGfXqr9jyFiIfFKo8F7KRkIe
	IzNtn8HGaLYOVrM/JM5LbUNI2JRIzOhUCAaPDlooZ20hStbMI1x1ezdOvfGVdf/vM38hCwPOj6AVh
	MAeFKmuKrn7O4mOammuzSptNDyGt1ha1fJY9XWTCQzT0UiLorUpT6kz474gef0WpIsf+4K0l79f1D
	DidDjr7YpFgKA53FQZ6DGWItoqKW6k85SEqmpt+JUyur4mDQdZpOaCp3mOD/VV8mWhZHoIJ8PvgbL
	B7VKoGQs/7m8XlbPTffpDiDL/KWTSh1385EAEi4EH4G7zqwAgQnLWNaLSvBe+rpKdn7FM3sN1JcVH
	sRqzMkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlv2u-00000007u6p-32mG;
	Mon, 20 Jul 2026 20:57:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlv2r-00000007u6O-25F4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:57:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 089FA143D;
	Mon, 20 Jul 2026 13:56:55 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47E543F86F;
	Mon, 20 Jul 2026 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784581019; bh=0sf+fyuHYnaMAtA19DNDELQhufykY0EdpHdcCz+mY5E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Txr+OlWCU4eRFFdWhfpWDvyOIGXTE6VaH2oovMfE3rYvaXCxdRyi7vq8YUyWnOKke
	 8pm9yanXgHi2g5r9fcnnBoOGust6vI1m9TPxPCzZa6aND9D51JAsd3CHZgIcL3St2i
	 ln5zfxbkd/RvZ7Dtd9JNF+IRAP5fcdoK16AMcrDI=
Date: Mon, 20 Jul 2026 22:53:10 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR
 receiver
Message-ID: <20260720225310.039aca2e@ryzen.lan>
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_135701_640648_51489AF5 
X-CRM114-Status: GOOD (  23.92  )
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

On Thu,  2 Jul 2026 17:47:46 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hey Justin,

> This series adds support for the CIR receiver found in the Allwinner
> A523/T527/H728 family (sun55i). The only board in this family that I

will you be able to send a v2 with the fixes we discussed in this
thread? No driver changes, just the binding for the new specific
compatible string, and the DT changes.
I tested this on the X96QPro+, and also managed to enable IR operation
on the Avaota board, where it uses the other IP instance (and another
pin).

Please let us know if you can send a new version this week still, to
possibly allow a v7.3 merge. Happy to review that quickly then.
If not, please drop me a note, I can then take care of that.

Cheers,
Andre

> am in possession of that has the IR receiver is the x96qpro+, so it is
> just enabled for that board. The Avaota A1 may have it, but I don't have
> hardware to test, so it's just enabled on the x96qpro+ for now, but
> left in the a523 DTSI for future use.
> 
> The sun55i family carries a newer revision of the sunxi CIR IP that is
> not backwards-compatible with the prior hardware. So a new pulse
> capture mode field in the control register resets to 0 by default,
> which captures nothing, and the sample clock divider became selectable
> instead of the fixed module clock / 64.
> 
> Solve this by adding the two new registers, enabling the setting of the
> pulse capture mode register and the selection of the clock speed.
> 
> The new compatible is therefore added standalone, without the
> usual sun6i-a31-ir fallback (it won't work).
> 
> Tested on an X96Q Pro+ (H728) TV box with the Google TV remote that
> came in the box (using NEC keymap). Was able to press buttons and
> get readings from lirc / ir-keytable.
> 
> The series is based on tag v7.2-rc1 on mainline.
> 
> Justin Suess (4):
>   media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
>   media: rc: sunxi-cir: add support for the A523
>   arm64: dts: allwinner: a523: add IR receiver node
>   arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
> 
>  .../media/allwinner,sun4i-a10-ir.yaml         |  1 +
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++
>  .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  4 +
>  drivers/media/rc/sunxi-cir.c                  | 76 +++++++++++++++----
>  4 files changed, 87 insertions(+), 13 deletions(-)
> 


