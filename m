Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD9BC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXBKTcTefX9SVPzC9FRI6I0GB4s2HxzZxXrettj/Cj8=; b=e7V0G0zPDoIDWSR0mfX7NtzdDz
	bM7klqnERnMZZkIauEBm7li7iV72QrTCek+NXZQhYX9CDgWGYqMdJkIggHUr6m9ePX0O0y9HWd7AU
	ulAAi6+2Jk2Tz69wYePI3P6MWWYCJ2B3XUcOdOcWJa5y1gX4b7QcI64kiyPbo0ljM7XVN6ZyhGvuK
	M1C5XkwE3NYB3zoFUVRTnwEQ1VJ/7R+/mRs2Dx37Xds/KZ7WeoUDmfrwnMKPrOEAAxR2EWDHTJzQr
	3i2Xlvty9MnrmSSg0blFXyQFsw3p7Q8pxovE8IE9znNi2FvO04AcjhXFUcpFh4qrijrkKfCziUe9s
	dtou0Q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g22-00000001X4z-46bc;
	Sun, 13 Sep 2026 08:57:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g22-00000001X4o-25go
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 08:57:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADD4D60DA4;
	Sun, 13 Sep 2026 08:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2F41F000FF;
	Sun, 13 Sep 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289869;
	bh=bXBKTcTefX9SVPzC9FRI6I0GB4s2HxzZxXrettj/Cj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOLk4XZ/VSYM35I495tyPj/RQDivuERf8I4jfS3T8zGt2M3MN+Gzeuw53r5G3mISD
	 5krbYJZcL0ozfIOznhcidk6AxXsBNUJM5bM0INz9Duv/fnUD4reePPlKKx8cHz6Iil
	 oNWq/UeRcnfbMhEyINhZNZf8TRpHiyjTUj+bEJ/kcIi86qA6BsWFzPa1Vuai7wDQu2
	 X2NEUUPqocbvIh4YU36H1cLE3BNVoxlWXwAq6R5tw8ERHpVvbC8f/v82bAFvvsnmo1
	 KhYvb3Bewrq3nRIUcC1K0QbuGvE3Yzeoa0eGq7rS+dF9SfcpcxHIS6rRszERKUxNE7
	 YD4ar/zca4+Ow==
Date: Sun, 13 Sep 2026 10:57:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Message-ID: <20260913-shapeless-adorable-fox-5c1fad@quoll>
References: <20260910155509.1425682-1-jm@ti.com>
 <20260910155509.1425682-2-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910155509.1425682-2-jm@ti.com>
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

On Thu, Sep 10, 2026 at 10:55:07AM -0500, Judith Mendez wrote:
> Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
> The uniphier-efuse driver can be used to read AM62P efuse registers as
> well for GP_SW silicon revision detection.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


