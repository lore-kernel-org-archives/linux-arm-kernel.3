Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InuKAAGjHu/C7GD/p6y1dIS+oWspdPvUrz6/e8cjyKM=; b=i92vonLFd/RURQ2rSZCLU2HeqN
	hSgZNJQ54B4meGB+R8cgf+vHFcGB3WWpUUz8NzEpNKuM0tgZ3Rm9yvVCAwYtSj42Tl9NS05rnpDVZ
	DD9nmsZMExfGSIPZ45GxzcsVAO5wjrmyY1mVPYueTt8ylNjJA/nhvJ6krspy7DWp7Pg0k6iYakacR
	gIBOF98INiP+O9tmHc/xE4eY29A+oSR2MAl+pTGJEd4IlEQBxpops7aQTAZMox9BNnTwEl9TbFGu4
	QiEY0ijW3m9k/TQuvYXy9sfmNvIeNDcB/hjnAO8GWk+o7lbZihSbQzsTPPwEmR95HgXZbo2IMs+Hx
	jTjMj0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3wY-00000003azG-058M;
	Mon, 16 Jun 2025 07:07:46 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3qZ-00000003Zyv-18KF;
	Mon, 16 Jun 2025 07:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1750057280; x=1750662080; i=frank-w@public-files.de;
	bh=InuKAAGjHu/C7GD/p6y1dIS+oWspdPvUrz6/e8cjyKM=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=s2UVLpUKJZyqePN0VoRDHjcH1kF2nvZKAqTZkzdJ3S1G1FhxLe/WJ7aonJgYwff1
	 2O7pslpgw6AoB9xR1d+Lp2pQuxrpjw4e7vRRvzCQCJE9Le8pURc9y1BzdaDseApBW
	 vGKi3V4o+j/N+t8sgHoYJlOfYH7EYq5jZ1g3AEaGpqqlIIfpajDNXPPYcaa6QNwtz
	 HS5/BrZ1I/KpeER6QopNP6/0JUw9kUSZ6tF+9OJjWZ+JZ70abf1sefc9pPUhTNMWT
	 Bs6vg9RrfIqyhdldZ0+XsproGILWz+1DSAmbEKySlpL5WDQzzQPV9G6OQp2f/k9ZN
	 VbxjqO4BMB+mS72rWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.67.37.206] ([100.67.37.206]) by
 trinity-msg-rest-gmx-gmx-live-b647dc579-tr2th (via HTTP); Mon, 16 Jun 2025
 07:01:20 +0000
MIME-Version: 1.0
Message-ID: <trinity-e9eaf8fd-42f1-46d5-b1df-3bfefe02b2fe-1750057280436@trinity-msg-rest-gmx-gmx-live-b647dc579-tr2th>
From: Frank Wunderlich <frank-w@public-files.de>
To: mason-cw.chang@mediatek.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 jpanis@baylibre.com, npitre@baylibre.com, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, wenst@chromium.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
 steven.liu@mediatek.com, sam.shih@mediatek.com
Cc: mason-cw.chang@mediatek.com
Subject: Aw: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add mt7988
 lvts commands
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 07:01:20 +0000
In-Reply-To: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:E53Jv9HXOWkrKn1ZmdCThVsKfrzyzuGZargrqRZrhq4Jf1N6adv3cJ2SO3q/CtWy8d1d/
 QDM9voUlQrOto5dwjYfZWRz4yPGaMpj5j0PIhveWyIfGmukm4lJdw+qRF8g5xZigd97/80PljnoQ
 H8ZrO1S5pA+KCV21QjyAF1d3rOVeZzzMO0CfDykQZKy1Pztvw0C+hv8rbqBrIxsegEJF5iyfSKP0
 r4WZa67IPl1lKRtoLF3B1SdTESGO/2b3C5xJh94nV4fOA2mNfxuFfOgbRims31qA5sc6MRAMUNFf
 lw41SniqEtVepmdTyGLN3TgvPEvq317HVyJqOzvxi5npkIetYQ1kamys4S/E8OxFUA=
UI-OutboundReport: notjunk:1;M01:P0:PxlaLSE8vxo=;EPEHr1o7va+Z4JcCx7lU/6b8+Cc
 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
 LFSEZB56NrtCrz7ufFA==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_000135_607988_4E259CA0 
X-CRM114-Status: UNSURE (   8.17  )
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


> Gesendet: Montag, 26. Mai 2025 um 12:26
> Von: "Mason Chang" <mason-cw.chang@mediatek.com>
> Betreff: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add mt7988 l=
vts commands
>
> Add the LVTS commands for Mediatek Filogic 880/MT7988.
>=20
> This series fixes severely abnormal and inaccurate LVTS temperature
> readings when using the default commands.
>=20
> Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>

Hi

just a friedly reminder for maintainers, is the patch series ok or does it=
 need any changes?

regards Frank

