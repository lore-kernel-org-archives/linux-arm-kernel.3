Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035C6FD5326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osg/KBiSHPE8q8+l4cSGrjz/3ljFNSwcPbponOZHnUQ=; b=FRvZQ/k8dEa9yLlAlEkNl+7C6S
	lTPRN2hWblyvvJXJO9FFDagjKqvMtXdtBfvR8f65c3EuQzuXEyQ+TzfPr+X+KUe7Sgwrli279Hp2p
	soufCnm5MW8y4UHiQX2Hu522Ba4iDc4Pk1skubpw0vlYkLahYtH29IONX6F4pLFfhWs27mtpDa3Bn
	EKdu/gyxGdVb0TWsNk0LOcllLQlYT5lfP/iLGqP75g5Qok6DRU5V6snZf03Ft+OzZ0dCWMg+kxzpD
	gznyeWqF+EN3qAZBcR1c4dec6Wsr/v/sr9340C5+qZi26Kpgbu1l44le5/iSuGhecyglSyfnVKkJD
	7Ub1V2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXK-00000008B6a-1KDO;
	Fri, 27 Feb 2026 09:53:30 +0000
Received: from mout.perfora.net ([74.208.4.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXH-00000008B3k-40Et
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1772185987; x=1772790787; i=marcel@ziswiler.com;
	bh=osg/KBiSHPE8q8+l4cSGrjz/3ljFNSwcPbponOZHnUQ=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MMiK2rh7VsX/zoQ4o0NwOJ6xEki7pxvTLDTlGiu+E2vFCNObT8kp7VJPwAZEaz/8
	 Ogu3VZbkBObF8SnoiRN843KRe3xbCQwr3/fQmjlK+rq4H0utQhBJI25I8LOmtL+fo
	 KurhjelHnxlNVM78cxaGejN9Nfh3PiiaVBsol942Dk255FsGuSiza0Ge40+MzOsGt
	 tMhxDG6S5pOMZiIhWXjZ/YFizFS44HtyN2jkFV75kDeQeACNCqoP75HdY7F1EF+5W
	 XGOQcaYmZ+aOAIZD/W8P5ZK0AWmF0fGKaEwTlYMh6w7L58a3AMOD+W3gkrZYoDhXQ
	 rqotraS1FQPRnAyVQA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus004
 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N4965-1vVGqJ3eDp-00rOlj; Fri, 27 Feb
 2026 10:53:07 +0100
Message-ID: <e2130fa8e18cdffb9be9426a8576e67675e87d55.camel@ziswiler.com>
Subject: Re: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700 eth1 RX
 sampling timing
From: Marcel Ziswiler <marcel@ziswiler.com>
To: =?UTF-8?Q?=E6=9D=8E=E5=BF=97?= <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com, 
	dongxuyang@eswincomputing.com, ganboing@gmail.com,
 pritesh.patel@einfochips.com
Date: Fri, 27 Feb 2026 10:52:55 +0100
In-Reply-To: <6137cd6a.4859.19c97f5eb67.Coremail.lizhi2@eswincomputing.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
	 <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
	 <6137cd6a.4859.19c97f5eb67.Coremail.lizhi2@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:P7rtaATGEKMWJFkzUg8ddjiTxi9RHPpZ3eAD8g5GykxXsfTcBTX
 8RXzCrhmAc5Vm8vo5y1jI0txTBr30Z6MJfl46iwascAdegNwXLF6TXOAfQRWSJB2uYY9XWl
 dt0tvp3HLYBjkGuG+00bNoMDBoNn6gZOOikO9YDx/ihQDYDOvNeLt1z5PGKPi6KVwwkcFPm
 LWc7lQqLeeV8Xby4TQxWQ==
UI-OutboundReport: notjunk:1;M01:P0:2aAsh0z8eO8=;1a+V6iI+Ks1SBDduFZaoA6b5djK
 3pmbvM9EWtriNKuicZvUI5AmVvd43284UVoaevjgNUSBPV36nB/7mxc4eDlCNUQph6dxQBuL4
 Ycr7eQJ3QSN/K1dZWCLtJS7fpXwBqChlRTXKqxA4t98XyQm8q7Jx6JC6GIqNhEdJqLCoSmQZi
 Cz+LKAK/hiCEw64OQ3l5Va8JXMmJX26a1U/WFux48O7/DghTcf+FifcEZm9OMWSwDPJ0WRCDh
 qvNsQUaVuFKusDrGC4ltb74acVwQNNhNhB8AX9J+aXXqOXvqqMEG3Uo91o2TO1pmniqju+K7Q
 RF6MqFY6yjVm1lqRpCa2TVySqtHmNjuQl7HyQR8M9XZvBwyKclpp65eIOD82kSxNwsKZAPAkx
 0/GfQhgkZ3nsRHyT4ASlDcsjUMG55SHMRwHb52IK63UlJ0eVpsE2G26wz3k+om0Ulr/5YsRJB
 ZZmRCXUzEHScAJ04gd0yctOGhg6+AsDAip0DYXuJDoB64TvmEyWO0XkowXdomVbatX6yo82aw
 nFAagbtvHoO97AIxgo9VfhMP6Rg6fe/UI5wMZHTKgiPVfHoxF7MMy4U0NfZu1+VpZ5jYjTJbx
 0Mm8j01Qofo8rWpK1uhfgmd0M/6LWN7EFbXMCdBXLprG+YmSsx8boRWLSC1vJ3GsxsKgn06kp
 ZzqmMZybqoXexY+y+lyGbJxB+iuLsd2EdFcqg+dP25wC8i+LlhSWizYouAdZ7lbVTxaA98zKp
 RBzcvMXZGNT6j+Ix/2fxK48YwJz1dIWlrX/UY+Un32ifhY8YWFkpbX5u+e+6zz3yJD6D3cTMu
 uve9lbYVnFJ7swcfR7wEeryrSsf3BGfuukHBtk8IBVD7fq9Bg+3uOfkRERtwFqjjGOm64Kmk+
 E+AHKM5pF2K6tRCIOCTQRHSIaCLTXPyvYlpBXgZaZRjyx08Tm4J1jk97kedDU1Zt9LKOpFUJz
 r+Nctqrgtyju+cZRQgZlYP3drW8xusEQJ3d06xXIGT3ahI28N1Ynwvt7XCPYQWFk6bLTs7Stj
 EnyklIa4U53kIYpwZPS7btQtE+N9WKZMcqqq9vL2FFnv0yZPIlm9W+55A6dVkRKFIr8HsCeIu
 vu5gw5PFZepe3GluE+HAm2pOmk5zo9NCan+CxkELxxOGNkkqthGnmY5+/eW5q/qpX12WWSmKX
 hPHw15Q0jC/de4zYcu8jpPdaJVk9OLkhRDejDs7RjQg9x0YOq8k6k83UJ/STzVlIrIuzYQnvo
 luAkUvfUV/H8bfJoZFAj22atQ0zm/CqPn2TiTLA99oNO3sTszglfC+HzFTw5nITzPO3He/ezm
 8v/bnaKh6/yckOWDcdqZkabQIPqgMAlGTkkzDc6jtZMsvgbv6WjpKjLsmq2/9n/+gjYG+SL9a
 kJFNkTNKrDGAuoLadQBVy5tWXjX/VqeLdxMqe0HZ++uxRekNsWx+5voj923XXmqjtWf2iAk0X
 7BQNPIli40Q496UTNbaveeD72ZwwF928ZWCDL/pvluaB+th+j5Q46HKdwlDTHUoXlcGPMK5JW
 illTnRP1btSRPCvmqBYME/DqAKzf7p8nuo+V4cbusgIuNXDcVE93w9GU0Wz17PjDfCV0VKA9T
 /AexslfP3O1GIlgRatK8Gy2hMa/XC/JV7IVwH3jF6DNaSiDWfqoF/1BfmugAyGspAsVs2us+5
 GjBoFUeyerviIjGb0QUzO3momKUvOReMVhff5aUXonxsyHZ+zYRcVr/XUAjZmjwz+ZX5V0VFT
 b17rImpNxujZUwSAlRyh5jfQANiMCGFcgYFwOMe9MEebeIaiURsnatGQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015328_211400_468833A3 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Zhi Li

On Thu, 2026-02-26 at 11:20 +0800, =E6=9D=8E=E5=BF=97 wrote:
> Hi Marcel,
>=20
> Thanks for sharing the details.
>=20
> 1. I checked your log and noticed that the kernel cmdline already include=
s
> =C2=A0=C2=A0 "clk_ignore_unused". Therefore, your issue does not appear t=
o be the
> =C2=A0=C2=A0 same as the one previously reported by Bo Gan.

Yes, that actually came from ESWIN's hifive-premier-p550_defconfig which I =
disabled now.

> 2. I also verified that v6.19.2 already contains the two eMMC fix patches=
:
> =C2=A0=C2=A0 https://lore.kernel.org/all/CAPDyKFqcMyM-=3Dx+2FWNLhHY=3Dgu5=
ApHNPQhp0xBKDJGr7BhEx4Q@mail.gmail.com/
> =C2=A0=C2=A0 https://lore.kernel.org/all/CAPDyKFrkEZDuMbGpfxismcx=3DvJkSS=
K_XbtB762+sUFocupT63w@mail.gmail.com/

Yes.

> =C2=A0=C2=A0 A likely cause is that the eMMC DTS node is missing the AXI =
clock definition.
> =C2=A0=C2=A0 Please refer to the DTS updates in the following pull reques=
t for reference:
> =C2=A0=C2=A0 https://github.com/eswincomputing/linux-next/pull/20

Ah, that one helped (;-p).

BTW: For CPU frequency scaling to actually work one may additionally need C=
ONFIG_RISCV_SBI_CPUIDLE=3Dy.

> 3. In addition, please check whether CONFIG_GPIO_DWAPB=3Dy is enabled in =
your
> =C2=A0=C2=A0 kernel configuration. Since GMAC is built-in by default, it =
depends on
> =C2=A0=C2=A0 GPIO being available during early initialization.

Yes, I also changed that from =3Dm to =3Dy (;-p).

> Hope this helps narrow things down. Please let me know what you find.

Yes, it all works now perfectly incl. CPU frequency scaling. See [1].

Next one would be working PCIe and USB. Unfortunately, for PCIe on EBC77 on=
e would likely need some sort of an
adapter cable/PCB. Maybe I can solder something together. Let's see...

Thank you very much!

[1] https://github.com/riscv/meta-riscv/pull/602

> Best regards,
> Zhi Li

Cheers

Marcel

> > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Marcel Ziswiler" <marcel@ziswiler.com>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2026-02-21 02:37:57 (=E6=98=9F=E6=
=9C=9F=E5=85=AD)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: lizhi2@eswincomputing.com, devicetree@vger=
.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
> > edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.o=
rg, conor+dt@kernel.org,
> > netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, a=
lexandre.torgue@foss.st.com,
> > rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com, l=
inux-arm-kernel@lists.infradead.org,
> > linux-kernel@vger.kernel.org
> > =E6=8A=84=E9=80=81: ningyu@eswincomputing.com, linmin@eswincomputing.co=
m, pinkesh.vaghela@einfochips.com,
> > weishangjuan@eswincomputing.com, dongxuyang@eswincomputing.com
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC770=
0 eth1 RX sampling timing
> >=20
> > Hi Zhi Li
> >=20
> > Sorry, to steal this thread, but I do have a quick question concerning =
Ethernet on the EIC7700. Every time
> > I
> > enable gmac0 in the device tree my EBC7700 stops booting (e.g. SD card =
is no longer detected) while
> > Ethernet
> > does seem to at least get detected. This has been seen using next-20260=
219, stable v6.19.2 [1] as well as
> > 6.18.0-rc6 [2]. Any idea what could be going wrong?
> >=20
> > I admit so far I only do have one single EBC7700 at hand while waiting =
for further hardware to arrive.
> >=20
> > Thanks!
> >=20
> > [1] https://github.com/riscv/meta-riscv/pull/601
> > [2] https://github.com/eswincomputing/linux-next/tree/dev/test-upstream=
-v6.18-rc6
> >=20
> > Cheers
> >=20
> > Marcel
> >=20
> > [snip]

