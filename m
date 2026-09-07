Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE50DC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCjFhWPNIHyCCGcOUKXpSBj6qunRSHfl8V2Z8EoV8nE=; b=gZzQTcXKOXsag7xzKIxNyOKiEt
	bgquI+uOT+g79Ng6i6Vi5P+QPLAQ/zCpby51Kl9B6oqPq1fY3jd2qkkFEeVwGqRmLhhgkTDxI+UUM
	ZGNRgkSC7dpXDlycyPBDsEF42Hi4tUpFOsVIS2hk186dNy7bnIQw9C8PfImey0xImrVbQvY7AToRp
	6h19Ny8rvZS26IwGP7/nSHAC1ydR5pDRTXW/SMpyrGw4BDt4vWvdVHEpvaANsm0JaxAK3tY7AigrN
	JGK/CCno8CdeI3xcMBGldUSoPq3kxmo+LDoGD1e5mFVbdczv5w0/Zs8BSv6KmZiG2hEzxW9Xv6huA
	swa02OnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cEw-00000007Ich-2ys0;
	Mon, 07 Sep 2026 16:30:38 +0000
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cEt-00000007Ia0-2svt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:30:37 +0000
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id CBF1F780333;
	Mon,  7 Sep 2026 18:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1788798627;
	bh=WBKBczPmnFNqn4oIBcLRMTmSwk8E7CwqvkPMeqXkv/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrVgf5A7eKYt7GcaIfUWEc2J962GNTRiqS4oleuwDrm0Q81xaxIZ+6YgQQ1Kh5ECi
	 8Hi3DwQR1SgbwCldFJ6RnfI9F51NAqShrz9BM7OpxWOfAPu3RWpcl+ffU59PP3hvyI
	 Avxgz7X6z2iXrwAQkIgNa6JHNzIOr4ygSO3ac2nERcIRpc+ADW0kSnwM7RigCaRgjz
	 OcxEUl2LkMsX7sPMJ/wkSlnEckqLCoetx+FSnDVabZmhCibG/8LO79WNf7NS6yUnbP
	 PVad2zu6mtidc84Npf65aHE1KAZQ6Zmv7YCI2C5b4ZRJ6UBeskblftFbxlsfBgWy/1
	 EluxjPQQ4xkrw==
Date: Mon, 7 Sep 2026 18:30:17 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH] bus: fsl-mc: register the object drivers after
 misc_class exists
Message-ID: <ap7mmR_4QV0k88dK@L30177.local>
References: <20260901-for-upstream-fsl-mc-initcall-order-v1-1-36ffe48f767d@free.fr>
 <fmmf72ypmmooyxszz3l47xabdhvetowgvbmbjmvj6bumuh5onh@pntmny63urbg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fmmf72ypmmooyxszz3l47xabdhvetowgvbmbjmvj6bumuh5onh@pntmny63urbg>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_093036_143587_7DF02D9D 
X-CRM114-Status: GOOD (  17.28  )
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

Hi Ioana,

> Do you mean that the above error messages are triggered by an unbind and
> bind sequence like below?
> 
> $ echo dprc.1 > /sys/bus/fsl-mc/drivers/fsl_mc_dprc/unbind
> $ echo dprc.1 > /sys/bus/fsl-mc/drivers/fsl_mc_dprc/bind

Yes, same sequence on the root DPRC

> I am asking this because I cannot seem to trigger it myself. There is a
> misc_deregister() which should remove the char device upon unbinding the
> root DPRC.

It does for every normal misc device, but not for this one, because the
root DPRC's misc device is created classless.

You can check the states with:
    grep dprc /proc/misc   # e.g. "256 dprc.1"  -> registered
    ls /sys/class/misc/ | grep dprc

If dprc.1 shows in /proc/misc but is absent from /sys/class/misc, its
misc device is classless and the unbind/bind should collide. If it is
present under /sys/class/misc, it was created after misc_class and the
sequence is clean on your setup.

fsl_mc_bus_driver_init() is a postcore_initcall, it registers both the
platform and the dprc drivers.

The fsl-mc DT node is populated at arch_initcall_sync, so the root DPRC
probes synchronously.

dprc_setup() -> fsl_mc_uapi_create_device_file() -> misc_register() runs
before misc_init() does class_register(&misc_class) at subsys_initcall.

misc_register() does not fail in that window: device_create_with_groups()
with an unregistered class creates the device with no misc_class
membership and still returns 0.

-> So at unbind, misc_deregister() -> device_destroy(&misc_class, devt)
cannot find the device within misc_class, it returns without removing it,
and then it leaks the device + its /sys/dev/char/10:<minor> link while freeing
the minor. The next bind reuses the minor and dies on the
duplicate /sys/dev/char/ entry.

I guess, from my setup, it happens when the root DPRC's misc device is
created during the early probe, which needs CONFIG_FSL_MC_UAPI_SUPPORT=y,
fsl-mc built in (not a module), and the root DPRC probe not going through
EPROBE_DEFER.

If it defers, the retry runs after subsys_initcall, misc_class exists,
and unbind/bind is clean -> which is probably what you are seeing.

I started to face this issue when I did try to restart
the MC from Linux userland instead of uboot in order to be able to adapt
with some DPC changes during the runtime.
 see https://github.com/vjardin/lx2160-sdx/blob/main/src/lx2160-mc.c
But I guess this issue should be quite generic.

best regards,
  Vincent

