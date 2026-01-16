Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14DFC982F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 19:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOIsIzI7WiDlq65gAQN/Rp2PT4RYKGrXr3biwu9dKdk=; b=2pVrzCYWeGyyPtTRu/HvLy8/Zi
	F/dkm+WA53Yttk9BVAWhM9Nrt7gB1Zpk6lwsxgweF6sIdYJz/qZ4VH+xrT16dK0oAEW14ijDdztUt
	ZEJFnWJvJhBvhGmzEw3GdVBzztv5SS1N3qIH6ikLUHYbQPKJY3VSN6rHXKNitol1sBiVWM3eYiwoD
	YU9I6xVU4rqXbWBltHXP4u4rd0DhV0fWKP086cKVrFWn+hyXaosnzFc5QAYlkN0hFv5ww4HaK8SMN
	nfFGu2JtWWSwYG47T9WEYnRJrIC3IvqlAyu5Fh5eokhog4hO92MQQQdCoEV73xEGG/KnpRDj0JEJB
	pWPtPlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgpCQ-0000000EfmS-4AyP;
	Fri, 16 Jan 2026 19:09:34 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgpCN-0000000Eflp-3GGD;
	Fri, 16 Jan 2026 19:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1768590566; x=1769195366; i=wahrenst@gmx.net;
	bh=QOIsIzI7WiDlq65gAQN/Rp2PT4RYKGrXr3biwu9dKdk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZmLicNzPpp9Zq+xMcgTa3fzvl/oHsZFC/lbxTl8SeJsQclBjpXW2dTAiRMeGQxPo
	 fYOufzXysxdKcyayRcb7sf3rxyup3CaiT61Xcs+vl0rX1ZeGGCFLJkSnp1g6w77p2
	 L1/uJ20Td72wAkCQxzqY/UPadfvhv6C+loW/o4zEMxnEB5nkwTcwc75pMclBoXCaj
	 8VSJx2Ip+wE2ovmqwX+o+jOtS7BY6wWX7pgQhLNwGFGAcc2IBpPm+rL0koFi1LIwP
	 EVwQ6ilJgrt6/PqppQsrKTeMFF1DmI9zoyMbDfgo1fxdy1RQ3JeI6GzzYUn1T0pvV
	 LSp/7azxGkMWHnXyVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoRA-1vd1ZQ1nAE-00BcpJ; Fri, 16
 Jan 2026 20:09:26 +0100
Message-ID: <f70c95cf-e048-47b6-aa6d-e65bf47fee47@gmx.net>
Date: Fri, 16 Jan 2026 20:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
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
In-Reply-To: <20260114120610.82531-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xVERlNxr39ZJa1OQNlLPowmVSOzZxVIBCwvnSaP0eJVd3KTDm4R
 Yw+ftRybwirOq18wiBFVwOZaouYMdsL+chLL0JyV8JJukA1GHsXA6Oxuu2Sewe8ZhBCO0aB
 mxrr0Kn9R7ejc80AQmQktZMcwNusB7p8EBzoPB7E+3SY0rr3F/k3yBFMf/C4X0SqWOMKJ11
 IMubcEZ0xPYpl/hRyIMwA==
UI-OutboundReport: notjunk:1;M01:P0:ERruxhv27NQ=;sJ6zhfgSEtO+5BZXPWwNYS/+FT7 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_110932_189412_A268D64A 
X-CRM114-Status: UNSURE (   7.14  )
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

Am 14.01.26 um 13:04 schrieb Ma=C3=ADra Canal:
> Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
> and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D device=
")
> added driver support for V3D on BCM2712, but the corresponding device
> tree node is still missing.
>
> Add the V3D device tree node to the BCM2712 DTS.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

