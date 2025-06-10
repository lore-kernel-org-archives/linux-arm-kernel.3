Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6590EC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8TZOu36Zu0X+TwQ4J9L8v1/Sz5M4UbPXvWPJWawvAw=; b=Xk6hWSHw9113aQaZwQAQDgo2Q9
	mMH8B9B2XtoI+5f2IESCFwygKy3vSR8EWKjA7i30pj+KEzMIzOnYZvvcbhXd7WnJB+dXYN3qH0DZ8
	qLX6JmdO9XOo8K2eAuQUJIiKkfsZ2WJkYdwaSW7Qn4IC7kjKphLXEeMLMproz35SM4Gw3ZKVyOgT2
	cSg0fywAlFTpt/iFhioBRP69pYXCWfSxX2yBxCT0g8m1gqFzbuC+JiITInzzrI5Hep88OG9nxEuON
	baG1Nl38iMlw6ipg5o82ncEWOTaC3IkR9rrOIQaipvffGI7Jott6nND9pZgRA/t+FwkWZsTs/PC4A
	IxV51QxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lU-00000008FAo-40pt;
	Tue, 10 Jun 2025 22:48:20 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3HP-00000007jPp-16xp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 18:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749578429; x=1750183229; i=deller@gmx.de;
	bh=K8TZOu36Zu0X+TwQ4J9L8v1/Sz5M4UbPXvWPJWawvAw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=X/CD3fANxAWWn7v52YLkHfKEecpb6BKHqGc6zAgQ+tvomYeV0e/xRFT3WRIVRo0r
	 bb98YXX5lB695gIUnOM4TnAUrYLHV54eGygVDCcH1arpPmUhIaXNyhypcfjL+WnLz
	 cCR8Q3pgWQoegfxaIoqDffQCyz/qQ3dXtiZf6MKkd4r5SB2aRnJy24FLBKunt4L7l
	 3GVS02Kpm3UyKSIgg7TfD6dLRzdqg5ix/ERf6wH3XWL+DXtcmIqaaJyS7Pd43MJVM
	 VaG2V1YeUYXTZBiie2dLdTmOfBHNGxRg14zzLK7QN3BqhLc9HPn63DF2OhOLokPKP
	 FRDsbh7F5hghrzuIjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1uFL2O2Yf7-00SIpm; Tue, 10
 Jun 2025 20:00:29 +0200
Message-ID: <e34abf13-b745-4683-8c8a-52a11e2be2e5@gmx.de>
Date: Tue, 10 Jun 2025 21:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] fbdev/pxafb: Unexport symbol
To: Thomas Zimmermann <tzimmermann@suse.de>, soci@c64.rulez.org,
 simona@ffwll.ch, linux@armlinux.org.uk, FlorianSchandinat@gmx.de,
 alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-12-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F4KyiKjsH3HRtj+5T+o+ZK4dWqglv7z0g4aHCoZsPmSd/+R1Bb/
 XfchOBgsD5qjauAeZ9O/ouwWWYwA4hM9o5iRLhiNBihmI0teahx3uZSvpUDmhzm9XKHSrA7
 LoCzKN8gbhjLP6lJP0tlYGQugX/5auvAfCyfUO6j+My0wfRvcrrCm58e/rRdsaUX9+7xghm
 C/J3WJGLeot4EYuJSLnpA==
UI-OutboundReport: notjunk:1;M01:P0:mtAr322YntY=;kBnmN4TSZ/mojLXlVZRxoGxf7m3
 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
 H8cHdIaZfuoYBLQvVDAPxlvaa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_110059_592691_70CF9D6B 
X-CRM114-Status: GOOD (  16.28  )
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

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix the compile-time warning
>=20
>    drivers/video/fbdev/pxafb.c: warning: EXPORT_SYMBOL() is used, but #i=
nclude <linux/export.h> is missing
>=20
> The affected symbol is not used outside of its module.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/pxafb.c | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index ee6da5084242..f15310bf94cf 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -1058,7 +1058,6 @@ unsigned long pxafb_get_hsync_time(struct device *=
dev)
>  =20
>   	return fbi->hsync_time;
>   }
> -EXPORT_SYMBOL(pxafb_get_hsync_time);

True, the function does not seem to be used anywhere (at least not any lon=
ger).
A comment in the file says:
  * Some touchscreens need hsync information from the video driver to
  * function correctly.
Not sure if such touchscreen drivers still exist, but they don't seem
to be in-kernel.

So, if we clean up here, maybe you should then simply remove the whole
function and the reference to it in the header file too?

Helge

