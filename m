Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456B4606D81C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xAPDhEl1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rn0+o/u3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J6+TRHT0fPj4a1Bf7OUNcK1tDs18NfRgn9ubKZdBdOU=; b=xAPDhEl1PmdbXR
	oZ6Bi5ds6TxAPmkGglFK0nnC0gcHwWO7Nn349Ccv71iKcyGhyQogX5XGBKGoTlrtcqQlHYK66Hls5
	CdX8T4qJ49aBcFWp9VUMduQKGA9yGfAN4qiQ4ahqJktjJxKH94hOCI8pT7FbG9GePOCQt5Gzm/yxu
	jKdbk91QU7TsHRlKAolFxuTdRcz3wUprprdRbfzb3VZXpnAwv3SWkkhZGT9Xgi/lzxFcq7oyTogJD
	W4YYeYICclpXaE2fFx5R4lK6kEE8UtP8BY2IpOozLA0oorZ8xVcgKgLKx5OMis3Kcu9STM4ZqZfEG
	NJ7QkiydHopV6j5HUknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzK8-00000009OX5-3nwE;
	Thu, 05 Nov 2026 15:24:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzK7-00000009OWM-12hD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:24:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADCF760416;
	Thu,  5 Nov 2026 15:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82531F000C1;
	Thu,  5 Nov 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892258;
	bh=J6+TRHT0fPj4a1Bf7OUNcK1tDs18NfRgn9ubKZdBdOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rn0+o/u3wb7vjgps6rsQku1SIVGcwBW77XRmVlD/Pg3Zz9P7GJgl8tbCq57ueWInN
	 qunl6YTKOzW+nqxJhs3XkYtHUDLqm5z46C/b69OE6Mu/c6vU9rBsB0VRhdbS9UyxnP
	 opXTrGzP7L8ictun1rVh1AZw9HZHctnuxSzJGqHheg8FtByiuGxa9TFK8aMFvzb8QQ
	 C58DV5hBa+AAGFQzzNjiKEvxLl7v714/vxNfvEtD/ZaCVxzdVZjD5q4U1vX+ogH9d+
	 0d3IWyY6ShVBz68eNVQNa1XfGehE+jhX2pcF1KVDxggRLK3nyPQweixS6rvT8NysOr
	 44RXew2NIxNJA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Aiden Isik <aidenisik@member.fsf.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
References: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
Subject: Re: [PATCH v2 0/3] Introduce Exynos5515 pinctrl support
Message-Id: <179389225540.696044.4640598390040264702.b4-ty@b4>
Date: Thu, 05 Nov 2026 16:24:15 +0100
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


On Tue, 20 Oct 2026 01:02:33 +0100, Aiden Isik wrote:
> This patchset introduces pinctrl support for the Exynos5515 SoC.
> 
> It is very similar to the other Exynos SoCs, therefore we reuse the driver
> and for the most part the pinctrl bank macros. A couple
> Exynos5515-specific macros are also added.
> 
> Kind regards,
> - Aiden Isik
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: Add compatible for Exynos5515
      https://git.kernel.org/pinctrl/samsung/c/e0a07b3e54f762774a604c39275afe3575bf8352
[2/3] dt-bindings: pinctrl: samsung: add exynos5515-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/c5ec9b1c5f95b4af91811fbbd86c83d0f5f240ad
[3/3] pinctrl: samsung: Add Exynos5515 pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/6bb1aa75bc2c85a89ee7856b9557b519fb7428cf

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


