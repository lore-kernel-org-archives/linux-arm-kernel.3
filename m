Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500D606D801
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1HoJrlwa;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaJX4OVc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NLTVzjwW/Q8HtLH8gl2VVrDwo7+tJCjngM5BFqgJeRw=; b=1HoJrlwaXF9zkm
	WqxV4h+KRcTARfaGHQWCtgBQxW8Y3ra2+EgMqUS2dkrkz65+li38XbNeLYT5PkktJOwboxr3JHKHu
	il7xhUe6NPM4Z6fZd017eaTiQ74hVjpu26C+TppY4cPa9mgpIu16p1OiSTaxbHsOMSbiOBiFmollW
	qO4AwUehu3nvGiFcPlfxIpzpZk3DPYUXvcXltv+fy8KAfKAOn+Iy+xE2MDmlUn5xEMkFU6b0iUj9t
	kFpp86k9H0jzU0xWQBEvbhzRnuZSq3FOtqu8HkgHEAROtjjH9DfLgeGKxiqixEyVJFGIOf/QHbtda
	QQd0mzQyyd1qs6fSX09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzKU-00000009Ocu-0OFu;
	Thu, 05 Nov 2026 15:24:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzKS-00000009Oca-1eJF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:24:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D631D400A5;
	Thu,  5 Nov 2026 15:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B422F1F000C1;
	Thu,  5 Nov 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892279;
	bh=NLTVzjwW/Q8HtLH8gl2VVrDwo7+tJCjngM5BFqgJeRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QaJX4OVcR4eoG7cyCHhaOrMz4sMVB7jv8h2TgNzAZVvI6jNX9MA5ebeGtKYcA2/1a
	 bCTL/BwG7zfUz/CnX2BpF7vEoX81H9Dx+rbyBSJyztlPDeodCg10GG/rcnQBtbJZ/q
	 lYbF0esaQaWSyiniY9m2TlZozQ2JLX6sLQY2HdTR2kOUvtmtIdz5aBYmbB7rjFBTA5
	 Vn0vZ0YWlnQQ05I3I4tY+C3iyUOEIJBl9h5+thPSPDZRrd79UjJU95b9gzM/3pve1a
	 fRG01wV99xrWT/XHDEOjejY0fMJndIOcSco2DJ3Q7sLrL7UrEgXvTeN1ox4DrfvhVi
	 0N1qB3KdsXoqA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
Subject: Re: [PATCH v3 0/2] ARM: dts: samsung: Add support for Hardkernel
 ODROID-U2
Message-Id: <179389227745.696540.5942397677891715381.b4-ty@b4>
Date: Thu, 05 Nov 2026 16:24:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 26 Oct 2026 21:41:52 +0100, Josef Schlehofer wrote:
> This series adds the Hardkernel ODROID-U2, the predecessor of the
> ODROID-U3, based on the Samsung Exynos4412 Prime SoC.
> 
> As with other closely related boards, such as the ODROID-X2 and the
> ODROID-X, the ODROID-U2 device tree includes the ODROID-U3 one and
> describes only the differences: the micro-USB port is peripheral only,
> as there is no VBUS supply switch, there is no expansion header with
> SPI, and the 3.5 mm jack is headphone only, with an on-board digital
> microphone instead.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
      https://git.kernel.org/krzk/linux/c/c3386407c5c0c6b02601f9c232f21a4e64cc268c
[2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
      https://git.kernel.org/krzk/linux/c/a312b2f6ce258fce3d8e89b939227932380b6017

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


