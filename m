Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A74AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=; b=EO8IQGNCnKqYbqWCipjmgbNBDm
	sCSDQs8w1gopeHu5nYXwYViFHhg6SrnUHlvcBPJK5I3A8xTFlmBfnoCWPG0EMWz+Qgtmq9Yu3v3f4
	aRHi/MixPM2EyopI4JLZc/kTZ+EuH0TZjfmMboRIvSRTGkuIc8AwRCI6w+eylUvgIcL7GxWW7Vb41
	e70ccMb41rmOL32HX5bmM3gCMY8s7p4wyKC7etnQYE5VOhdXdQR4XoCykqHtygRYahhnc/ZqydLQQ
	z++R3HMggonE+wn45OUyE6YuDKR/LIsxTKTqc0RyxDErheTu1mBZMsOIgIQtoWcicYk4EZ+l46IRN
	+2Iib3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRny8-00000009Npn-10vM;
	Wed, 18 Jun 2025 08:16:28 +0000
Received: from mail.successa.pl ([162.19.205.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnuS-00000009NTK-3D9S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:12:43 +0000
Received: by mail.successa.pl (Postfix, from userid 1002)
	id 5C5B52858C; Wed, 18 Jun 2025 10:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=successa.pl; s=mail;
	t=1750234355; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=FxJyQdcTiqBjQarygkSGXxHVmwQUkRmbks5HfMHDwpuHS1iXd/s8L6ZtRqGhXxQj6
	 u6aE2l37xiyoWulEC1ZzdDzkhzfWFftEai3j0eTj3tvD9WDwaepS8uhzl4A3jcTdf2
	 HulGMp3JJN9fKDt3QCxrhpIn+AveDp+ENyjG1MRE9sOOCTyu7Ot2R4PNhD0p//wRmg
	 Kx9zPldR+IymUzzkkuqQqFUajrLMZ5A1x/H6dZsZzpGEG8DzdE/+0B6TOEZZlt2GlY
	 ieufbBV9hqJdO53eCGo7V0yQzLY1w2T4bAYYq55DcgB10PUVJyNn91b1ALiClE+ZP9
	 zx2d518A7UMlw==
Received: by mail.successa.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 08:11:08 GMT
Message-ID: <20250618084500-0.1.iv.1uuy8.0.acp1oyv6mj@successa.pl>
Date: Wed, 18 Jun 2025 08:11:08 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@successa.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.successa.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_011241_499920_DFA73566 
X-CRM114-Status: UNSURE (   1.79  )
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

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam
Adam Drzewiecki

