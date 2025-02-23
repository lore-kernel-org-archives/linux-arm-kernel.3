Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D4AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZDXKhTwAsTdWmNwWvCsW4dBHabuvPaPaUXGTXcf+Kk=; b=Ktra/VRts8N2FVFziYFYpmljYv
	rcyo+/FCgpxd/6K6aSAo55noW6LTZzSzx5cvHG3j2/bN1yOYc1kVePAaVbAxI/wvhb9UgFYxu4RLh
	ZRHjNdJbWjgEUAWPDOcI7xB6mUWCC8uCxFZPAGFjeUIuED1jiAhIcEIxq+zF5qQFnVZwHlpxIPW//
	GKGNWw0EFde15CGHDvCXZhRNUMD+c2+qouv8zvJI8PLJKmQHmb9UgYqhtkgg5hQYWwbaR8CpYY80V
	D5qJ+lnYt6cFuDIiHmKyrQWOgCtj1TL0SIsU1C8COwsgAz4a8a+lJBJ63GTVO4KM9a5bQhCQRNpgp
	KbVmV2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmJJm-0000000Bo1H-0qpm;
	Sun, 23 Feb 2025 21:15:18 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmJII-0000000Bnlk-141A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 21:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740345224; x=1740950024; i=wahrenst@gmx.net;
	bh=XZDXKhTwAsTdWmNwWvCsW4dBHabuvPaPaUXGTXcf+Kk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pWWp/55CJSndmRv5PHx+l8DHnYjh14mgYv5TJXpQccn5m7Ss9FH25Pf2VH9LAZgF
	 XHwi3yaIUZobgqjsQxKdS9BVkZr7ZO2MJEnrM5x9m5dXdPPTu5cfm5skAmjmZ3EY8
	 bxc1ulJ2Gzo2/0RTlOj8oeaN4SxPk1nRRRf+cc79HCAGL9ZwqzU7u9WWUpCOMUyLE
	 cidPguOvDVDPMFWQ39BgXvdK2ASaejGo3vFC08eQPPT/l2n3xKRdh1FGay0J6wKZd
	 a12chO61w4Ra7Lc551EzLQaPQ4v8X51GxZZ8sWPa+o8/Jyyt2YQaZmR7Joc1FnReW
	 NaxRkbOJB+mXJIymeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Ue3-1tfRXi3du5-003QMJ; Sun, 23
 Feb 2025 22:13:43 +0100
Message-ID: <32deb7f1-a155-4cd8-b00a-048676a60c0b@gmx.net>
Date: Sun, 23 Feb 2025 22:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: bcm2711: Don't mark timer regs unconfigured
To: Phil Elwell <phil@raspberrypi.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org
References: <20250222094113.48198-1-wahrenst@gmx.net>
 <5ab95f85-9a91-4bbc-8eef-299376ab46f2@kernel.org>
 <CAMEGJJ04D-LJ5=NdYYu=8Dfsy+mb0sQpL6n_pT+DAcyKAiPyvw@mail.gmail.com>
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
In-Reply-To: <CAMEGJJ04D-LJ5=NdYYu=8Dfsy+mb0sQpL6n_pT+DAcyKAiPyvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xLfENJY+bNTRHJcJ9Svd+mnb6wcFGfwwOP/QJ+owuO5tewx/dCo
 pg6y1zyAcGrbN06fNo7S+YzkIOmnPG6dNWWrhlCNZx/owKq4FGbwGs2E+zeYVDWb5dtfF6t
 TtuvVUgN6gPunDmbgqZc84oqKVYDJonBImo8RXJUYxWoMld/yxBLAguv7ZwMEhizvK3w4M2
 l1VFT8HoJ+phXbADKydGA==
UI-OutboundReport: notjunk:1;M01:P0:AxeeNlHYTSM=;6OgijR+JVVwXAKykImkIETmC+KD
 pixqyklUQCaY/yBgtCJ6SI2M6+ZIm/5EkkMh6fz/VX3KHwuE9t7qDrX8Ot+x0CEDi/S3G2wvq
 /DKe1Fo7YMtMLKM00oVMQms94ESYg1Ugzw+KQi22o55EnfQPKNvH8VTws2ruYnTaydNb1g9KF
 Od/KFOwVGaKjZoEHfqIxILaQo24Lv8BgLEEKY/sB+b4dE0lYP98dp9guvJsqV6HK73PPQ1n7f
 mB0EiJsSijReYSSQ5cwxMv7myWbiRds0B01kuNsHEkjRwYyqBLPCCFztCociER6xMn3+0al0a
 7rc0LaDezacazm+kiEn19+RAdFUTs9WCpLWu8yUKH815qAFU8BOGZcvw3ZMQMzWKyqo8Qr2d2
 MYKXhdhuhKb70p7HP4jbatPeXCaf3LAEx/dxjL7AQKAcM4w0hbgs0tj/AZINs20QNJynYAgn1
 iAQDQHjrRyLcLaCiXaAAgijTj94G2eYWLo185MA0/X/N5J4sQOT1vJ1jH0O+2aIEH4M1V1Zqi
 ycF/KGXulzOL5ZX4d/b13B+6pf3YFb2nxuTzxFCx4tpzd07n7TdrXbcWpmpJxTYe69I0PwmV7
 jKTsgYOnP2QGjbB8tDe3AqkmGVYGboLEdDp0Gsr3v0mtbGo5aDm3YnlJEI6RpSZq3vlAtA3SR
 7pqeC1CHe98FrPCwgY5CTbzcwDLfjL9FX/yOdjk0I3izn8QmR+/SWoEeAq133ReVxdFeUhlu5
 TbHf6sJjlmx3I10IWpjq+M4lWyge7dpntbiLYkUi8MEXpYbAV8SEJA4PesbtyBlJGDZEcaDxG
 EHDtZaI4jPASP/3OSD3fnB/f/Nr9sLnCLAZNtKbmZ0JiV11yNDZOoh/3yoiZY397VJUTndZZd
 lBvpdLWsybinjrWhyAt+usjizFjDWFAKdasoVJcRIkaXznTfamsjAM1OtCzzf99Ha/cmnna5S
 zBqDPLt80lRjhFs2k9qll+7d1K2PntjtZYQ40M3D97lqFKrR5gYTLYjSslkgvLaxFB2vywmUc
 VTUja6dpOakvHgxLLchxZ/ex2QCiqR0Z+vgLLZMROF7o6EwvuARZXlMZvw1tUagvZF/RpYOZD
 VttbH+DwPFSj31Bd47s/lUe+lQ1tvMKIa6G/nSYa6PZ7tjUaUmA5CNCA8coThxpN2h4BJJCWX
 Naf7sEs3nWCMcWwpzjQ6IhrVGyg+8AO5sdIUxnVp14HUQmIICMe8uALjck3tChV8x2V9VQUa/
 LLuulo1RiUMP/wUqfwiI3Y7CPvafwZXoD2xu9CZ4Rhe7INy+GkME0rngCmbZQOaqPrAF6xvXT
 5iUmN1V6cpFiHL1fNRqDXUqzRoJMIKZT2g7yIKlUZyO5n/Bzso3umMkd1tMBW8tBqdi1HSo07
 pU/bflsPdFm5W/YjogNOrrROjH64n6IvgLpziDxYpU3zusl0hmxLoTseBGDtzkoypUkbO7kQI
 EbJGRMWHCaryMtSuCUXPwZj0saG+jAkHeAjxDHUGB4z6p1rq6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_131346_631061_93D399FF 
X-CRM114-Status: UNSURE (   9.56  )
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

Am 23.02.25 um 17:11 schrieb Phil Elwell:
> On Sat, 22 Feb 2025 at 10:44, Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
>> On 22/02/2025 10:41, Stefan Wahren wrote:
>>> From: Phil Elwell <phil@raspberrypi.com>
>>>
>>> During upstream process of Raspberry Pi 4 back in 2019 the ARMv7 stubs
>>> didn't configured the ARM architectural timer. This firmware issue has
>>> been fixed in 2020, which gave users enough time to update their syste=
m.
>>>
>>> So drop this property to allow the use of the vDSO version of
>>> clock_gettime.
>>>
>>> Link: https://github.com/raspberrypi/tools/pull/113
>>> Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> FYI, although the patch was written by me, the commit message has been
> completely rewritten.
Sorry, for mention this in the commit log, but i thought this was
necessary to explain why this property was accepted in the first place.

This is the original one:

https://github.com/raspberrypi/linux/commit/d06cb3534b6553a1f76bef2ddaf833=
e23dc12a4c

>
> Phil


