Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7092D33981
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m52HUG2ozdh/t95+oxWP0b3row4ZsNckyGzjnNOPYg4=; b=CUbkFXvddvtdoY
	s1zE5D2hJoX4+xBuSU8hxc/xuTCbuxDksMfRDTvv61P80hAOPqIxA8kvI+hv2/njH0xys4FkwJxQB
	gLMmaeQse9UsFDT1e3U5BSfAKJ+9MaGsu42QEPibRXiF/ErG0unb4pungGkP3HCRgWNz0ngpoRw10
	Y1guwVKI/fZ/DxInM0lMv/AG0nFd9z/on5NJ/7HCfFAKRKU+sEnSxVVqcURqkglWky0sGTkk7TYt5
	E2NZ1cT7vtypa7hCtgGNoOaDqAvjkOoPioo7r9EPqvFKBXrQiUjMb2SjRpK2wOes51c2GE5aeZUMl
	24fBFJFfvl0EdUlLGJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXx4-00000009fWn-3OSc;
	Fri, 05 Dec 2025 15:42:34 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXx1-00000009fVX-44zb;
	Fri, 05 Dec 2025 15:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1764949321; x=1765554121; i=frank-w@public-files.de;
	bh=m52HUG2ozdh/t95+oxWP0b3row4ZsNckyGzjnNOPYg4=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qi4aZsfz57/ZkFsIN0J5I/KnO/mQ6JNiY/XO9sbO4bS8fBPFyThQdkf4MEjwJ3Nd
	 /RXGTwSfodU+CQzVe83WZ8lb1tUKc/1A9KmpuiIjQwZI1Z3bnooNJyxP7IGorA3cz
	 ZpnQ9eWZ0iP+JcnpIxpNi26rjaKdoeiRkltj4XpxPs0Z/weyIBtbfB/F55657Ng5a
	 OTBK7fFRxvLe9n8OqjjWLOdi6AV+keYvj91xHOao8v/8yRoPWI9GM0pkVGW3tPrVS
	 bg3GP6AcZadn+2NL9qeICNKYpv6RNFyAlH2RL5tWyi1jQ1kEpYS+I7dlKVy2Fk8rT
	 lW93PGBltg1kQqmcPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([80.187.71.20]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1viDie2Bob-00Xd6V; Fri, 05
 Dec 2025 16:42:01 +0100
Date: Fri, 05 Dec 2025 16:41:59 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/2=5D_arm64=3A_dts=3A_mediatek=3A_mt79?=
 =?US-ASCII?Q?86=3A_add_dtbs_with_applied_overlays_for_bpi-r3?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_Jsq+Zu14ojvNNjgOFWA40iaqYrgGQsrHNWraooOML98fXyw@mail.gmail.com>
References: <20251119175124.48947-1-linux@fw-web.de> <20251119175124.48947-2-linux@fw-web.de> <fc5c9829-96fa-4028-a642-0792699e92a5@kernel.org> <ddad2f21-4853-41c9-acfb-1613f5000f0c@collabora.com> <CAL_Jsq+Zu14ojvNNjgOFWA40iaqYrgGQsrHNWraooOML98fXyw@mail.gmail.com>
Message-ID: <9C47E860-BE37-4EDF-8C9A-613CAE509053@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0RvG6joc3Y7jr8SCWNtx9fH/1gq5fy72CCgIRE7up/qQQJ9Z5sL
 ZElwrJuGZPlUDkmULsEq5bt9Nqe6+16LXDxCcx/wvJAvh7XRqQZzm9o+n2SWW7ZYWK3QxXz
 MEXAmMmpyuKSxdA/EVC2VV+XJ1Y1/b3hvBqviW8xSsIlWUJu2orw7t5+eSYlU+NIFr8Sope
 YmXwAh8O/8L/hwf4XvtJQ==
UI-OutboundReport: notjunk:1;M01:P0:1HE+xtfe7LY=;NLlNljx21TMNixA1Y/voQxCyTwV 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_074232_396782_08AF9405 
X-CRM114-Status: GOOD (  13.17  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 5=2E Dezember 2025 14:46:45 MEZ schrieb Rob Herring <robh@kernel=2Eorg>:
>On Fri, Dec 5, 2025 at 3:05=E2=80=AFAM AngeloGioacchino Del Regno
><angelogioacchino=2Edelregno@collabora=2Ecom> wrote:
>>
>> Il 05/12/25 09:10, Krzysztof Kozlowski ha scritto:
>> > On 19/11/2025 18:51, Frank Wunderlich wrote:
>> >> From: Frank Wunderlich <frank-w@public-files=2Ede>
>> >>
>> >> Build devicetree binaries for testing overlays and providing users
>> >> full dtb without using overlays=2E
>> >>
>> >> Suggested-by: Rob Herring <robh+dt@kernel=2Eorg>
>> >> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> >> ---
>> >> resend of
>> >> https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/202406=
08080530=2E9436-2-linux@fw-web=2Ede/
>> >> due to discussions here:
>> >> https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/202511=
17211306=2E725678-1-robh@kernel=2Eorg/
>> >>
>> >> changes:
>> >> - updated sd-nand with sata-overlay
>> >> ---
>> >>   arch/arm64/boot/dts/mediatek/Makefile | 21 +++++++++++++++++++++
>> >>   1 file changed, 21 insertions(+)
>> >
>> >
>> > This looks like still not being applied and now it is a warning in
>> > Linus' tree=2E
>> >
>> > Can this be applied and sent as fixes?
>
>There's still one warning remaining after applying this series which I re=
ported:
>
>scripts/Makefile=2Edtbs:20: =2Edtbo is not applied to any base:
>mt8395-radxa-nio-12l-8-hd-panel=2Edtbo
>
>It's fixed in my original patch=2E Can you all take that and drop the bpi=
 hunks=2E

Sorry, missed this part and i do not have this board,so
I'm not sure if this should be applied this way=2E
But if it helps i can separate it from robs patch and send tomorrow=2E

>FWIW:
>
>Acked-by: Rob Herring (Arm) <robh@kernel=2Eorg>


regards Frank

