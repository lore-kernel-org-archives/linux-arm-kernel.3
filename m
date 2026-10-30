Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF2606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kviaed6V;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cdjlzgza
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r3mesjXZpMq/QbEmw5EflPGX4n+VcT5zdLRzDbA874g=; b=Kviaed6V4dOZmmlzY9F9O43Ppz
	z8TvJreFBeP/OFo2quClijrkrn8XBOBOdxCN8OramsKICmHUeKzPIYSrP23EWLxrpNSAiWxHVZ5fz
	CqlxkpJH3Iywm3RHZ4pRLXeTE02jLh8L0ZuxaDbEhfuzfkdUw8uhbu61QrW60tHuPwdGAejICSb1/
	mrExF2N5gf8fJpK+BmOY5nDECYZfDNrrh5XSH2JcRiZpIQ/gB6/w1qj1oVuD8sMOTJiVAF4CCzJvc
	OzP5PfLcPzRO1d4zNaXTyjw9awqKOgLkRZdiGRZoMZJE9Aexu5n+UtEvSawTt0X3jdEqf3+2RdX4w
	rSrW2z0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqve-0000000CLSR-0mas;
	Fri, 30 Oct 2026 18:02:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqvY-0000000CLQe-2PI7;
	Fri, 30 Oct 2026 18:02:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86521605C6;
	Fri, 30 Oct 2026 18:02:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793383327;
	b=SyF3OcjX58kElkpQXoic3U6BdE+HTImqvZT6BTI0niEbUpi46Da2FvzKlYF77lgXUot3
	 HXL3oWFQs2oVLfdS/0J5caac496Br/R/il32DUpT4AC2j7tQFGOnZew4cP9a0DbJZxNSY
	 O1iwsjLhBxnzGb6djs4LyoNlbhI8tOsZWGygV2gTzSIViZowa/9t8r9NfoVWsGi1PExWc
	 NGKqzn1uIPT8yL4fIWDwkxbnlEaXqf0ubpypEXTfrvpHRAAcfrD1F3Q5sWTvC763kuK/e
	 BIUrAQuo1DnYMwRyoPp8/addvAigS3r1v7QthT4hQw/OH+T+pDmAHsMhEuuK+plVUFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793383327;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=r3mesjXZpMq/QbEmw5EflPGX4n+VcT5zdLRzDbA874g=;
	b=XljPRJxZs+BdfpKUujWfuwq8tSA/gza4WGlrOdotv6HDvwfFi5FEvG4KboNTeOotQOCR
	 TXmq4jGQFqpnfLAckvamP2QjkJWhx5wW9yB8hA01YWCID4Z0Zq/S5TIQ7y5pt2eMPIcLo
	 IaCB49L/bV6P/lXAfXw3n9fAJHPqiJ6U/DUfykX+d8D8T1fYTxcrpbmc20Sb+spqMZ4TW
	 oLxoGLxmV7C0YbxTlsG8/tyyLumGvT+AAQIjmXmEWMgsG7WuZUsEC976uyTEHW1I8oOfH
	 LI8VTCvpl1GTXhDEfTY8pRTJgSwR62kG5O7dBmbCBYVqb/dg17sXjsAgFULIfiXAARw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7BE21F00A1A;
	Fri, 30 Oct 2026 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793383327;
	bh=r3mesjXZpMq/QbEmw5EflPGX4n+VcT5zdLRzDbA874g=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=cdjlzgzaKbrq+Ptz8+KPtXCMEA2reLNc0TFTY/eaUK78IhPMnbhuubDVCJs7b3n3G
	 q42TUBvD4adGVTlrho7mKSeVKctaLBTGVEHwkSzluNwCOLhBX7ZWZBg+DWCrf3F3Wa
	 xu5L3CUHzzyGvW8WJKlbPwWhBvA5+/2/fT32vgHmRcPDjyb9V2wLujl1AWA/lZo9ti
	 KVgU7tVxQXHNOOLwsmXAaRRukuu/H1+q5O1CY/6axImqgZgStAuU+44Wecyiaryxri
	 4hiL62vmpYa5ltEqimBWi54NMv/k2mN3e44vnmBoACTwXbx7B/8f+9AEBrrOSE4B4t
	 NwFewo7TWLmBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3416443F1B;
	Fri, 30 Oct 2026 18:02:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 30 Oct 2026 18:02:04 +0000
Subject: [PATCH v2] media: rkvdec: Do not keep the clocks enabled from
 probe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-rkvdec-runtime-pm-clocks-v2-1-8ff510a231de@iav.lv>
X-B4-Tracking: v=1; b=H4sIAJvb5GoC/42NTQ6CMBBGr0Jm7ZhORQiuvIdhAWUqE37TYqMhv
 buVE7h8L/net4NnJ+zhlu3gOIiXZU6gTxmYvpmfjNIlBq10Qeqi0A2hY4PuNW8yMa4TmnExg8e
 cms5YykmXBGm+OrbyPtKPOnEvflvc53gK9LN/RAMhoW21ubaFrris7tKE8xigjjF+AZc1RKO9A
 AAA
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Diederik de Haas <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3311; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=zsa4RX1c/nbvAozgmcN/IU1qGvXJqkjP4BnsN43BGmQ=;
 b=kA0DAAoWMpeVi+pfeQMByyZiAGrk252g3CU8c3IdDSZpGQ0cK1tTF0u77/pNmEQE36uaSbo3c
 4h1BAAWCgAdFiEEkMIo2mik1f1PSDfgMpeVi+pfeQMFAmrk250ACgkQMpeVi+pfeQOANwEAoGgF
 h9OSXorU/sv8C1ifnWk32p5bhPxWTAmx/o+j6ZoA/3SCrX77lyVxa9AxhduIM5mMv6+txRaDQFe
 LTFYIq3EN
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

Since commit 6a846f7d72c7 ("media: rkvdec: Enable all clocks without
naming them") the clocks are fetched with devm_clk_bulk_get_all_enabled(),
which keeps them enabled from probe until unbind. rkvdec_runtime_suspend()
disables them on top of that, so their enable count never drops to zero
and the clock gates stay open while the decoder is idle.

On RK3399 this also breaks restore from hibernation when the boot kernel
has not enabled these clocks, for example with rkvdec built as a module:
the gates are closed when the restored kernel takes over, while it still
counts the clocks as enabled. Powering on the vdu power domain then finds
the count at 1 and leaves the gates closed, and the first QoS register
write of the domain never returns.

Get the clocks without enabling them and let runtime PM enable them while
the decoder is in use, as before that commit. Without CONFIG_PM the
runtime PM callbacks are not registered, so keep the clocks enabled from
probe in that case, as etnaviv and v3d do.

Fixes: 6a846f7d72c7 ("media: rkvdec: Enable all clocks without naming them")
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ROCK Pi 4A (RK3399) with v7.3, rkvdec and panfrost built as
modules, panfrost not loaded:
- idle decoder: the vdu clocks have enable_count 0 (1 without the patch);
- hibernate, power cycle, restore: 3 of 3 (0 of 3 without the patch, the
  restored kernel stops after bringing the secondary CPUs up);
- H.264 decode with GStreamer v4l2slh264dec, 300 frames of 720p High
  profile: output identical to avdec_h264 (md5 of all frames).
The QoS hang was traced with debug prints in rockchip_pd_power() on a
7.3-based kernel.

This is separate from the unbind leak in Jonas's patch that Francesco
posted [1]: here the extra enable comes from probe.

[1] https://lore.kernel.org/all/20260717154505.83935-1-pavone.lawyer@gmail.com/
---
Changes in v2:
- Keep the clocks enabled from probe when CONFIG_PM is disabled: the
  runtime PM callbacks are not registered then (Nicolas).
- Retested on the same setup: idle enable_count 0, hibernate 3 of 3,
  H.264 output identical to avdec_h264. Builds without warnings with
  CONFIG_PM=n (arm64 allnoconfig + COMPILE_TEST, W=1).
- Link to v1: https://lore.kernel.org/r/20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..81cf3c1ba7fb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1788,7 +1788,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
+	if (IS_ENABLED(CONFIG_PM))
+		ret = devm_clk_bulk_get_all(&pdev->dev, &rkvdec->clocks);
+	else
+		ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
 	if (ret < 0)
 		return ret;
 

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261030-rkvdec-runtime-pm-clocks-41adcf141271

Best regards,
-- 
Igor Velkov <iav@iav.lv>



