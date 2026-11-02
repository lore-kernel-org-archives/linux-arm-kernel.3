Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B39606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8/Fi5+D;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCpbHumV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qFPyztT176Q3NCX48vm8ZlMz49fvWVMs0ZbSqK7hMFk=; b=A8/Fi5+DsHX6oJ
	vAEkHSsHAzLzNyCUnyunvxnfVkbK8ckIrkmj7kMFB23ONUOYQzv1rNAJahyEQ83h7eOyqkKPjgwjO
	YUpSH6Rb09lrXuJNNKAU0t21p8RMAXmTbm1omR4Nkl0iaV8alPsIooybukWdZlpTYv8vXY6492Ucj
	aLxCImUA2RbaDKBftHjcqeES0QygdDjyN/H2sr/C2sdwit3NcPgWQaXhmOOcxfHCeuqUryRMqTdNr
	WrVwnPJJwW4f8+R9dVkDKo/BBgRbaSTDyDstwKZmBhAm4owRp/24TPQGeHkjI/K0a90aJnpNdJA+g
	KYKilY7PJbkrrAIpjmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrFD-0000000GUyr-3Qa3;
	Mon, 02 Nov 2026 12:34:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrFA-0000000GUyT-3PCg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:34:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 537A5414F2;
	Mon,  2 Nov 2026 12:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7AE1F00A18;
	Mon,  2 Nov 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622871;
	bh=qFPyztT176Q3NCX48vm8ZlMz49fvWVMs0ZbSqK7hMFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aCpbHumVYEejY023NxGrQPkgORAOLDqFBr/lKlOmoly4n3si58GiHod1HxRD+YX8E
	 FMx6mIvmvsmgmEhw8LQFcZrfCsy66AJb7kFfCOWtXF5nfkdCA/PM2LeH6QCMd85Zc+
	 q/JBCO0qqBm76YBjW07sNykYI/qcIH0Bc6+cpScWXbJAUSTgtZMJ/dJRgUB72xeJpw
	 1r/c3V4P8jmSBP2Z1Ix7f3lsVZw6Nwky7kny4rpkLj4YMpFCBgnX3AF4ycAx5m607i
	 qQEP7wp/wuOgrWUXCIDnux6x6RcrPxL+/Mw6X8+1rxVr14R5OF9Aum5YhOCWFA0OKi
	 MXUdz5pZ1Unnw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel-common: add USB-C PD timer and revision properties
Date: Mon,  2 Nov 2026 13:34:07 +0100
Message-ID: <179362278574.150793.9490214857479214179.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003-gs101-typec-pd-timers-v1-1-4b6f3235133d@google.com>
References: <20261003-gs101-typec-pd-timers-v1-1-4b6f3235133d@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=krzk@kernel.org; h=from:subject:message-id; bh=YAtD549CiW+R0jb9Hz8nSE5JrJvDXAfq+kgwKxyaJiQ=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6IM/mkNJevdXpq9Wq4JpdL9xd9nKtwmXjLR9u aeT1n94fGKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDPwAKCRDBN2bmhouD 19bsD/9GdkYmvZHZaBXj3i1FvbOH7rs+o9J/pxPDhkH+QhotaNh+zU+Fln85KWXB/wa95T8wPhJ UigShgkPEoTz7/mAclaSTMwAg+2HIiaBrdGfiRPUDb0eOiLr2CpySxn1br0W4nsZM8YELt4oFR2 bx/uYYLJgTnK+OqU/8QO/UoJ0/jF5KCCZw7a9CUHV7/WvR5ATOJusRtUhc41v8n3w0Exx3T5tBd 11UcjLxeJVFEo1Ww1W2FCC0q6z7B+VEc3F4N2GiIR+CxAa3Il+qIGhab01GWJxIjBeO5Nnn4WiD FuLsSIkLP1Fy9C4C2LLraqFHg2dQ7CysamMk4lfi/bIZJW6XU04T2AZqxwf2u5swPAUyV4ad2TM W8MiRVLvaLwP6a+NM7fWrD1RKCJYzrJ9dKiBSGQsmyLvUOLzeAzLhrvng43gWZHHkD0bYk69L2G 0tNgr77aILYBv2O0NYu0fQXwafanI18IVolCYy/lU7czxgWOhTVEUFqP8bAvfTYraIx3K6CH9S3 C9nkWzodi0TN59LeQXBqt0GLj7PiInTkPmhE6rtfLKAFODvzyaoCVDTlA5m+tFgvGgqJKKE71/5 7FyPw513VRBRq6XoF9+IFxBuinrrfkTpeqfrMhbdKKg9bSSDADmVzBj7icuhOKZoq/BxBKA4Vr7 XrVnjSJO6xZ95y
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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


On Sat, 03 Oct 2026 06:48:30 +0000, Amit Sunil Dhamne wrote:
> Specify the tSinkWaitCap, tPSSourceOff and tCCDebounce timer values
> for the USB-C connector via the sink-wait-cap-time-ms,
> ps-source-off-time-ms and cc-debounce-time-ms properties, so that TCPM
> uses the values tuned for gs101 platform instead of the defaults.
> 
> Also add the pd-revision property to advertise support for USB Power
> Delivery Specification Revision 3.1 Version 1.8.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel-common: add USB-C PD timer and revision properties
      https://git.kernel.org/krzk/linux/c/fc557ccccac92028bcedda4bdc59dffc56d3f96e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

