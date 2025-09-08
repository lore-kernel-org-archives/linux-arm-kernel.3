Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E743CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36riWVZaI/SBIjc5Jjs7zqIpnkymBhbeOM8oHEnXB+M=; b=4KprzbvMn6Pf9sYC4Lk0PX5ums
	GIkATmP0fsL8ud5dc0gUV46v4U6RM7gDdZAVJ+1BUSNc828qoguJLOmlyaS/MrPzQj6OjhkvYjCdj
	+qADcat4aJKxH6Z+g6zZn6Hc7mUb8CpHBHT5i51hvtLpsdv3fTCYkGETssAywc5YA5dL5w6dM5WVx
	vUsbJ4ZZKF188RCBLcJGhSJP62dJEsTD5g/KHC21fUJPhz4CLueGCy62o74NMGGqAs49AfIp9FBR9
	v+Mely9XCWFOAACwYJcVLcTp1FNe1JSrO0WhhyE3E9fl+jrse97kjnDvfsP8KIyXJWU/ETe/J2cm3
	nVRGWz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvb1r-0000000H1u2-2Ny3;
	Mon, 08 Sep 2025 12:31:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZqo-0000000Gbda-34IE;
	Mon, 08 Sep 2025 11:15:59 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51346725;
	Mon,  8 Sep 2025 13:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757330082;
	bh=+8Z8atAnfriG15S5k0i4V2/xNbQzXkz5PziUTXcBQe0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MtEXD2U+aGfOqJspEKZo5QXwh0CeOGPsQ6sDmV/H/A1CAZLTVzuXptUKRuZMD3SnG
	 +TXeXaSYNUpKi8TskBfd15Y0DSIe6wMuGNtFr7LysZfxv249kQCL5TwL2gcBtseZqX
	 DU+BOYzHlhbl2YlEpmH49f6HE4HvR34NDSlv6P64=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aL5uKTiEYZP68xLd@stanley.mountain>
References: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com> <aL5uKTiEYZP68xLd@stanley.mountain>
Subject: Re: [PATCH v2 0/5] staging: Destage VCHIQ interface and MMAL
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Mon, 08 Sep 2025 16:45:46 +0530
Message-ID: <175733014607.8095.7451233410776368088@freya>
User-Agent: alot/0.12.dev28+gd2c823fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_041558_903646_975E9B5E 
X-CRM114-Status: GOOD (  12.29  )
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

Hi Dan,

Quoting Dan Carpenter (2025-09-08 11:18:25)
> It's really hard to review the code when it's just sigle line like
> this:
>=20
> >  .../raspberrypi/vchiq-interface}/vchiq_arm.c       |    9 +-
>=20
> It's also a head ache to do a cat -n filename and then copy and paste
> it into an email message...  I thought there was a trick to make the
> diff show up in the email?
>=20

I am not sure how to configure b4 to give the full file path instead of
shortening it after the first file in a list.

Does git-format-patch already have some option? I can use that to ease
reviews till b4 adds support for this feature.

Or did I misunderstand your problem?

> regards,
> dan carpenter
>

Thanks,
    Jai

