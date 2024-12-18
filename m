Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832CBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIx4+ehJd8CzMirpUFa0hf5n+2tvsSKoBQPhoB0dzH0=; b=LM/HpQvqT12yBoQgnXu09h63D0
	j3JeEAcBoEN10Z9hcNRdFkgLkr8deW5cNI/ZIeDHw3z611E2IZgIcOb2ma9GiJZkpbvZGiJN5edmO
	nPGHP0fHfw57O5Dul8wTZTELFHhA2m64MiFIy2Y4qMPVuvyhucTv647VqRDxuoqMLs2Hfxv7FQ7Kk
	mhtDcNnm6aZBy9WVAmSZPQ3fRtky0U2gL91qQe5ZsXo7UShVJbnnAp64N/nkEZvURyeOhCKkAgwJS
	qEiqSA+A9GjuZoDcz/Qobl94qN/VmfVsm+4De+WAuP+D8jTf/RnN6mCoctpYy9anS4VMTNFApbBlH
	RQiHG4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwyg-0000000HBqd-09GV;
	Wed, 18 Dec 2024 16:32:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwxZ-0000000HBk0-2Sw1;
	Wed, 18 Dec 2024 16:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734539498;
	bh=mY3U7AbtnJQCWWh3Vx0S3LcnVgc2hSTazVJkcFVQpIo=;
	h=From:Date:Subject:To:Cc:From;
	b=iRNQuBoOyjkWUbElYhDirfToUam6+fy7IPKah0TVqldU4lZ+iRHU5AL8WHEsI3nBf
	 Qls2I4NVk8xKY4d+VPNmdkM9iP8zixQEdudA/dOS1/JjiG+ZDISM8yJcMj1ODSg8b0
	 4jtiauIPWuhe+DyDDDI4s3B6Couypnq0v5ltPIFeYbxbV5DS4vQRY9l1B7eBL9Cx7d
	 CRXb6vkMSeXKqs+iBFvAQ/9Mntj703tt2xkLQQEiDwBno/CAQz6XD4anhogP5neIiy
	 0Mustuguh4mEA2QZv9QxMXRv5mBpZtAbd4sIUhg1jQFt75stp5zCBqVXfgKlIIuCQx
	 VJyOYT1nPTzbw==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:15:862e::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B95C517E37B2;
	Wed, 18 Dec 2024 17:31:37 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 18 Dec 2024 11:31:30 -0500
Subject: [PATCH] arm64: defconfig: Enable RFKILL GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-rk3588-rfkill-gpio-config-v1-1-dfdf464f97d4@collabora.com>
X-B4-Tracking: v=1; b=H4sIAOH4YmcC/x2MywqAIBAAfyX23IKPBOtXokPYakuhoRCB9O9Jp
 2EOMxUKZaYCU1ch082FU2wi+w7cvsZAyFtzUEINUkmL+dDGNviDzxPDxQldip4DGmdJaK23lUZ
 o/ZXJ8/O/5+V9P2vpeaRrAAAA
X-Change-ID: 20241218-rk3588-rfkill-gpio-config-5c8e0333dae9
To: Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_083141_794087_D8A13B48 
X-CRM114-Status: UNSURE (   7.44  )
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

Enable as a module the RFKILL GPIO driver. This is needed to power WiFi
and Bluetooth radio on various RK3588 board. Without this module, rfkill
will report the switch has hard blocked, which prevents using the WiFi
or Bluetooth feature.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e6158633f07c1f3532fba62f09b31e7448..9293e988789f10cf074dc80188839a32485bee16 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -200,6 +200,7 @@ CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
+CONFIG_RFKILL_GPIO=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_NFC=m

---
base-commit: e0fc7a7869452b877c26644fdf0b38dd9a6cf8d2
change-id: 20241218-rk3588-rfkill-gpio-config-5c8e0333dae9

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


