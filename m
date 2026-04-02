Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C087D3942E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nFd9jIu7oCg8zWjsPLajZf3hoUIOyxi5ZuP6KD1xE0M=; b=EXsRwKgpYbrgXz
	3Akyhda6m+VNDE/fRc1V+EFbKVUyfUqbW1iIDxNCqwdZzZmZUo3HT19TVZRIQ1pMQ88frgS/nkCdP
	qqWpiyy3PKsqkDS6vRGAVrESdM+3X06AEX9851jL34AAuyx8I2BYLF89FBVWnyOCXJMijKWbE01cd
	zMiPBD43qLTkD4OGOgXrThAZaPLNdoOtHaSAOVrz1xSEHXLKXZKkIsEgfobhhz0ho6xbkir0jk91I
	xK/Bq1EgNd5LBmwFdRRKHhDp6163B1cYrENbRBCAWu5+dTnTYp2err/AVSa67OYeYmsG9v/t/gRDB
	7fXZ3arm/OmeHsfcHqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IhL-00000000F3K-1SjI;
	Thu, 02 Apr 2026 14:07:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IhJ-00000000F0p-2n2F;
	Thu, 02 Apr 2026 14:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=nFd9jIu7oCg8zWjsPLajZf3hoUIOyxi5ZuP6KD1xE0M=; b=goV7VbG2kxcN3leV03D/4P/pXz
	9r14DSWIT+SGTQBkoB4IvfHVgGMvC7/L9rhz4G9hBRWGghi2dy7UqbEnFoBF5AlA1x0RWJMTgF2fb
	TR2C9889O/o+ZPnAExCx+Dowr7yievTsjFHAzAbGT0fFfG2AknISBX+hJwO/Jfj3+LjrIzqQ5452A
	7ine93fuHgBxu/4HLSr2j8RtX1tlfp+iP79H/Geu1gfq2Ih1SQEgbksK/n27NyAj+jhGSmJCztU5n
	ZGXU0XCMuL4I6WtvrBqzn4TRqnZnc0IJTjMeKk3fvMy/KlsHqNd1WN/3N9OCxqyXd0Kk5GMWDRiw+
	vGpQQBaA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IhG-00000002ctk-1IqA;
	Thu, 02 Apr 2026 14:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775138810;
	bh=QK06DeIrGJLo+skpQxZiMaOTbSFroKiAVBO1zjQLL8s=;
	h=From:Subject:Date:To:Cc:From;
	b=LFogEVTIizHA9dz8cc7MtMaY27t1BL8kIFa3b2Dah2VYrBHqYyeWwlhC9njLL/YwN
	 CYzUAxIrgSTmwkSLCGwmJvhnrgiIXEs4hFf4M/8lVRe3B+k4XR5whz0A9QX4gDvr7F
	 /VfWhjLBiZSyw4eU6pslcWytUeG7/GW92jdigFhln/PQyLhlfY46zvoSAE7TLFuWYy
	 h5okdLGQdiXV2Derhst7wleIeWhSHR8k0WB6e39hs6r9O8hbD2qoM0dCQlRzzCBxjf
	 eqoO+YzAzGvbRKp5gIolZYwnQQNGhA28QYAaLMSBFN6gklMqwORefb7AZbwCnnGFre
	 PVs9V1yfe8MQQ==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71C5D17E7827;
	Thu,  2 Apr 2026 16:06:48 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/4] media: rkvdec: Switch to using a bitwriter
Date: Thu, 02 Apr 2026 10:06:35 -0400
Message-Id: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ7CIBQFr9KwFgO02NaV9zAugH4sWosBipqmd
 xfqzo0uJ3lvZkYenAGP9sWMHETjjR0TlJsCqV6MZ8CmS4wYYTtSshq7a+xA4ckDliY8nAngsKY
 drVpZKl0rlK53B9o8V+3x9GE/yQuokF150RsfrHut3Ujz7kciUkxw2zClm5pJ3pKDssMgpHViq
 +wN5Uxk/4hYEgkuqppXknDafIuWZXkD4F6jABcBAAA=
X-Change-ID: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_150658_481812_C9178CFE 
X-CRM114-Status: GOOD (  10.75  )
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

Using bitfields in large structures where fields are mostly unaligned can
be hard on the compiler.

Issues have been reported with clang ([1], [2]) and, even though those
issues are addressed by clang devs, some setup can't or won't update clang
just to compile a driver.

Even when fixed, the compiler still might have to allocate a bigger stack
frame to manage misalignement. Coupled with other features like KASAN, the
stack becomes larger than the kernel's maximum [3].

To avoid this, let's drop the bitfield implementation and switch to a
bitwriter. There is already one for the older variants, so make it global
and use it in other variants.

Note that only buffer structures are switched to the bitwriter. The
registers representation structures are kept with bitfields, as they are
properly aligned every 32 bits and don't require heavy stack overhead.

Also note that the VDPU381 SPS and PPS structs are kept with bitfields,
for the same reason that they are small and aligned enough not to require
heavy stack overhead.

[1]: https://lore.kernel.org/oe-kbuild-all/202601211924.rqKS2Ihm-lkp@intel.com/
[2]: https://github.com/llvm/llvm-project/issues/178535
[3]: https://yhbt.net/lore/llvm/20260121230406.GA2625738@ax162/T/#mad878ec24a8224e1387ef5e73cb77b9ada55e3f2

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v3:
- Change bitwriter function to static inline instead of its own object
- Link to v2: https://patch.msgid.link/20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com

Changes in v2:
- Don't use BW_FIELD to compute buffer size
- Use correct size for buffers
- Fix missed indentation issues
- Link to v1: https://patch.msgid.link/20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com

---
Detlev Casanova (4):
      media: rkvdec: Introduce a global bitwriter helper
      media: rkvdec: Use the global bitwriter instead of local one
      media: rkvdec: common: Drop bitfields for the bitwriter
      media: rkvdec: vdpu383: Drop bitfields for the bitwriter

 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    |  39 ++
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  51 +--
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  |  40 +-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 109 ++---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  93 +---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  |  57 +--
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 171 +++----
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 351 ++++++--------
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 502 +++++++++------------
 9 files changed, 562 insertions(+), 851 deletions(-)
---
base-commit: d0c3bcd5b8976159d835a897254048e078f447e6
change-id: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


