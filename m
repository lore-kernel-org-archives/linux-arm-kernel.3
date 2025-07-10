Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D98CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5pXaI1r/zpH3w7W9hJhtiCehE4r0uIxKw1TgRh8vR8=; b=aFxCXrAH5lBG8da5tPM9KN+aMD
	m4+WIg8KvmeEDjqGpMX3njBKv4r0JqFOTHe4gx5EXziY6AUPD8gws48aDZXryg0+dWqlgAkXKZ58S
	m6bUFRfPYZMasTFqThN9W/V9oHvkzXE5OvBy24fDU4WXwT1oyiIjqiAAKX97TetCEFSQr25Wv8CxS
	fbPjoSaKco83450kNFp3neTPcRIughwd8U/XBrtCiahpFVpeKUpTGQV04ZO2ffxhq4oDD82RS5E+j
	QzpoH8gCgpa3CODc0L+99Dkm57qwcmEvDs26sboa3A7dp76EbERRest89n3xeJA7Qb8EnYg7v62Qb
	Uu2qHFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZr6E-0000000BtNz-0Vdz;
	Thu, 10 Jul 2025 13:14:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoqW-0000000BXEn-0I6L;
	Thu, 10 Jul 2025 10:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=S5pXaI1r/zpH3w7W9hJhtiCehE4r0uIxKw1TgRh8vR8=; b=Ht9a9ds8QmgNk96vPVGQ+vPQy7
	tzfGfN5/ClJZvtqv6wE3cxEjpMhZYAPuICJu2IikGf3mATfmr/ESku9F9AKfaQQ/kZNO+iQ48/+Eg
	6WziwOLSuSGLMFiL3sX9WTqMWq1ku93MPek76sg2Pkt1eWdK84abTuROtVXhhfpRSn+/FqSmoMKB/
	aFkMw4cdrKTLUhG/zWx5+LMmTNDVZUnPsAFw7dc3ejODB69Z8+bWoleIEAT8fPrY3rE2hYf9LRJei
	7bqarUkQVgH50GullncS6Bq/88t+1tmdlotpBHF1Wy6sL3JQsx4TuR91PpihGJgmcSmC38Uvgg+9v
	9i+terzw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoqS-00000008zyD-0yat;
	Thu, 10 Jul 2025 10:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752144574;
	bh=6eCyQRGUL84zvCp0r/7JvZNwmMn+HX4Mb1TJDE3F9Wg=;
	h=Date:To:Cc:From:Subject:From;
	b=XuviOK6SBd2NvqMbB2L6+gu9vU3NmambBlBUx0FGqVrbYsdYcqmU28Pr3MWUO6R3o
	 6Oir2TVfotwjcaQLnNCHkMoPa8smRsz1gjumj/H1DUYXG0oFP0S1GhSfiLKCMnZ3cc
	 aJ9uONWY7gPE52f3OR5+zsRrN4s36z+FVorr2LWvtcATAy4Fq6ScnF/9Jcil2HBYog
	 qbCqW601yIBf4IxJmHfxl3avVAhBnVUOeMdEnvuH5rdB3NpH7eZCSvVaMCLUyoQWio
	 ti5fU/6NJ/ZOV6WaZubJM0cJaXtnu6x9FaNfLoQMBn80BUehK2XOsroFQlV1WkU9sz
	 aoF9r2NETeH7A==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5501717E0489;
	Thu, 10 Jul 2025 12:49:31 +0200 (CEST)
Message-ID: <59724e10-12ca-4481-b0e4-72d7b6e4dae0@collabora.com>
Date: Thu, 10 Jul 2025 16:19:22 +0530
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
Subject: drm-ci: rk3399-gru-kevin: kms_flip@plain-flip-ts-check-interruptible
 flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_114940_778704_8B831780 
X-CRM114-Status: UNSURE (   4.28  )
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

# Board Name: rk3399-gru-kevin
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@plain-flip-ts-check-interruptible

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_flip" "--run-subtest" 
"plain-flip-ts-check-interruptible"
pid: 1007
exit status: exit status: 98
stdout:
-------
IGT-Version: 2.1-g26ddb59c1 (aarch64) (Linux: 6.16.0-rc2-ga202a71c05dc 
aarch64)
Using IGT_SRANDOM=1751940132 for randomisation
Opened device: /dev/dri/card1
Using monotonic timestamps
Starting subtest: plain-flip-ts-check-interruptible
Starting dynamic subtest: A-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16669.4us +- 86.357us accuracy 1.55%
Stack trace:
   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1435 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1856 run_test()
   #3 ../tests/kms_flip.c:2141 __igt_unique____real_main2028()
   #4 ../tests/kms_flip.c:2028 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest A-eDP1: FAIL (1.733s)
Starting dynamic subtest: B-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16662.7us +- 30.159us accuracy 0.54%
Stack trace:
   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1435 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1856 run_test()
   #3 ../tests/kms_flip.c:2141 __igt_unique____real_main2028()
   #4 ../tests/kms_flip.c:2028 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest B-eDP1: FAIL (1.544s)
Subtest plain-flip-ts-check-interruptible: FAIL (3.308s)
stderr:
-------
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
Dynamic subtest A-eDP1 failed.
**** DEBUG ****
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_kms-INFO:   2400x1600: 60 266666 2400 2448 2480 2564 
1600 1603 1613 1733 0x48 0xa
(kms_flip:1007) DEBUG: No stale events found
(kms_flip:1007) INFO: Expected frametime: 16663us; measured 16669.4us +- 
86.357us accuracy 1.55%
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
(kms_flip:1007) igt_core-INFO: Stack trace:
(kms_flip:1007) igt_core-INFO:   #0 ../lib/igt_core.c:2075 
__igt_fail_assert()
(kms_flip:1007) igt_core-INFO:   #1 ../tests/kms_flip.c:1435 
run_test_on_crtc_set.constprop.0()
(kms_flip:1007) igt_core-INFO:   #2 ../tests/kms_flip.c:1856 run_test()
(kms_flip:1007) igt_core-INFO:   #3 ../tests/kms_flip.c:2141 
__igt_unique____real_main2028()
(kms_flip:1007) igt_core-INFO:   #4 ../tests/kms_flip.c:2028 main()
(kms_flip:1007) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:1007) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:1007) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
Dynamic subtest B-eDP1 failed.
**** DEBUG ****
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=3, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=4, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_kms-INFO:   2400x1600: 60 266666 2400 2448 2480 2564 
1600 1603 1613 1733 0x48 0xa
(kms_flip:1007) DEBUG: No stale events found
(kms_flip:1007) INFO: Expected frametime: 16663us; measured 16662.7us +- 
30.159us accuracy 0.54%
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
(kms_flip:1007) igt_core-INFO: Stack trace:
(kms_flip:1007) igt_core-INFO:   #0 ../lib/igt_core.c:2075 
__igt_fail_assert()
(kms_flip:1007) igt_core-INFO:   #1 ../tests/kms_flip.c:1435 
run_test_on_crtc_set.constprop.0()
(kms_flip:1007) igt_core-INFO:   #2 ../tests/kms_flip.c:1856 run_test()
(kms_flip:1007) igt_core-INFO:   #3 ../tests/kms_flip.c:2141 
__igt_unique____real_main2028()
(kms_flip:1007) igt_core-INFO:   #4 ../tests/kms_flip.c:2028 main()
(kms_flip:1007) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:1007) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:1007) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:1007) igt_kms-CRITICAL: Test assertion failure function 
kmstest_set_connector_dpms, file ../lib/igt_kms.c:2247:
(kms_flip:1007) igt_kms-CRITICAL: Failed assertion: found_it
(kms_flip:1007) igt_kms-CRITICAL: Last errno: 9, Bad file descriptor
(kms_flip:1007) igt_kms-CRITICAL: DPMS property not found on 54

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79971538

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

