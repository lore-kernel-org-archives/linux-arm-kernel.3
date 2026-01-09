Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE9D26D9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjbjUpsAsCVJ0RrUntwNzm+wTNXU0lp1MnQ6qvk5YjI=; b=vX28QX0fv7mnaxoSZXp5qfhHGk
	ufSs2ee+YoKJJzPK8otuEvPiX9tjCYQvfINIDF+TCpyuZZkZ/Fpjhh+WLCiU9n8x0f+KN4rMjwnI0
	jH1CuO/Q0qFxATnKdZGByo0M10z6oLqM+OXvONOuQxJYyE67PeGIVGObjrfO/VTsHUbhjAd9enbg1
	pp3V3nE9i2jSzpwZhn8N0hA2N1nfpYuWMeLXR5XD5xDSpltO5Fyc0T5gQnv/q48SB0GhXhnuHWV1y
	sNcK3qLP9eHMfCKAMzMFgmnvQvtgx76yhmmqt3hyyXOGqRXDjL/wOn/20VhTfonlLpvOp0frZOwlr
	89biwD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWx-00000002xNp-2dCP;
	Fri, 09 Jan 2026 19:52:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWq-00000002xG5-24Ij;
	Fri, 09 Jan 2026 19:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xjbjUpsAsCVJ0RrUntwNzm+wTNXU0lp1MnQ6qvk5YjI=; b=N+RbX1AcVuJ0MQfIEnfmvzjJjL
	6cK/v3XBYoW6UOL9O12FRfKl1MfNlt0OONGWPGXpsQkio/yN6FeRY9uQJ+pQipnXEVKt4TBsbXRJ+
	85ObIbVp3U+zig0MfKBWhcGmb28xY4lzN18/EsbnwwnjFIIB46/ltrw7vCpwodjxe135nLzi0Epbq
	ZOBQJAuwS0ZHHCjKT8G+T0W+r8+akZZIDtFknQJ3XagM6Ex0I5sQ6ODf/rdHmww19oZ71ICIF+TLS
	kzwyyiC6USvjcySc8VZKpYsMwnnhng8MtShA+Lb8P8/5RjTg/XbweYc83w+mANb7OlnukurJqvA2h
	jJmSCDeQ==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veIWi-001fth-Od; Fri, 09 Jan 2026 20:52:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Petry <petry103@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Damon Ding <damon.ding@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable second HDMI output on CM3588
Date: Fri,  9 Jan 2026 20:51:54 +0100
Message-ID: <176798831382.3446147.12018502751434054481.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021160603.96934-1-petry103@gmail.com>
References: <20251021160603.96934-1-petry103@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_115212_537882_2711E056 
X-CRM114-Status: GOOD (  10.49  )
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


On Tue, 21 Oct 2025 18:06:02 +0200, David Petry wrote:
> Enable the second HDMI output port found on FriendlyElec CM3588 and CM3588 Plus
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable second HDMI output on CM3588
      commit: a770eb1f3219dfc4c28dac66c96735fa8acba4e6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

