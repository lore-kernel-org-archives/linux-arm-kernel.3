Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bRtAMhJN;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VEieXkss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nKvUoZJ6cM4Q3+vdfnWBj8KC+NLhl6GuVHJjIA6JQ0o=; b=bRtAMhJN8s2ihs
	COHUrKFDpswDlnFGfaA8HTrpkEsFgFmkNannsM6Tf6ZFzD8+1xFBG9vmjDKWwRcLETcMu8anUA4hU
	ipfkFHSEDkGp65DXZUZrVgOshP7HA1lM+uSgcw2bE9+WQSXCl2T7ufTvTPm3gtLytuatSxATa5I6Y
	Qr/pCUmfPS8L6Rxh/FMYrQh6QDDwbwkZ0PdIUV4K9PsZLt7OzzOF98M9A/Ca+2FbpkyR1Udygpq2w
	47jbOOFLR2Kf3CZFa/N5YkBOvLwoIcwPWQOu0mDTiw4LGESfQluXTMmY2Pe1b0CA3AoYlGh5p3ipe
	SnildEyjmCio0hcMtniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWDK-0000000EZKo-2VDc;
	Sun, 01 Nov 2026 14:07:14 +0000
Received: from out-106.mta0.migadu.com ([2001:41d0:1004:224b::6a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWDH-0000000EZKO-0Yea
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 14:07:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hnDwTwzHH35o8706gMWEB6t9gGfKl1uCTO/DK8frRFY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542028; v=1; x=1794146828;
 b=VEieXkssPAfYpr6PQ9tN2RZkcLJ3FyyWKFnGjG5v/V6eYLH2QxYSvsRLgrblyOaiEBXFFw6M
 htqzzv5UijwTqObZZkU93z9MgMmE1rKj6b0Em3hqlc0pMrkBEbPuiIRhA10HoU+Mmtv8FRTaCqg
 4kcOiK2c7w/eQ6wBdGMROTfc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 628719066510015c;
	Sun, 01 Nov 2026 14:07:08 +0000
X-Mizu-Trace-ID: 628719066510015c
X-Migadu-Flow: FLOW_OUT
Message-ID: <2375f4a7-eec6-473f-9795-5ed55c245208@linux.dev>
Date: Sun, 1 Nov 2026 14:07:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] drm/tidss: Stop using vp_bus_type for directly
 connected panels
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-3-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-3-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_060711_450005_238C6990 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29/10/26 10:18, Tomi Valkeinen wrote:
> When a panel is connected directly to a video port,
> tidss_dispc_modeset_init() sets the encoder and connector types using
> the 'vp_bus_type' feat. DISPC_VP_DPI selects DPI and DISPC_VP_OLDI_AM65X
> selects LVDS. Any other type triggers a WARN and fails the probe.
> 
> vp_bus_type is problematic and is going to be removed. Change
> tidss_dispc_modeset_init() to use dispc_vp_is_am65x_oldi() for detecting
> the OLDI case, and default to DPI.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya


