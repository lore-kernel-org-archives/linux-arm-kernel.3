Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DE4E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2Xy8fR4klMdtV76o+AOWxUczteB2M7hrx0J1kUwdMc=; b=fCp9zciSjpr0s94QdduGgaUc6C
	G+SIQOYqsZ587dpj+txBheZ10+8RuOuvz8f+WYynyfZvQWN8xmdxjA4DXTZ/bJIG40yUTxC0VwSpY
	PkYHsiByNZfk/Qg3FUgxrglyEhQesmm+bUHJw2BtGQTRd3JzjJLRmMOL+2P0QxaxW7rshb8ZZkBLe
	VpjeYr7WHwLlV6fKqFNwjt+wgFAX0hvF3dmw86/jHsSag41/DgBLtLp5J2knNtrW0IJU4ozJfikcr
	uI3jGKNb2kgrP7hyqV6HE6SXD/BFUdNYOMRlF3f+1e17XcKDQ1WUR8nVyvqodNjyiMi0ieP17TrMR
	pKZc9Ecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJELb-0000000Gfqb-2pg2;
	Thu, 05 Dec 2024 16:04:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEKZ-0000000GfiZ-2dRo;
	Thu, 05 Dec 2024 16:03:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d0d6087ca3so160772a12.2;
        Thu, 05 Dec 2024 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733414633; x=1734019433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2Xy8fR4klMdtV76o+AOWxUczteB2M7hrx0J1kUwdMc=;
        b=MMqdBY+mEHz53CrSvHLKkrFQ75o0vr3QQYBwFvGLbef1NwbJz/1xwnc8Td4yQ8E8u9
         1bp/4GYYWFklrHc/G6oXLJHc2/fSoCMeW5tmCrw5+AOYz72jwd/knnV+kH2wASjJbVvH
         lIsQ7UujOGodklLokznx3hoi4LmIVfq72jXkBQiyUb47lSRxzEvY8R/2Y8XzoS6SKdHO
         2YNRzm7CsuXAZ5VDzeGghD4XjOVyV8LLIBMjLsk5ejgU7CzTs9auCqwq4DfYsdHiE84c
         dK7Y/6oJtNTK2OeF8F0MTItu1Zb7DPBxHpSTFLxvGnp1OGZbzGjHpVc9ToK1MxshI87M
         4LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733414633; x=1734019433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2Xy8fR4klMdtV76o+AOWxUczteB2M7hrx0J1kUwdMc=;
        b=Zmv59//uGP+Zf22u8qNxwTz3iHzXYbDAWXn1wyL/sCXFOLMpsVv4dPOI4I9tCDldbb
         Ss5/v5wr0OmcRv0UohYN2kEc5j5IvGtbAzu3hH/36cl0j7umoAbzc3SAhTdvB/IrMzUN
         /qCCNOXAHQdj8MjS4eobWsz4ZS7cBToAJAcv91VJv6AbMTXvufp/QFMHgWfB7FCGMc2o
         1MgkBybj28AYxGmklaXfHx+b0VflqVus4/59JWaDWA12WQouROzxPGaYh67Qt9ChBHRK
         kFnJBDvwxMGONiLoOFSVA5nnwFxbtrtGDJgvlbMDz9r0vZtxCX4OfpWuPlCkhgm8UoiK
         YwvA==
X-Forwarded-Encrypted: i=1; AJvYcCWLtFIvHOxJG9oTxprTXea9ep1zs941YPpNZEIVj7QxroMkAGKC5H50htmu3WkCEZKwxrDVcU+HnmwW3iUDoNQ=@lists.infradead.org, AJvYcCXKaNKtzSxOfCnLrM33OiyzM8VwQuk/1WkFjqjGMQStoI8hwz7eBQKH1KYsTAl8LnsnPKZYUXmNjyZ1mGyVc8m9@lists.infradead.org
X-Gm-Message-State: AOJu0YwY4cAfBFrTUSj28Y9broTgpHTsnszdEJpTSnu/IGufr3JEDPeF
	9eYnFConRC4hISJm78ecsZIIO6Mykqpt7a63fZspDO/aTH6KW9aF++gAMw==
X-Gm-Gg: ASbGncudel2cVmXceJfjaomO5YjIA5C3Bm4nI9I9m0j8xQHvV1ekg+OBO0LCzTeOvxH
	KeRIrA5ctkX/EJnIwa4i7qPwAXQN5tCnFJg7v+hy0T4cv2YHYTKxwX8fdSrc64skX+iASDvnAZw
	QKh2AA27k6uJPGRwgVYYEzK/t6WIofbQ6NraNq9+mc+nWHD9El+I1iqrNUQyDVeEhhF0yvSvWKT
	0FHx4oCztmgGh1u1sLgHHGMOVEQjldQqAP/Rsk=
X-Google-Smtp-Source: AGHT+IGJbttEx625sbvfZB6qmADeEHHoDaiWaHna5evY6Uo+8Z7yDeoc1B7PgSItB+aXhyAsOqRfgw==
X-Received: by 2002:a05:6402:3595:b0:5ce:f524:c15d with SMTP id 4fb4d7f45d1cf-5d10cbabbdbmr4365917a12.11.1733414632304;
        Thu, 05 Dec 2024 08:03:52 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a25e20sm944126a12.16.2024.12.05.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:03:47 -0800 (PST)
Date: Thu, 5 Dec 2024 18:03:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 1/4] net: dsa: add devm_dsa_register_switch()
Message-ID: <20241205160344.hnshthreouyjecxq@skbuf>
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205145142.29278-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_080355_667914_CA3B5ACF 
X-CRM114-Status: GOOD (  20.74  )
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

On Thu, Dec 05, 2024 at 03:51:31PM +0100, Christian Marangi wrote:
> Some DSA driver can be simplified if devres takes care of unregistering
> the DSA switch. This permits to effectively drop the remove OP from
> driver that just execute the dsa_unregister_switch() and nothing else.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

The premise is false. *No* DSA drivers can safely be simplified if
devres is let to take care of calling dsa_unregister_switch().

See, no remove() method of a DSA driver calls dsa_unregister_switch()
directly, but instead they all test dev_get_drvdata() against NULL first.
See this patch set for a full explanation:
https://lore.kernel.org/netdev/20210917133436.553995-1-vladimir.oltean@nxp.com/
but the short explanation is that the parent bus can implement its own
.shutdown() as .remove(), which for the DSA switch device means that
during shutdown/reboot, both .shutdown() *and* .remove() will be called.
The DSA framework is only prepared for either dsa_unregister_switch()
*or* dsa_switch_shutdown() to be called. It doesn't work if *both* are
called, so we have this mechanism where .shutdown() will set the device
drvdata to NULL, so that .remove() will become a no-op. But that mechanism
will become void if we start to drop the driver's remove() and rely on
devres to call dsa_unregister_switch().

Demo for sja1105 driver with the spi-fsl-dspi.c controller driver as parent.

diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index f8454f3b6f9c..b9c92a5e5f5f 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -3404,17 +3404,7 @@ static int sja1105_probe(struct spi_device *spi)
 			return -ENOMEM;
 	}
 
-	return dsa_register_switch(priv->ds);
-}
-
-static void sja1105_remove(struct spi_device *spi)
-{
-	struct sja1105_private *priv = spi_get_drvdata(spi);
-
-	if (!priv)
-		return;
-
-	dsa_unregister_switch(priv->ds);
+	return devm_dsa_register_switch(dev, priv->ds);
 }
 
 static void sja1105_shutdown(struct spi_device *spi)
@@ -3466,7 +3456,6 @@ static struct spi_driver sja1105_driver = {
 	},
 	.id_table = sja1105_spi_ids,
 	.probe  = sja1105_probe,
-	.remove = sja1105_remove,
 	.shutdown = sja1105_shutdown,
 };
 

root@debian:~# reboot
[   52.421866] watchdog: watchdog0: watchdog did not stop!
[   52.515700] systemd-shutdown[1]: Using hardware watchdog 'sp805-wdt', version 0, device /dev/watchdog0
[   52.525256] systemd-shutdown[1]: Watchdog running with a timeout of 5min 44s.
[   52.977392] systemd-shutdown[1]: Syncing filesystems and block devices.
[   53.041107] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
[   53.070259] systemd-journald[277]: Received SIGTERM from PID 1 (systemd-shutdow).
[   53.123590] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
[   53.156518] systemd-shutdown[1]: Unmounting file systems.
[   53.170735] (sd-remount)[632]: Remounting '/' read-only with options ''.
[   53.229253] EXT4-fs (mmcblk0p2): re-mounted e092e674-ed6c-4216-b216-58d8390ae85d ro. Quota mode: none.
[   53.313634] systemd-shutdown[1]: All filesystems unmounted.
[   53.319334] systemd-shutdown[1]: Deactivating swaps.
[   53.324625] systemd-shutdown[1]: All swaps deactivated.
[   53.329943] systemd-shutdown[1]: Detaching loop devices.
[   53.342596] systemd-shutdown[1]: All loop devices detached.
[   53.348263] systemd-shutdown[1]: Stopping MD devices.
[   53.354180] systemd-shutdown[1]: All MD devices stopped.
[   53.359633] systemd-shutdown[1]: Detaching DM devices.
[   53.365699] systemd-shutdown[1]: All DM devices detached.
[   53.371178] systemd-shutdown[1]: All filesystems, swaps, loop devices, MD devices and DM devices detached.
[   53.381033] watchdog: watchdog0: watchdog did not stop!
[   53.424144] systemd-shutdown[1]: Syncing filesystems and block devices.
[   53.431313] systemd-shutdown[1]: Rebooting.
[   53.458710] sja1105 spi2.0 sw0p0: Link is Down
[   53.477004] mscc_felix 0000:00:00.5 swp0: Link is Down
[   53.486054] fsl_enetc 0000:00:00.2 eno2: Link is Down
[   53.518865] Unable to handle kernel NULL pointer dereference at virtual address 000000000000002c
[   53.527921] Mem abort info:
[   53.530776]   ESR = 0x0000000096000004
[   53.534612]   EC = 0x25: DABT (current EL), IL = 32 bits
[   53.539988]   SET = 0, FnV = 0
[   53.543124]   EA = 0, S1PTW = 0
[   53.546315]   FSC = 0x04: level 0 translation fault
[   53.551282] Data abort info:
[   53.554211]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   53.559792]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   53.564904]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   53.570476] user pgtable: 4k pages, 48-bit VAs, pgdp=0000002083f73000
[   53.577029] [000000000000002c] pgd=0000000000000000, p4d=0000000000000000
[   53.584079] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[   53.590374] Modules linked in:
[   53.593442] CPU: 0 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G                 N 6.12.0-10714-gc118f6e3b41e-dirty #2585
[   53.604532] Tainted: [N]=TEST
[   53.613010] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   53.619999] pc : dsa_tree_conduit_admin_state_change+0x44/0xf8
[   53.625864] lr : dsa_unregister_switch+0x194/0x2a8
[   53.630674] sp : ffff80008002b940
[   53.633997] x29: ffff80008002b960 x28: ffff330a40938000 x27: ffff330a40cff818
[   53.641168] x26: ffffba4f5bb05000 x25: 0000000000000001 x24: ffff330a42e19400
[   53.648338] x23: ffff330a42e13668 x22: ffff330a435a5890 x21: ffff330a42dc7000
[   53.655507] x20: ffff330a42e5e080 x19: ffff330a435a5880 x18: 0000000000000000
[   53.662676] x17: ffffba4f5be23118 x16: ffffba4f5bb0d088 x15: 0000000000000108
[   53.669845] x14: ffffba4f5c02b550 x13: 0000000000000004 x12: ffff330a40938908
[   53.677014] x11: ffffba4f5b2ae418 x10: 0000000000000000 x9 : 0000000000000000
[   53.684183] x8 : 0000000000000000 x7 : ffffba4f5917fbe0 x6 : 0000000000000000
[   53.691352] x5 : 0000000000000020 x4 : ffff80008002b620 x3 : 0000000000000000
[   53.698521] x2 : 0000000000000000 x1 : ffff330a42dc7000 x0 : ffff330a435a5880
[   53.705691] Call trace:
[   53.708142]  dsa_tree_conduit_admin_state_change+0x44/0xf8 (P)
[   53.714001]  dsa_unregister_switch+0x194/0x2a8 (L)
[   53.718811]  dsa_unregister_switch+0x194/0x2a8
[   53.723272]  devm_dsa_unregister_switch+0x1c/0x30
[   53.727994]  devm_action_release+0x20/0x38
[   53.732107]  devres_release_all+0xc4/0x130
[   53.736217]  device_release_driver_internal+0x1d0/0x280
[   53.741464]  device_release_driver+0x24/0x38
[   53.745751]  bus_remove_device+0x154/0x170
[   53.749862]  device_del+0x1f8/0x3e8
[   53.753361]  spi_unregister_device+0x90/0xe8
[   53.757646]  __unregister+0x1c/0x38
[   53.761147]  device_for_each_child+0x6c/0xc8
[   53.765432]  spi_unregister_controller+0x50/0x158
[   53.770153]  dspi_remove+0x28/0x98
[   53.773567]  dspi_shutdown+0x1c/0x30
[   53.777154]  platform_shutdown+0x30/0x48
[   53.781089]  device_shutdown+0x174/0x238
[   53.785025]  kernel_restart+0x4c/0x128
[   53.788788]  __arm64_sys_reboot+0x200/0x2e8
[   53.792987]  invoke_syscall+0x4c/0x110
[   53.796752]  el0_svc_common+0xb8/0xf0
[   53.800429]  do_el0_svc+0x28/0x40
[   53.803757]  el0_svc+0x4c/0xc0
[   53.806823]  el0t_64_sync_handler+0x84/0x108
[   53.811109]  el0t_64_sync+0x198/0x1a0
[   53.814786] Code: 0a490949 37000489 37b00468 f9421828 (b9402d09)
[   53.820901] ---[ end trace 0000000000000000 ]---
[   53.825600] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[   53.833306] Kernel Offset: 0x3a4ed7800000 from 0xffff800080000000
[   53.839420] PHYS_OFFSET: 0xfff0cd1640000000
[   53.843615] CPU features: 0x080,0002012c,00800000,8200421b
[   53.849120] Memory Limit: none
[   53.852184] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

This will need a lot more thought before it makes its appearance as a
tool in the DSA toolbox. Otherwise it is just an avoidable source of
problems.

