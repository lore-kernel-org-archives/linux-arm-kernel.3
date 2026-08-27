Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD049C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39xHH2vSkwxps+NccOz6k0tJCTNnVs/T6Y2fM6jJYRs=; b=EhZ3RvX9uLwoC4N5ZxW1tdFw/i
	BbmellPK6fzYErPLLMoc1a2KXbEyX1FDb8UEmgHJ4XCYuDx8NIEmBkcyvzrOXRcDaVLpd9vLj9/Kd
	NON8y74qWTAUkFCnQnMIqh72ech7gW9QM7Stne8DxoDSU6A8GU1d7JJYAg6ckLgdyevxdnTO7XnI5
	ZTw5rRL2ZT9Tg4wqdxPEaWEwL9c/N3ZxhWgk9ceeLlE3oXPIBvRXCpPJQ65Zk4lM7xa71pPC0bKNC
	jCZpL1Bh9rK+nX/WJxMB33vZYGKp1JaeKmNoWqig6OLg8tPCjrSHUacHprwCOO+WX8oTHJKqqC4ie
	0rw0/A2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeTd-00000004Yrw-28aw;
	Thu, 27 Aug 2026 18:05:25 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeTa-00000004YrQ-26bM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:05:23 +0000
Received: from ehlo.thunderbird.net (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id E7C211FCB8;
	Thu, 27 Aug 2026 20:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1787853920;
	bh=39xHH2vSkwxps+NccOz6k0tJCTNnVs/T6Y2fM6jJYRs=; h=From:To:Subject;
	b=Fsio+jNzaXaB/awgLvrTU3AWTs7NhEG6KhTQkrhZ+LXqh9Dg93laXFvMyWGiOxKyI
	 fjUE1tV7bmgfoPR1/009476IlemlpIF8Pc5fw4d+9dTz1cYRHi2zPmi4R1l6VNKLse
	 TMYTQoEyjRdjWjBFTk1vyV2U1BV9N6HfC3wHwnIClMs9Z6ai5vY4Sb4k5s3UTydlAP
	 96nzYP4VuYFuCDzRX3Yu9vygq7NXZ8/Zb/LwKqTMbpUWHy52yTGtqFXosEfoZWPJCe
	 CpqHeiP2j/D9/EkhL8vsPjJNglj/d5JRf83hF6i4XvD9aDzFdpOWi3dJutVdPN+lG2
	 FUBSP+1TYUO5A==
Date: Thu, 27 Aug 2026 20:05:17 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: George Valkov <gvalkov@gmail.com>
CC: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch,
 krzk+dt@kernel.org, johannes.berg@intel.com, kees@kernel.org,
 miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, wenst@chromium.org,
 rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com,
 s.kerkmann@pengutronix.de, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com,
 peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_3/3=5D_ARM=3A_dts=3A_armada=3A_WRT32?=
 =?US-ASCII?Q?00ACM=3A_add_marvell=2Cinvalid-reg-hint-in-rom?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com> <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it> <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
Message-ID: <A7FBAD8C-3AAD-4268-9BBC-3BDE071481E1@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_110522_817871_76C6D86F 
X-CRM114-Status: GOOD (  10.96  )
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



On 27 August 2026 20:02:27 CEST, George Valkov <gvalkov@gmail=2Ecom> wrote=
:
>On Thu, 27 Aug 2026 at 20:40, Francesco Dolcini <francesco@dolcini=2Eit> =
wrote:
>>
>>
>>
>> On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail=2Ecom> wr=
ote:
>> >WRT3200ACM and WRT32x routers always report a fixed US regulatory doma=
in
>> >from the mwifiex ROM, which conflicts with the platform regulatory
>> >configuration on units sold outside the US market=2E For example:
>> >- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
>> >- phy1 mwlwifi 2=2E4 GHz, hard-coded region 98 EU mapped to FR
>> >- phy2 mwifiex 2=2E4 and 5 GHz, hard-coded region US
>> >
>> >When the system boots, it detects a conflict between the user selected
>> >region and the radios, e=2Eg=2E BG FR US, and applies extreme restrict=
ions,
>> >preventing phy0 from starting on any DFS channel=2E phy2 works=2E
>> >
>> >Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
>> >WRT3200ACM device-tree, which signals mwifiex that its regulatory
>> >hint from ROM conflicts with the platform and should be ignored, so th=
e
>> >platform regulatory domain can be used=2E This does not allow the user=
 to
>> >change the regulatory config of any radio=2E It only allows phy0 to st=
art
>> >and operate according to its certified configuration=2E All radios in
>> >WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
>> >they are certified=2E
>> >
>> >On WRT3200ACM, the platform configuration is stored on the devinfo mtd=
3
>> >partition, which is read-only: cert_region=3DEU modelNumber=3DWRT3200A=
CM-EU
>> >
>> >The Linux kernel sources do not have support for WRT32x=2E An equivale=
nt
>> >patch for these routers has to be sent to OpenWrt=2E
>> >
>> >[1] https://github=2Ecom/kaloz/mwlwifi/issues/173#issuecomment-3078796=
99
>> >[2] https://github=2Ecom/openwrt/openwrt/issues/9956
>> >
>> >Cc: stable@vger=2Ekernel=2Eorg
>>
>> This whole series is not material for stable=2E Please drop thia tag fr=
om all the patches=2E
>
>Dropped CC: stable from all patches, and sent v9:
>https://lore=2Ekernel=2Eorg/linux-wireless/20260827175850=2E89395-1-gvalk=
ov@gmail=2Ecom/T/#t

Please, you are not supposed to send a new patch series revision every tim=
e you get a single comment and you did send the previous version just 2 hou=
rs ago=2E

It does not work like that, you just create additional overhead=2E

I assume this is all documented, please look into the Documentation direct=
ory=2E



