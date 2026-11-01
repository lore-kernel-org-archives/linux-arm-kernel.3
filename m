Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F21A60A2622
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vjfN0r/j;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=dJPZ4lf0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mUcjaVQ7lyI1vitc+H9u1tzf0raKfI5LNSobORLeUkg=; b=vjfN0r/jJkefLo
	7k4zhPMF+q1aNcSR7VlJX07m/6KOINoEWB/cZYKRCzO2If8YRd5jvv6zP1uFU0elyO2CVFKlayrpc
	Z7kWHOxhuApfyHbb9fzTV4ZhzAW20/eTWeXZUbW3oLgIsj/ykcnlUESGG7DZ/EP9ANRhTVes7hJMy
	qAXIti0Tos06ByrqEu8p/JlHbpY3pALY0+mdAiJFveFeqLbduYHLJubSsoJkgqXGZPgL9XBkucyJf
	FlFRhE55GmoMs1R4fZiwyfkuMhYgjZjSSxV3Os/kEBBDBMUXJ3WHqd1bODIuaXgzy/3xnVsF/Bqoq
	9BfZrhXNvTXz8xmobqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqK-0000000EzAv-2TQe;
	Sun, 01 Nov 2026 22:16:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq8-0000000Eynt-0Ywb;
	Sun, 01 Nov 2026 22:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mUcjaVQ7lyI1vitc+H9u1tzf0raKfI5LNSobORLeUkg=; b=dJPZ4lf0xCMO5WIF9dnHeRq0nE
	QwMvkV4WnCbmPJF9dTEftjXGWXVgZSGwDjOulqBiaD6baRs4KFtJfyMBKYbnIi48Sfu2fIlLLOJpO
	kQOgtx47BpY8Dx5T/TsBD92rH7sFi4LQeqnfrtaFEMtxhAywbvh3UD8F5l2PfM2VhERPDgX9wazT9
	3vOWHD57MCwoo81GrMpA4CPjJYbFmUCi281qAU2GYvuU/lXMTX1jLvVwLgPXGkoxBRT7K0oz168LD
	vfPVGZEfqTvkAaTFI8YiKvlhoAWZi72uPITpL5aR6xYBAsNSu42EQCaAirwzFJH36JwILxFzlhEnS
	Gv6oxP/w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable USB host0 on Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:27 +0100
Message-ID: <179357131396.4107717.3550186345621350857.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-b4-helios64-usb-host0-v1-1-693fe316701b@iav.lv>
References: <20261011-b4-helios64-usb-host0-v1-1-693fe316701b@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141548_223485_1E01F400 
X-CRM114-Status: UNSURE (   9.69  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 11 Oct 2026 00:51:50 +0300, Igor Velkov wrote:
> USB host0 of the RK3399 (USB0_DP/DN) is wired to the USB 2.0 pins of
> the M.2 Key-B slot J2. Enable the host port of u2phy0 and the EHCI and
> OHCI controllers behind it.

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable USB host0 on Kobol Helios64
      commit: 5d96282894c536c85259ce0f25780b48bf77b9b6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

