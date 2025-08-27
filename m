Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B838ACA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3SHrtPAqFbDLobh59fKnGjYYwLObqoQgweywRdDZYA=; b=wUoLG7PHwNwvqwdF9qqHy8+P9q
	24HAdL/mv6gEVloxQcAYl86xLu/iCHL/oo1PLFDQEo8UZYAvKg9Sntq8v6+HS9Fp2FkydR+C3YFUA
	CPgguSvy++8y8nwUQEYJkMddA3eqweUp6BhFKa/T7XiRdzFw6CucrMEo90W7Kg3KPcjuR56hF3wcg
	TE1fn0LxYHvq6ElaXo1bK9MbRk8WGvNmMVAzh1Ef1wlYGQRDjPy9ZnnH34grMe3sJRAC0nzPuF/7J
	xFpLvgXIsYcNrGM4jNHCi7uvAgy0KD8kGGBHrHpm9sAVXZsu3f8g0Rj1l9P406fhfTgQMl3bWf7Li
	lF4pJZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMh3-0000000Gk95-1zOb;
	Wed, 27 Aug 2025 20:24:29 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLJN-0000000GWcL-0Ov2;
	Wed, 27 Aug 2025 18:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1756320945; x=1756925745; i=wahrenst@gmx.net;
	bh=V3SHrtPAqFbDLobh59fKnGjYYwLObqoQgweywRdDZYA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Dc28QQQ5Q9d6yMkUlxOlTGkcjAdO1UdtzNYsSzOq1Qu0P2n6XlJt1hkEU0dwag4L
	 jC3felO6GZsYC6QwU/sFyg+98EP2GXwXdR5EoGqYHnRXN3CyBsBIO0C8/o28uU3ak
	 RhddFogemm1Jgm+tBDcdddpprhENXSg6a8QEuEMTPCdNWy2k5cgd7+sHCY2PGCUCK
	 BBX+D2xuWpz278wuapyAh1NwLfugBXINQUGCF0aj27xTPufsJtl4DqlQTUvpxY+bb
	 6DWzdGK8FVZ1YE+7G1g0IP67HviF1o0ik088T9svEpLHvUZn/9dRhdbr8aGU92iVz
	 EJ8e3fBfEIMhtZ07/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDkw-1uc0HR2f5E-00zK5y; Wed, 27
 Aug 2025 20:55:45 +0200
Message-ID: <bd021516-baf2-4b70-a7fb-036eef37269b@gmx.net>
Date: Wed, 27 Aug 2025 20:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] staging: vc04_services: Cleanup formatting TODO entry
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-2-5052a0d81c42@ideasonboard.com>
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
In-Reply-To: <20250827-vchiq-destage-v1-2-5052a0d81c42@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c1Xw/t7uBQJYkTfLuc2LEn/nn2tMf44j5/YYqYsuqVKhixXJ0ia
 K1ehuBO7bKUZHsAbX9EWslDIeas/dK2OXhWqi8NydrGgMZPPTr2FHpaTxWtTY14YlhXgmG0
 1+ZU+vHrRR8ZdRgd8maJCTmGLCq2ZF+UWSb2+5bI0aZjVyFw3Eumsd3ukk7RK4KqugdQCpZ
 pqsHdzV7niaQKZDYZJp/w==
UI-OutboundReport: notjunk:1;M01:P0:TX49Uk6FjLY=;Tq84wu1C4MCJu1rTcp0m0Ozcphw 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_115557_424650_1DA2D87F 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Jai,

Am 27.08.25 um 08:24 schrieb Jai Luthra:
> The code indentation for the vchiq interface driver is not so bad
> anymore [1], so drop it from the TODO.
please also drop the point "Import drivers using VCHI." because this is=20
very old (Linux 4.4) and I don't see a reason why this is related to=20
destaging.

Best regards
>
> Link: https://lore.kernel.org/all/20241013112128.397249-1-umang.jain@ide=
asonboard.com/ [1]
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>   drivers/staging/vc04_services/interface/TODO | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stag=
ing/vc04_services/interface/TODO
> index f6f24600aa86240fba77169f62f3e657e42727c3..6e5f27db88ba8e533ee1fabc=
3091771d8efe66a2 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -20,9 +20,3 @@ some of the ones we want:
>  =20
>   A short top-down description of this driver's architecture (function o=
f
>   kthreads, userspace, limitations) could be very helpful for reviewers.
> -
> -* Reformat core code with more sane indentations
> -
> -The code follows the 80 characters limitation yet tends to go 3 or 4 le=
vels of
> -indentation deep making it very unpleasant to read. This is specially r=
elevant
> -in the character driver ioctl code and in the core thread functions.
>


