Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906A6CF58C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7DjuaJPWcETZ1BexKkq1MHxDnEIhEMitdG38RRXcQI=; b=gBqxFlevEp1OxeqZgwabR1KYBw
	XyCrZ+xAYYxjOqllpgYJvvCpcPIthwq2hsq/EcbizScfjTktkc4Op0gvVI8eBCbkVbvniBn/jUbqS
	ZjHBcrFgeVNPi509fm1QWvnBrIyT0adv5quT1F8h/EFoOPCp/nBWlkWYBR8TRq4eaemE2xX0M/Ark
	zDU5IHuRtiEA2tHEMwMHBnEnLgHBgoSdwFIoVyMADwuaYTVqLgd0/wF35QN6CZsGQ9jLhTzuwyx8V
	D124trkOjg+zXEJu18jYL/8t6i4Pt15I3ZxcUcmuPpFSyriGwydMw6b1Z/gUyDcPAdIbmfoPBsFU5
	7VWMTVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm5E-000000049ml-3FFz;
	Wed, 19 Nov 2025 17:35:08 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm5C-000000049dg-20D3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:35:07 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dBTBj0Z4wz9tH7;
	Wed, 19 Nov 2025 18:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763573693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7DjuaJPWcETZ1BexKkq1MHxDnEIhEMitdG38RRXcQI=;
	b=WHjH6S8ESGByKl/O/KwaDe6G2Tvvl5q3caVr6qlZuksDsp/DwOKBHTrxofXW2BEDn/tnwl
	L+9eYypQu3P4YLegrs9sdKNx280lnZ8shAJkggHxUcvPhDwsHtJKf0iqMmIxMmFHSUxwWA
	b0+ezok5Ow07/nDu3a3hMvc+1vrldol3f5pX4HWZYS86M8qSl7vHkNEgdFmwHzvwplBY0+
	HPSCvTWPfh+i05qlKHtVhzBxETEFe8datCe4BNgejZMUNWVQncD4qxBsQEp9NRSb/ydzkd
	5MThOY6Eu8CwAIVIH7DzxJbEoqPrsToqIlMKElDewFvMshUZnHTmXbEz7Keobg==
Message-ID: <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
Date: Wed, 19 Nov 2025 18:00:55 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, "Jiyu Yang (OSS)"
 <jiyu.yang@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Xianzhong Li <xianzhong.li@nxp.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org> <aRnBqgzeotfrdNmy@dragon>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aRnBqgzeotfrdNmy@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xfg6n8nhyrnhx6yqpdx41yjpkht33zzw
X-MBO-RS-ID: c077a67f0eb4f199681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_093506_690812_04995D6C 
X-CRM114-Status: GOOD (  11.88  )
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

On 11/16/25 1:20 PM, Shawn Guo wrote:
> On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
>> The instance of the GPU populated in i.MX95 is the G310, describe this
>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> 
> The commit log seems need an update for the regulator part?
The patch seems to be already in next, but if it can be somehow respun, 
I can do that ?

