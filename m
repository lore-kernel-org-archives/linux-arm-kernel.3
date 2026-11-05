Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB85606D80E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ut12m9B5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLV8emy3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=; b=ut12m9B5bGSoSB3C7j7kaB32kp
	8aICOvMI7O0OnPHcu6Yo2OTmOhZI9vlREUfsIZzBdDcmHaIyoNXI1PPDAu8cmqEQFOgKbCAEFvh0j
	5UbkdP4edvllECuR8WiywS1VO/I35DPKOxadj62h2B2fSAIcKIxbFhAYKNHvxVHCoAtuxwrje7RnT
	hQnuKDmRzF2ZIOoqejmwdy4KYJq9/xFtcL925hhiQn6kNiqz9zu7yK36sz/s/jBwWBWSKZVUWA7FZ
	40XM4jp+HIP/qTCFA70wSESKJQAyHTsKf4MWm3yG8hHP9PxO3lXvEltC/h7eojBUyD7cuccV0+rHA
	+7IUdHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6ny-0000000ArRn-0eOI;
	Thu, 05 Nov 2026 23:23:38 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6nv-0000000ArRD-3J1m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 23:23:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so10394a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 15:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921014; x=1794525814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
        b=rLV8emy3gLOR5LFW5bcajQiw+ePUQC2tWpPzEo2mRgVs6AxJEGiQnpc+Ds/tAB8de7
         hKtl8yVdWKw0FnSL/t+i+rD3f82t8ln6KHosQcilGupkv9+g4YCRy7p71CaFhBryKg1y
         ZQV0E3OnHhgdfZoqfC7YcLBo668rVXpABgGuKuAiFkKX/sjcPM87pE3+bI7/a2EPBrCe
         ERNj7LJlvxoD5e77tj1jwtvgfhTNcMJuGNq1F75nwbuzzB8JV7Moe720UOTM0UvCr2GG
         YLV1zMelAev0q/M93xxzS3u86HlpFVFsqm+hY4+yXtojS/ekMQgQebZpxFfdwPISbBL3
         39lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921014; x=1794525814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
        b=gt0X1ba2BP5p7tIvyNZcZr4b8Av1DsB5z2K463UmzkBUHqQLdggPirw+C90pHs8LC9
         5TXwzp9mPABWPMdA0t+umzBMK/tBzxnT1qRlVpcVdUaihxC8utBfKIk9haeQDnDnqI86
         2eLh9+Jp0v9Y/qE+xtemdpF3yWp+mm2Gsy8VINLr0JJR4TXytkRSbPsv1idXI9CqhGIM
         3NeX6+pELmrJNotFK6fdaCirtuRMOyHZU434SygROs2o3SzwwjxeFG3R9pT8SzqvUkvg
         rWhIwIO6MibmYpTWe7/KldPSrrt8jpetXWXGn2NGKvrTpGuJbuHDB4BhO1zhkwXzKK6j
         FLpw==
X-Forwarded-Encrypted: i=1; AKwUvBxG3gzc28cMf2yv7MkkNqUU716Fuf7z7pVRbqQBdVcD/31yjKBLHOygO/ibw1QqPoG4MuGII/3VZM5hWmMkg0/D@lists.infradead.org
X-Gm-Message-State: APuU4Z93Pi/6n5+CCb1ZKC+rNAuD+Df5ftphLJoJR3QayjfarTIkYydq
	RqLz3PpWXjiKoFUvy1zA6rry6ZlvsW/2AgzunvVDwjZ+DoixBGS04CAO
X-Gm-Gg: AYBFou1RcsWBLL8jeFpUipsUYzWwS78pUKHXXhW4S8K0UagYCo6VVhzTJckpzpb9sOA
	DTpKiDy4U2U6UIfq7QbwlGD9ldM/9QWkdge85c9iEaaL9JlV8UZVqKGYwupW6QfrZGRJkj7hQk9
	f2/Gu8SK1kyzyQwjBdGEeFiMFdMc0A8rVt7f9SvB9fqFHR+6zPr59n/Sh1AwEt/BA4fJXVYQIF7
	xyA5J4QZZtNh7uFSJFBPvxRvrqb3ChfDMrr+HkijfYQxkExBjK7ru2WIxc9bK8R15zBH+QfFRZ6
	JTTy94J+mlR0XxtKzXLCb9+dwPxP8CNOEgs2eb2qzF8ZcJSJlFn8ESoOkMIUyqguHQmnPFTKjKS
	PKdKqTwtXhA9E/oupO82V5/mawNxYGbGSKia+6umoJyxGwMLFHwzpO1GmiRoubv2grlrKww5e2+
	GCLeRiBgAppGrYrBdEnOYheX5HVd0H+J7KVh/LEb7CZCkbK0k8DOCahSnw6a6XMfYAtGOdvtLZq
	8eSl8A1HxAelrqWeAJQ0lGTWhOR4JuhWIRkeQhDoSKXGmG2N3CVktUamNtJXnzwrDuNIe28lk1v
	CnVaHYejLYMTfkMfHDHjP0wNy4nAEId9oOl5mhzgLwGYEFfVicEYkQK/L38y5L5jhkAIsiXAOWd
	EypQilS0=
X-Received: by 2002:a17:90b:2590:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b0db014274mr896768a91.0.1793921014532;
        Thu, 05 Nov 2026 15:23:34 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:33 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 0/2] media: rockchip: rkcif: ENUM_FMT and bytesperline fixes
Date: Thu,  5 Nov 2026 16:23:08 -0700
Message-ID: <20261105232310.385463-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_152335_826350_74E59C11 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes two issues in the rkcif MIPI capture path, found while
using the libcamera simple pipeline handler with a Sony IMX415 on a
Radxa ROCK 5B+ (RK3588).

Patch 1 makes VIDIOC_ENUM_FMT honour the mbus_code field, as required
for V4L2_CAP_IO_MC devices. Without it, userspace can select a pixel
format that doesn't match the media bus format, e.g. a different Bayer
order, and the captured images have wrong colours.

Patch 2 aligns bytesperline to 8 bytes, as required by the MIPI DMA,
and honours a larger value requested by userspace. This allows the
capture buffers to be imported as DMA-BUFs by the libcamera GPU
software ISP on Panfrost, which needs a 64-byte stride alignment,
instead of copying every frame.

Tested on ROCK 5B+ with IMX415 (SGBRG10, 3864x2192): correct colours
without any userspace workaround, and a stride of 7936 bytes accepted
and used for zero-copy import. The corresponding libcamera change is
under review at:
https://patchwork.libcamera.org/patch/28662/

Faizel K B (2):
  media: rockchip: rkcif: Filter enumerated formats by media bus code
  media: rockchip: rkcif: Honour the requested bytesperline on MIPI

 .../platform/rockchip/rkcif/rkcif-stream.c    | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


