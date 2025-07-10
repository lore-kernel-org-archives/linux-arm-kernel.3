Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC65DC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vTTyze3jDN36/qxlDdvHUAVe44A6gsIJiPRwc/8yONY=; b=iVjcteTRGMkmyFBPEdLxva4mPs
	xvkZdz7p0MN5S54hXcqPCudPI/ty80ir7H+gVsMWyWm82jxvBhKTE4BFNe9zS56Q5VZbPvV2I2Z14
	yYL/WKJjK564mEAWhBXwmjVfhdxmuS3Lokk5Os8D4U1NJYjCkdUjoCFutYIX36WkyuYk7mOwV2y0Z
	D+U09qHEoQvO9pXeRLpI43ZBtkff2TMK+N5/kAXcRHuft2nBappwFy07VIHqq8zYot+L+q2l8W+y6
	6kf/1CSecJ9+ek636B2Vjo9ThAN5r8KXTmTDud6WWVNUsbzcPdygYdmcAgvujmHheNENwY7vwQOUk
	fYxfGAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZppK-0000000BgEL-3rmk;
	Thu, 10 Jul 2025 11:52:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoXZ-0000000BUY5-14al;
	Thu, 10 Jul 2025 10:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752143407;
	bh=ULw7wT/Zin6p0rqWnTH20a2r+OT/dAS9iD1kWJ24mCM=;
	h=Date:To:Cc:From:Subject:From;
	b=YfsgW3EAIc752yTueKOYdPfO2PC48GvG6SHfQOyHvDAiOYU+CbK+jdGlyq5DsjyZ8
	 aGtBm4EAWIl4QD9nxtJB/PlySflePaa5WN9jibeUeAIAKqOzSbue0O50uXQna0IlZy
	 eHK0ktjNkTiuK0B5A1XksMvDIu9gV7On3cydnBs86xWvoSwjbRfZ5eCGLJlJTSxRmH
	 uZG1wa0fO4pxEOGC19T2FqK7DHagE9f8KvSA5mt8fQ/qcX51fsjtzoZJhFJquDLRzo
	 XRcEB5LkUos6XaQdjLYuEz5nRCLtMi7LDGow1+eg+0+CJO9UKc30gdp3ORXoyFM3E1
	 vtxtIlKQxltQg==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 053FA17E08E3;
	Thu, 10 Jul 2025 12:30:03 +0200 (CEST)
Message-ID: <e29c2892-08f2-423f-af72-e4d8b207fd1c@collabora.com>
Date: Thu, 10 Jul 2025 16:00:02 +0530
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
Subject: drm-ci: rk3399-gru-kevin:
 kms_bw@connected-linear-tiling-1-displays-3840x2160p flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_033009_698254_FCEEEE0A 
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

# Board Name: rk3399-gru-kevin
# Failure Rate: 60
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_bw@connected-linear-tiling-1-displays-3840x2160p

02:16:31.041: DEBUG - Begin test 
kms_bw@connected-linear-tiling-1-displays-3840x2160p
02:16:31.041: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
02:16:36.124: [   60.745159] [IGT] kms_bw: executing
02:16:36.124: [   60.758055] [IGT] kms_bw: starting subtest 
linear-tiling-6-displays-1920x1080p
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
02:16:36.127: ERROR - Igt error: Subtest 
connected-linear-tiling-1-displays-3840x2160p failed.
02:16:36.127: ERROR - Igt error: **** DEBUG ****
02:16:36.127: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: !(pipe >= num_pipes)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
02:16:36.127: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: data->output[0]
02:16:36.127: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: !(physical && pipe >= data->connected_outputs)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3840, height=2160, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=15360)
02:16:36.127: ERROR - Igt error: (kms_bw:356) ioctl_wrappers-DEBUG: Test 
requirement passed: igt_has_fb_modifiers(fd)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
eDP-1: set_pipe(A)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
eDP-1: Selecting pipe A
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: plane_set_fb(58)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: plane_set_size (3840x2160)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: fb_set_position(0,0)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: fb_set_size(3840x2160)
02:16:36.127: ERROR - Igt error: (kms_bw:356) INFO: Assigning pipe A to 
output eDP-1 with mode 3840x2160p
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
commit {
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x3b/59
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 58
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x3a/58
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: }
02:16:36.128: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: !(ret != 0)
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
commit {
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x3b/59
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 58
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x3a/58
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: }
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO: Stack trace:
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #0 
../lib/igt_core.c:2075 __igt_fail_assert()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #1 
../lib/igt_pipe_crc.c:433 igt_pipe_crc_get_crcs()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #2 
../lib/igt_pipe_crc.c:592 igt_pipe_crc_collect_crc()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #3 
../tests/kms_bw.c:247 run_test_linear_tiling()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #4 
../tests/kms_bw.c:293 __igt_unique____real_main262()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #5 
../tests/kms_bw.c:262 main()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #6 
[__libc_init_first+0x80]
02:16:36.130: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #7 
[__libc_start_main+0x98]
02:16:36.130: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #8 
[_start+0x30]
02:16:36.130: ERROR - Igt error: ****  END  ****
02:16:36.130: ERROR - Test 
kms_bw@connected-linear-tiling-1-displays-3840x2160p: Fail: See 
"/results/igt.kms_bw@connected-linear-tiling-1-displays-3840x2160p.log"
02:16:36.130: DEBUG - End test 
kms_bw@connected-linear-tiling-1-displays-3840x2160p

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79872340

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

