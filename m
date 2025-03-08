Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB8BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Le3hYMAYg2a39hHnv9MXC3X/fcJZT6of4UTCrB3LqeQ=; b=kycmyzlk6NFdh5oy1v10GBR//s
	ms2y4bMhpyruOK2h1rEz8q8yusC8CCOetADXqm2TYkrbiiA+VWdiy5Uts0whYs7OZOhLKXv/gE90b
	0w9dv1Kzs2kq4aj4URUqZZx998iLT02asg/VttGEaJwC+fjLnaT5ilbGj+vkYbzMAS6+/q5lJBde9
	0hqsty95nbatpbzRVvhiX40q5oDh69sDKDU7I6enQlYdlrv4A3Rc7T45GWfu3E5nbsYf0QtgeMPRv
	tLOafqwTERUtasaxJb0K32EM3XjoLNmSmNkCVRxG+LYceiXmf6b0oOTBlKykg1+Rog+INy+2VARKD
	k/m9lyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqyA5-0000000Gwfn-0FSw;
	Sat, 08 Mar 2025 17:40:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy2A-0000000GvYx-0VfD;
	Sat, 08 Mar 2025 17:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Le3hYMAYg2a39hHnv9MXC3X/fcJZT6of4UTCrB3LqeQ=; b=xvTAMJJ2wKtjHzrOKxWewBTJJR
	peeqDCycSz8HiAn5rP9LOsc/6XXeNrCLNj0p0riJg3bqyl42B2FpVOyllKuEJNtUxRzIJnFRSBD2f
	Gem/rZ9fkpgjw1xmw72IHnFY+e4eGvEcpNS4h2zbOY/m9sTVLKSl6bt5y/b9nYxkEHPM/nHTiB3Fr
	+j6xD3/GHr+9DvqXPI0jNty1/9H6tjUIvDvJjourq9yPMhfV+gDldN0Er2h5QEPuoz181D+V8YZzt
	iPsQomT8w5+K8C6oDAZ6hmAOgppVF6u0IEHGVSZCh6OMQltX4VAYHE1MfDiiizMk9jgWgNdtCSJ4C
	kVhduGWQ==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy20-0004Tx-GC; Sat, 08 Mar 2025 18:32:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: slow down emmc freq for rock 5 itx
Date: Sat,  8 Mar 2025 18:32:06 +0100
Message-ID: <174145503579.101861.2973510887051189420.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228143341.70244-1-liujianfeng1994@gmail.com>
References: <20250228143341.70244-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093222_156112_313AEBBB 
X-CRM114-Status: GOOD (  11.43  )
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


On Fri, 28 Feb 2025 22:33:08 +0800, Jianfeng Liu wrote:
> The current max-frequency 200000000 of emmc is not stable. When doing
> heavy write there will be I/O Error. After setting max-frequency to
> 150000000 the emmc is stable under write.
> 
> Also remove property mmc-hs200-1_8v because we are already running at
> HS400 mode.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: slow down emmc freq for rock 5 itx
      commit: b36402e4a0772d1b3da06a4f5fbd1cfe4d6f1cc0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

