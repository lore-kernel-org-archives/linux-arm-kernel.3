Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AF8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Kh4IzNYBu3mW0ro+qkx1GphLLmiK1jbW6xdIlzD9hk=; b=wzez243CVCNlhCXXCly3MsQt7+
	7LPjsSN9/ub02BDBU7Sn8DTcdhbjPZYr7s+lKMWB+TJVg4Ab5Jof1lJ7TJKKu0UXoBPvbjdjYVTV2
	X0KFOhg2VNLu3LCFHHslFWRpGnxv0AHOlFl7AZgGXXwrUC2vCa4ZzXcbvNcB+A6JIX+zL5x8mIFLE
	dr4YssuAYNXQqedgqNKubPyr/l2atplsTjwCKVkqm5GZ9ccibabqmU57OtB9sv2aIhqFiLvq2oT5v
	XfBtzwj5/QcGzWFhsceGs7AxRyIIAzP9tb93aU34RJmK7MhozqkC+4lXQTgBZUObTP7x2usGTy9Ug
	R+u/Km6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgo4l-0000000DLgR-0UeW;
	Mon, 06 Jul 2026 18:29:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgo4h-0000000DLeP-36F6;
	Mon, 06 Jul 2026 18:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/Kh4IzNYBu3mW0ro+qkx1GphLLmiK1jbW6xdIlzD9hk=; b=ZDmPkj47Q+WnwI5vSuG12DHrXP
	UbiEDbs3jhb/ZSpUwvBoJkJEDSfU6ZHog56KzgcsNslm3vxvcw2A6+s1y0tGwIBd59BzOCCySIwKw
	CSVOBTeEgG7vM/F1piGu9n+rEZkp2HALe2UgYxp+cxyj0BMue88nkEoLUVgQrxDZzIytNBwIMvp+V
	XPN5oDTrolyJKP/GlbxGvHPEJQINljaEPkTCJSCQZX3ht627KjtaLAnNOXd8lnMpopGOE6CALDhqx
	K+Qf1WLHvlxDr3wyZbQIYxU2KVmeElsJZTLiVSyDelGgTcW69++dMLqVBX5SrVJahj+QFpKgMHBYR
	5slcro7g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Diogo Silva <diogompaissilva@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] drm/rockchip: Remove dependency on DRM simple helpers
Date: Mon,  6 Jul 2026 20:29:26 +0200
Message-ID: <178336256097.417648.401412534359404316.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704-rockchip-drm-simple-v5-1-a333f527a4f9@gmail.com>
References: <20260704-rockchip-drm-simple-v5-1-a333f527a4f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_112947_791397_33263D88 
X-CRM114-Status: GOOD (  11.77  )
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


On Sat, 04 Jul 2026 11:12:02 +0200, Diogo Silva wrote:
> Simple KMS helper are deprecated since they only add an intermediate
> layer between drivers and the atomic modesetting.
> This patch removes the drm_simple_encoder_init() helper usage in the
> rockchip drivers by open coding it and using the encoder atomic helpers
> directly. This is a step to eventually get rid of this simple KMS helper,
> once all drivers that use it have been converted.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Remove dependency on DRM simple helpers
      commit: 640c55fc147f0202365f916a1297f62d640efa3e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

