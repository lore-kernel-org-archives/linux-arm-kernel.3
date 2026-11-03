Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C90606EE8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FxbU0PWi;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lleyHFBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=; b=FxbU0PWi3S7y7R
	gHTcZBjI0bgMuSeKKeXNzxl+eH+kkx2J/O+gLjgKrOMlCP8t4KArXNf6VyIKS1eh3fw1/Te6O3ckO
	w/9tNVb9Dwd9YkOti5o8b2Hv7palh6C/rY244LI2ldydwn3PrAivxa7X49OL+Ee29EqQI0kvuY/SU
	sPKvk6zYD2DMdGH/fj764kmEjq6Y8FBO739cu1JtnacVqVYv8jS5WddYIQlf5LmiJWZgno6Ada3GL
	nffAVvHKZaF0G0Imt2Itv9/V2smJHN8q+LwEbQm35/H2pFpqOHoLIX1sEooaIx7awHyBlADV+GYpR
	z+nKa1p/Eijep/rZsVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDd-00000001q8R-2Jrj;
	Tue, 03 Nov 2026 09:54:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDV-00000001pzJ-06Gp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso37613965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699647; x=1794304447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=lleyHFBplpYMGTN9OYLyUq7Tp9pbmaDTQpmpr5r5HfJjCVAtEo1HD2+654fdGLgbSq
         HsE9keCrPvMtTl03/lRDLmrk5d7ez1gJevHUnPghH6StiqEMbUYF3yY9E0I7VFvc0+fM
         penFdmAGRfX6GtCFHfbmOdpZwEjg890JT2ZIx5hBZM2oUxsELX/lemkxSFLUo/+2427/
         mobpbFndubLboJCavfMe3tNy/Ld0ql+JpokWXmK/8PVIff+eLa7xe5vozytuhPhhB0dC
         zo9ywP2gtZHZ6KwD1P7lfdIwqF0JYZOfKzj3OMDFmTa0UJHwGVfbWleOyBZkBR5+O1Qg
         B8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699647; x=1794304447;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=mV/lZHi3A7EYpUgSXUvMn5eh/MECFoYSvnlF+aweoXPj05dGdUeK1kSDohWYWItG+J
         moXQEppxuzhYqFyr4BdPiq8ozUenRDiMv+C98k8nGTfQ4LkEpJMZCoLxinNJKgZVeghT
         qE8T4rTuYu8fUUiB891Hpy4svs8Bd7NUHnoiZOS1A+HoEne/OnLYopLEHwLxQOWitHZU
         k8Ljgx9Xz3yHRm2z0kZTf51ra3tUQHt6Cs0ypZ++47HIUF+CBfB5AKFoaiK/Y8mUw/Hf
         /i/i3lRpxFYAtFg5rOtkKt1yd29v1rVQgwOSpO7pHal4BjXNWv+9iyKBbZYUyFXDZEFd
         fzYg==
X-Gm-Message-State: APuU4Z8MKFPmw382+5Alz9eoiN2HpeEqF8A0vQ4cu2xvPhfOTpgVobRE
	mwGDygmgmwuoGuaks4Ggevv5vTYT86QjhsyypkfW3yUrwzDBXKvpFS096UKBH1HxGNg=
X-Gm-Gg: AYBFou02dO/PrEbUbkj06nFnvs4DpgU1/aesx84tA1B6d7cFnHy7Nm39LiVBwuVW5/I
	khAQOULJkTqprRAhCdPNta/2ak2+OGeeIAvbTfd2Mx7lalfECBAGv12+SrgpOmC9gPsJwEmq49A
	TGoU5KzRh51tmO6FevacDP3A9PFZs4AHWal3X19X+F0VRJjxt9OCAuCSc6uF6h8xTePxgTELMQZ
	j5zWhKRboJLivCCffhJoCilJbvXV8CI3rQn/nDHm8ptk14dWRRn4kqlqghrKwJiTNZQ7bCZ4wDC
	A+biAyVxFRiNe2cpINUYYarNp3hZcQDM6SdkQ9wQYlxgsmPYqVwdtLIAJVnuWiL1XOQjAH/2f8V
	jPrwYdAGobBuVjDUmjm7YrjwvFAz4vmHXNuE06i2qc6+JPn/m3jOoeLJyPvXe/TmWmgZrV+XIHE
	kuYKSD0cHzj3fRXju0Mp1PlfUyyQRIk6EPRZUMfdXqVFuPbbBcosECZadBsbIKtDlIbLLTITTbx
	u86blJVSxPmKKd38qmcxrq7NrsNrMwB+I7kJi2pJmyIP2hk9Pv37SzE+DTUvKUcgIXtqq7NNJQV
	VFAmO15KzYtj7bK6oXGC+JBv+vmU6YkDFoF7yd4vXQy61DQLFQ==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr308685225e9.6.1793699646995;
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
Subject: Re: [PATCH v7 0/4] arm64: amlogic: T7 thermal support
Message-Id: <179369964613.2330120.9766633798877372121.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015409_764725_1CA0D5B4 
X-CRM114-Status: GOOD (  12.20  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, 16 Oct 2026 19:16:06 +0200, Ronald Claveau wrote:
> This series adds thermal monitoring support for the Amlogic T7 SoC,
> used on the Khadas VIM4 board.
> 
> The T7 exposes six thermal sensors (a53, a73, gpu, nna, vpu, hevc),
> each accessible through the secure monitor firmware interface rather
> than a directly mapped eFuse register as on older SoCs.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/4] arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      https://git.kernel.org/amlogic/c/79279ee341b99634f3c106e5970e13d073e8b064
[2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
      https://git.kernel.org/amlogic/c/c3644a9b59fa49ef88bd312dcdf47cc6e155dbeb
[3/4] arm64: dts: amlogic: t7: Add thermal zones
      https://git.kernel.org/amlogic/c/e41608d8792d8de0369a0e90f7e0d2b45db27541
[4/4] arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones
      https://git.kernel.org/amlogic/c/e90086cb0f608c55e0b2d17e8db8207e789fdaf5

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


