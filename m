Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC90CDB462
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgBGZ2yZajVmZ1h/tTLg1uNgBwqZ+mIw9DPRp3zPgVc=; b=NaDRIfStywrVDuiiCQRnVBrXwt
	0KZJk8uotIdOtz/hM48bmNnnWyqhkPyaa4WBvWlY+7gr9rzcZ+QD7+P4UFsROOSRjrT719XkQCAgw
	rKUo/UC3cdTKOkFf/tAq7pV6PbWvqfD5qAoaQQkxfvObn9QkC20BBGlM9UId5M64pOiQjjTOcy3ww
	4A9A7EXNNTSqrEuSkT359DtkFuoxfxo0melAQtKDPCtF3Hqlie2LnbNjc2mTgk09cBm+kbGrQDdI+
	rOpDpIgcq2TrWBzO90PDxKFqcHRQZqtuiT4CZAJgDbFkkyehORi8l3Cvm0+AM1st2aHCJY7fjABJH
	TGhyXhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgNY-0000000BEZW-3QbW;
	Thu, 13 Nov 2025 23:05:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgND-0000000BENA-11dN;
	Thu, 13 Nov 2025 23:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IgBGZ2yZajVmZ1h/tTLg1uNgBwqZ+mIw9DPRp3zPgVc=; b=f2nKSRBKTmdga0eJoPJb4dN2KH
	ir5N/ul7aOER4NNEtFcE+riZxZNW6vbdc6VrYvZCKkiFyIDmYj9B88ftI2eMzJo91i4dcsH0YwRXO
	VmWjUJQQ8ehTwX3Wuj8+qR4wfnQHMuBdgfjawcndjho1k8OxthieU+5wHc9m4+lzUbojH4jM1CyWr
	Sph3erVIB6/E53Se+lLvSEOV3xIRV8AqFRqIrOzQ0jWdRRkaYhMbAJLaRAKM4y68IqypxyuehhqKL
	BPz/zNxbkBtIzeKkp1t1lSLybWMvQ2Ka9DpIWslxy3mKSxFYquzInp7b662brrarwxm7TCesa2qTB
	Kz4pm1Iw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfVB-00000001Iok-3OEf;
	Thu, 13 Nov 2025 22:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IgBGZ2yZajVmZ1h/tTLg1uNgBwqZ+mIw9DPRp3zPgVc=; b=MRFU62MD/CRiWmtziqW1O4F97R
	PiNOFY1P3HVSABlmMcVFIKxVzWQYbh8jsGu09lTmEa9UqerxxoC5ljLnyueLaROa8nqCGKSdWoUrY
	B/rV89IIesGwt0WIFfHU1oDrGCxDl+UnApCF9DSK3c2XXrnxja3XNFesunaj3LmoIDZAROZ78OTJA
	v3M+p+O74GGSynrPkstVUXGWkaDsCWMouEStHxGRW7Barrh3Le21oI6x2QED+TmYuA7uHsiupUcZ3
	z3sVYEdlLPrHxaK3LXVDj7L8cE9dISCZa9WrkHy6SjENIPoQv97KeLttyIvuD8zgS+SG0Qdw3z2MR
	OhG+U/Cw==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJgMk-0005bo-Pv; Fri, 14 Nov 2025 00:04:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Torsten Duwe <duwe@lst.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] devicetree rk3588: enable HDMI audio on Rock 5 ITX
Date: Fri, 14 Nov 2025 00:04:23 +0100
Message-ID: <176307502898.495066.6660023173872091863.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251110181153.CC62B6732A@verein.lst.de>
References: <20251110181153.CC62B6732A@verein.lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_220917_537622_C2939709 
X-CRM114-Status: GOOD (  13.38  )
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


On Mon, 10 Nov 2025 19:11:53 +0100, Torsten Duwe wrote:
> The Rock 5 ITX only needs enablement for 2 nodes in order to send audio
> on HDMI1, the connector closer to the 12V barrel jack and farther from
> S/PDIF.  It is sufficient to declare the audio injection as okay, and
> to activate I2S6.
> 
> Note that for the other HDMI output it is not that trivial, as the video
> data there originates from the SoC's DisplayPort output DP1 and is only
> converted to HDMI in U7 (an RA620).
> 
> [...]

Applied, thanks!

[1/1] devicetree rk3588: enable HDMI audio on Rock 5 ITX
      commit: 3906f8558838841dad2bb96fc6ca10fe54a99f09

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

