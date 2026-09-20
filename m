Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD616C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbJAK7aXa5pz972jBcMi7T/vqSkdrkXCC86Z5Qp3eWA=; b=gWt0pL7QaXvodil0ySN7a3j+Ge
	snp2v2vGXJuCDjAcOPRRvdc+BhOuBbuOoGtRbhj9ws+KBZxsKZHTypmLfkNp4Li40ddxqaQZWiQXi
	57IDxWNKD63G/Y9LuLYzARkqWP9CzQD4dd3NCXIzxuKH3WEsWVvOzdkFqcFEeCa7O4Cmw7lgjRB8I
	wn9jZqNsGmN+PokM5nwhEAGReAe8wbfw44gAWKl+ODKsIhxPKOw86U92F5/4zaXyiKJahwXe10+B7
	HkBGltg1V7t7gcf3ZZLC3I9xx5aOKbNhPi01khenTd9Sg28oXerTHkJ75kjeKV6XtFqtfSi/qxome
	xZ1x+O8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BQw-0000000H0N3-0ifT;
	Sun, 20 Sep 2026 06:53:54 +0000
Received: from mail-106104.protonmail.ch ([79.135.106.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BQt-0000000H0Md-1I5N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 06:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789887226; x=1790146426;
	bh=IbJAK7aXa5pz972jBcMi7T/vqSkdrkXCC86Z5Qp3eWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=frdOYZX7FZJb91z6hvpOE5kpgk1q9s61Ad7aVmQ4uEJktsWxeb3O8iXMhYKFYCplc
	 AQEr/xyofjiCZdfjZ1p7lJIK6PIaJH+SyO5XEkcLuIyuR+C8bWcq9Gu2/C79jofA9U
	 R5HZTCWYeyr8JVFQjRt07BKju70K9EV0/hJfw5KcJAK2iA6w4DlToxp+crJ4R/4P88
	 oZ0PGwkaqNprudYxz4Rqd/kZZFMderx2YDEE9H80hCu3zSGeGPU8D1fdtgT3eAZbs7
	 hYko7HerXKILyDYgUihgLtj/YWV8mB2ctxZUXGT8yBYUzMJsm+iVR/Cp9tBQKZyRdo
	 EdpIyHhLCdH2A==
Date: Sun, 20 Sep 2026 06:53:42 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: =?utf-8?Q?Juan_Carlos_Guti=C3=A9rrez?= <jcarlosgl96@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
Message-ID: <nW8RRZw7ua8aoc8OVyDPwkugyF_ondGUfEyOAIeuIjstEOvZUVgQGJ5ZPREZV0uFfsj_tcfUAENVI6ojy6ESKziH-HxaYLDWZl-OomGx2cc=@proton.me>
In-Reply-To: <63a19617-9349-4dd4-b9cb-dc677edc387f@arm.com>
References: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me> <20260911-b4-spc-glee-a64-v1-v2-2-ed0b7ff02e0b@proton.me> <63a19617-9349-4dd4-b9cb-dc677edc387f@arm.com>
Feedback-ID: 47397442:user:proton
X-Pm-Message-ID: 8b81d433734c5098b45b8dd05d52a33c041e4bfd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_235351_986166_1FC2DA24 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Hi Andre,

Thanks for the detailed review.

I have looked at the PineTab DTS and the other A64 reference boards. They a=
re useful guides for the remaining peripherals, and I will use them when pr=
eparing the next revision.

You are right about the memory node. I will remove it and leave memory disc=
overy to U-Boot.

The eMMC was left disabled because I had not yet verified its supply voltag=
e and operating mode from a BSP boot. I will inspect the BSP MMC configurat=
ion and runtime state, then enable it once the voltage and timing are confi=
rmed.

The 25 MHz SD limit was conservative while high-speed operation was still u=
nverified. I will test the 3.3 V high-speed configuration and remove the li=
mit if the board is stable at 50 MHz.

USB has only been validated in peripheral mode so far. I will check the BSP=
 GPIO/debug information for an ID-detect pin. If the hardware is wired for =
OTG, I will add the corresponding usb0_id_det-gpios configuration; otherwis=
e I will keep peripheral mode and document the limitation.

I will incorporate these changes in the next revision.

Best regards,
Juan Carlos

