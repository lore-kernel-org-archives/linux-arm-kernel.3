Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA22606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=em0i9aOw;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=rqn+WFU6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eYtcCAUAyxcdw2cmJ7zq1Yfe3NPneNfyPaYN6IdyrTM=; b=em0i9aOwTUMxqm
	iWq4axs2qpsTFloKXW3FfnHTGqmf1nJJ383keeKFEZV98n84wUesFOB/RqJNb1jcRWiowTjbQzMRn
	AWVNvlnGbWtMzN3ckYJWFrrOsaHeFzMuN3Fk3BmUsCRUEGOTyW7B686Gj8cUti6Aswg8VZ++TqNdP
	hq2rvKjuOOxFg5XQSfhxkX1kwZhpbp6lhIn1EUXo6rZvbcj2UPSOBpVUINHdzmGmFUAEdK0wBpg/K
	imOEhG4OXYhWbNZZbjFIDiK6krV07Kg1d1vYybS5a513y9g24PKyG0stC0ORYmVaRDWpEEV8WN/+j
	oT25RqHWYQ/haOEd/dAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqF-0000000Eyxr-0K5c;
	Sun, 01 Nov 2026 22:15:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq8-0000000Eyns-0aOa;
	Sun, 01 Nov 2026 22:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eYtcCAUAyxcdw2cmJ7zq1Yfe3NPneNfyPaYN6IdyrTM=; b=rqn+WFU6tfNopmG6DEe9s4Vi7k
	u+bbYY+z1arpxea6QCsrzpUK07zRh+4MFM+agupOh2KmyxvtXRFdnUP1ebLzTcROrKT2ZXcR3hbWG
	za+rdsQFZTNLuhvQ+6OoHRHGS0t+jECbxkwgEmsd0aamHVHWSXUCnMfgVSqelOcioCAbkKVG6RwF2
	qhcBavqDqzWidieTXZzPYEOLzGKD4hpeuoPeHohujKTU/qzhosAB+gtu8aEP4vuw+bDhBwtD3Betu
	jFvTlDXg78L0gRK84TtM89ZALXmtG2SHGEKGh82pVhYkW9JcR+WM07D4DucErQovLCgd9uoz/GVsx
	IkvWHBmQ==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HS400 enhanced strobe on Kobol Helios64 eMMC
Date: Sun,  1 Nov 2026 23:15:26 +0100
Message-ID: <179357131394.4107717.10877160497446825996.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
References: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141548_207612_D70BB74E 
X-CRM114-Status: GOOD (  10.55  )
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


On Sun, 11 Oct 2026 00:52:37 +0300, Igor Velkov wrote:
> The eMMC of Helios64 runs in HS200. Run it in HS400 enhanced strobe at
> 150 MHz, as on Gru. The strobe line goes straight from the SoC to the
> DS pin of the eMMC with no pull-down on the board, so enable the one
> in the eMMC PHY.

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HS400 enhanced strobe on Kobol Helios64 eMMC
      commit: 0b1be7859dc26611558e4bbb7f42e4a1238af59a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

