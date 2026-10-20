Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F240606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Di9pV8LC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vmes4ejj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hDopJ7Qj8tTboD/8FzzAGyXZaGFBbxnDVfa4fvU0AE=; b=Di9pV8LCx0MdJCweJ5Ph9awXBr
	e0XT5khRSciUwRrugP0mjIDwR+5e0En79H4/DyC2XEG5bMECrNQNlv5zIa/2JDwZxul5fBIZOBji8
	g1MgasBqj9zvb7iJdK8Qnbfl5i84RtgHPaoN/T4a7jT+Oyh1mIc2aonArCCZ9Kiy5zHqGYVlWc4q9
	ev3u5W4vLrjddqiNklEcPHuXiq1QnsaYstRurZP6ilKyWw4ST7nqhBeVCm7q48EnO54LKBpQKb0r+
	iLx+PlUXel3SzlTUzxrveRBNZ6/JrqnkdBKq9X3fmFtNhZedIehICwLvwvtXbGzK+qtc+GGiXWjIW
	PMkJf/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4fc-000000095tM-2YBt;
	Tue, 20 Oct 2026 07:54:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4fb-000000095st-1RjS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:54:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76F28601F9;
	Tue, 20 Oct 2026 07:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A961F000C4;
	Tue, 20 Oct 2026 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482842;
	bh=2hDopJ7Qj8tTboD/8FzzAGyXZaGFBbxnDVfa4fvU0AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vmes4ejjOo1Auy6cIFkuA9t+aWJ8TAxXtW7qD5jhTiuh4as5A+jB0XgnEg30U8x85
	 he+Q/9d8FxirJkp4+KK5e47c0vFmcZPxrITViI9mnuW3NoMCdkCUHfewhwAs/DuHoG
	 O0DbxNq8VSC7TVQnnRbmL1xWfi8ZU2Sf4bIXJ69lljekdCrM964eeE8hn6eA5ueuP9
	 RkaySItndo6BurJsmhtbjvmYsaipomkbTMrb7FGOrgVcOH+jPw9T3idO2ZHp7qmk0A
	 X7yNoJ4Ithhhe4AJlDsVvC+4siB89T2RuJc6594D5srmgu4HRovBLKQyQWrkeeZfIo
	 xDWLlsutovbyQ==
Date: Tue, 20 Oct 2026 09:53:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for
 Samsung Galaxy Watch FE
Message-ID: <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:23:46AM +0100, Aiden Isik wrote:
> Hi there,
> 
> This patchset adds initial support for the Exynos5515 SoC, along with
> support for the Samsung Galaxy Watch FE (codenamed lucky7), which uses
> this SoC.
> 
> Support for the following is added:
> - Bootloader framebuffer
> - Both CPU cores
> - Memory
> - Generic timer
> - Watchdog timer
> - CMU_TOP, CMU_FSYS, CMU_PERI clock management units
> - ChipID
> 
> Currently, these device trees support booting the device to an initramfs.
> 
> There are quite a few regions of reserved memory, where usage of them
> can crash the system and/or cause unexpected behaviour. Currently, most
> of them are named "misc-rmem@addr". They will be given names as their
> accompanying device drivers are added and their purpose becomes apparent.
> If you would like them named feel differently, feel free to let me know.
> 
> The VGIC maintenance interrupt seems to be unavailable on this SoC.
> I cannot find any reference to it, nor usage of it, anywhere.
> It *could* very well still exist, but it is a mystery for now (and also
> not a *huge* deal on a low-power SoC designed for smartwatches).
> 
> I am getting checkpatch warnings on this patchset advising to check
> MAINTAINERS as new files were added, but I am ignoring them as the
> entirety of arch/arm64/boot/dts/exynos is covered already.
> 
> This patchset depends on [1] for drivers and device tree bindings.
> Note: This dependency was merged into the linux-watchdog tree.

DTS cannot depend on drivers. Please fix your code, to avoid that.
Dropping from my queue.

Best regards,
Krzysztof


