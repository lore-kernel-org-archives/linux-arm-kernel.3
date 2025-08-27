Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B764CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo5VPZPmvvVNMtSgyk77lcKVCA1pjjH9MJAyRqDBcvI=; b=uiawHD6+Dgr7x45bY1+tRx7j+u
	Ix+KD87o7O1JkEu+6bmlPCoc75YMVHADDtdWNbQPjCl1AqRMJJhxJimXijgHCqwhZFrj2sW28drOx
	EEp1OOXfhKZJbeShCPHwfcQjhfKAJMwAqxarzn0qVZ/aOXgJOt/F3poT7t5YMX8j2kOmFT/ZALM0u
	QjMEfTWp9oowFArlfVFcagWJMds1IOqigbYoLJb490OfNSqX2xDLNeKP9yY1cL0+BQHSvo9GF1L3d
	+Yr7pULOoBOJTwnwbg1r3Y5eOgerdp9DCkCawMH0LYNLZQZtqAEpHOXH7H2mOZFN8KjmC/zK4FGwf
	Enkmt/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRo-0000000G2Be-0RBM;
	Wed, 27 Aug 2025 15:52:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFZj-0000000FT5W-0VAv;
	Wed, 27 Aug 2025 12:48:28 +0000
Received: from pendragon.ideasonboard.com (unknown [213.244.170.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5A2572093;
	Wed, 27 Aug 2025 14:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756298842;
	bh=e5mQpwMdmJzV0x5VzHrH/u+0doQo9DSdnKqJBUqGllE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uT7LdAvYUb28rsFJuYBrrAA85xLXirLV6ro2puzhkbTv7rQ4efpTFn1oXLQLw7kBW
	 KtuHFsmuV8HizrLY3VrcXmYcHDC3fEPyp7PN4uEcit36sQnvEHARpkVIKNJNwqdGLL
	 Pb9pDUSfN7JV0dhR6SpvWDwAOTDblsmqdbu6XzE4=
Date: Wed, 27 Aug 2025 14:48:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
Message-ID: <20250827124803.GH5650@pendragon.ideasonboard.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_054827_294145_A47D7691 
X-CRM114-Status: GOOD (  11.11  )
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

Thank you for the patch.

On Wed, Aug 27, 2025 at 11:54:11AM +0530, Jai Luthra wrote:
> The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> that is already upstream. So drop it from staging.
> 
> This also simplifies destaging of VCHIQ MMAL, by reducing the users of
> the MMAL API (this driver is one of them).
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/vc04_services/Kconfig              |    2 -
>  drivers/staging/vc04_services/Makefile             |    1 -
>  .../staging/vc04_services/bcm2835-camera/Kconfig   |   13 -
>  .../staging/vc04_services/bcm2835-camera/Makefile  |    6 -
>  drivers/staging/vc04_services/bcm2835-camera/TODO  |   17 -
>  .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 2012 --------------------
>  .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  142 --
>  .../vc04_services/bcm2835-camera/controls.c        | 1399 --------------
>  8 files changed, 3592 deletions(-)

-- 
Regards,

Laurent Pinchart

