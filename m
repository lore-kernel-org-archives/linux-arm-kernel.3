Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07B60A2615
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H6Zoq+SE;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KXIvGTeQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hli9Pm6PyR4E1whnLP74hf5mHnZKkC5Wmy1ba4WkJhE=; b=H6Zoq+SEov4l/L
	9xwyjQs0Cct3UEerx1luiIQ6p3xRLE27sBMqNYlVlK1eK4fVEaolgS0wGgt7CF9Uv9u1oZtBVla1G
	yjerPmC3Skcpt+max2UYWE/fj1xihfAQaIY+/w4dhQeIj42eInirI215RZHrxdRsyNBicHYH49yGK
	BimjtZGdWDfBaBZwYC0eqP0uOBPTloDfT7Vu6AuFnOrAYYkyRWRiGu9GLpK2J0ZD4Nkye/5TP4uXB
	Tcyf5ug0mv94NP0BJ0S0TFOFGVNSN8Yj8TKbgiJs0gvU4+tRdgFrKKwqt2mOTgL57MXQQhm2KS9mB
	I6NFJTV+8AD803IbUE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqPn-0000000GNGo-00Yu;
	Mon, 02 Nov 2026 11:41:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqPl-0000000GNG9-19Rr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:41:26 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75328BE;
	Mon,  2 Nov 2026 12:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793619547;
	bh=T+o17ojaeL3LXS8MEZRII4Gziximst2Yab1GxPQcvhM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KXIvGTeQ97m5HZMByM/E2aPK96z4htwSQbPZrQMzUkZbrLZoiUZPDBa1x8s/HV906
	 rvr66VS1WTemwmFC6/KPrpMpywOuNSz8/BNKd3fSRFMNtpomPGSXe8lU6Ko7K8KeVU
	 Zx94ahRVzU7xrC2xlIMX5hWiKAfF0T8eWNmSRigE=
Message-ID: <02facf72-2b1e-4e31-a84a-cd18913469c2@ideasonboard.com>
Date: Mon, 2 Nov 2026 13:41:19 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] drm/tidss: oldi: Drop unnecessary forward
 declaration
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-6-dc7f2b532478@ideasonboard.com>
 <5044b7a0-5eaf-4008-9653-11027b8055b5@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <5044b7a0-5eaf-4008-9653-11027b8055b5@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_034125_464034_E25BF841 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi,

On 01/11/2026 16:11, Aradhya Bhatia wrote:
> 
> 
> On 29/10/26 10:18, Tomi Valkeinen wrote:
>> Nothing needs "struct tidss_oldi" in tidss_oldi.h, so drop the forward
>> declaration.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Should this perhaps have a Fixes tag?
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
I think this is more a cleanup than a fix. The forward declaration 
doesn't cause any issues, so there's nothing to fix.

  Tomi


