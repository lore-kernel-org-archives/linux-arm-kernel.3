Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E170ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOva2ua5YC0DlSsKzj422bisdd/KEYS4VnSvX68g38U=; b=y96/xujXuzoodnu5B2tOB9I3ti
	pUmVDkkokhwBLKQmC/G7HZDsw+u/Qbid+b5ViYGxCRlMOoDxX6plucWuKhoGCMtKFnr92nPtJ29z8
	3LzBCZqksYwSIl2a5lbQOMBKWmyphh3/9Edwbwv3cVLmjc64Ssi6dgloYnDJ4zxBJG/DlvU6cEDro
	/P01mvatWtX6JZ1HgUbyZoLhlz0WSCeNih9Yjkbl48DDfbJ/S9+ogkA0t8Se0RDhOYH5OHeexBRd0
	+1LD2WaYgdBPXhOtnkI6Mi8QlemkEFDMxYyuE7gKU/eyschHAq9UK1Lx8PbiPKgcrEoKC1gaGxQ4C
	GvX7/CQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSnk-00000000lC6-010M;
	Fri, 05 Sep 2025 09:32:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRZI-00000000Gy4-0MoY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 534AE60279;
	Fri,  5 Sep 2025 08:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF30C4CEF1;
	Fri,  5 Sep 2025 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757059991;
	bh=S6kWmIW0hVTEZZAoAewWz0JxbYGS//J7DbVnzoq7lWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqfTjSQidjTXugpGnslEzU82f/RadZElrGPTahUGa2Vj5cKM5BL5TuFZJyfNoVThP
	 cXJqvvemUKZHUrcqJZj7S+nU2Mt/FOKD+ANHVUJDojYsr5/k6McPz32+9bHLye4urn
	 1YvTNlTZ7ERiS/E3Q9h0TGVAo5cOi9RH9MY+eUMzyfVSeziJqjw93A3IIQ/qdHRK9U
	 gm6OUCPSqji0ceFUTD5F2sflO21MDu6wIywexM4+gWmryX0aOhjgvVx2k+jpjZ2CGB
	 dGnkwzASq7uyDcyrPakuM3WTWOS4lD5GVXOsqnJA5sbDKTJKhFkuNxRCnkvQ3cfDX8
	 QhlCb/hGrMHrQ==
Date: Fri, 5 Sep 2025 10:13:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linus.walleij@linaro.org, brgl@bgdev.pl, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 ast2700 pinctrl
Message-ID: <20250905-oxpecker-of-impossible-prosperity-63ee96@kuoka>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
 <20250904103401.88287-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-2-billy_tsai@aspeedtech.com>
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

On Thu, Sep 04, 2025 at 06:33:58PM +0800, Billy Tsai wrote:
> Add the ast2700 pinctrl compatible string.
> "aspeed,ast2700-soc0-pinctrl" and "aspeed,ast2700-soc1-pinctrl"

Nothing improved, completely redundant commit msg. We see this from the
diff.

You got comment last time and it applies everywhere.

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Best regards,
Krzysztof


