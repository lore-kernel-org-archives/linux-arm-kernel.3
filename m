Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA27ECCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dL9cNk/ZEKPLZBuPsaXaPEmvwCbR0bAkWH6SBOotYD8=; b=4auEPGJJmSsLeu9DGTUHRqgUDy
	GbuPvzhHe6hoGt8pw+sT/cx0zodQXdFU1bW3Yrum8wTzfkkKD4vujjEr5DxKpJZ5+vHucj+0D6IgV
	3lDOi+FrFZqCA7iRbmh9ZmBxWHIWxpr0Kdvit4wUhq8F2FBauhn+IeIe+cgLh0Axi+dqz0YhE/5Q2
	Hubb7HuDUFMkDbKTjjuBuH+sDqFqovDZa6H83ppJ50n0o8cdeYY1Y1B5/lfkGR6fgdOiZR1rUqnBP
	7uwC4wYm3oirC80kuTOYEyKFivpig0mZZYFc8D93M7ci9HI+D++eHNQKflNDJStvh/ifRX+yNEWs4
	K2Y6R+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn2w-00000007SM1-4A8E;
	Mon, 19 Oct 2026 13:04:58 +0000
Received: from ocn-ckd-mts-119c39.ocn.ad.jp ([122.28.130.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn2t-00000007SLP-3jI5;
	Mon, 19 Oct 2026 13:04:57 +0000
Received: from ocn-spm-mts-101c1.ocn.ad.jp (ocn-spm-mts-101c1.ocn.ad.jp [153.128.190.226])
	by ocn-ckd-mts-119c39.ocn.ad.jp (Postfix) with ESMTP id 80D65340032D4;
	Mon, 19 Oct 2026 22:04:53 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=docomonet.jp;
	s=20240125; t=1792415093;
	bh=YT55gpGm8NrjkJARCGxiUjSTkL4aw7n4zEtZ9T9agNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tIBMJsGbiGZiKZ75I7veh1BI6/gydbuy61XWC2+0onOVYvykJsR2MBz3cOnAgaaHt
	 KQTZAJicCuEf2DXcVfZmQUA6FAlPcYKsrWZBLN/M+xFlr7rGDhO/vjVTFn74qjx8kh
	 +UIm+BDzb1/kaspyTo5b5E+xtMWmqaLDqiV23/x8=
Received: from ocn-vc-mts-108c1.ocn.ad.jp ([153.149.236.202])
 by ocn-spm-mts-101c1 with ngmta
 id 0feac299-18dff007e611286f; Mon, 19 Oct 2026 22:04:53 +0900
Received: from ocn-sdpx-mts-113c1.ocn.ad.jp ([153.128.117.211])
 by ocn-vc-mts-108c1 with ngmta
 id d83a9b4e-18dff0079f7349be; Mon, 19 Oct 2026 22:04:52 +0900
Received: from docomonet.jp (p3688129-ipoe.ipoe.ocn.ne.jp [153.238.101.128])
	by ocn-sdpx-mts-113c1.ocn.ad.jp (Postfix) with ESMTPA;
	Mon, 19 Oct 2026 22:04:52 +0900 (JST)
From: "Asai, Shigeaki" <y-asai.0816@docomonet.jp>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC as rtc0
Date: Mon, 19 Oct 2026 22:04:51 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailer: HidemaruMail 7.42 (WinNT,A00)
In-Reply-To: <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
References: <20261017110743.3555391-1-y-asai.0816@docomonet.jp> <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
Message-Id: <10DD5FCA6DA7B692F3006A@docomonet.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_060456_289701_21FA2E5A 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Neil,

On 10/19/26, Neil Armstrong wrote:
> The vrtc was used as rtc0 because it's the defaut wakeup rtc,
> can the rk818 and rk817 wakeup the system when in system suspend ?

Thank you for the review. I did not think about wakeup, sorry. I tried
it on my board:

- s2idle: with Igor's "irqchip/meson-gpio: Allow the GPIO interrupts to
  wake the system" applied, an alarm on the RK818 RTC woke the board
  4/4, and the power key on the RK817 3/3. Without it, neither of them
  woke the board.

- deep: an alarm on the vrtc (rtc1 with this patch) woke up BL30, but
  the system did not come back to Linux, and I had to disconnect the
  battery. An alarm on the RK818 RTC and the power key did not wake it
  up at all. So deep suspend does not seem to work on this board for
  now, which looks like a separate problem.

On the other hand, the vrtc does not keep the time, and the RK817 RTC
drifts, so only the RK818 RTC gives the correct time at boot. Also,
before this patch, the vrtc was not rtc0 on my board even with the
rtc0 alias: the RK817 and RK818 RTCs registered first and took rtc0
and rtc1, and the vrtc became rtc2.

Would it be OK to keep this patch as it is? If you prefer to keep the
vrtc as rtc0 for deep suspend, I can send a v2 with rtc0 = vrtc,
rtc1 = RK818 and rtc2 = RK817 instead.

(This reply was written with the help of Claude.)

Thanks
Asai, Shigeaki

