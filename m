Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D58C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztxpMMJFLLvR1oZapArlbuf/s3HpqOv3E90SpnFpTec=; b=ZBWxdJv5mP78RLcMu2d9gGG5JI
	1Gu1FplcvxoKOQWgWRp2DC4YaIcba2VFn+71XX33jMbqI1hHooRwsFIfk2HFaJUPivrNi1IJc4yrz
	zUA8DA94fOrFrspLviDYiiNfB/OULQm/i1KxmmKqQoCnvEfLAwPNmXUGdJGh4mKANDt1UrQBRuhu2
	En9fv7kFqfh/P1qoyxERb61TTRKYoghwH/4C2fX5HyNBwNCvRVH2zAEkwm3PMauo+alYRg3ylCJab
	8ztNyHiovXQ/QkE1FwfwsDRwdL4P7TMGynYZPI5GQYcQcnKttzKBsJJx7VPaqP48ABsdT1ADhHkf9
	vfWzJbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IUf-00000001rkA-3YvU;
	Mon, 14 Apr 2025 12:00:53 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IJV-00000001pfY-3ULA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744631350; x=1745236150; i=wahrenst@gmx.net;
	bh=ztxpMMJFLLvR1oZapArlbuf/s3HpqOv3E90SpnFpTec=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=B5TZlic7IPw+iMxfK9Lw9WWs8SYX20bTSJlUcIxtp/PzT1ScTT/296LjM++pVwoH
	 KsgGS0ZLHf0eFe2EwsWVPUxnVTAskcG+DUTb9PAEF8cYZtGHbGnp/RxbjDwusmlVg
	 CyDfhnCH0QPJG5mGNy6kZdYtIpmuYEk5/nfAhZPYE1UmVpv8x8m02w95v4FsfVlJb
	 eMRSoRZmNvVDsRnq1HL+maAKRE9qlj7VZ0H38bUx++udVrwMH2De8NuQ7XH6x8F4f
	 VzpRSu70sfLuoLORrwVKXma7u4dsVEYk8Pkm04JTswtRxgcmWKhhGry/nCGqDa8CK
	 8VEhHj+pUhiYeDjZYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof9P-1tFnGG3XYH-00ZWq1; Mon, 14
 Apr 2025 13:49:10 +0200
Message-ID: <a1133205-7dcd-4875-8a1f-a7f128140730@gmx.net>
Date: Mon, 14 Apr 2025 13:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v8 13/13] arm64: defconfig: Enable OF_OVERLAY option
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1742418429.git.andrea.porta@suse.com>
 <9d5b41bf6d1565f0de96c7c1680bd404cba40189.1742418429.git.andrea.porta@suse.com>
Content-Language: en-US
In-Reply-To: <9d5b41bf6d1565f0de96c7c1680bd404cba40189.1742418429.git.andrea.porta@suse.com>
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
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:T0QNT8oJFH3Ns/oSx+yvOcldq/37PEeJZ8dWssGFEoeeUNJGOj8
 KAfIXjvO1zKr1QEuPh7Eqjuqz2/z4zNabaGMxpSWbn1clCvFtqKNgYdhRGLS9tgQXUxW/se
 Tfk4+QgRqvFMd4vCU928Nm/NcWEAy0TPBmjeOKyqxFpQXGP2n71irv4xUMvjL7SMvpqm/0c
 M1XqzoKqO2/ChPsE+19rg==
UI-OutboundReport: notjunk:1;M01:P0:jtrZ2GhFz9g=;d8d7oUs6bLbBoChY0c/bH2hp8ck
 XGrKelH8fwQk/0LqxpwXocMb9CXERgTSgjBpcgv5kgMBSy0KCQjo5T+E2x8qUWlqS5Vaxzloc
 pTYaVkPIQ2MLk5BsZvDYqHTpU/n50KPJJ5y/+XmXaLuvpQUK3MkpVuU8ulQoZs4d2djPLDx+v
 VUfqWpUAX2lBrYLk+c3JRboMIZWoOQM6yl6C+bzkYvczoG8LwZYsOYslVH7iyTA5XF1h2lc5w
 9CFiY8SiiwDh3O7PtNhYH2ylGVLlnrJeKpcZCCyXrcEJt7bi4WLEN2jYTC6/fRXwgh11B+lfy
 zyGzLPzD5L8xSP1UsaLh+7SNeOYFVDbosrVloNwzNEyJkW3F/Ddz7Gs6FDrgRVTp9rhTMw1wm
 k1aOuTy72BYjctn3yJO/+c2A8PDCDnlxcQR7+Q0ZWTDc5xfO0ho2XYJ+E/PpymnS0k4XyFGAD
 8aHzJyPF43s0VrW01FG1bupTaV+ZLUrm45yMRIn6OWOxEbB4s/GZtoxCUr117QE4HmYmlU/im
 0wuFg96Vtqd16hmnorVDPs2Nj/uIfN5jkEJvRIIeufjVsYq5d8nRGrwFn8BF8JvFI/rwbLb52
 MPZY0LjXueBPZvHK90N6riGUDA7hrbIFqAJ874CfvOg++n44CcS9VtWXBanfp+1amcIId0AAx
 r8L69lfIabDc9qL8Vby9v2do6WTVykZJLqeEEJwbwlEJfbdWNSVF2WL/UCCRvFVbHccQLvcco
 TFtUWQMk7GWxPR3OxDikizp2gQWCYrtQm9qi7C4eJ46rCx7fgpR1JWiCfcUOFvFdCfNXI+45m
 o+8E09k1b2xWXUSnyWqmJIkG5tx3OINOz7odIwV6GRakKPaP+254OB2esGpBCZ+TM8+iIHFu4
 zuZc8flXXe2LipHd2BQtvKUf1TJ3BAupIfRm3Kae1AqP4aL5mlAxKZ51dZxoUZnDG3RaJmJpQ
 HlzVF8qQoGr+LVMkq1hu1I1zTGmtK5z5ZIPbqTEZqI9nCa0d9sHSEmd37svI7H7T/YOAWg0Pc
 RNL6H18wXttv36KJ1jp0G6IuFeTNta7cnUaW0o2JzyWPApIDcLebHenkiemf+Hl9pToRgquzR
 V2hC7F0r6JMP+vNEg+Ur7ZZgaRxe/uZ3Hg0zyW5GzJKo6Fry60qR/Vm7oPeqqjzxYF1iPqno3
 6sjfYYHLhb+NpZNhAakG/q3YVR4QaXW/De1Zba4zang5EzvpnWTBZ0nrYQy2dB26Mwl41V11V
 V3bl2W41nR2JHbtGte4xy6po1IhfNqX7qEU56ZbrVHG3nt/aEW7A7Eh+Kfql/CwVkmA6VZS0x
 fEsKSx3VMu5nZTzZCSeZOT4WlDZf9zyO0smlAmZxE9iMwh4lWkuM1AX15hKi4twaARRKYekwd
 xnrZlNvZcMDl7LaTeT1hkNEhlqcHU5Tdl+zuPzGX7fiWqJiAZqM2fwoWAOcTywiCpeaM6sL03
 1CNkjD9+vq9JFcuda+xardD/PgYZP+avbY519DXAi/+fBr4LF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_044922_167216_8038A6F3 
X-CRM114-Status: UNSURE (   6.87  )
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


Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
> option. Enable that option in defconfig in order to produce a kernel
> usable on RaspberryPi5 avoiding to enable it separately.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>


