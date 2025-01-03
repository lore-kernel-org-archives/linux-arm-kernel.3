Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF710E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSZyTWc43T6IonkTfcLgJcOxGhw33jgiACPQkXxKyO8=; b=fCxeachLIvj7pGIpj+QJNNGkoY
	SMrkdKn5aJY3h88u2VAzc0gvDrHUgmZ8upAg4MklHNhpPnPAoqmNM2utMQ0MBeD5NODQSp1gNWsah
	syuU1VKcuJT1i2ikZoOLJV0O7sSuxUKiEC0UcTTlW0YioK4295hY7R6C/jQo3HtZwDCvVIm2h+F7C
	uaME1+SUZtgL3D9ql8dCN2FxMctu4dYqFS5ixlNxy9c8Xoa8wQ5Q4sHqQXw2ltyKrbTMgvChX/sCf
	TMjDOeSwnwuLPB7zSCzPMHx3BFL78yQdKoOoyjY/cu0ovbSR2g2umsjldO3Yr9j3M0UazIg9amkpu
	pes9f7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdCT-0000000CTXB-0gAZ;
	Fri, 03 Jan 2025 08:38:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdBG-0000000CTSk-3urf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F398C5C62C7;
	Fri,  3 Jan 2025 08:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A4AC4CECE;
	Fri,  3 Jan 2025 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735893438;
	bh=H/j1VVG5p6FV3q6JjSpoYf2uLqB9DXS2WeYg4giuiz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvjCmMtNIU/R8T4CoVEsxCa/klrPzI+Iwi7CcTroCwKMPPBadxyW25yIGpcUrJrM5
	 wjeWHu1TsoSoqPNv/5rpCbw58H0y8OH8OLbXHDUqyfAxB4/7mznh+11VjGBQN/u3jf
	 Ifo2wP5EtzfznYTwha70f/Yb0vjRVpyfhwPU5SzvNa8WpJciTNRorzQpox8OSNgqsq
	 mQeUAOvxh0qsb6O92uhrd4q8lGQEAYeqoTssEJdw81A4YglwYJRfwvqCJ69H9Xs1+n
	 WkZEklTQGcsiyuFDbzdWTJDTOzmvnUv71jNsXQ+naqkuprdCd31A+GFS7yoAiN53Sw
	 Tv5ZKPImv8MIw==
Date: Fri, 3 Jan 2025 09:37:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatible for exynos8895
Message-ID: <dykofnfflmcdcmtq65y77aginsx27sx3qwhaofyljnc2uo7ibr@pyp7po2hsabm>
References: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102205846.223955-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102205846.223955-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_003719_015063_BBE3EAF4 
X-CRM114-Status: GOOD (  10.83  )
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

On Thu, Jan 02, 2025 at 10:58:42PM +0200, Ivaylo Ivanov wrote:
> Add samsung,exynos8895-dw-mshc-smu specific compatible to the bindings
> documentation. Since Samsung, as usual, likes reusing devices from older
> designs, use the samsung,exynos7-dw-mshc-smu compatible.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


