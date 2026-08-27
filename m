Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B96C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hg55+g+2sDxRj0S/u4Rec3c5AtKBMNduDaEDI/9xCII=; b=BzneiVLZC+2ro20ifgAV9cK1+4
	LAy76V+x0ghBoVGOrmfnARvqS4zyl/2mBOeTSyEu43gLDNkuw9p8WWXqkC/p5nLvfOGlsqs7NpwL4
	J+ZogNjOi0WS0V4oHZZgd7B6w2c3EZuqZE/FT+9NVpkULJq4fr0BJIpwuMX88CU5gpIYSHrR4oOky
	BC1Z6/YquC+bjvUF8wUIxwv7uDj5kjSWAT6wk9n1hSl57SUAtcjgi/gdqvnYDTo/qQwliaYVMPtjb
	jjoKbIdfTb3ohnaIrCniOi9tGu0dZ35gfU/V0cldsE3/KUFtklk4p4aouqH6HpSlA0JBaw2mBE9cr
	1nDzT6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze5z-00000004UQv-28qE;
	Thu, 27 Aug 2026 17:41:00 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze5t-00000004UPr-2XaY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:40:57 +0000
Received: from ehlo.thunderbird.net (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id D45DB1F8DA;
	Thu, 27 Aug 2026 19:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1787852445;
	bh=Hg55+g+2sDxRj0S/u4Rec3c5AtKBMNduDaEDI/9xCII=; h=From:To:Subject;
	b=rtPCcZtZZLMg2hlmuRelXiAc9nkNWnlk+KZ/tNxhU9gp5XfzD64NF844FzFHh+mo2
	 eSPRF3GmpK1FQcWOs3xdzcU4P/+MY+f8C3hboy4tUQUjVnk/JQnXblCyl7Iuvc+yZB
	 yilCfKzwO2OgHaz/Tnsi8xdf9V14bstx1vqWQXB05SRwytH4uELlpHWVqCMtvlL9nz
	 iP1QNwR2z8jpUOTv9M02XNAbHPbBcG8H1HrG+j7QHvwUOhmITFErOHTzbEOAbGkAS6
	 WgRiTIn6k8CEMmPpPkX9ln+JDsv8un5A5cVQqyoiFXZxvkxV228eI9qK56nzi/6xCI
	 zrwCc2KFJ1izw==
Date: Thu, 27 Aug 2026 19:40:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Georgi Valkov <gvalkov@gmail.com>, briannorris@chromium.org,
 johannes@sipsolutions.net, andrew@lunn.ch, krzk+dt@kernel.org
CC: johannes.berg@intel.com, kees@kernel.org, miriam.rachel.korenblit@intel.com,
 rongqianfeng@vivo.com, wenst@chromium.org, rafael.beims@toradex.com,
 avraham.stern@intel.com, error27@gmail.com, s.kerkmann@pengutronix.de,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 chunfan.chen@gmail.com, arend.vanspriel@broadcom.com,
 peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org, gvalkov@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_3/3=5D_ARM=3A_dts=3A_armada=3A_WRT32?=
 =?US-ASCII?Q?00ACM=3A_add_marvell=2Cinvalid-reg-hint-in-rom?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260827171937.28878-3-gvalkov@gmail.com>
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com>
Message-ID: <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_104055_795537_5B2CB1AF 
X-CRM114-Status: UNSURE (   7.32  )
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



On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail=2Ecom> wrote=
:
>WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
>from the mwifiex ROM, which conflicts with the platform regulatory
>configuration on units sold outside the US market=2E For example:
>- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
>- phy1 mwlwifi 2=2E4 GHz, hard-coded region 98 EU mapped to FR
>- phy2 mwifiex 2=2E4 and 5 GHz, hard-coded region US
>
>When the system boots, it detects a conflict between the user selected
>region and the radios, e=2Eg=2E BG FR US, and applies extreme restriction=
s,
>preventing phy0 from starting on any DFS channel=2E phy2 works=2E
>
>Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
>WRT3200ACM device-tree, which signals mwifiex that its regulatory
>hint from ROM conflicts with the platform and should be ignored, so the
>platform regulatory domain can be used=2E This does not allow the user to
>change the regulatory config of any radio=2E It only allows phy0 to start
>and operate according to its certified configuration=2E All radios in
>WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
>they are certified=2E
>
>On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
>partition, which is read-only: cert_region=3DEU modelNumber=3DWRT3200ACM-=
EU
>
>The Linux kernel sources do not have support for WRT32x=2E An equivalent
>patch for these routers has to be sent to OpenWrt=2E
>
>[1] https://github=2Ecom/kaloz/mwlwifi/issues/173#issuecomment-307879699
>[2] https://github=2Ecom/openwrt/openwrt/issues/9956
>
>Cc: stable@vger=2Ekernel=2Eorg

This whole series is not material for stable=2E Please drop thia tag from =
all the patches=2E



