Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A32FEE4EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DF3tx8gi5jZKQjslyit2tfWOSyg5FObA/kHxI3yvfw=; b=xRTwcvtRmub3zeVaJX5X/jdBPr
	ExOVCgpCNEAOlna/IB9rJdMV3Gg7FHvBwQShd5UDf3EhgleIqkiK0a9WO1GtI2dqUna8Hqw+HS8Ag
	K2Ace+RMXSNfqwlldYn1apY6Mj+Z9hp8VWuogL6y/FthBcY07DkcCBhR6NfQqlOe0jLqwvpwlhQOk
	GInZY38hi02h+sAZnGcOmb/fG1+7nJENVWpnyHb42AuMiWHGodOe/crr4z3xrjv5YQ+x0olmFK6pf
	vQSQDGCIeMrO80r9WrC6XxA1oDLbAohcDhGUXcHPaxLlTD+nOkeU+UO6Qght0f/GlHMEUhJ9O+rtM
	4cRGibnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwICR-00000009lX6-0E5k;
	Sat, 28 Feb 2026 11:09:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwICP-00000009lWu-2lhk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DCE16001D;
	Sat, 28 Feb 2026 11:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D49C116D0;
	Sat, 28 Feb 2026 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772276967;
	bh=JU5ai7kfyN5uc+o28Wybo3zKonA2dSNvhH5252/07eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3m/SE93NIuo1ll95Ptc0KAYz0HTt5Dc6J0iF+RvQlwIv1S12KBzCADKqDXcmfH1A
	 JIXaQHzjczjIf7+aFbEcMpb2a6zrRl7T30QQwJABi/04PfWOetvZ1grrPJtOuhCPtz
	 y7+iPEkAiSqrcfFXXVN2DceT25csBNF9SWoBVJlBDT48ue6fVR033R4Zoa7eUldf3J
	 FVOKtnqcoulO9fqJZZ4JYqSYMR1FdSxZwynMrBcHppIi+vzfFPzE/7mt4LRupd+py2
	 WaI3FE9Bi03VCgOBWdL3apijG5v0QJPIWmZLIOBgYDCnI1LmP+53OQifNSpR3lhqIf
	 z+9RddFiqB7Mg==
Date: Sat, 28 Feb 2026 12:09:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: vendor-prefixes: Add Verbatim
 Corporation
Message-ID: <20260228-graceful-beaver-of-saturation-eb524a@quoll>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
 <20260228-gemini-dts-fixes-v1-4-0c6f6d0fb4bd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-gemini-dts-fixes-v1-4-0c6f6d0fb4bd@kernel.org>
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

On Sat, Feb 28, 2026 at 01:05:44AM +0100, Linus Walleij wrote:
> Verbatim Corporation has manufactured a few electronics items
> over the years.
> 
> Link: https://en.wikipedia.org/wiki/Verbatim_(company)
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


