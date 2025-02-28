Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1634CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Po9lkk53WpCSRkdq4Ikgw37LPEEBIGDpqx7XIKq1sj4=; b=EgHgtp+a4N5qwHe8YIauV7jBT2
	odzSQRGPZWIqZ6B1PmDhGXOjEQTNcYT6BEtlLsehOcfySz47lGx8oqc41+ZiKF86Hko/MbeFxSdvv
	/qpPpnqD/nMnCTGIXNDCQ0sif0yTW9mxl0ZY0a6wV5jovTXt/g7NbzOGBp+yyryB8T77g28WT2VZd
	gFxIfLH9urNvtw/fQ1eGpdUkLG+f4zxilakbrngSAEkKU54MCXOF+wpPiwHLTcJBS0v8KvvxivYwr
	fcQizNUBND/I8htDIIMiAmietpQC7KND8S74DI+ExwcShgz95Zxqzmm1Em7ZGK0NTEG0GTeEaqiC0
	9kOtgf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnulh-00000009zIg-0u8M;
	Fri, 28 Feb 2025 07:26:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuil-00000009yzP-42dp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 07:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDA985C6545;
	Fri, 28 Feb 2025 07:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54E7C4CED6;
	Fri, 28 Feb 2025 07:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740727422;
	bh=uITozB3t5RbjP4wjORLIFy/Pq+qHbI4vAfez1H/n5jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E26xzOUZRtMyr8btqRB+0o8ftdVUUy3bD/84Zy0yZ11+/ZP+RGcicEE+kKRjrLVpy
	 5Iae0586G5aM0EozTcBtk2hqXb7giI+PBU6G7ueptjFkZWFzH3W1POq64LDvDEpqX4
	 4jtFNbJqT7oxAPnvl/ojyWPJEGL15wI72QN5FXXRpA07eFI2v1I2tcn1w52hkN3B79
	 8DXZ/tdndbWo/Amq273erVVhZbRpj18bTAk3hhLyyBOe2lHzMLwChm57QXRwCuxz1M
	 47a2yW0RKTdo4nTr2XCg+6XH05FI7IzG5zYUUreobdQ/kV15V+EcxJq5JKNXyo83d7
	 GTOxqlm4VCBCw==
Date: Fri, 28 Feb 2025 08:23:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v3 5/6] arm64: defconfig: Enable CIX SoC
Message-ID: <20250228-piquant-spry-ibex-7efbe4@krzk-bin>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
 <20250227120619.1741431-6-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227120619.1741431-6-peter.chen@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_232344_055999_05E2D208 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 27, 2025 at 08:06:18PM +0800, Peter Chen wrote:
> Enable CIX SoC support at ARM64 defconfig
> 
> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


