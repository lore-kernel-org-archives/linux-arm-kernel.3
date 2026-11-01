Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8612606A6C0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=47VMpeq9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LHHqXp9C;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=OUqoykoQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+PSaaDmaOVWUQ+VHhuXHm+ChDICCzay6CedCYV9aBDQ=; b=47VMpeq9beL0Qo
	UFOcd7Lgs3bZovyQhJWJSWFaC3//0wjVaigr2XLNxfinu2G1mKQekFpkk6R+fpvBIslDrtZzCZdUz
	rISsnzebX5BA0uVoUo9k96wNB9THkMrgxKlmnmiqxtPh/QhcKYiqBIK/ma4CTM0xGj8G63HqBwgav
	cSwUIz+LxPldjqZFMB9kx5mP/+/YTF3G+UVv02x+TYuoS7v+JuJDcjMavtLSdm56shWTfATUM/2pX
	fWN2rts1/Dh6KFGJTaOvqesb72dWHT2U/QHzcSaYCPMvbZc/cSjwM6v18x9HQbe5xSkIQ6tFmT0n4
	1QpLyKcO+6zpKLz8zhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrw-0000000F4Cv-3TSL;
	Sun, 01 Nov 2026 22:17:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrS-0000000F2Iv-1kQ9;
	Sun, 01 Nov 2026 22:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+PSaaDmaOVWUQ+VHhuXHm+ChDICCzay6CedCYV9aBDQ=; b=LHHqXp9C9DxlEkEbaboWakgogq
	zsBYcKa8Eke8baYUchcCNFgyhkyIBpcW0xmXRJx/cD6X3VEFuJciV+U0BbSd8ztHJ7TumbS2exSUW
	QmTnihkCF7hNuKzPpeX1KOagW71W31RPJgSZjnXQPpitGWS30AGZaXKOiAIAay2krlK7gknDQWtuk
	QEbFdAOtMQebcNmuhMPrsNdB3b9rR24BmA+swyKaNkNx9BQWbs+XGNWa+DX5FGvS7IullPks2aSJO
	N7Fy5gLSQBz00BsTV0yO91h3jdWrhnTDDaWrXX1NC1o8MCuKgAfvWWgU2pRn1fSkI5W2CK/OTTdly
	ZH3BrrSQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqg-00000001seX-3A3c;
	Sun, 01 Nov 2026 22:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+PSaaDmaOVWUQ+VHhuXHm+ChDICCzay6CedCYV9aBDQ=; b=OUqoykoQw5+FEa9dg1IfaI3/Wb
	A5+bkqs2+YGj018zeUKDS5sFoJlBQoHa+ogK/4vuKvUyqI4qWEM6hM6NDlz6CedUF4omAchCxXGP8
	isENDwfaU6J66ZpRsyL0BuEiYeEkNhJeS4Ib7eBNJ1Z35l32RlHgb/uGcj/L4NDif9z0eaH4vPSsC
	zd+jV+HV+wovty79e5z3Ku5GWBX1iOGXioMa616tDSW4hm3R/K66xZtP0Bs9ODV6FAtZgJttgMAbL
	7pRmUjtcIoHKOqwTmGVgBepiuQoce1jZ/pPr5L9QF7N0iJT2dRTrfayAzYb95aXodqesT93/TVNB6
	sll/CYMg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:08 +0100
Message-ID: <179357136485.4108155.1255031928445083494.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024-helios64-pca9655-v2-1-97210e9aafb1@iav.lv>
References: <20261024-helios64-pca9655-v2-1-97210e9aafb1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_221653_969574_4CB6D3DC 
X-CRM114-Status: GOOD (  11.17  )
X-Spam-Score: -0.2 (/)
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


On Sat, 24 Oct 2026 22:15:04 +0000, Igor Velkov wrote:
> Helios64 has an ON Semiconductor PCA9655E 16-bit GPIO expander at 0x20
> on I2C2, powered from VCC3V3_SYS_S3. Its 16 lines go to pins 4-19 of
> the P5 GPIO header, one line per pin in order, so name them after the
> pins. Its INT# output goes to GPIO0_B1 with an external pull-up (R59
> to 1V8_S3), so the pin has no internal bias. Schematic, sheets 34 and
> 35:
> https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64
      commit: 3e8f8468c1a9b42740db986ee07d829696a7b5db

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

