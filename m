Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EEACCD1AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX/GfPS0In2iRprrP0cHPXakAWNuzZBuSJ5qRJoflf8=; b=LMNOnhJeeQ+2KG4m+in2b2+s0h
	oLVyUXbrGaaOJOotARMKP+UgYX/8OPaDoLaENkedETG0tOYS2lwPvTYO6/ym+XPoBoVxLTUgHFdP3
	CgfGA+ic5aFpQvRw9AbEe3HhqTMxz/7uRgCzu/5vurdkzxD5vDRhf4YWxCSmIn6/sdl7qGjPWxt6O
	GDD5LktvTNwEWd0twpw0GgxfxUJSdO9ocZHs3w9e8uhOHpJIdb/ZUr67CBEtKxUTWOy3vGBzxsFGg
	vuziHiIY2IhAbzUA8BJ3Sd01mqp81n5CroJGm3DDFG6MCOif9qd0hvTeavBwYZkF7bM3skEh7xKp7
	z4V2B1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHFK-00000000N4g-1IhJ;
	Tue, 21 Oct 2025 18:38:10 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHFG-00000000N3f-2ful
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 18:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761071880; x=1761676680; i=wahrenst@gmx.net;
	bh=LX/GfPS0In2iRprrP0cHPXakAWNuzZBuSJ5qRJoflf8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Spwm7MoGL2TQTJf+PN01UFpy8ji6aZN7r+LJ0rAV5Z3gD6zpZGxG3HiiNgzi69Hn
	 b7ITN+0Iq66oRXPYyxVSSJpCd7yXKDufIZp5QmX8+i0iVAJLNnsPLsrp7gftYP6G2
	 98PUAI43x7ZSOzd7qRQkVVXpKrZQy/OlzigANvHQUobch4FCz+yPa/uBn6unCLL2b
	 qWzFs50PDCvDi0eb2KQI89zIeJK8vxkjuwxeKCBluHvUAgIfqsYmpLP3ATEvzY29n
	 qdCi2/lmYEBicen4zwXVqt/yoynVnJJ/1axfVorIroIqO9jvaFOTwV9rlrTz3KhaR
	 OaAb2GFOso/femoQgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.217.223]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIMbU-1ux02u07jo-003CHS; Tue, 21
 Oct 2025 20:38:00 +0200
Message-ID: <2d999f66-1dbd-440b-b5dd-31608e5d8e8b@gmx.net>
Date: Tue, 21 Oct 2025 20:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Wahren <wahrenst@gmx.net>
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
In-Reply-To: <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f6jIKQ2t9frIcEG4qbiArvXgNiCEqzGLcipBbPYHpXP/OUadC68
 ecWTbKtpTre2RaCzkYb65lArZFtZDbOjeboOdfLVX/iQRUJ1whYb/EA2uXQBdNOj7voRbiN
 7ZedJwztFYKkjNKv5MecnpRtENChxLJrM+7uNw1xRNlCW5acj2uJFkOTwx2WKVIxhOWfWQs
 4AviWVyN+YKspObOY/uDg==
UI-OutboundReport: notjunk:1;M01:P0:kkP2qcJlkA4=;XFRK5LGBtxAXEmnfGSTRVSDeoNS 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 DuTOx13xrwxML3tzSFNOXc9Xyw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_113807_036548_471E8ED5 
X-CRM114-Status: GOOD (  17.88  )
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
thanks for your report. At least I'm able to reproduce this issue with=20
current linux-next (arm64/defconfig). There seems to be more driver=20
affected by this issue and it doesn't look trivial. So it might take=20
some days to analyze and fix, because I'm on business travel.

Best regards
> Full log:
>
>     https://lava.sirena.org.uk/scheduler/job/1981716#L9006
>
> Bisect:
>
> # bad: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] Merge branch 'for-linu=
x-next-fixes' ofhttps://gitlab.freedesktop.org/drm/misc/kernel.git
> # good: [6548d364a3e850326831799d7e3ea2d7bb97ba08] Merge tag 'cgroup-for=
-6.18-rc2-fixes' ofgit://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
> # good: [8735696acea24ac1f9d4490992418c71941ca68c] spi: cadence-quadspi:=
 Fix pm_runtime unbalance on dma EPROBE_DEFER
> # good: [6b6e03106163458716c47df2baa9ad08ed4ddb0e] spi: amlogic: fix spi=
fc build error
> # good: [0b7d9b25e4bc2e478c9d06281a65f930769fca09] spi: airoha: fix read=
ing/writing of flashes with more than one plane per lun
> # good: [b508de5211652c439419cda7840feb3f22f75cd6] Merge tag 'scmi-fixes=
-6.18' ofgit://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux =
into arm/fixes
> # good: [03667191cbeb1a23c444c88b7c058dcbf2dd03f1] Merge tag 'ffa-fix-6.=
18' ofgit://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux int=
o arm/fixes
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
> # test job: [8735696acea24ac1f9d4490992418c71941ca68c]https://lava.siren=
a.org.uk/scheduler/job/1948358
> # test job: [6b6e03106163458716c47df2baa9ad08ed4ddb0e]https://lava.siren=
a.org.uk/scheduler/job/1959348
> # test job: [0b7d9b25e4bc2e478c9d06281a65f930769fca09]https://lava.siren=
a.org.uk/scheduler/job/1962113
> # test job: [b508de5211652c439419cda7840feb3f22f75cd6]https://lava.siren=
a.org.uk/scheduler/job/1981616
> # test job: [03667191cbeb1a23c444c88b7c058dcbf2dd03f1]https://lava.siren=
a.org.uk/scheduler/job/1980576
> # test job: [f43579ef3500527649b1c233be7cf633806353aa]https://lava.siren=
a.org.uk/scheduler/job/1948241
> # test job: [ee795e82e10197c070efd380dc9615c73dffad6c]https://lava.siren=
a.org.uk/scheduler/job/1927696
> # test job: [4092fc5f35cecb01d59b2cdf7740b203eac6948a]https://lava.siren=
a.org.uk/scheduler/job/1911635
> # test job: [18a5f1af596e6ba22cd40ada449063041f3ce6d4]https://lava.siren=
a.org.uk/scheduler/job/1930414
> # test job: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d]https://lava.siren=
a.org.uk/scheduler/job/1981716
> # bad: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] Merge branch 'for-linu=
x-next-fixes' ofhttps://gitlab.freedesktop.org/drm/misc/kernel.git
> git bisect bad b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d
> # test job: [2878351f8275c49fc809cbf6490a4a2e05cd360d]https://lava.siren=
a.org.uk/scheduler/job/1982267
> # bad: [2878351f8275c49fc809cbf6490a4a2e05cd360d] Merge branch 'driver-c=
ore-linus' ofhttps://git.kernel.org/pub/scm/linux/kernel/git/driver-core/d=
river-core.git
> git bisect bad 2878351f8275c49fc809cbf6490a4a2e05cd360d
> # test job: [ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6]https://lava.siren=
a.org.uk/scheduler/job/1982733
> # bad: [ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6] Merge branch 'for-next=
' ofhttps://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
> git bisect bad ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6
> # test job: [40efeb7008e820c09532760b0aa07f327a5eaa4f]https://lava.siren=
a.org.uk/scheduler/job/1983168
> # bad: [40efeb7008e820c09532760b0aa07f327a5eaa4f] Merge branch 'arm/fixe=
s' ofhttps://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> git bisect bad 40efeb7008e820c09532760b0aa07f327a5eaa4f
> # test job: [70b154f7b68ac0df0abdc242462856ef58cd50a3]https://lava.siren=
a.org.uk/scheduler/job/1983459
> # good: [70b154f7b68ac0df0abdc242462856ef58cd50a3] Merge branch 'mm-hotf=
ixes-unstable' ofhttps://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good 70b154f7b68ac0df0abdc242462856ef58cd50a3
> # test job: [bc16536fee96bae9ed573dfcc6d455775682f041]https://lava.siren=
a.org.uk/scheduler/job/1983942
> # good: [bc16536fee96bae9ed573dfcc6d455775682f041] Merge branch 'fixes' =
ofhttps://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
> git bisect good bc16536fee96bae9ed573dfcc6d455775682f041
> # test job: [2f3471cc5d4179811a2c15675ea278d348d30d73]https://lava.siren=
a.org.uk/scheduler/job/1984071
> # bad: [2f3471cc5d4179811a2c15675ea278d348d30d73] Merge tag 'arm-soc/for=
-6.18/devicetree-arm64-fixes' ofhttps://github.com/Broadcom/stblinux into =
arm/fixes
> git bisect bad 2f3471cc5d4179811a2c15675ea278d348d30d73
> # test job: [d2dc8a386a906bc120fda82207e291244e73d292]https://lava.siren=
a.org.uk/scheduler/job/1984278
> # bad: [d2dc8a386a906bc120fda82207e291244e73d292] Merge tag 'arm-soc/for=
-6.18/devicetree-fixes' ofhttps://github.com/Broadcom/stblinux into arm/fi=
xes
> git bisect bad d2dc8a386a906bc120fda82207e291244e73d292
> # test job: [4adc20ba95d472a919f54d441663924e33c92279]https://lava.siren=
a.org.uk/scheduler/job/1984408
> # bad: [4adc20ba95d472a919f54d441663924e33c92279] ARM: dts: broadcom: rp=
i: Switch to V3D firmware clock
> git bisect bad 4adc20ba95d472a919f54d441663924e33c92279
> # first bad commit: [4adc20ba95d472a919f54d441663924e33c92279] ARM: dts:=
 broadcom: rpi: Switch to V3D firmware clock


