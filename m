Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE139C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 09:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHWyZdcB8AA39zvrCK43NnP1NWZcGM90EVQitgCTQTw=; b=HwX3H/XSUR9qkuIVXlNkXqi6BO
	WYQTR7AX0wrMJN9AP0iktzg/QG7yYIwOo4Yu6CtHcqryh9LHq2fxuIuQTYxUwkmkalkqvQg84NiFf
	ASOirS90g3XryfQVDtGl3pVRcII60S1vlPpg0Ctop1nbXieezqRXOfNnXJUVb+/8+baidwjTZcIEQ
	mryaiBeZAY0nI1th8ZWPNUMko4ZhaotioEGOLPGVcGmAtZgWv/df8dWuHtbVvSJnROSKcvDAJ0n2Q
	bTRn9QXABKftcgkKsmhgOSi4xQrvn9zcqEDmvyRq0q5krdMnhHP5JjW+KkT4H03qFmXWWWQz+lJCA
	NRPmExDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nn7-00000009r11-3Ays;
	Thu, 10 Apr 2025 09:01:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nUD-00000009msK-1F0p;
	Thu, 10 Apr 2025 08:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EHWyZdcB8AA39zvrCK43NnP1NWZcGM90EVQitgCTQTw=; b=ve0ivaWYSEJlTm2rZRZFbfJSDo
	zTHcwz4xnyJL5ObuBLQAdC9QZ6SxkGhmjzL2hvFbD7Z+7t+JSw23lcqkpH37QfIlHHWsJ+gzKCwEJ
	lDg6fqDR26LXtGCaXX1g1XKfduFssg/6HJDxLXUtAJDoikJWnpqM0t8q4wxOgj8yWgQy8qzVGJWry
	BaUWlxDY9bLvfpPdX0Kbvk1lK1qy6fkm98GAzIVf8iUf1C7IllRHJNKZkrGLHDHDaOkUVuH7uF3YA
	8jt50uXIVw+jMDPOfDvfT/qciVDto++T7cyTVb90miGeLACLR09jWyMV3PFsgi0d2+/Gkx7b29HO+
	icxduvsg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nTw-0002qP-KD; Thu, 10 Apr 2025 10:41:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Date: Thu, 10 Apr 2025 10:41:45 +0200
Message-ID: <174427445691.820310.13105802044398378268.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250404214030.401629-1-robh@kernel.org>
References: <20250404214030.401629-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_014213_333103_6DA87FC7 
X-CRM114-Status: GOOD (  10.03  )
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


On Fri, 04 Apr 2025 16:40:29 -0500, Rob Herring (Arm) wrote:
> assigned-clock properties are implicitly allowed in any node with
> 'clocks' and don't have to be specified. The max here also appears to be
> wrong as there's a case with 4 entries.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display: rockchip,vop: Drop assigned-clocks
      commit: 64e6121dc1b18a8208faf5b26efb50206722fd8e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

