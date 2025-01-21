Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DB2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OItftmU3nmHodeFN5LD5V3oR/F2npmbkhzoTbe1kM+o=; b=0QcJV6VYpF8wKUjFTMWdAiNEmn
	LYSgDQOOPuZ6cwW/jaoF7stwg0UHGUzCD5IDS69ucXHzWccf2AtLo0h/TaB3qSAGj+vJa/4ncV75t
	iUDN109s8++fNOnbvbHN+YOyIsvAhP+6EzCgvkZOWuNv9nXslY25+peIJG6p++HiG+p2E/Ub+ja1Z
	bZFy6CWz4Butb1WcoTOIZ/iPVuQ0C9P8zEQMJ7KlggygO1bWir33aECcGVxIht5HfkhxRgq77eEto
	GpsVT/Pn42qtnjjPr/yKm4tSpWMOMIShy+WlzTCUZ8Q+acWcmsNO4RUlwRYPMBdJJfGTa6hB4MYmh
	YdxNRYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHia-00000008Qlb-0ekA;
	Tue, 21 Jan 2025 17:07:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHhI-00000008Qdl-2lVJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OItftmU3nmHodeFN5LD5V3oR/F2npmbkhzoTbe1kM+o=; b=KvgkrE0rogp+a/4Foip2XP4U8x
	7NhupLyR9KURgt2tWVnxxhnN+fuusBdQm2LJzlGsNJ8JxYZfRX7vxAPVEQnlQQRcp6gHKhf11OY5m
	j+euHjhojXFdazNYT0+Bl9oPNw1CYGN5PmAphZw7+ncC05I8+KC9iBfRDLnHhz1d9jGpqhLoYM/HG
	KiRudfiigr49OVXnJEIUqoWaqcGmlM83i4xUSx9zgkfaieokWY1Izd5dfoAME2pHX9PvhStQahys6
	4esaFGu1hvglBHtS3YKHfQMw8BMlhGhj5mkDW86sud/NMo3Gr+92HOZ2YpjTGKY9FzMXGhtGt+kOj
	VMBlOGuw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40242)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taHh8-0007Tf-30;
	Tue, 21 Jan 2025 17:05:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taHh0-00043L-1F;
	Tue, 21 Jan 2025 17:05:34 +0000
Date: Tue, 21 Jan 2025 17:05:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, netdev@vger.kernel.org,
	linux-rtc@vger.kernel.org, oss-drivers@corigine.com,
	linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linuxarm@huawei.com, linux@roeck-us.net, jdelvare@suse.com,
	kernel@maidavale.org, pauk.denis@gmail.com, james@equiv.tech,
	sudeep.holla@arm.com, cristian.marussi@arm.com, matt@ranostay.sg,
	mchehab@kernel.org, irusskikh@marvell.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, saeedm@nvidia.com, leon@kernel.org,
	tariqt@nvidia.com, louis.peens@corigine.com, hkallweit1@gmail.com,
	kabel@kernel.org, W_Armin@gmx.de, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, alexandre.belloni@bootlin.com,
	krzk@kernel.org, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, zhenglifeng1@huawei.com,
	liuyonglong@huawei.com
Subject: Re: [PATCH v1 01/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
Message-ID: <Z4_T3s7zn3UQNkbW@shell.armlinux.org.uk>
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <20250121064519.18974-2-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121064519.18974-2-lihuisong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_090552_702412_587A6E2E 
X-CRM114-Status: GOOD (  13.95  )
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

On Tue, Jan 21, 2025 at 02:44:59PM +0800, Huisong Li wrote:
>   */
>  struct hwmon_channel_info {
>  	enum hwmon_sensor_types type;
> -	const u32 *config;
> +	const u64 *config;
>  };
>  
>  #define HWMON_CHANNEL_INFO(stype, ...)		\
>  	(&(const struct hwmon_channel_info) {	\
>  		.type = hwmon_##stype,		\
> -		.config = (const u32 []) {	\
> +		.config = (const u64 []) {	\
>  			__VA_ARGS__, 0		\
>  		}				\
>  	})

I'm sorry, but... no. Just no. Have you tried building with only your
first patch?

It will cause the compiler to barf on, e.g. the following:

static u32 marvell_hwmon_chip_config[] = {
...

static const struct hwmon_channel_info marvell_hwmon_chip = {
        .type = hwmon_chip,
        .config = marvell_hwmon_chip_config,
};

I suggest that you rearrange your series: first, do the conversions
to HWMON_CHANNEL_INFO() in the drivers you have.

At this point, if all the drivers that assign to hw_channel_info.config
have been converted, this patch 1 is then suitable.

If there are still drivers that assign a u32 array to
hw_channel_info.config, then you need to consider how to handle
that without causing regressions. You can't cast it between a u32
array and u64 array to silence the warning, because config[1]
won't point at the next entry.

I think your only option would be to combine the conversion of struct
hwmon_channel_info and the other drivers into a single patch. Slightly
annoying, but without introducing more preprocessor yuckiness, I don't
see another way.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

