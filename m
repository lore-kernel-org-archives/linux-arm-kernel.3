Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D135D5C0D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1XhJx+fIAJODu/uxCWon9+hPz79kYKO9bkmFz44OSI=; b=M1l5pW/lRVCRNFnbY8/wUqpCq5
	tk8Xoa6xceBqu8vVEvOcfReyLFyKNu/DJ6cyT3r3+vjlI2AKJUKQP25gaqocRPWpczbutSE/2zRNk
	7RB7x4j4k4wGAadqGAEinWhaABPbvEVZ8S1DtQrHtObA56P2xVyXcWIxyjRE5JBceL4erTJYt3yZF
	V/8/BUAuDZiE7bLf+rjSqVUG+VnxqrfY3UKmX1/UfG7gG5OjxhAEOIqEplllxQI0ukSVeIgArgIf0
	R6cSNhOUNyxfwnL7qsZwDCETr39rhwBJBA95aV4pLh+pZmImPVNwEWSlImrm8DJ9axwoS+jLcTBwx
	c5ZNcpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QDo-0000000AtSC-3QZz;
	Fri, 08 Nov 2024 14:44:24 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pk0-0000000AoRm-0TF8;
	Fri, 08 Nov 2024 14:13:37 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731075214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1XhJx+fIAJODu/uxCWon9+hPz79kYKO9bkmFz44OSI=;
	b=H057aWJezfIgKTUjmJGTSgdB2Pr0tldAJmTO3ztuFXCrA1ZciBYv6xlqAa/OQt0lTkYLAm
	OsuOvCy30s0gFQ9HiucRPIolWx1h2m5NsAi/QohLy1PgkZJ5yCVVtJbPQd3GVEo6TIgJwa
	JLyQtlPZzlana/KT82xUOgEJnmzvmcJDmPgZxLCdjyZQqG6fczk6IL5mY6u55kOia9Ckmf
	/wZUKHMjd5DCIIyvBzQ/9kPGWs/iZ83F2iWUphjLdKeUY7+3EMXOW1xuYKisIqVNFBm8cV
	6CASTLXiJBO4eJhj6JW7NB/tP1Ev+UXzX6hrkD46a6Njga+s/jHyIqUmay/rPw==
Date: Fri, 08 Nov 2024 15:13:33 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
In-Reply-To: <10558711.nUPlyArG6x@diego>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <13633881.uLZWGnKmhe@diego> <3734f6a5424e3537d717c587a058fc85@manjaro.org>
 <10558711.nUPlyArG6x@diego>
Message-ID: <047164cc6e88dcbc7701cb0e28d564db@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_061336_476914_3906E079 
X-CRM114-Status: GOOD (  20.85  )
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

On 2024-11-08 15:09, Heiko Stübner wrote:
> Am Freitag, 8. November 2024, 15:05:02 CET schrieb Dragan Simic:
>> On 2024-11-08 14:56, Heiko Stübner wrote:
>> > Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
>> >> Perform a few trivial code cleanups, to make one logged message a bit
>> >> more
>> >> consistent with the other logged messages by capitalizing its first
>> >> word, and
>> >> to avoid line wrapping by using the 100-column width better.
>> >>
>> >> No intended functional changes are introduced by these code cleanups.
>> >>
>> >> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> >> ---
>> >>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
>> >>  1 file changed, 4 insertions(+), 8 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> index 58a44af0e9ad..f451e70efbdd 100644
>> >> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct
>> >> platform_device *pdev)
>> >>  	}
>> >>
>> >>  	if (!dsi->cdata) {
>> >> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
>> >> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
>> >
>> > this is all probe-related, why not convert to dev_err_probe?
>> >
>> > As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_err.
>> > So dev_err_probe would be the correct way to go?
>> 
>> Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
>> deprecated (which I originally missed, in all honesty) makes me very
>> happy. :)  I've never been a huge fan of the format of the messages
>> that DRM_DEV_ERROR() produces.
>> 
>> However, perhaps it would be better to keep these patches as-is, as
>> some kind of an intermediate, limited-scope cleanup + bugfix combo,
>> and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
>> conversion to separate patches.  I think it would be better to avoid
>> a partial conversion, and I'll be more than happy to put the complete
>> conversion on my TODO list. :)
> 
> But your patch-2 really just open-codes, what dev_err_probe is meant
> to fix. So with going this way, you're sort of making things worse 
> first,
> until that second step happens.
> 
> Similarly, reflowing lines for things that get removed in a week do not
> serve a purpose - those line-breaks have been that way for years
> already.

Hmm, it makes sense when described that way.  I'll see to perform the
complete conversion in the next few days.

