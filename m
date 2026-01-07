Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A8D0D145
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDMvlleZwMR2aomNCyTDedhI75Th/j2D5bFQKhUurrs=; b=1yDG/apT6Sr9zbhcJR9L+L2p/O
	iOsfTIDaUlm8HMcYqiwREveidlOT4vHs9IJNkHrqGrTp8Dh4IIZFi8vP/dafcUhPYQCDtaUqRrtxR
	HnSvtHnLLDYotDs2lw1SSem/5tHJUHZ0QkguzyxwoG7VP324Ge0bro3Zmv5tXwt/geD5TUnQiXvQQ
	en/ATIXhdzxcNAZlrO121ZU9+IRrfSgBI1Sz7du2T/4lw7h9XHOOi2nY/3yL09EfYDxjcEFEH6pHI
	Pg0EmY4qRlCiU7TqDNQk0K/m4p6fmJ2b2kXB/cDsFMTcDic/aDM+WRUxsbkiBsLcvsKiH1YDUAa6e
	HbPJD5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXkN-0000000FPOH-3wXt;
	Wed, 07 Jan 2026 17:55:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXkL-0000000FPLQ-2XCn;
	Wed, 07 Jan 2026 17:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767808498;
	bh=FskVu4bMK9X3YY1c0FaKoNF9nvaMiNegDxZbSfSbmrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jnhuDG/3RzbHLW1cDYXDpDfODx6dx6Z0mYekdHtI7n6ljoYmOpR8UdCzieAdPOkqV
	 tWZDw6yi12pV926Ako6rRlA2ep5ppnD6bKo99VWcrCjnGJzLlluGHtGGfu6puAuSrN
	 FuPx33eXiiGxXNUiFRKJMVSbgJeTeEh0eDXgWlXK1jIGLP8IFJ7JL5VCT3YitdAXkJ
	 j6LXSlvEblONUjRt6BQIOs/1qxupairXBfjIWNgpuuh9+pasqr5JkFkg7H/HILq+Be
	 JJN0+7rpNy5fmD1jghz1i8dnQrE/fL7tShPWd+RO3kf0wcoVkWRjU9XFMS1v7wo17H
	 R4FYG+jdDqdvA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F0CC17E13F6;
	Wed,  7 Jan 2026 18:54:57 +0100 (CET)
Message-ID: <0cce5e09-1947-46b4-8ffc-1aa880accc9a@collabora.com>
Date: Wed, 7 Jan 2026 19:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Introduce BACKGROUND_COLOR DRM CRTC property
To: Diederik de Haas <diederik@cknow-tech.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <DFICN8TKUFBH.1V8WHTIQ5BE2J@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DFICN8TKUFBH.1V8WHTIQ5BE2J@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_095501_872497_8C86343E 
X-CRM114-Status: GOOD (  16.71  )
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

Hi Diederik,

On 1/7/26 2:18 PM, Diederik de Haas wrote:
> Hi,
> 
> On Tue Nov 18, 2025 at 12:51 AM CET, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware-configured to present non-black
>> colors for pixels which are not covered by any plane (or are exposed
>> through transparent regions of higher planes).
>> ...
>> The subsequent patches add background color support to VKMS and the VOP2
>> display controller used in the RK3568, RK3576, and RK3588 Rockchip SoC
>> families.
> 
> Cristian provided a helper script which would show a test pattern and
> then iterate through setting Red, Green, Blue background color and then
> set it back to the original value.
> 
> I first tested this on a Rock 5B (RK3588).
> Without this patch set, the background color was Black with every
> iteration. But with this patch set, I did see a Red, Green and Blue
> background color, after which it was set back to Black.
> 
> diederik@rock5b:~$ grep -E "^Changing prop|^Read BACKGROUND_COLOR" bgcol-test-bash-user.log
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> Changing prop value to: 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to 0xffffffff00000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
> Changing prop value to 0xffff0000ffff0000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
> Changing prop value to 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to: 0xffff000000000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> 
> I then did the same test on a Quartz64-B (RK3566) and that too showed a
> Red, Green and Blue background color and then was set back to Black.
> 
> diederik@quartz64b:~$ grep -E "^Changing prop|^Read BACKGROUND_COLOR" bgcol-test-bash-user-q64b.log
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> Changing prop value to: 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to 0xffffffff00000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
> Changing prop value to 0xffff0000ffff0000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
> Changing prop value to 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to: 0xffff000000000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> 
> So this patch set does what it is supposed to do, so feel free to add:
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>

Thanks for taking the time to test this!

Please note there's a newer revision of the series:

https://lore.kernel.org/all/20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com/

Regards,
Cristian

