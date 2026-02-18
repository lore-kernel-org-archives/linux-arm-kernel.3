Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A917E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1SEXdCn6Ivy44E3s/UlBooYRFgSXnmehGPBAK+5r7w=; b=S1BZYYmSLNg83pwlcP6Mak22mF
	M7v9EFxT0aB6Y3pMD+mD1TDy7S4tWhO9rHsQYIk2+x2DNtsGupyR6m+LqeMvRjn33Gczy/pQDgsJc
	do+T7hgPg5i9cIL0hoI70tiewSPhNZnBhQacpnohksTlK63VeUM9jIByJiTCT7r00wYrceSIXlSKm
	04uAXwD1ZHt7t4mSCeHI0noZdU8SD+qd6KtDH3YFStW9nC9VI7hB9ovhzjjasQ6z+3E0PZPKaFTHL
	RqHkFABQWaYUh2Zxjkzrrf1O2YdwDZrTxT81PomgVOVCStShTjTYCKIkmD6zkRdSKIDfXSbTL0Wcg
	IU1T5wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgS5-00000009lA1-1NTx;
	Wed, 18 Feb 2026 12:14:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgS2-00000009l8D-3BSi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 12:14:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B79A61A1101;
	Wed, 18 Feb 2026 12:14:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B45F60738;
	Wed, 18 Feb 2026 12:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB03810368B5D;
	Wed, 18 Feb 2026 13:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771416878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H1SEXdCn6Ivy44E3s/UlBooYRFgSXnmehGPBAK+5r7w=;
	b=HYTBvtLMo0ZI1vTmR3shXPdXnQSaLhlps7FOcyorYrgRXMTUk3zc08EhkeCDdsPXDollAH
	wUscZMnh7Z2pdfMI0cNNN3NGXBn0pRc6R4BIwenYaV7G62cZOFca+FqCGHGf6foul7WObY
	GgJtZWzZim0ZGTnRsJYoQlMW2q06dXb9ee3f1CwSYfehu0pnlJEa5VKn7/W7t4wX0ByweI
	kiB/LFKr8WFqi8AKUaDvl5Az/3bxmfZTrRKkMiTwhjc9R4x1Vp0aKL0olbGxn2zAa+E3It
	z1Y9JKzH8DUP5ybferD/yQqjdn00yhKc4qx9g4UBWcUcQkkYhP0ifv5Zwh7Tvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 13:14:36 +0100
Message-Id: <DGI2VIKQYD6Y.2R4TM6UD58OSU@bootlin.com>
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Cc: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>, "Nicolas Frattaroli"
 <frattaroli.nicolas@gmail.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko
 Stuebner" <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, <alexandre.belloni@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <49e43733-1366-4a4a-a787-f7221b9612d2@sirena.org.uk>
In-Reply-To: <49e43733-1366-4a4a-a787-f7221b9612d2@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_041443_129789_1D418F79 
X-CRM114-Status: GOOD (  10.21  )
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

Hello Mark,

On Tue Feb 17, 2026 at 8:22 PM CET, Mark Brown wrote:
> On Tue, Feb 10, 2026 at 10:54:04AM +0100, Luca Ceresoli wrote:
>
>> I'm afraid I just found this commit breaks audio capture on the RK3308.
>
> Can you please send a revert explaining the issue so we can drop the
> patch (unless a fix is forthcoming which doesn't seem likely right now,
> we can always re-add the support later)?

Thanks for the feedback! Revert patch sent.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

