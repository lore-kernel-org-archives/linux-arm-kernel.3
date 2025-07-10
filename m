Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDF6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wgPGL8NSh//d8SJahQFHJhDTvJjR5glUdE4tDtHOT1A=; b=Kw6nWBL9V0IMH0wD+MOZ3aht3z
	sXtID2IT3w1odLoq7tDEjxuv1vxd2P8rxFSdqdZm2go2RllsxjcmqxR7pye1iJczntu4aurvxovDk
	wxR9gAWctE0+orPh74ukm1ST6YzhgEBalvZ6ITwRDSmBzI2Z1LWmMwxS0E6BCTJwJIjsqfbHq+CH/
	PE75euxeVwdZRMIqTtS/kXj2L5ynV4kkQw6vR/wU8PILsDCvozPCl+wlGIHwoqvj4I4u6ruFE47Uy
	5QA6HSYMp1IYlgI3O4OS5lumgJiN6gHdQGLiOKnkwEzKNSVDm07DhvBiLcbsIeQofcjfBD2fMWhfU
	gm3FrwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZs7c-0000000C5mP-3Pyq;
	Thu, 10 Jul 2025 14:19:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqS1-0000000BmS4-3NAh;
	Thu, 10 Jul 2025 12:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752150751;
	bh=/CM+lyP53J7UcGjxOHDtIVWvKIVGjaIQZW9DSJl3mss=;
	h=Date:To:Cc:From:Subject:From;
	b=GYEXtVAdnx9AE0HL2pY8kVV7VwIiPfXPaBO8PL4nj7cWPmEqP8EeXwu80gQ0p3IA6
	 xrrBBXgYgxDjWvmtyMgaO31OoBppKTnor/CRvnTVb6SihtWxPGW5zihjTX/NhMAHZv
	 pVTPK7oTGP1dDcqUnkovhELXn6q8QLQiDjNqdW4RD3pl3rUyXzUmmITBCbuPqeaacP
	 PkpvS/nvI+LBRvjFkrmJvA+uhOoJiztAxdMTuwd+n8LtfVtHRKZQ4ksheTIAVJvAHr
	 JUr3KxpKhzXljDGSZ+kqLFQC8aMweMiTojGi3SqgyKT0hnFbwTMHhvsCfPzecR50pl
	 W6irUbaAwbr+w==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07FC417E0EBD;
	Thu, 10 Jul 2025 14:32:28 +0200 (CEST)
Message-ID: <10c5abab-c8fe-4eff-8eed-009038436b49@collabora.com>
Date: Thu, 10 Jul 2025 18:02:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rk3288-veyron-jaq: kms_flip@plain-flip-fb-recreate flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_053234_012157_49EF9FA0 
X-CRM114-Status: UNSURE (   3.98  )
X-CRM114-Notice: Please train this message.
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

Hi Maintainers,

There are some flake test reported for rockchip driver testing in drm-ci.

# Board Name: rk3288-veyron-jaq
# Failure Rate: 20
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@plain-flip-fb-recreate

11:11:35.318: DEBUG - Begin test 
kms_flip@plain-flip-fb-recreate-interruptible
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Test assertion 
failure function calibrate_ts, file ../tests/kms_flip.c:1455:
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Failed 
assertion: 3 * stddev / mean < 0.005
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Last errno: 4, 
Interrupted system call
11:11:35.318: ERROR - Igt error: Dynamic subtest A-eDP1 failed.
11:11:35.318: ERROR - Igt error: **** DEBUG ****
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=5504)
11:11:35.318: ERROR - Igt error: (kms_flip:500) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=5504)
11:11:35.318: ERROR - Igt error: (kms_flip:500) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_kms-INFO: 
1366x768: 58 74250 1366 1502 1532 1592 768 776 788 800 0x48 0xa
11:11:35.318: ERROR - Igt error: (kms_flip:500) DEBUG: No stale events found
11:11:35.318: ERROR - Igt error: (kms_flip:500) INFO: Expected 
frametime: 17153us; measured 17154.4us +- 32.168us accuracy 0.56%
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Test assertion 
failure function calibrate_ts, file ../tests/kms_flip.c:1455:
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Failed 
assertion: 3 * stddev / mean < 0.005
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Last errno: 4, 
Interrupted system call
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_core-INFO: Stack trace:
11:11:35.318: ERROR - Igt error: ****  END  ****
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Test assertion 
failure function calibrate_ts, file ../tests/kms_flip.c:1455:
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Failed 
assertion: 3 * stddev / mean < 0.005
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Last errno: 4, 
Interrupted system call
11:11:35.318: ERROR - Igt error: Dynamic subtest B-eDP1 failed.
11:11:35.318: ERROR - Igt error: **** DEBUG ****
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=3, pitch=5504)
11:11:35.318: ERROR - Igt error: (kms_flip:500) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=4, pitch=5504)
11:11:35.318: ERROR - Igt error: (kms_flip:500) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_kms-INFO: 
1366x768: 58 74250 1366 1502 1532 1592 768 776 788 800 0x48 0xa
11:11:35.318: ERROR - Igt error: (kms_flip:500) DEBUG: No stale events found
11:11:35.318: ERROR - Igt error: (kms_flip:500) INFO: Expected 
frametime: 17153us; measured 17152.9us +- 40.380us accuracy 0.71%
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Test assertion 
failure function calibrate_ts, file ../tests/kms_flip.c:1455:
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Failed 
assertion: 3 * stddev / mean < 0.005
11:11:35.318: ERROR - Igt error: (kms_flip:500) CRITICAL: Last errno: 4, 
Interrupted system call
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_core-INFO: Stack trace:
11:11:35.318: ERROR - Igt error: ****  END  ****
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_kms-CRITICAL: Test 
assertion failure function kmstest_set_connector_dpms, file 
../lib/igt_kms.c:2247:
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_kms-CRITICAL: Failed 
assertion: found_it
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_kms-CRITICAL: Last 
errno: 9, Bad file descriptor
11:11:35.318: ERROR - Igt error: (kms_flip:500) igt_kms-CRITICAL: DPMS 
property not found on 52
11:11:35.318: ERROR - Test 
kms_flip@plain-flip-fb-recreate-interruptible: Crash: See 
"/results/igt.kms_flip@plain-flip-fb-recreate-interruptible.log"
11:11:35.318: DEBUG - End test kms_flip@plain-flip-fb-recreate-interruptible

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79896646

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

