Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A29C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jq6fh3uaqWlLcsUsKG9lBjftr3yW7KpXO+JuhvHERfw=; b=4EuA9P6c4FbADibNXSkbW4SkUj
	fps1dV3qpRzFU+j7VPuPMu6hNXK4330IazyPDUic7ddz4Wlv4N6exWK5VuWUK4K2hPqs2kxBg9FPj
	gqqd+y+G+XtQ/NEh0fVNEwZENk07bH64cogIDZL2Pr9ZpWR1g6qoF/UeFDEcoOeMJbRb46L+KBRDM
	rVYx5L//7adXrThb56JFBoX1/+9yNYoDaIUE4x9s5TSzvXOGCy4jXBVxOfQcQYsyOT1S7pKwdmEH6
	LQUiiW4FGELXairdRoldwj0VuKqPNMbYPSs81HaCmhgcIHAPknMUc3OtB8ejICz/Hvlb4txS4jE5v
	Qnnq/UOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cxu-00000000Sis-22pz;
	Thu, 03 Sep 2026 19:19:14 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cxr-00000000Sd6-2Bgu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1788463142; x=1789067942; i=wahrenst@gmx.net;
	bh=jq6fh3uaqWlLcsUsKG9lBjftr3yW7KpXO+JuhvHERfw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fc7wbEOYwvLCsOuQV/w54JsxIfNPON7YI3PKEUC32ZALGLn5LA+kWKueXOwVBba2
	 dWSTxGf5dg55PZKwac+OLNvsaJdTMd0b16amZOFyhzFnzGqtP+jF/sAZc3+VmrhX9
	 QM8btjIxxtqoJya2g+ySR8DXGJjd0Lf50AsmX3tVUK1bDvFrCAXicB7dLSXugeMNl
	 HnSxDEle49oeqwD7kv4GPVE86/mdObrks2wYUk9zOcXJTYn+ZvDFhb3mxYPEUgEmF
	 PgZ/Got5yCrzphJFeLY82O22K+ZSQ8pu0h8f3RTu6eDUpOxn5EPQJ129Crwow2Rso
	 yp4OmorNmM1rKE/Lmg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1xHFwV2WFt-00HtGE; Thu, 03
 Sep 2026 21:19:02 +0200
Message-ID: <e661adf9-626d-4b76-9f2a-dc363e5bea26@gmx.net>
Date: Thu, 3 Sep 2026 21:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
Subject: rpi: suspicious log messages from vc4_hdmi & raspberrypi-power
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g5eq/T+97uT7+6HsKmJXlX2SVFgZGPCIysGp1eqijmSjg104MuL
 HxTiLgLUX4ygmjakBU4EUbfAFk0ettB2zB0EZLjKmed1tfgalHqNyCxmntoF0P14Ma0XIZv
 QpueY7kGgYQtigrsYDkTrs4h2kCgRaabqHGZN1L+I3XHWZZlbPWC8Gg9dk3hRMo0XGCHTVD
 lLm7DU9Bwx7QOdDVlav+Q==
UI-OutboundReport: notjunk:1;M01:P0:0J7cbHP8Pts=;0uvhnPJxNi4vdnzFW1U44GchXCF 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 hmhcsJEgs5dsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121911_868734_FB7EB2B3 
X-CRM114-Status: UNSURE (   6.43  )
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

Hi,
while testing my old Raspberry Pi 3 B Plus with a mostly recent mainline=
=20
kernel, I noticed some suspicious messages in the log, which are new to=20
my eyes:

[=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x0
[=C2=A0 =C2=A0 0.000000] Linux version 7.2.0-14759-gf6ce17b2c3b2 (stern@sc=
henker)=20
(arm-linux-gnueabihf-gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0, GNU ld=
=20
(GNU Binutils for Ubuntu) 2.42) #60 SMP Thu Sep=C2=A0 3 20:31:50 CEST 2026
[=C2=A0 =C2=A0 0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7=
),=20
cr=3D10c5383d
[=C2=A0 =C2=A0 0.000000] CPU: div instructions available: patching divisio=
n code
[=C2=A0 =C2=A0 0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT ali=
asing=20
instruction cache
[=C2=A0 =C2=A0 0.000000] OF: fdt: Machine model: Raspberry Pi 3 Model B Pl=
us Rev 1.3
...
[=C2=A0 =C2=A0 0.619485] raspberrypi-firmware firmware:rpi-firmware: Attac=
hed to=20
firmware from 2024-05-24T15:31:28
...
NEW [=C2=A0 =C2=A012.637746] raspberrypi-power firmware:rpi-firmware:power=
:=20
sync_state() pending due to 3f806000.vec
NEW [=C2=A0 =C2=A012.645164] raspberrypi-power firmware:rpi-firmware:power=
:=20
sync_state() pending due to 3f902000.hdmi
NEW [=C2=A0 =C2=A012.652442] raspberrypi-power firmware:rpi-firmware:power=
:=20
sync_state() pending due to 3fc00000.v3d
...
[=C2=A0 =C2=A028.835362] vc4-drm gpu: bound 3f400000.hvs (ops 0xbf2c6984)
NEW [=C2=A0 =C2=A028.839062] vc4_hdmi 3f902000.hdmi: DTS/ACPI name 'rx' no=
t found,=20
legacy failed (-19)
...
NEW [=C2=A0 =C2=A028.879525] vc4_hdmi 3f902000.hdmi: Could not create devi=
ce link=20
to hdmi-audio-codec.1.auto
...
[=C2=A0 =C2=A028.889098] input: vc4-hdmi HDMI Jack as=20
/devices/platform/soc/3f902000.hdmi/sound/card0/input2
...
[=C2=A0 =C2=A028.901895] vc4-drm gpu: bound 3f902000.hdmi (ops 0xbf2c3fb8)
[=C2=A0 =C2=A028.902040] vc4-drm gpu: bound 3f806000.vec (ops 0xbf2c6498)
[=C2=A0 =C2=A028.902164] vc4-drm gpu: bound 3f004000.txp (ops 0xbf2c7720)
[=C2=A0 =C2=A028.902240] vc4-drm gpu: bound 3f206000.pixelvalve (ops 0xbf2=
c20ec)
[=C2=A0 =C2=A028.902323] vc4-drm gpu: bound 3f207000.pixelvalve (ops 0xbf2=
c20ec)
[=C2=A0 =C2=A028.902394] vc4-drm gpu: bound 3f807000.pixelvalve (ops 0xbf2=
c20ec)
[=C2=A0 =C2=A028.911383] vc4-drm gpu: bound 3fc00000.v3d (ops 0xbf2c7c54)

Is it worth to investigate or expected?

Best regards

