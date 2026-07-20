Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB139C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT1jaqD1Iccb31fXdwSCF9w0Y9iQoL1OwEC509jWVdI=; b=t8738Ebi3abSSugAJwmS6W5iZT
	3Hr5MNzIZ2ljhLrkj8MDrLoZ6xWSdzlmdelnDR/uX392PUgiHgkczQPOKnF29Hg6mTQtPu1VB97lP
	r9oYECx5HSyZSjLXo3cGI7NR/d787mdMI1bS774La9Pxj6Vbhx6JoBydeMdOU8Rk463ToKeZnjm40
	wKm2bvuBm0YJ+cNaO9gZIirkzoVVGfVOCHA5QYCDMKQ8P1JIMJi32G698bkqUbody94ejyttaPY3K
	44vVuaRAxsBgAUghdYIPmF7ABhcJttQmQNIfIFhfJSm6rW9FydTUqmNFX9qQB9CZ+AUiOxGpRiHG1
	bcHEA0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmzY-00000006gcO-3et1;
	Mon, 20 Jul 2026 12:21:04 +0000
Received: from wp585.webpack.hosteurope.de ([80.237.130.107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmzW-00000006gan-25I0;
	Mon, 20 Jul 2026 12:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=loe-web.de;
	s=he168698; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:In-Reply-To:References:Cc:To:From:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZT1jaqD1Iccb31fXdwSCF9w0Y9iQoL1OwEC509jWVdI=; t=1784550062; x=1784982062; 
	b=ogPN1ev90JIDAeEsG8BTrxMST5U42TqgWPccC1gBxjqVn7KHijepwQ6dg3hm/Gsuek3DWu1D/qo
	rNBGR7bR4Vmj2IkwxcLBKjTeT6+5nmNbL64FYRdXZIhRgiZ6SFuPJ4OBVGlyCVX9eXJFYc1aa+DaA
	zZ23/5ExAeWMo9MAVqeUywFAAxdbkUVoc7nZ2VdOGaP+141YIGa7FzVylVz0LeUnnTmyVWT6/XWP4
	kQyy/VMbBmjuX3h6VMoVCXNV+BF2wc7PcG/3T04RjHx1S75Xx8OYQ8K/+89eIOiO1U68+15UvlL8B
	mtBypmtuGs18zg9yO+TeWZ8MXhbWlCKZDBuQ==;
Received: from host-213-179-158-197.customer.m-online.net ([213.179.158.197] helo=84JJL23); authenticated
	by wp585.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1wlmzI-004nlt-2U;
	Mon, 20 Jul 2026 14:20:48 +0200
From: "Jakob Loe" <jakob@loe-web.de>
To: "'Alibek Omarov'" <a1ba.omarov@gmail.com>,
	"'Rok Markovic'" <rok@kanardia.eu>
Cc: "'Heiko Stuebner'" <heiko@sntech.de>,
	"'Sandy Huang'" <hjc@rock-chips.com>,
	"'Andy Yan'" <andy.yan@rock-chips.com>,
	"'Maarten Lankhorst'" <maarten.lankhorst@linux.intel.com>,
	"'Maxime Ripard'" <mripard@kernel.org>,
	"'Thomas Zimmermann'" <tzimmermann@suse.de>,
	"'David Airlie'" <airlied@gmail.com>,
	"'Simona Vetter'" <simona@ffwll.ch>,
	"'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>,
	<dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260717120005.2087386-1-rok@kanardia.eu> <20260717120005.2087386-4-rok@kanardia.eu> <CAKyg=SV2-81VFgr+Tq=-Si5EO-86MA+ZFoQ+DX1fEYdnnLYJng@mail.gmail.com>
In-Reply-To: <CAKyg=SV2-81VFgr+Tq=-Si5EO-86MA+ZFoQ+DX1fEYdnnLYJng@mail.gmail.com>
Subject: AW: [PATCH 3/4] drm/rockchip: lvds: add RK3568 support
Date: Mon, 20 Jul 2026 14:20:48 +0200
Message-ID: <000c01dd1842$32a0a580$97e1f080$@loe-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFaHWtND3nIPg5aqhiCEj6HM4JNGQJz810+As1SicW3Uj7lQA==
Content-Language: de
X-bounce-key: webpack.hosteurope.de;jakob@loe-web.de;1784550062;9dd12afc;
X-HE-SMSGID: 1wlmzI-004nlt-2U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_052102_708320_24AF7335 
X-CRM114-Status: UNSURE (   8.72  )
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

Hello!=20

Nice to see this is still being used.
I can confirm that this actually works and outputs fine LVDS on a =
RK3566. Also reliably so far...
Any questions, I will see what I can help.

All the best
Jakob


-----Urspr=C3=BCngliche Nachricht-----
Von: Alibek Omarov <a1ba.omarov@gmail.com>=20
Gesendet: Montag, 20. Juli 2026 07:39
An: Rok Markovic <rok@kanardia.eu>
Cc: Heiko Stuebner <heiko@sntech.de>; Sandy Huang <hjc@rock-chips.com>; =
Andy Yan <andy.yan@rock-chips.com>; Maarten Lankhorst =
<maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; =
Thomas Zimmermann <tzimmermann@suse.de>; David Airlie =
<airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Rob Herring =
<robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor =
Dooley <conor+dt@kernel.org>; dri-devel@lists.freedesktop.org; =
devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; =
linux-rockchip@lists.infradead.org; linux-kernel@vger.kernel.org; Jakob =
Loeschke <jakob@loe-web.de>
Betreff: Re: [PATCH 3/4] drm/rockchip: lvds: add RK3568 support

> Based on Alibek Omarov's earlier posting [1], with the changes below.

Hi, I'm Alibek Omarov and thanks for picking up my patches. I didn't had =
time to finish them and these days I don't work on hardware that uses =
any of Rockchip SoCs. However, if I'm not wrong, it's still used in =
production and I had report from Jakob Loeschke (added in CC) who =
confirmed it worked in their setup as well.

Thanks.



