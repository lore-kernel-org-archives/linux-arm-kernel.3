Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD640CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BB/+/+uzygItZXtBxPYboOzj4LWbesHHWPiF5RM+9Rk=; b=ddCcho4zSyPYcDY8Is3LM5ScPR
	8Y5mvplzMbaXNwpS+XF3a4i+d1bnzWSaHqHYSugStEdE6WOVHZTHO4c5AaMlRrdP9iJttZhtQDOAI
	yCeiMSPySezHPRSQLqsWOOIWJN9sfmTQWdDjaLrvpCNQXIe3I7cTN9z8OFFPmf8IZBUsRHwPTQz+9
	v6Y67nvPyTM6CBMELfCglM1M497Sjh2/3+jidHo77zPyhjMMnRyzhmPJt546Ewk3Bl4ri1JiMUjcB
	QX9uwurOd1siVT7zHyXZm4BWXha+UTI4tXXnCmIOT6h9vuIZvWFoLLpnzVeUZAguIOWlc3krgxJ/n
	i3L4Ivng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCns8-0000000Bqz1-3Ni0;
	Sat, 25 Oct 2025 23:40:32 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCns6-0000000BqyF-0HAW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 23:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761435624; x=1762040424; i=wahrenst@gmx.net;
	bh=BB/+/+uzygItZXtBxPYboOzj4LWbesHHWPiF5RM+9Rk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Fo79xAPcGukEOXqsVTZ0qyfzX2sMlpD+eE1jQZBjgC04GpA7GiXIVCYTpEH3M9ac
	 rIgAC/0ehPdEBHRo2HE1x7SxtRgZPp/zBMjGkBmuESFfHxxc8+0clEKSpsGe1qkGJ
	 wjW7giwhLBS/QRDmI+Xk3/JLC5T5rIy7T/vIKsDrU353rfbxsA7CdFBjG6t3rY5JS
	 qUyWlRr/z4cssC6V3mH0WjWUIIy8gIyFIajJNd91+cLRtLUuG5JEYVOknkZC33yxS
	 kmh7wI7BfWCLtUewhBS870pZxwDO4ArRG5SGECY3gdeoDJkf+taqvDDNR/n9fgdRL
	 jbjiR9LqrXbsA7qNOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.217.223]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1ujKTw4C5f-00TD5h; Sun, 26
 Oct 2025 01:40:24 +0200
Message-ID: <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
Date: Sun, 26 Oct 2025 01:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd
 <sboyd@kernel.org>, kernel-dev@igalia.com, kernel-list@raspberrypi.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AomwFVPH8k52cvaqMwAENcM65sLpAIE+adE6LvE8Mi/go2jPFK2
 /4RMiyPOP9OzTF7ER94Z0Kxu6WeY2iBEpnoVTS/OtvrMNNspnBHFvye1UmkAlrDMTpWYkGV
 DMGoNYkSgTueyJUOE6eAxdcVsO9MAH6BQ1NjT24DBQ4ugoQk0z+ySBEX2YVEz0VI49/oCgo
 b1HWlvVhd9AkVAa0IQwDw==
UI-OutboundReport: notjunk:1;M01:P0:C4fWmBYWTtY=;oieDGYTyhTWA33z+SvrRlSMcFzD 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 28rTA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_164030_488408_F6E24AF1 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Mark,

Am 21.10.25 um 14:09 schrieb Mark Brown:
> On Sun, Oct 05, 2025 at 01:38:16PM +0200, Stefan Wahren wrote:
>> Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
>> when preparing/unpreparing") the clk-raspberrypi driver wasn't able
>> to change the state of the V3D clock. Only the clk-bcm2835 was able
>> to do this before. After this commit both drivers were able to work
>> against each other, which could result in a system freeze. One step
>> to avoid this conflict is to switch all V3D consumer to the firmware
>> clock.
> I'm seeing the GPU start to fail probing on the Raspberry Pi 4 in
> today's pending-fixes:
>
> # # v3d fec00000.gpu: probe with driver v3d failed with error -110
> # not ok 1 +platform:fec00000.gpu
>
> which bisects to this commit.  I'm not sure if that's just a preexisting
> issue which is now being properly detected or if it's an actual issue,
> I'm not testing the GPU at all so I couldn't tell you if it was actually
> working.
can you confirm that this issue is fixed by this commit?

module: Fix device table module aliases [1]

[1] -=20
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit=
/?h=3Dnext-20251024&id=3D9025688bf6d427e553aca911308cd92e92634f51=20

>
> Full log:
>
>     https://lava.sirena.org.uk/scheduler/job/1981716#L9006
>
> Bisect:
>
> # bad: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] Merge branch 'for-linu=
x-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
> # good: [6548d364a3e850326831799d7e3ea2d7bb97ba08] Merge tag 'cgroup-for=
-6.18-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgrou=
p
> # good: [8735696acea24ac1f9d4490992418c71941ca68c] spi: cadence-quadspi:=
 Fix pm_runtime unbalance on dma EPROBE_DEFER
> # good: [6b6e03106163458716c47df2baa9ad08ed4ddb0e] spi: amlogic: fix spi=
fc build error
> # good: [0b7d9b25e4bc2e478c9d06281a65f930769fca09] spi: airoha: fix read=
ing/writing of flashes with more than one plane per lun
> # good: [b508de5211652c439419cda7840feb3f22f75cd6] Merge tag 'scmi-fixes=
-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into arm/fixes
> # good: [03667191cbeb1a23c444c88b7c058dcbf2dd03f1] Merge tag 'ffa-fix-6.=
18' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux in=
to arm/fixes
> # good: [f43579ef3500527649b1c233be7cf633806353aa] spi: spi-nxp-fspi: li=
mit the clock rate for different sample clock source selection
> # good: [ee795e82e10197c070efd380dc9615c73dffad6c] spi: rockchip-sfc: Fi=
x DMA-API usage
> # good: [4092fc5f35cecb01d59b2cdf7740b203eac6948a] spi: dt-bindings: cad=
ence: add soc-specific compatible strings for zynqmp and versal-net
> # good: [18a5f1af596e6ba22cd40ada449063041f3ce6d4] spi: dw-mmio: add err=
or handling for reset_control_deassert()
> git bisect start 'b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d' '6548d364a3e=
850326831799d7e3ea2d7bb97ba08' '8735696acea24ac1f9d4490992418c71941ca68c' =
'6b6e03106163458716c47df2baa9ad08ed4ddb0e' '0b7d9b25e4bc2e478c9d06281a65f9=
30769fca09' 'b508de5211652c439419cda7840feb3f22f75cd6' '03667191cbeb1a23c4=
44c88b7c058dcbf2dd03f1' 'f43579ef3500527649b1c233be7cf633806353aa' 'ee795e=
82e10197c070efd380dc9615c73dffad6c' '4092fc5f35cecb01d59b2cdf7740b203eac69=
48a' '18a5f1af596e6ba22cd40ada449063041f3ce6d4'
> # test job: [8735696acea24ac1f9d4490992418c71941ca68c] https://lava.sire=
na.org.uk/scheduler/job/1948358
> # test job: [6b6e03106163458716c47df2baa9ad08ed4ddb0e] https://lava.sire=
na.org.uk/scheduler/job/1959348
> # test job: [0b7d9b25e4bc2e478c9d06281a65f930769fca09] https://lava.sire=
na.org.uk/scheduler/job/1962113
> # test job: [b508de5211652c439419cda7840feb3f22f75cd6] https://lava.sire=
na.org.uk/scheduler/job/1981616
> # test job: [03667191cbeb1a23c444c88b7c058dcbf2dd03f1] https://lava.sire=
na.org.uk/scheduler/job/1980576
> # test job: [f43579ef3500527649b1c233be7cf633806353aa] https://lava.sire=
na.org.uk/scheduler/job/1948241
> # test job: [ee795e82e10197c070efd380dc9615c73dffad6c] https://lava.sire=
na.org.uk/scheduler/job/1927696
> # test job: [4092fc5f35cecb01d59b2cdf7740b203eac6948a] https://lava.sire=
na.org.uk/scheduler/job/1911635
> # test job: [18a5f1af596e6ba22cd40ada449063041f3ce6d4] https://lava.sire=
na.org.uk/scheduler/job/1930414
> # test job: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] https://lava.sire=
na.org.uk/scheduler/job/1981716
> # bad: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] Merge branch 'for-linu=
x-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
> git bisect bad b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d
> # test job: [2878351f8275c49fc809cbf6490a4a2e05cd360d] https://lava.sire=
na.org.uk/scheduler/job/1982267
> # bad: [2878351f8275c49fc809cbf6490a4a2e05cd360d] Merge branch 'driver-c=
ore-linus' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/=
driver-core.git
> git bisect bad 2878351f8275c49fc809cbf6490a4a2e05cd360d
> # test job: [ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6] https://lava.sire=
na.org.uk/scheduler/job/1982733
> # bad: [ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6] Merge branch 'for-next=
' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
> git bisect bad ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6
> # test job: [40efeb7008e820c09532760b0aa07f327a5eaa4f] https://lava.sire=
na.org.uk/scheduler/job/1983168
> # bad: [40efeb7008e820c09532760b0aa07f327a5eaa4f] Merge branch 'arm/fixe=
s' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> git bisect bad 40efeb7008e820c09532760b0aa07f327a5eaa4f
> # test job: [70b154f7b68ac0df0abdc242462856ef58cd50a3] https://lava.sire=
na.org.uk/scheduler/job/1983459
> # good: [70b154f7b68ac0df0abdc242462856ef58cd50a3] Merge branch 'mm-hotf=
ixes-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good 70b154f7b68ac0df0abdc242462856ef58cd50a3
> # test job: [bc16536fee96bae9ed573dfcc6d455775682f041] https://lava.sire=
na.org.uk/scheduler/job/1983942
> # good: [bc16536fee96bae9ed573dfcc6d455775682f041] Merge branch 'fixes' =
of https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
> git bisect good bc16536fee96bae9ed573dfcc6d455775682f041
> # test job: [2f3471cc5d4179811a2c15675ea278d348d30d73] https://lava.sire=
na.org.uk/scheduler/job/1984071
> # bad: [2f3471cc5d4179811a2c15675ea278d348d30d73] Merge tag 'arm-soc/for=
-6.18/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into=
 arm/fixes
> git bisect bad 2f3471cc5d4179811a2c15675ea278d348d30d73
> # test job: [d2dc8a386a906bc120fda82207e291244e73d292] https://lava.sire=
na.org.uk/scheduler/job/1984278
> # bad: [d2dc8a386a906bc120fda82207e291244e73d292] Merge tag 'arm-soc/for=
-6.18/devicetree-fixes' of https://github.com/Broadcom/stblinux into arm/f=
ixes
> git bisect bad d2dc8a386a906bc120fda82207e291244e73d292
> # test job: [4adc20ba95d472a919f54d441663924e33c92279] https://lava.sire=
na.org.uk/scheduler/job/1984408
> # bad: [4adc20ba95d472a919f54d441663924e33c92279] ARM: dts: broadcom: rp=
i: Switch to V3D firmware clock
> git bisect bad 4adc20ba95d472a919f54d441663924e33c92279
> # first bad commit: [4adc20ba95d472a919f54d441663924e33c92279] ARM: dts:=
 broadcom: rpi: Switch to V3D firmware clock


