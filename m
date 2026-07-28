Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EFCC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 07:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiZ+x+vhRWQhm/RdJSk6EPcAg6VKMKgUIQhfffQ2FTQ=; b=ARsir6s7LAFuaV7X59Xdw/pE/4
	dVDBF5D57zThdcYjT98Xv0J4fhajUwRhom1D/WPu8kvrx4dSJBVS7ux0HsQAZ54iisL8Jc0o1RDrN
	L9xOAWBj+42LqfNoqTUyx8QcLEoOSFuDsPXs4Y2GnQi6FmPBPcDOS6yuFc0tJYr1ET1vSdet9zyF5
	qQ7OhsNqrLFKIdFvQZWJd4KT+5APnrKb0iCF9V0PsFCzCj4k3++PqFwrGIF7x15GS7jtpGBNR62xB
	c8rzmfKswb7+tVwguKEJecrdqNnjcp9w6F4ps3yp83Zu1L1/yznPS/9oc0BhIPdnuGodedNb8YwXc
	4R4rfkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wochf-00000004fZP-1Ntc;
	Tue, 28 Jul 2026 07:58:19 +0000
Received: from mail-10697.protonmail.ch ([79.135.106.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wochd-00000004fYi-0GpW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 07:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1785225492; x=1785484692;
	bh=uiZ+x+vhRWQhm/RdJSk6EPcAg6VKMKgUIQhfffQ2FTQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CnY67PWEdvVCG/3T+ILplemqYk01J2Uhs9DgZM5H0HrGP0s7rM7ziPNnt1nql5o6N
	 4/7QGneO/1F3nVAuFojXjo/UiGwTwLwF2p38xCSD/LFyKrro3useUlrSBrpVLhNyIZ
	 vxn/WU/NQ8t2mP94h/3wmm6jxwPiKCKHX1qB6MOt8XXHlnxqh6Q+ePluprrTWED/qv
	 em9RmzWpCr4raNQF3/RuuoVpOp3r+e+guOqI01E5veshOFkc+dnOcsRziTQSO0CCFf
	 Y2rp2Ki96td4HEdHRT9CLbKcgssCZa7coSFG7DyHsZbFSlvqrhnlN9zMceDhqSwUU8
	 LNsFBtnUE3iQA==
Date: Tue, 28 Jul 2026 07:58:07 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, Conor Dooley <conor.dooley@microchip.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 0/4] AUXADC driver for the MediaTek mt6323 PMIC
Message-ID: <92F7jsoczEi2TOWKT6Qqmppk-KE3uJjCKASTXa0RPV7nJZVfXhxdbuP9RptMsvV4_dnvJAlCh9NYvmiiO2mDGQojZoCozVKhXyOJmp2x6AM=@protonmail.com>
In-Reply-To: <c11705b1-fc46-440b-a27e-0cc38f3b2d69@collabora.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com> <f2d5801c-1d12-4a61-ac23-aa24dfd0ee5c@collabora.com> <20260710005424.5c559b5a@jic23-huawei> <c11705b1-fc46-440b-a27e-0cc38f3b2d69@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 0039053f5457e970d1073aa66047293d5cab3657
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_005817_268335_4672A596 
X-CRM114-Status: UNSURE (   4.65  )
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

Hi Angelo,

Could you take a look at patch 4 (DT)?

Best regards,
Roman

