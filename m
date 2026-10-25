Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD649606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Phf/ZTwE;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=D1Mx3zSP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=; b=Phf/ZTwEBwmo+O4GU5zTNf0rWE
	w/m7vyz4Jbm/KZVr+99C0j+lHR+5weKDaXW9ngnMD5xNgtJVOLJf/cw92n2YG5QpOfGgM0uUUfNnO
	3QkHqqF2xSJc85WBEPred6FNy8xpUFeiO0v4TlQtbGmdRheXc4PEnwRBUNdYSk3SnUuOW4A13LMtr
	Jsd1nra/RqtoTjh2shM6DZYRc0Y/bOY3mh55PzDE6cA1G1GYaI/q6evJzTOPSuTOebsdA/MztMO9T
	qENAMc+0YPznhMCpkega9hLY53QuiKwxvyhoTVLZ4TQvQhhSrlPzwNwQXTwBvW3cXnTXYNkQ7KoOd
	/SaVLJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtXC-00000000scB-1mPW;
	Sun, 25 Oct 2026 08:24:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtX9-00000000sbo-1s3p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 08:24:53 +0000
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 05CEF3F471
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792916686;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=D1Mx3zSPvqL+TX+7jPag7RYNyMUM0k3doAUyLJC0CiaNYZ7855ipsmotb1pBkfzjY
	 ZeVNk+ZHdfJhgSW4RTfMB2qnwUe3sNOMGV5PGOd3/MnkcGUI4cHhBq724TIgrpNV2I
	 p//JRJVPEANZ3v+QWCYKsiJ78QYfDbzMB52k4OaSRHOXI3J0CmuGYWs9oD4ue+mJ9R
	 M6saVe9d2aey2jEgM7g/uKAGegvoqNo1fYYDXH3vvgoGicMJz4KcZJaUB33cDd4TaN
	 Oav4fGFRmqghR68vZgjIDfmrUkvSmq4GfaEz0Y7FSbcEFBl4t9XDRFGkBzbUIjgW7U
	 DeihuRop6hVmV0ublJD0BnLH0ocMOwhnO3dslfua+LZ1RY+c8sOI6zliKxgCb/N/DV
	 MoNUkwE/HJOfT2ON3hHwUDAhDpsP95x//amFZikkc4dLf/PSQEywAzpRzYehgds5kD
	 8g18kFOXbtmA6FPC2uilCWUNO3siNN/HzmlCDy9VcRVmvf0bkGtCzuQKP+OXNTKteb
	 4ThIRsytT8hTTh9tdE9Le8o/64NMtrDM8sAzi/inwNbGl6i+WsN3FGe4DIEjCFz0xd
	 OC7yedH2DdcgPIcwQ9/T6IhAsfmEAliADNmbYWDRMQsQ5w0rJJuAbMzCW8VixSuQDA
	 1r42nh/GX+27T5PqQ2XWQZN4=
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so10104088eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 01:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792916684; x=1793521484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
        b=JLxiwwuNAufuCxByLDnZK1xWGRzfoySRUoGgKOHzE8z9UY5BBVm4mCxiraY/4NQjER
         gCtdTEJ3IF2bCJjpIBsDivr++/ySN64Gy6KSEuzRyL/M0z9WzTtp/qCfMHEZppCQXb0F
         L2Svuo0x0qBHhlgcL882rzJKpHSKCMDMWukxDsC5KghXPIkGorRpYAvs6XEaw1io8/U/
         18RCNbPHUE1XInmia1nS8majRvQKMeDe14K79L4G2by+d+DSCbY1FtGOfQM5vuI3WBeh
         OYJsYLWCkR3oYlc6fzMKZGiIWFBDGJgqtTql1zB78ciCLZA8iuzk6CebK7230Z0R2cmr
         MmgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvTAEgyoTaRxM8/UXCBCxCP3NXQyw6+EfbH9uFeIVGn7Wou7vJpXjuQuULiLf0P4rsUgvG4kMXP2tAG5eHg3Hm@lists.infradead.org
X-Gm-Message-State: AFq9FYLsrd/j8ypnYESjet+sZu9vRlU875BlX8jX+rFOFuPdAYiVPu34
	WdG8MVnChfj69c43jKpZtqR+B7EBQGnTd+n7H8W6vJ5cDU6NIsWF4P/51L5qqiAH4LcELNdkIKK
	lrzZ+bS1qhhq4wgkSWBOfMCpovTGulG1tQ3J8Osl0jo3ex9RNWavzoC9SsFjTmBPvU7CqOwYC9w
	CY/MpjzR7ImAS+Q+vC
X-Gm-Gg: AYBFou2eKuUI4TTH+NyzZoYJXYENEsQfElmh3MWcPepYWc9nw4Rn2R5F/Hn28hoifwx
	ky2qlHRNznsyWJqadDRVSuxq9uqlsKeRSPXTy1LcfrJ8GS2XDmoDByHA+kSwDmdlo9BeoVq3k1Z
	t5rBqRo3u6GXRrAGCGDzFjRPdoheHtmVYm0v9bcwLh94HeaQw1L82rVahE0HHAa8/lJ7Hq89+OI
	1N/NgFwGa5IEVkHGYM8J3qYqwEUmGxUjWMB0PkaztpyYY7WOwjuQBREL8liANO+hphoHK+Xvhlj
	0dpCR/XLIdymSxcL7y4HcDOfedXn1ylIEkhXzNe5u3Svq5OEbPlTjrT3ko/hP8ijcoKDE5yJVSB
	hwQxVe8NhQ3CcmqLCFXaNkH9dDHxRziFDfrxZeTRomabUdlfUk6jmHrEYFmas+oAMAMqJbJ4=
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907891eec.5.1792916683832;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907869eec.5.1792916683321;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
Received: from resolute-linux.tail872496.ts.net (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm10301143eec.4.2026.10.25.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:24:42 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: Register the media device only once
Date: Sun, 25 Oct 2026 08:24:18 +0000
Message-ID: <20261025082419.199021-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_012451_870693_906DC435 
X-CRM114-Status: GOOD (  18.84  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The v4l2-async framework calls the notifier .complete() operation every
time the last missing subdev gets bound. This happens again each time a
remote subdev is unbound and bound again, for instance when the sensor
driver is unbound and rebound through sysfs.

mxc_isi_async_notifier_complete() calls media_device_register()
unconditionally. Each call allocates and registers a new media devnode
and overwrites mdev->devnode, so every rebind creates an additional
/dev/mediaN for the same media device, and leaks the previous devnode
and its minor number. As media_device_unregister() only unregisters
the most recent devnode, the older ones also stay registered after the
ISI is removed, and ioctls on them dereference the freed media_device.

On an i.MX93 board with an AP1302 ISP, every unbind/bind cycle of the
AP1302 driver adds one /dev/mediaN: after three binds, /dev/media0,
/dev/media1 and /dev/media2 all expose the same media graph.

Register the media device only if it isn't registered yet. Keep the
v4l2_device_register_subdev_nodes() call unconditional, as it has to
create the device nodes of the rebound subdevs, and it already skips
the subdevs that have one.

The issue was found while debugging an unbind crash in the AP1302
driver of the NXP BSP kernel. An AI coding assistant helped to find
it, and wrote this fix and its changelog.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
Tested on an i.MX93 FRDM board running the NXP BSP kernel
(lf-6.18.20-2.0.0), whose mxc_isi_async_notifier_complete() is identical
to mainline, with the AP1302 driver from the same BSP plus a local fix
that makes it possible to unbind it:

- Without this patch, three unbind/bind cycles of the AP1302 driver
  left /dev/media0, /dev/media1 and /dev/media2.
- With this patch, after each of three unbind/bind cycles only
  /dev/media0 exists, and media-ctl -p on it shows the rebound AP1302
  and sensor entities. No kernel warnings.

Not tested: the ISI removal path, where the stale devnodes would be
dereferenced. Build-tested on top of 330517c63aa9 with W=1, no new
warnings; sparse was not run.

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..82a03742405d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -90,6 +90,10 @@ static int mxc_isi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	/* .complete() is called again every time a subdev gets rebound. */
+	if (media_devnode_is_registered(isi->media_dev.devnode))
+		return 0;
+
 	return media_device_register(&isi->media_dev);
 }
 

base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
-- 
2.53.0


