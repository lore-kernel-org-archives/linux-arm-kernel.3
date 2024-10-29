Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963F2D2AB11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0Jn+m07xtUdX4LrdEUa9cQnczW6HMipQ/zu88pmCus=; b=uCnvROAWUZTq67/+gmEcCLQzxp
	RXqu8VFqWRl9OShFYs2t7jkU8HVZhblQ58gC2fbGCJ1rW16WmY7ozaq3KDIHHJBgISiqrV3YvvqX3
	79c2G5EpigC7/oM6zv3YLKWN+mzTJ0krh+DBcNaAoZGjVvDAlKikQ932V5BuCGYoBJpr+cxKqBS59
	hKt6vyrzfAj1/pHvhbmEieA3lj/1tW+2x10GR91hA5Mxy+kTc+AxA4sfN3Q2d6BkAUNVk6vh1y+n8
	1mPqqOgkj7S+Z8eiKqkpnHhxCYQBy5fjRh/91msHRGvndewv2j6X9fHeyI+DFZ57jb09EwDfEDMVd
	YHFQM9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ivd-0000000Dvto-3zaS;
	Tue, 29 Oct 2024 09:54:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5isU-0000000DvRe-2SVI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:51:08 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPV6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1t5isG-0007ky-Lq; Tue, 29 Oct 2024 10:50:52 +0100
Message-ID: <4addc413-dd13-4867-8c49-45539af7b45b@pengutronix.de>
Date: Tue, 29 Oct 2024 10:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
To: Fabio Estevam <festevam@gmail.com>, Andreas Kemnade <andreas@kemnade.info>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>,
 Marek Vasut <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20241028180844.154349-1-festevam@gmail.com>
 <20241028180844.154349-2-festevam@gmail.com> <20241028194728.0655edd3@akair>
 <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_025106_649988_5B73D743 
X-CRM114-Status: GOOD (  19.21  )
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

[Cc += Marek, who maintains the Linux driver]

On 28.10.24 20:48, Fabio Estevam wrote:
> Hi Andreas,
> 
> On Mon, Oct 28, 2024 at 3:47 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> 
>> As the devicetree might also be used with other software (e.g. u-boot),
>> this might break something.  So if u-boot (or any other software) does
>> work with fsl,imx28-lcdif because it only uses a subset of features of
>> fsl,imx6sx, it might be worth changing the binding instead.

Thanks for raising this point, Andreas. I think it's important to adjust
the binding's compatible list binding if need be to avoid breaking DT
consumers.

>> Same for Patch 1. But I cannot test that and do not have a strong
>> opinion here.
> 
> U-Boot would not be broken after these series:
> 
> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/video/mxsfb.c?ref_type=heads#L388

The barebox driver only matches against fsl,imx23-lcdif and fsl,imx28-lcdif:
https://elixir.bootlin.com/barebox/v2024.10.0/source/drivers/video/stm.c#L579

The MXSFB IP appears to be completely backwards compatible. Otherwise the
i.MX6SL/i.MX6SLL integration of it wouldn't have worked as it used to match
against imx28-lcdif so far. Checking the Linux driver, the differences to
the i.MX6SX also look like they are not backwards incompatible.

On the other hand, Linux users may start to make use of the new features
that aren't available without having imx6sx-lcdif in the compatible list,
like the overlay plane and the CRC32 functionality.

With an eye towards improving device tree stability, I think it's more
appropriate to adjust the binding to have three compatibles instead.

Thanks,
Ahmad

> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

