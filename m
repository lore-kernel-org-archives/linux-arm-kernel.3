Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8449C83F15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsrAewYdxCOw7meyNu9Dxfatxc14gQYGLBU0rmsxSXI=; b=Sx5YdW2KBCq7JmHsHkcyJBel7h
	C/3om/JsnhjQRI3gaM4fbFDQ7fSa2hMBAjxnkFtSYBwJYZvISjii/ElatYK1Dk0TNzDWqW/us8uD6
	7EtQIDKUHyhf81Dz6jbGY0NP2tuNnyqmhodPGZ7F0NyW3glsX2nRxXHeHiHJHaOz7bVAhi86s/58l
	0Hp0PL7hc/4XfF/BT53Eqd+MfDa7cjZdWF+/ZG8tFaM9GQlvC5y6efpVQOlS6ZLYX6fDiQKeslk6D
	gmXtpPkssqaU1+/dAbWPOjjREpUtm/GxUvCxHlBKxJLssvZ1XhzoyjfVea7NspQikLES/7d4n/vIk
	K49SajNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAM-00000006Mzi-0ju5;
	Tue, 08 Jul 2025 19:39:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCER-000000068FZ-43uK;
	Tue, 08 Jul 2025 17:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UsrAewYdxCOw7meyNu9Dxfatxc14gQYGLBU0rmsxSXI=; b=Lynv3Frf3rBtms2npWzUUIn9vw
	LhSsoTH9A+tcJHmikDww3CC/Bhf9a4M4Xi2oUW6VqQC4l9NW6hJMke3e3ZpEiRCmU7+S6iI+8vsd3
	w1keFK0/i5YgGCC/XbHwBkMOJije0KBENdY48BmCKM4/iL/xZFNBy+SeZSMom/mXJPDXPqacT51uK
	olVFgNLpwusp6PuRPqTw8gIs4kOpVcVL8ciszBPdXipVSbLnmxdCi7CXMbZrJ+84kOwROPgpgzvWg
	iIokxtFxKlNct/rPUUt+QSEhA6VfSp/wIa9Vspc+rgYO8etZObd1GybLLykrKCEcqLz0ry4SRV0+I
	p3V44KlA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCEP-00000008lhB-00bF;
	Tue, 08 Jul 2025 17:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=UsrAewYdxCOw7meyNu9Dxfatxc14gQYGLBU0rmsxSXI=; b=wvUWkg3FkW0jkJVolAjco2fGUu
	e2sbQ0rIKJLerF6maTBPwGeip1j6T7f2pvNpS90enolEnhNMCBIHkMjFGj1ZLGKPG67FOBOFGRfOS
	VHnjeAtbkAH0u1KKj//tyRfM+vb2aEov6XExzXwOfeqeEbOJ3v77ajzGvhPCLtoKKi39mxK5+0MPJ
	ayP8CGHSIslNeZUtFZ+q1I01UXdxx34uWs3ETy738UirGof9X323x8y6VcnB1jpDcd89j/9DHoMc+
	sLXRU6N4rO0TtHjL1ve2JLWn0AmxqKMJ0MLZyP0B/RuB9KZz2qx2sB0nz/soxYk0zjhIS3iSbojIy
	RfWQC2Kg==;
Received: from i53875a8d.versanet.de ([83.135.90.141] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZCE7-0005cC-6g; Tue, 08 Jul 2025 19:35:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v4] drm/rockchip: cdn-dp: Convert to drm bridge
Date: Tue,  8 Jul 2025 19:35:16 +0200
Message-ID: <175199006057.1731917.377817003707865970.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250529071334.441-1-kernel@airkyi.com>
References: <20250529071334.441-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_183549_259721_AE637447 
X-CRM114-Status: GOOD (  14.65  )
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


On Thu, 29 May 2025 15:13:34 +0800, Chaoyi Chen wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> Considering that some code depend on the connector, the following
> changes have been made:
> - Only process edid in &drm_bridge_funcs.edid_read(), so no need to
> store additional edid info.
> - Now cdn_dp_get_sink_capability() only focused on reading DPCD_REV.
> - Update bpc info in cdn_dp_bridge_atomic_enable() instead of
> cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
> cdn_dp_bridge_atomic_enable().
> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: Convert to drm bridge
      commit: afbbca25d06e2d361016da43dbb90f3a6034913b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

