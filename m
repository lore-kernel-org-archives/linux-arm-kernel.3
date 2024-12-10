Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35119E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbVJw5J4GWJ01T8kGIEWydEYZvhCAGIPzpK/iHXKbT8=; b=sZN1gV7Qc6EtgcbFUSz2TYrfcs
	XJ8+TvQlWKm87SrPbS+OeB7GtXusJLIMxAdza9eJhnOBklc63idYnztyvkINKwSOsux2P3ywjfT9K
	KZjPmQiBQONmQs8IFGW4j+ZZ1yVNWKmwa6VyL/TGLwMfv6T3FGVHzatTvEON/zxjcMxOTC+9zwCjA
	w6b0xclUwJYNMc9DAP7/CTRP5VDO4QRnjt6VdmVYfW0SHHAFJM5sTdimyecz3ewoI9hVltMQL2YUP
	4ocaEbVEONjsv2eXs3+UgUHZALfT00O8VQZoZxmyqMzrQLLUlmWk7DpnhcRx3w2gNnOx9jmrS5yK8
	KvORsjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKytK-0000000BMxM-1WB5;
	Tue, 10 Dec 2024 11:59:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKysG-0000000BMl3-2BTG;
	Tue, 10 Dec 2024 11:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KbVJw5J4GWJ01T8kGIEWydEYZvhCAGIPzpK/iHXKbT8=; b=RuEz1aVQq20Lt9i1RM6zkuMFJP
	E7gWUPReBqKH8hpAFsniOi4v/LpHXv3Huxx0sfQy6a6Wv4J8NoiuKlL56oJ3qoVXx8FhEKY6PMtJN
	ZlEeAarE6zVUMWD2bArovq74ytqUrvtYhvxy66Wh7mwUtEnrz0Sz1Iqu5xioV064XpTb4dBa3HR2l
	LL3z9/hSMcy+0EdyOgpDFDzVLZ0qHW7r4Rn4bBa4SO0AtawcKWHheuFdCZHHYXM2p/E2Ucn2vedyZ
	C7JA5VBytM4DCLM+U8MgACvIs57uqQXQFYUli/U7BKzTLVA0bNP3xs9OQFSM8Jbttbyl1OFEz0VDU
	e+IKUKqA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKys5-00058v-Pm; Tue, 10 Dec 2024 12:57:45 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v5 01/18] drm/rockchip: vop2: Add debugfs support
Date: Tue, 10 Dec 2024 12:57:44 +0100
Message-ID: <4471861.MSiuQNM8U4@diego>
In-Reply-To: <20241209122943.2781431-4-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209122943.2781431-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_035756_588387_F81A517B 
X-CRM114-Status: GOOD (  20.39  )
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

Hi Andy,

Am Montag, 9. Dezember 2024, 13:29:13 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> /sys/kernel/debug/dri/vop2/summary:  dump vop display state
> /sys/kernel/debug/dri/vop2/regs: dump whole vop registers
> /sys/kernel/debug/dri/vop2/active_regs: only dump the registers of
> activated modules
> 
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---

> +static void __vop2_regs_dump(struct seq_file *s, bool active_only)
> +{
> +	struct drm_info_node *node = s->private;
> +	struct vop2 *vop2 = node->info_ent->data;
> +	struct drm_minor *minor = node->minor;
> +	struct drm_device *drm_dev = minor->dev;
> +	const struct vop2_regs_dump *dump;
> +	unsigned int i;
> +
> +	drm_modeset_lock_all(drm_dev);
> +
> +	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
> +
> +	if (vop2->enable_count) {
> +		for (i = 0; i < vop2->data->regs_dump_size; i++) {
> +			dump = &vop2->data->regs_dump[i];
> +			vop2_regs_print(vop2, s, dump, active_only);
> +		}
> +	} else {
> +		seq_printf(s, "VOP disabled\n");
> +	}
> +	drm_modeset_unlock_all(drm_dev);
> +

nit: not needed empty line at the end of the function

> +}
> +

> +static void vop2_debugfs_init(struct vop2 *vop2, struct drm_minor *minor)
> +{
> +	struct dentry *root;
> +	unsigned int i;
> +
> +	root = debugfs_create_dir("vop2", minor->debugfs_root);
> +	if (!IS_ERR(root)) {
> +		for (i = 0; i < ARRAY_SIZE(vop2_debugfs_list); i++)
> +			vop2_debugfs_list[i].data = vop2;
> +
> +		drm_debugfs_create_files(vop2_debugfs_list,
> +					 ARRAY_SIZE(vop2_debugfs_list),
> +					 root, minor);
> +	}
> +}
> +
> +static int vop2_crtc_late_register(struct drm_crtc *crtc)
> +{
> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	struct vop2 *vop2 = vp->vop2;
> +
> +	if (drm_crtc_index(crtc) == 0)
> +		vop2_debugfs_init(vop2, crtc->dev->primary);
> +
> +	return 0;
> +}

I'm wondering about, shoudln't there be an unregister step too?
I.e. the late_register callback says:
"should be unregistered in the early_unregister callback" [0].

And there exists drm_debugfs_remove_files(), though it doesn't
seem t be used much - just by tegra.

I haven't managed to find drm code handling that automatically though?


Heiko


[0] https://elixir.bootlin.com/linux/v6.12.4/source/include/drm/drm_crtc.h#L737
[1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/drm_debugfs.c#L265



