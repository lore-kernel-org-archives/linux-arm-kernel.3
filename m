Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C5BCAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiFpZDhUfqgKCn5HM4k5yjF0ycj/ynBIMD6NrQ5yxxA=; b=RGHMsRGjE5BUBWkDiQzHKdNNCv
	BX5P3uhQ75JL+b5Iqlq+Ke3dUL/RjJIKiigswfEWjQrgZ/Bkc5K2wV7kb18Ho33Uk1OU5S7AYfc4K
	43lPCXvhdTW1LijoIUaCjv4lZAO25gpCfehXdmEjKO7r38FZiwhXra+AuZQ/41xgYPeCq+9IrVb7i
	snN/H62ieg7PZ1/y9EwBerBxSPrx90VkrICOxrRGYJ6cBtpFM3Hra37U7NFfNG5tIyRP9PCNjhJ4p
	cizjtS2lspQxmb3HANEBHMLYLOy/Sed2KGVPPBLYgj365mpzliy64JXwNm2qX0nQ+4IM0rAdJX6Rz
	HoPLuVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUa-00000001V2f-2wVH;
	Mon, 08 Sep 2025 18:21:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvc2C-0000000HPZx-1zph;
	Mon, 08 Sep 2025 13:35:53 +0000
Received: from pendragon.ideasonboard.com (85-76-134-76-nat.elisa-mobile.fi [85.76.134.76])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6184499F;
	Mon,  8 Sep 2025 15:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757338478;
	bh=QlTLqNc89PFy/lYlep+bGSoF2OH8UGwJuVCbEjw9SEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnOvDi8fmOn4iFEW/0psuE1Hvib/uu/MIpR99Ok+ntP+dESabK64/nYulQ29GaTVO
	 eLBiUgS92dxt8O8F3Ind4Y/H0NZWkTTjz4F04V8tnyd7PqFzIAa7K0mduG65MfbRrS
	 lKz01QWIlnQtxUez1GfFxr9ua9SIEt4pkhxRMh1Y=
Date: Mon, 8 Sep 2025 15:35:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 0/5] staging: Destage VCHIQ interface and MMAL
Message-ID: <20250908133527.GE26062@pendragon.ideasonboard.com>
References: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>
 <aL5uKTiEYZP68xLd@stanley.mountain>
 <175733014607.8095.7451233410776368088@freya>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175733014607.8095.7451233410776368088@freya>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_063552_652246_C24DAA06 
X-CRM114-Status: GOOD (  17.11  )
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

On Mon, Sep 08, 2025 at 04:45:46PM +0530, Jai Luthra wrote:
> Quoting Dan Carpenter (2025-09-08 11:18:25)
> > It's really hard to review the code when it's just sigle line like
> > this:
> > 
> > >  .../raspberrypi/vchiq-interface}/vchiq_arm.c       |    9 +-
> > 
> > It's also a head ache to do a cat -n filename and then copy and paste
> > it into an email message...  I thought there was a trick to make the
> > diff show up in the email?
> > 
> 
> I am not sure how to configure b4 to give the full file path instead of
> shortening it after the first file in a list.
> 
> Does git-format-patch already have some option? I can use that to ease
> reviews till b4 adds support for this feature.

--stat=-1 should help. I don't know if -1 happens to work or is the
official way to remove the limit. --stat=65535 should be big enough too
:-)

> Or did I misunderstand your problem?

-- 
Regards,

Laurent Pinchart

