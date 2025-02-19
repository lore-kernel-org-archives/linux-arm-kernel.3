Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868A4C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTw76i4BbtQyQih5Zo0i9+iSWSO7S3QZcD6OOv8jjac=; b=MtaMxlKHIjhtkPvm1lemN+h+fn
	ZjZc4WOOLgduyMJrauX3KamGZy7Fr3M86UwNHOWdlIoIoI5zKpIhF4htNwHgWluTKNSxmSqVftc5q
	eEp2qiFEuxZLpXSxVpWG9gk9RxwDtfbybZBsHefQRz8v05EOLdqEsy/SxCeIYWsKBumC+wvhhTWUj
	2/ihOqEjnxGBAcSARZSVNGbxSqVxOJEzOG0z+6IAct9tHp8QNAD1wxlXYdVqiSoU7J4Xc5QYDkIYZ
	xzXj+aJtiQLVo2c1EkM72N7c3LuMR4djJdBEbt1mTdCorJNtdCHqRV51/tOCfkHL8knS9s0EVDQTt
	XIMpY2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkh4x-0000000C4xK-3uSv;
	Wed, 19 Feb 2025 10:13:19 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgek-0000000BxWQ-2wKl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=JTw76i4BbtQyQih5Zo0i9+iSWSO7S3QZcD6OOv8jjac=;
	b=CCsAnE4oKb7Sp6POYvhvLDSp2ItTrN1MPTzYHaSuV4u89vhRSxu/w1L3VmrzYK
	NAIQbSFZ0fGBL+Gv+A6Og301Ph35ZVPKfbggrbhn/E/t1keW1Lg90qTkqNgKPz3D
	O6DCodh+JvbscRvJJoN+yEQTSEGjSXoTYLDqxKzyowD2s=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3e85RqLVnYuNOCQ--.19638S3;
	Wed, 19 Feb 2025 17:45:55 +0800 (CST)
Date: Wed, 19 Feb 2025 17:45:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: match mxc in file names by IMX / MXC entry
Message-ID: <Z7WoUSBvNZLAEm0K@dragon>
References: <20250113-b4-mxc-imx-maintainers-v1-1-7605d3d8e35f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-b4-mxc-imx-maintainers-v1-1-7605d3d8e35f@pengutronix.de>
X-CM-TRANSID: Mc8vCgA3e85RqLVnYuNOCQ--.19638S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5tw43WryfKrWDZryDZryrWFg_yoWxWrc_uF
	Wqq3s3GrZrK3W7JFs3tr1jvryaka1UArn2qryYgwsIgayfZrZYyFyv9r1DJa40grnI939r
	uFZ0qwn3try7ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUppB3UUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR-4ZWe1nVcu1AAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_014615_097160_9CD92B73 
X-CRM114-Status: GOOD (  10.25  )
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

On Mon, Jan 13, 2025 at 11:13:01PM +0100, Ahmad Fatoum wrote:
> There is a number of i.MX-related drivers that have mxc in their name,
> but are not matched by the i.MX MAINTAINERS entry, most notably the GPIO
> driver, which is still being used on current SoCs.
> 
> Looking at current files containing mxc in their name, all of them are
> related to i.MX, except for:
> 
>   drivers/iio/accel/mxc4005.c
>   drivers/iio/accel/mxc6255.c
>   tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
> 
> Therefore adapt the regex to match all mxc files, except those above.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!


