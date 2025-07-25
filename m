Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A153AC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLYgWqNIFGd0r4HW5nV9IESqFa9QNfwIUAHcBOdrhMg=; b=SO6p1TA3ITSH9/2UjgbTDPSKkG
	VnuWG+grTpMKLHsUcZk5r+PTWKMRBKPpUDalYH4WB3jrz4XgVPy7iqCdsvIvqvqbQRAwoqYfIAn+S
	qHawiOFCex195UyWDyHVf2DY6odEU2I0JT9N7LzGJXtrfdwNsqNtz+DkzCYekB1PxcKZR1fnDT4ki
	abZ4DZZlhAd/dTBYKK+cwDsHMLfogCx1B+PV/VPm1Cagn3TPgxyiZnYv5gkqt/7bBFV9EgyMlKvoO
	Eh483VUhR+M5L3OcJ4eIy5vql/YJqzv9shxVOeAtflSsxMdkWpq+Wull16cWdilsxQexmo+ziWH/R
	wqhii+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf80H-00000008t1I-1ICQ;
	Fri, 25 Jul 2025 02:17:45 +0000
Received: from mail-m32117.qiye.163.com ([220.197.32.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7xp-00000008sjE-22PW;
	Fri, 25 Jul 2025 02:15:15 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d30daf98;
	Fri, 25 Jul 2025 10:15:07 +0800 (GMT+08:00)
Message-ID: <b0ce0d8d-4ceb-419e-a892-d39b8633aa13@rock-chips.com>
Date: Fri, 25 Jul 2025 10:15:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <3890785.kQq0lBPeGt@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3890785.kQq0lBPeGt@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f5cdd0d03a3kunm18dd1a7ad70d9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk8YSlYYQxpJTUhCQk1PSBlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KMKARJPJW06jkInizHjvIBa2f9dBzLMKkAMK563pYRj3p2h0dxgKuirrWh301Xv0TuGwm0OOTALQT9/UErJ0HweSyG88BuTMnkDSZTAH9b5AoJC+/+Dzp6HROoAHvz1cWYDn25PVnk/mD/yU9OE2aag4cqZ10fbbzaXH1xMcwh4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DLYgWqNIFGd0r4HW5nV9IESqFa9QNfwIUAHcBOdrhMg=;
	h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_neYYFWAlZzU6u2dlJ0lhZxxW3LNr/WCm4T/Zs27CXRucL5kMTeaK3zjPaPc3+xDf0VaycF59W9UbzOeqsUypy93IvVGAp7EIBubMTc/Nt06gB9UeYFfpG7JNT+Y5puW4OW+6FkYrGV5kMDJPKhRndEU3OQhP/OI1WD0ctb7/jZaQ+vCyokORdz2Ph+0uw0sli3ZylNUMyRtRolfNPJgkc0QR8fyHosI9qk9ISzsXHYewwFeVLwmP+cPu7IpelpBm834g3VVGqhmDqG9rXq1NrA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_191514_003985_EBE55B85 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

Hi Heiko,

On 2025/7/24 21:10, Heiko Stübner wrote:
> Am Donnerstag, 24. Juli 2025, 10:02:50 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3 is to apply a better API for the encoder initialization.
>> PATCH 4-7 are preparations for apply drm_bridge_connector helper.
>> PATCH 8 is to apply the drm_bridge_connector helper.
>> PATCH 9-11 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 12-13 are preparations for apply panel_bridge helper.
>> PATCH 14 is to apply the panel_bridge helper.
> 
> for future revisions, please provide a changelog on what changed since
> the previous version, I guess ideally here in the cover-letter.
> 
> 
> On my rk3588-tiger-displayport-carrier this works like a charm
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> 
> 
> 
> 

Glad to see your review and test. :-)

I will include the version-to-version changelogs (v2 -> v3 and v3 -> v4) 
in the next iteration.

Best regards,
Damon


