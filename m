Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCFEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEs4rY7eHqvNO9iNPud7g4FzDBOXrr28xDXC3lthqhM=; b=rPTdanL7K5f6VdqGu6bACxn14e
	jYhofP63QNAMaQgkhOyP1qmiTY0HKE44O+VJYfZj1GWJ0UYl2hRbpceIKtHQitN1aS8Vv+Fvk4O0k
	shNlYBjpF7un+kCPTK3NCvxQIFE3QJ83+N2c3nIVSCINhrP3r/47C4hzn8egpJJTGtTQLD/Tc/JGv
	nBbhEwm6O2vMmk5rysmhq4aX7Lbguk/qbobS4h6ErxuDGON770Nn+PiNCb1P4RAV+oWRvyYtlJS5I
	ls8vI66D8/odSdTSmShLEi+TtzmG8Kj5J60me9pJRua/85LKZLPmlAkOFz3Z7RCSX0/EDN0qmAFfZ
	Zoparp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgVb-00000007XYm-0nXG;
	Fri, 03 Jul 2026 16:12:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgVY-00000007XX6-3x55;
	Fri, 03 Jul 2026 16:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sEs4rY7eHqvNO9iNPud7g4FzDBOXrr28xDXC3lthqhM=; b=Nvvw3IFWR+JVGJVmxPzeEJSXsb
	5aMY2F1V9t+poqC7mKWF2rFowHP+iGLhSVv3M21edc0tutACoaqePA2o7KuyiHQXfpKkq0HTHeD3+
	y1zh48ybvfK/BXuQudhUtfPm2CXIThJlqDRxfP7rBkq627HZ2K2VDdyF2iF34xEW9MDohn7z6C8Da
	KqmyvcIpVUrMlJFk2x84W/n7fMzNd1YjqO+sd83EyJJaEXgfcsqx4u/NWhYQDWnwSS2W3Gpbkgjog
	iHRtxclyuNNsCK9iLyoTzH7qzAeD0YeFu0kESBaGSxSJEnAId7/u1uwb9SyOk4s1fcAPhDaGi2MTU
	GaqHM7fg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Brian Mayer <bleemayer@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Fri, 03 Jul 2026 18:12:47 +0200
Message-ID: <2960762.AiC22s8V5E@diego>
In-Reply-To: <CAB3eKoDcp=rVGDpvAHEeVLG3rHFw2E1XXxCe2QaApX0aLkyXyA@mail.gmail.com>
References: <CAB3eKoDcp=rVGDpvAHEeVLG3rHFw2E1XXxCe2QaApX0aLkyXyA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_091253_044539_807418CA 
X-CRM114-Status: GOOD (  15.06  )
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

Hi Brian,

Am Donnerstag, 2. Juli 2026, 21:09:20 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Brian Mayer:
> Hi kernel team.
>=20
> I was testing building the kernel for my radxa cm5+io shield, and it turns
> out there is no rtc in the DTS, so I got it from the radxa files.
> This is my first email to you, please help me correct it if something is
> off the standards.
>=20
> The commit attached does the trick. I used AI to assist me in this in
> case you're
> wondering.

Generally, please don't post patches as attachments.
=46or review comments it es expected to be able to comment
inline in the patch.
Ideally use git-send-email or b4 for sending patches.

=46or AI assisted changes, there is an Assisted-by: tag [0]

Please drop the Tested-by tag ... as you're sending in the patch and
your signed-off-by is on it, it is expected that you tested that change :-)=
 .


Patch contents:
Please use names found in the schematics ... the pin is named
 rtc_int_l there ... so the pinctrl entry should be "rtc_int_l: rtc-int-l {=
 "...

This allows easier lookups when going from DT to schematics and back.


Thanks
Heiko


[0] https://docs.kernel.org/process/coding-assistants.html



