Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295FBCE8D47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HUebMiP/35FO6RcYY0B8DO/zm6sJXKATe5rmen/gPc=; b=ETaB3G1dv5Pru6c/HnivXHS5xB
	WOFqLW9k6rK1BNKJvAKMmrbrdcdJCa9Wk8Gvu9mgQHG3WShm6YUs7kJXVNHK3gBKedbPQuB+E3Q8s
	EUhebF4tIAbORXbQiILqIl1v01PnaFOPtsIR+1UuVGWUfFeEnh9ApfbqriUCSSVaMKAzAJeYIZRRH
	eHQi8za5vQ7VVhs8eX9/gwKZvFRaEUg0TgA4KvjLwRaWbs1MsWBPhXX1d6xz7V61XdcVfr5xMmNSg
	46ZucjkIXjnf2GwnRCQGqm+75LlzAL2M40KxQ2vWAfSimvEsHKyGJVVNjfkezQfCddmhBx+RzFCAm
	v6IscBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvpc-0000000Ca4s-3mMo;
	Fri, 14 Nov 2025 15:35:24 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvpZ-0000000Ca3v-2bA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:35:23 +0000
Message-ID: <24a9a9a2-ba7c-4619-96dc-4355d850561b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763134515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6HUebMiP/35FO6RcYY0B8DO/zm6sJXKATe5rmen/gPc=;
	b=i9s/wnTaP9tFTF8VtyQN0XH3s4GEZVrxuhAZBnM1urA/1O1tz50RsnPIzMIR2g4dzT0+j4
	IGK5PLb4/kPZ7NB9GEcPZ2LYPRKhzWLSdC4XjWM3pIzole1EiEjz0/DWuLS8XRkoQwn3U3
	B/kOyP+9g7GGyT6UT2XZy9O8dNLi3BE=
Date: Fri, 14 Nov 2025 10:35:10 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] drm: zynqmp: Make the video plane primary
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <36048dd7-796f-495d-b715-d8f65a7c2f98@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <36048dd7-796f-495d-b715-d8f65a7c2f98@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_073522_145868_978E58BC 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Thomas,

On 11/14/25 02:42, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.11.25 um 21:37 schrieb Sean Anderson:
>> The graphics plane does not support XRGB8888, which is the default mode
>> X uses for 24-bit color. Because of this, X must be set to use 16-bit
>> color, which has a measurable performance penalty. Make the video plane
>> the primary plane as it natively supports XRGB8888. An alternative
>> approach to add XRGB8888 to the graphics plane is discussed in [1], as
>> well as in patch 2.
> 
> Did you try to set drm_device.mode_config.preferred_depth = 16, like at [1]?  IIRC user space looks at this value to auto-detect the color format.

I have not tried that. But I would rather use 24-bit color for the performance boost.

--Sean


