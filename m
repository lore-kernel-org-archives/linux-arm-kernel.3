Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400C8CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wlz4c6idBHgoakGdogx07IHOxQ08Zrz28QTnBsOB96g=; b=yLeDg+skynTyBQASDjviTxojDD
	j1TdLV90GrSJyv5m1TyJPg6cQb8K5tu8783hNMBZn30JEPhLp0dyieG5R9NNm1TFDFu5ap23QX6Zk
	WPrSn9dwitxHLJqKD7uylj9VuZ3yB5wMXUnnW1WKjJgM6CXkBwLqgnqexuskBErq0+BqlKKhfrFL+
	Q905uVaNX4e2KlDaX6+9b65syTXoMUifWOBWrxEeRGpbNkgW8u+l4pGcBmxnET3BTe303Fs0f3E6R
	gVcfqo3ZUDVjeXlAlp5PqH+glQLCUpvwCFKtn7ZW7ewXXHm8UxJhHxb8+iAddf/ewQEqHdWYWcZd8
	rmuUJrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTQM-0000000EhZ7-2AZl;
	Mon, 27 Oct 2025 20:02:38 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTQJ-0000000EhYe-0Gjz;
	Mon, 27 Oct 2025 20:02:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B47740467;
	Mon, 27 Oct 2025 21:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1761595351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Wlz4c6idBHgoakGdogx07IHOxQ08Zrz28QTnBsOB96g=;
	b=s+Er8bD00Vh0zoFn1jyeFeDozj4hRXhzbJySMH1fBS4fpcF+R/hRSjBYDDQ8A418n6f5d7
	UAbllmRWq1YZfRBjDizPOfTxF0c2uzyacC/4PRUSFDWoEoiDPmOxE9ygOBGyxPobAx4EPS
	M0vaQFwmPcvidS6cWLk6Q4oejdCPxbepVGNkEVfgJfLDbFeejOP6lnPVV/w9B/M7xxFqfV
	Tbq1Qt0++TTEniW4WEj5A8ZtFnVJvdhhYO8yLaqLQZ8X8MztfasawpW6h8a9bGp4tCrvoe
	EMdi9kYJZVQ7CMhGn8LuGGANIr1yaiokCBht15DHYQRrkaaRRd8aV0xxNXCM3w==
From: Dragan Simic <dsimic@manjaro.org>
To: sigmaris@gmail.com
Cc: alchark@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: pwm-fan overlay for NanoPC-T6
Date: Mon, 27 Oct 2025 21:02:13 +0100
Message-Id: <20251027200213.1821809-1-dsimic@manjaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <d583ee43-38c4-40fb-b33b-ce3153c9723b@gmail.com>
References: <d583ee43-38c4-40fb-b33b-ce3153c9723b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_130235_329557_4A6CB23B 
X-CRM114-Status: GOOD (  28.39  )
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

Hello Hugh and Alexey,

On Mon, Oct 27, 2025 at 7:08 PM Hugh Cole-Baker <sigmaris@gmail.com> wrote:
> On 27/10/2025 09:14, Alexey Charkov wrote:
>
>> Is there any downside to enabling this unconditionally in the board
>> .dts?
>
> Only that it goes against the principle that the DT should describe the
> hardware; the board .dts would describe a cooling device that doesn't
> actually exist on the base board.

Having a separate DT overlay is perfectly fine if we want to
describe a board absolutely correctly: if the fan actually isn't
present, the operating system shouldn't be made to think it is
there, especially if there's no fan RPM feedback, which is the
case on almost all Rockchip boards that support a fan.

Preventing the kernel from managing a non-existent fan might even
save some CPU cycles, ending up producing a bit less heat, which
can only help in passively cooled setups.

However, the practice so far has been to describe the fans in the
main board dts files, if the board provides fan support, regardless
of the fan being present in a particular board setup or not.

> I guess then in theory, an OS might allow the SoC to reach undesirably high
> temperatures if it's relying on the nonexistent fan to cool it down. But I
> don't think this would be an issue on Linux, at least, in practice.

We're safe, a thermal runaway isn't going to happen when the fan is
defined in a board DT but actually isn't present.  Thermal CPU and
GPU throttling will prevent the overheating from happening.

>> Overlays require more user configuration, and not all
>> bootloaders support them directly (e.g. systemd-boot users would
>> struggle). Compiling with overlays enabled also makes .dtb's a lot
>> larger due to added symbols information.
>
> Nowadays (on Debian at least) using overlays is pretty easy, I'm using the
> u-boot-menu package in Debian, I just copy the overlay(s) to /boot/dtbo/ and
> it detects them automatically and adds them to extlinux.conf for u-boot to
> apply.
>
> Couldn't systemd-boot users just use rk3588-nanopc-t6-(lts-)with-fan.dtb as
> their single DT to load, if it doesn't support applying overlays and they
> want to use the fan addon?

Yes, that's an option.  However, that in general doesn't resolve
the issues arising from systemd-boot users wanting to apply more
than a single DT overlay.

> FWIW, I haven't noticed any problems with having a larger .dtb (using mainline
> U-Boot to load it) and several other RK3588 boards are also compiled with
> symbols enabled already, and I haven't seen any issues reported with them.

After thinking a bit about it, I'd support the extraction of fan
definitions into separate DT overlays.  As I wrote above already,
not managing the non-existent fan might actually help a bit with
passively cooled board setups, which is a good enough reason for
me to support separate DT overlays.

If we end up agreeing to accept this DT overlay, I'll have some
comments on the way cooling maps are defined.  I think there's
quite a bit of redundancy there.


