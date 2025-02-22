Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6024FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkVtcH92DImRhYu7uxRobjv2u3gdu7jvPD7sqc01+cA=; b=WWwzmhr2JsCiRMEtmij7/J3MM1
	q/BEkXJDomy4dNQTgCnqcLxnuIp1oJX98y3Q+7RT+19DKjAWy6HRH5Wd7px5d+qR+rNtKFk5Yjmnn
	zY+yxKBZm3zNWdTsVZZnyGoSX6LhyUUansN+/r+B+/tsePRTdJWspN8AyLyY0ylwR+/JFHjU/bPWW
	P57td+orCVU1C34c/jKNMQh+uma6wdS5ROHh0yonuYBdKjBIyHCHweVh0utFCqnH9cmB9nQt7eTlK
	KMSkREH7O+ZGqRAz4kks+X+UIjC68ni/q9dUOqzCY+DbutsctpqEQW3FqgSM4pAl2bMvZZm9EcyXK
	327AvxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm4e-00000007lAW-2Bnt;
	Sat, 22 Feb 2025 09:45:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm3B-00000007l0R-3oCa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D15DF6114B;
	Sat, 22 Feb 2025 09:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DBAC4CED1;
	Sat, 22 Feb 2025 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740217436;
	bh=vejM1D5V8FJU5zIT5zcUExYcNOLocFCfXhexfw8wOrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o16wwvc/ogg+8FnjU5tJzN9QwUYxnkWrie23dPh0b8DxEM9A6ClAnUtQgnEOrtVxk
	 2XS5hTQ4DXkfMGEFjS7SiEphB5J41OTeGw1c4Tix5obIOuvjHjPFFMUq+nUBi9vM7s
	 4DzaFp3vL/69hlNs3C3LH2L6rOS4wjvr0AZf5Dsa4WAQUuROsjxMZsmpDwAJHGxn6u
	 lfx0dbNmWtTACTJClvn0ZqYpeYvOke+/zSkPauhFEWOmIhNlcu8W+8miw53mrAH0IX
	 wFeEsdiGKbDBRftbrcPlyHVqoOgMt3woaTdcGfkuKzDb/R+r5D73Yk24cBr5h8MHoN
	 qPxUiMSIyRFgA==
Date: Sat, 22 Feb 2025 10:43:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stanislav Jakubek <stano.jakubek@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v5 1/9] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Message-ID: <20250222-orthodox-black-mayfly-984ffc@krzk-bin>
References: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
 <20250221-bcm59054-v5-1-065f516a9042@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221-bcm59054-v5-1-065f516a9042@gmail.com>
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

On Fri, Feb 21, 2025 at 09:16:23PM +0100, Artur Weber wrote:
> Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
> TXT to YAML format. This patch does not change any functionality;
> the bindings remain the same.
> 
> The bindings have been split into two parts: the MFD binding and
> a separate binding for the regulator node, to simplify the addition
> of other models later (which have different regulators).
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v5:
> - Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
>   regulator binding description
> 
> Changes in v4:
> - Made $ref use full schema path
> - Cleaned up example
> - Dropped regulator name list comment
> - Changed description of regulator binding to mention BCM59056
>   explicitly
> - Changed "Power Management IC" to "Power Management Unit" to match
>   official Broadcom naming
> - Renamed mfd/brcm,bcm59056.yaml to mfd/brcm,bcm590xx.yaml

I don't understand why the name became "xx", instead of matching exactly
compatible. It wasn't like this when I reviewed it last time and this is
really unexpected change.

Please follow standard rules: filename must match compatible.

Best regards,
Krzysztof


