Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A74F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B13ZoKb4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikurpyFs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZnRM95YT+o+po860eeE+ZRoM22cCLoeNp5gtdyaXPnI=; b=B13ZoKb4mhJXitRnhAPbcHCl3L
	SxVwR8aOEKPvbYsgs8sKRwd79gi4UdjOLl2AjbAngeBS4mr4nlYn9dcSggkr1bLxT2PiHvm3zOOWw
	mOQHJ5Zt8YMiQLsGnBFvvW7+KGwtWKewadcSXOugFBh4tjE+qy5OGtn8Ax2GKsyecBVA+ch6T5vnA
	+3B23bPh30qj9+jFj4nEcmOFFQWSYZBIVAdHl2EBDzaUkXRZN1WAqxgB5fmHifJ3PboAlDguLxkv3
	6AbOBaOFER178vrsxe4d4Z12ZgPHic5+nWlSTXTU8WRFxQ5Erd/eNEJUIns3btb/gJvd75zfZ4bxe
	qwYw5+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbUP-0000000AcMO-3Yp5;
	Fri, 30 Oct 2026 01:33:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbUN-0000000AcM9-3dap;
	Fri, 30 Oct 2026 01:33:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05D0D600E4;
	Fri, 30 Oct 2026 01:33:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793323982;
	b=pLbuX2Ec6Elt/voyZp7vQlzgq6RGtWa2ZUJ3IJ5QIp+U1dVFItCuLJacU8Jz+oHYq+6V
	 Krh66spY9AS+T9abo4KGtZKyVYF5daBWu8w5iqybZf4OZlnXWHsrdu4LSwNWuOIl3dSEU
	 7hs/o8v1/+0P40L+x5oP+zOVdJU3Gt7E3gLDa1J68yqTGsAv4/ZKdrNGT/xS+syfkoQMC
	 Iq7qBCqHvG8pYcxyLma9T1GVGmxAhW932b3S/TxJYcDdKhfIu9Tu6FXxyIrm09dSgARgg
	 aVz1BdlT786BEuIstFvztn9lEwgqzT20VTP3BCUlQV15q56AzLlJrdZ47tLRSUrPh7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793323982;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=ZnRM95YT+o+po860eeE+ZRoM22cCLoeNp5gtdyaXPnI=;
	b=WBjMtBaYSjF16Mmn4+uEdpTXTMUYuQDHSE7OO6UB/ZE7seEQGF6MDo3WcpSc38m87LHK
	 NCtbLjBt+LYuPZQND37lF1nPkQCPsXznJKE1PPH2qeAV6AcD12liH3PJS2fG5CPPZ6aDO
	 88QOKEGcOKP2ANm7KFFpfjl77OxVvjihPf7AMN20lxj9RTQiY9ow8kqs4CCeGzt0S7EH4
	 reUQ7LG78we/eDs2g9fYRMsDExJ5bhWEQ21tQteS7ONaFHOondzHmwGNXduZ19RLoqzNu
	 TFi0KyPY5oLu6aLPOXIRz4NvYrONkbNWVB+xPJf9X034Pzg8E+ozcOOeHeRWg7IsyBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 450BC1F000C1;
	Fri, 30 Oct 2026 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323982;
	bh=ZnRM95YT+o+po860eeE+ZRoM22cCLoeNp5gtdyaXPnI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ikurpyFs331SEGKqOR5OD52hqUs6g6z2EW6venlHiWcayHKKF8MA2W24YnUh1/vxb
	 UsvA33a8b98UErBFecUtcGyUUtJdxP1NvBidBg5xsircidQIwB0uKL0twMc2KbSUAw
	 83daKti7/60joPaLgXCiWENTvCh4dG1WNAu5fc4/NXVSfNBrglm+CygNGaUAVEfU5h
	 XJFtscsAjmQGYXVkdHO9LYnCL+yrzKjz+vsSc/0LJDeu0SQKrSSK+lwkcNW8yUbjMC
	 8h6uj3jvDyvjvvJogxUiPKppdS7yTpQN5yN5iNZlwCcfom8TBJO0eJTiDnEW/1vb9d
	 vyScQa++kmabA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CC816435F3;
	Fri, 30 Oct 2026 01:33:01 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 30 Oct 2026 03:33:00 +0200
Subject: [PATCH] media: rkvdec: Do not keep the clocks enabled from probe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv>
X-B4-Tracking: v=1; b=H4sIAMvz42oC/x3MQQqEMAxA0atI1gaaKgpzFXEhaZwJjlVSFUG8u
 8XlW/x/QRJTSfApLjA5NOkSM6gsgH9D/ApqyAbvfEOucmjTEYTR9rjpLLjOyP+Fp4Q1DYFHqsm
 3BDlfTUY933XX3/cDQbjLdmoAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2611; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=DV65nOamq4qFrrJK3VgervQr4mJ0twxpufgrJGR55R4=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmPP595z7Fsxraet1UnT9VN2CkpP+/ejXN1c/lOOGS6e
 1oszNFn6yhlYRDjYpAVU2SZcEjjVsaSq3/9PcwfwMxhZQIZwsDFKQAT+fqN4X+FvN+VuAaNQ3de
 TlwXYhIUHaP5PFys8zOXXHmeGqfe69uMDC//vf3eVbf27uke7xN1N7ScLuo/aNBf2lA3w8Xmh/l
 FWz4A
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
the decoder is in use, as before that commit.

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
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..45c541ae3029 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1788,7 +1788,7 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
+	ret = devm_clk_bulk_get_all(&pdev->dev, &rkvdec->clocks);
 	if (ret < 0)
 		return ret;
 

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261030-rkvdec-runtime-pm-clocks-41adcf141271

Best regards,
-- 
Igor Velkov <iav@iav.lv>



