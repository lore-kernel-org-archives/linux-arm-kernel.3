Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F85FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Yv8PVd52JTRw4r6qh65xK+kFgGp7k/YH+t5aN2ivQM=; b=o5d1UGDsK5oZvP2bMBrVQp9+FT
	vsQDrKfGeGrDw0+Z5QIOI+H/5DbGdlin83en6gkf0BSv7Y7klnCv7g3Js3QrJFgJjnhhDkuFN6xTu
	SFSJMO4rL1XyXU5eWaIG7nHvW+saZ7DgrqDp36l//jDP3Q+JzjHBXKpLipflUMwmCa+ncseqNALrq
	QioDQq22RKEyRzgp+bKmDciJXZJ2LHMkUgXtT6VFTQVxczHJGHWvoM4E32PTUm/RvhCad/r0q5wwX
	ym1ZFyJiyAIjbV+tikei8tGf2yFT4/XTbZZtFdEl7EjkKCXXxVQsY1F0gbQsuAC9ywpleiDftEfDx
	12BQ/2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6ub-0000000Bzoo-2dH5;
	Thu, 19 Jun 2025 04:30:05 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6sL-0000000Bze5-0d1g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7Yv8PVd52JTRw4r6qh65xK+kFgGp7k/YH+t5aN2ivQM=;
	b=oIL3Q0De6A3nMNlyVAjT96y81tN5M/D0G3WdBE0268+AIXgutdBEL4keyZiTUm
	Yyo0jkkZjwwl9DbTsUGXq/vAXZzuGxY3gsH+DQZdkDluJnKylod0iDvZ18myVvWA
	XXc6o43PuZS+Gg4g82XJ7Lw7WMYQTwv5IbLQhY+UoB16A=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHfw6ikVNoUc_2AA--.36272S3;
	Thu, 19 Jun 2025 12:27:16 +0800 (CST)
Date: Thu, 19 Jun 2025 12:27:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, krzysztof.kozlowski@linaro.org,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
Message-ID: <aFORokzx/sImgDtA@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
X-CM-TRANSID: M88vCgAHfw6ikVNoUc_2AA--.36272S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy5tr4rtF45AFy5uw13CFg_yoWfXrbE9w
	18Zw1Iqay3ZrW3Wry5AFs5C34Fga47XryUXryFyw1kuws0yr98AFZrGrn3XFy5uFZ5WF9F
	kwnrtw1DCa9FgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1Hq2tUUUUU==
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwlxZWhTizsX7wAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_212745_566999_65212771 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
> > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
> > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
> > wrap and all slots together. Reduce minItems of power-domains to 1 for
> > i.MX95 and keep the same restriction for others.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Krzysztof, will you take this one once the DTS part is ready ?

dt-bindings is the prerequisite of DTS.  DTS patch looks good to me
and I'm waiting for dt-bindings part to be applied first.

Shawn


