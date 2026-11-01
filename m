Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB18606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Urlyb4Rb;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rlZMWP5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5F77cYEZGtdp//DOKdgD2RKyC5vHfZcmQ0ZLgGs8sZA=; b=Urlyb4RbGgDC9N
	UGeG4i0ecSflgZBfE9pl4VFdl2la//dFiHWZ64+4kJE6ga/LECtpZAO310FgZFl5AhXJOgecJb3fZ
	urMYIp4Mlr6ckd2WaQ+xRY2V5+fW+9Jdmoedsloti1lsBFkl2vNf4SCZJpNCLOrGgaRWKerWNcFDl
	e8XjAH+4BVJGaqBMrZEyHww5d0cfzO+rUN8bMLSvqZGFukRyX6bWpr5BCO50m7hiOxmlbGBjNhipn
	RUNXK5z6QqQVIiShGA+GNbGhojKYNk0Xk3COdx/LeY/o7j1y3AV0FCwKQgE50lSv3TgjWnAGbyAuH
	eDaqEdbikorHbYncM4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWDj-0000000EZP8-32x9;
	Sun, 01 Nov 2026 14:07:39 +0000
Received: from out-41.mta1.migadu.com ([2001:41d0:203:375::29] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWDh-0000000EZOD-2DPz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 14:07:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=buDOHrSxqP03PrEBlJ3QvBxrpymco82p9buINaigu+U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542055; v=1; x=1794146855;
 b=rlZMWP5Sh9QyAe/IXJLWd27+M8HWUkJ0aIqEk7sivKhnPL8Xmqk45/JzOn2YVpYRfUChRFZY
 pReYdawuKGtGQe5MwEMd3mg6hYN7d/7i87E5LoUt+Y1SqztdEgsmBG4DeKF6SeILA/QXXfdxLho
 Icd6KSBrLLuJIyCWYM90eAWY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5e03d0b85d5e79d6;
	Sun, 01 Nov 2026 14:07:34 +0000
X-Mizu-Trace-ID: 5e03d0b85d5e79d6
X-Migadu-Flow: FLOW_OUT
Message-ID: <1b44d01d-e3d6-4ce3-ae0f-9d76b8139487@linux.dev>
Date: Sun, 1 Nov 2026 14:07:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] drm/tidss: Drop the tied off video port check
 from mode validation
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
 <20261029-beagley-ai-display-v4-4-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-4-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_060737_727762_7D1B69B4 
X-CRM114-Status: UNSURE (   9.44  )
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
> dispc_vp_mode_valid() WARNs and rejects every mode on a video port that
> is marked as DISPC_VP_TIED_OFF in the 'vp_bus_type' feat.
> 
> The check is redundant, as nothing in the DT will be connected to the
> tied off VP, and thus the driver can never do a mode_valid call for it.
> 
> Remove the check, and rely on the DT to be correct.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya


