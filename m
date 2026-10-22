Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A1606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dx2MGA9z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=R7O7LQ2P;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=y9IdCL4X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=; b=dx2MGA9zuFcMEzYglK8iTA9hvq
	PPvOs4CDtiMCJ/pjGeAsYqcycjbn4nWKdo9rfyFZG/Mgf05Gu0Q2emaTnKUWpKnTCeNcMuqdmVxhj
	hCAjUWXbP/nHTQPVQ/YFs6ByNhpSP8vImGfE3vu9pJ47pRBRVNWSw2x4QwFdCSyM6Jn4T2cS/FP8t
	UWUBoNsRIPXVfDUn8oaABOKHOCQwNf5ZAUL29+/gu2MADkygOG6708irv9Y/DkH0+DVz3IHxZsGKR
	O+4B/r5TM/ZO8UBhGAcj9FqFupU1ZfcMeHyqwnNDHSmbK2pjsB8mHP7o2ahRveilNgj82NVKPu0Pr
	Q0x2Ss4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoC8-0000000Deyg-171Z;
	Thu, 22 Oct 2026 08:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoBy-0000000DeyD-1Ly1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=; b=R7O7LQ2PU2j27WKYJZVN/tBpfs
	lWBgey8usabkhqjHJVGva1uY8gt7612Js8+NZxx1SwopoDQc5LHLvp8+ywgF3y7gDGF6/4YywnsP1
	W6hpEbx+1TCDlDEGFNOqshFMyxW7H5aOFSHz+WEW3XiyUZEocNzn2nSh/hhAgtI15T1nClLTYeoDH
	p5C9SJanYw4Q0EOqXhQFo887ECu7q5ZLcEqN3U+wZ6oQIbQFbtmftsQc2++vy73w9ocFUip6llrs5
	QLu1/YcEo8s3ODcg5qpsIvaYxKr2i5VNZ+lJwNlQmkfBiqBmFS7a0zxlR/C5QSPwXv62geK38HAxp
	k3F09QVQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJoBd-00000006bVZ-3cNu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:30:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so965635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792657805; x=1793262605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=y9IdCL4XlkWlG6Fg0GQWTFFSCUce5qUyJ4raLiV0zT2DF+X/9LiufUwn6PkK2S7pH0
         8aphNshy75vP5/9elJmjgnQg3uzULi2+fHmp6RWBOFg1THzlQjVJLWc1J8LdHVN7YRh1
         X0PDL7NF7NdRsNhrqAONs/myYLY1poWQOUdoGRUykou34X4P6QOvd5V/mKiJqHVzkf7w
         ivFb62+KdU+JYe6F0RpcA1BRgvrXq9MmTz+U3RklJYnJ96r9HP93BsIu1kpjneayjPuJ
         4OmMZA0ZyT7lCJai7mkx9jxOwf6S8dIpnnBftXdBoi6tqIFHQLdnHGcV5Udhg8bT9WbG
         lA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657805; x=1793262605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=YseAMF9c7d/pBuWdbOWccbcWKFUr/uzcSh9fJ4RUiAw1r9Dum1D0gcTYkTwTlMxUT8
         ey/SRM0+X1Q+ZFIRGOziv1ArzcCA4bO7qzJFq5JlyVDqdrTpt6rtrP59/DY0ybc/MTuc
         YidpeZkzZZtF9xpLIqa1DaXLY0p7XE/yuizKiRMFE3Yif0Vd7yxwDTqeeKJJ8fsBt2vW
         SoDEpH2LRPja8BheIHCyZOsTLqqmuT2U+L4zrwAvRUjkyLBhD56TKSwwb/vhAkIm+moK
         a9bHqNoxv5gG5N9thWL7lh14i0DbiVM1uPbhE03xmeHLT0xzcoVtp9J9I9a62OnkqJR3
         rfAw==
X-Forwarded-Encrypted: i=1; AKwUvBzhv74Z+aqdZ+ZDbqtf8/9K8PlY9WAF4ciqkyL3XbdBohnLAKTe+3LVbTJGH039aT7o3xOEpE/0AWqE8XEIRrs/@lists.infradead.org
X-Gm-Message-State: AFq9FYJDqztUCJc8nLX5+muk2QmVeNOT4U7JV3vSi6CsvcfTTufuKOEX
	tviapSeyJj+MfU4zw/M11yCWQM1pbqoaEMRe2R7yGyLrRJfayRhDTA+Vl3+pj64Qvdw=
X-Gm-Gg: AYBFou3L4DJUMZNcDm3PBT1NTFlBZtnQmvBUlVeVUllt5EXBKZsZk/QlLWi5UaOLg1c
	a07UAFchVymWk7gQDJksmtZGFNbBGxfhFFL+yExX9QhBSB+1bInhdxv6N8+ZlVUWLCJbISyqkln
	pWBjH5VPPrf5yf9AFKYFPlI1XC9EjqPMdcFWi0xq4ASklbH4GGHVkPLq0TslXqBYYNlLopShgpW
	j/a80akpy0fv8eTdQmaSz4biHfrjY5zzXZQ5lmEjG2Y/BWvm+gyHKaJbpUvtGf+BA5HaHo5w/Z/
	+wSJNZCESfn04B1y0yhjUQ9jBKMh8SwBYO+J4u7bDKoBPA4cW9Bz+HUrIMzOCJtfOIGUQl/W/5e
	jPy4dSQi0CdsZmPZnArAEt/rRQ4gB+w+Pbjwamy7RsPS+Xn+PqWbcgJK4RRsn604xzqFFD8ouUb
	qPnxTjKeZlmHoIDC40iI1Xnfrc99F0X96kqhUUoeUBa25INFCveK7ctEEoJp1GQdf73aeNS5fM0
	6Z/2163CG6uc9dLOwBnsbPEuTKqaeV1DwjaS5b0TwfonhiYY4yHkbYVNp50KrRg/TcWLOjQGfc6
	vcxvXOwD0o6sOQzQKMkNWZh/hmLHbdLIuEe3oG1tFVzm22zdIO+Qba9DaJg=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4a2001aa316mr79122885e9.0.1792657805302;
        Thu, 22 Oct 2026 01:30:05 -0700 (PDT)
Received: from localhost.localdomain (2a02-8429-85a0-b901-3ef0-11ff-fe45-70e0.rev.sfr.net. [2a02:8429:85a0:b901:3ef0:11ff:fe45:70e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a62aaasm53713635e9.15.2026.10.22.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:30:04 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Thu, 22 Oct 2026 10:29:24 +0200
Message-ID: <20261022082927.59030-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_093026_377942_622CDEFD 
X-CRM114-Status: GOOD (  18.96  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
(both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
not detected anymore (vc4-hdmi is not affected).

dmesg shows:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Cc: stable@vger.kernel.org
Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
Hi Greg,
this is a regression introduced by aa125180c673 (via your tree) in
6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
7.4-rc1 has not been sent yet, could you take it there? Otherwise,
staging-linus would be great. Thanks!

v2:
- Reword commit message with more precise description
- Add Cc: stable@vger.kernel.org
- Remove redundant Link: pointing to same report as Closes:
- Collect Tested-by and Reviewed-by tags from v1
- Link to v1: https://lore.kernel.org/all/20261013131435.1454019-1-martin@wetterwald.eu/
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d35f5ac5c2e2 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
 
 	return ret;
 }
-module_init(vchiq_driver_init);
+subsys_initcall(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
-- 
2.56.0


