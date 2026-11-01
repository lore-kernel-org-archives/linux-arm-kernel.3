Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6073606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V7MC+83z;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=v8151im3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=koqrDmmt4O2BTAa9AgtZ7rW5JtPwtmhVY/Dn2gUanrA=; b=V7MC+83zsFw4qw
	1P946MaSiIy9th0R1F9ZlMJpzGaZdVaH/B30uU0/b1hGyLYa4YHM4zaWHKfM16Vwp9xRW9L3io5QH
	ZIo0GPrPYLjGCn/OO2Q40gqHifnuO8o5DOaLLGbpVkkQD4tQqu1jGsgZpsvfn5jfdpLw1yBVMq5fy
	1ZB2kzn5ZUd7fu/x3bKoDXsC4PAlT6Ivkw5vlge/BXP4XJl8J3BmiuRmTQ2njPEj3OAdWUKmgv9OO
	vyMmarKRfXRu+0oRSLteyngHvQr++HUu+Dqwrx/JpuTRUI9BKyUBk1L3th5yyINwLwjaS3PL0PK/x
	mCd5HyPC8abhPgqePSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqM-0000000EzFI-0Yw0;
	Sun, 01 Nov 2026 22:16:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq8-0000000Eynw-0g3t;
	Sun, 01 Nov 2026 22:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=koqrDmmt4O2BTAa9AgtZ7rW5JtPwtmhVY/Dn2gUanrA=; b=v8151im32iqLSPZW/19OcA/UAT
	kSapPEGiX/dUFAcVl9Tl+QnqsQDTPswcXwKBojtYS2LOPUQRf6zZ03XdqugWd/XWOScXLRWQ9godl
	SaeO2YQ7i/8D7EqbaW18wEXN2ZJDRDGgU0uOoxUkv/Nfl8UvgUwqEajpLsvd6t2b2v0NdR/pSQGWU
	NPvpmRCRpkmkiAncvX/Yjb55ZLpR2XXkYrLtb0DB/WKR9yLm25uGDyQjdCgCV+TE8SV+d7y8bytxQ
	hOGkUP/O7O37rZjLlJYqR4Z1lqnI/rRcOqf2ysWEGpfNAxpSPhCa67g+M0lrRMP3G6AyoM/3AXKDi
	6+sP7pbw==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Add vdd_log and vdd_center to Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:25 +0100
Message-ID: <179357131387.4107717.12481039737139265735.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-helios64-vdd-log-center-v1-1-4cafd110e0e5@iav.lv>
References: <20261021-helios64-vdd-log-center-v1-1-4cafd110e0e5@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141548_248669_A4323C46 
X-CRM114-Status: GOOD (  12.71  )
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


On Wed, 21 Oct 2026 02:02:29 +0000, Igor Velkov wrote:
> The Helios64 feeds VDD_LOG from a PWM regulator driven by PWM2 and
> VDD_CENTER from DCDC_REG1 of the RK808, but the device tree describes
> neither of them.
> 
> Describe both. The vdd_log range comes from the schematic (sheet 8):
> 0.83 V with 3.0 V on LOG_DVS_PWM and 1.4 V with 0 V, so the PWM is
> inverted. vdd_center gets the same limits as vdd_cpu_l.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vdd_log and vdd_center to Kobol Helios64
      commit: 5397d554ac76f10737eb7b87c48c8c4bb26d2017

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

