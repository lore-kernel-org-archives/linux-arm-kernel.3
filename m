Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V+clKNYL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YDf5OSlq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=; b=V+clKNYLH31NCZgZhdEdiaec0f
	7kRaPjAKLnEArB29F52chILyrk8PrgxZy/yMO876PeAHu/Ei6J17Pk0N1ngH922QmoLvi1YdzWROT
	2xLyO/JJB86Ju7JnDEmKmRCXUts3pLBgQo0QjfYb37cbgKL3RmkJ6dTpANQfuIvn7Cvrhc64pHmxL
	uLcRqE7lKsXX8RKw5lM8kWa0BDQ6x3HI7yVmvCJSO5WHmuewENa7tpOL5qr2FgVlMwuH945KHLE3K
	MNW0m+zhyRMOCMOmtfYBtMKUSW5JjoZSTJG/1TJ8ulNGgD1hpfwmtoBCLt3Hfv5UXHHxLM13rA+X0
	LYinf8rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ2Z-0000000BC0m-4AEZ;
	Wed, 21 Oct 2026 06:43:11 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ2X-0000000BBzo-0wlK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:43:11 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-676804a3a22so313555d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564988; cv=none;
        d=google.com; s=arc-20260327;
        b=gq4NZ8vxyz/z239rNdD8hdEI90SedOEjpw5uPmh7GnQHSlKBShSVENjlhQkKIIviWk
         Si6zPtoQ5CRugfQ2ZuFjp/yWHtvkZxjVbjlrtLbv/Hql0aDQPd9kxmCtvu3YGkv5nJLG
         RZYLHEimz2PQKMc9dBasl/h0JvFtq2zSfSA7bVAvYVDZFQu1b9MO6TKEaS2799gXbD0y
         a/Th65btWQjfZZrsrmR9L3aDeNi6SE/7sSUMdHvlajVuNnXQnGTRBJRA2UAAzNdI6KJ2
         ZTbrkfeXNkR0bLfhcIDensk+xTn3RW/1uzATuL8OSMd0PXidLfar91qdUYJ+bpavmvn/
         OEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        fh=DnBI+rhqxItrryPx3zh8vHV5OJAbAFmOE4kHtGxhk2A=;
        b=bxyhzfd9t1+JydMgPwGNvi0e735Ds/3pEeu0oS4zNNS8tXC8iCaQfPm481oih2z4Tk
         o5y+Wk/YhEfp/tbFWEOKGhEu3J48SQPOxlU+KrIbRIMMVZp9E6+Ct37Omj3Z039kKDTK
         OlnSvFVyoC9dL6ewOx+Ohiuqz3As5Avkr0RnExkeEaZn8rLUhgWqcbi828g33Zqi567I
         M/XOIoe8OSCppblxTbUFnh2tS2qnZHzDt84Vv+VDIY4dKsWFh47JEXraDw54kDr5zl4i
         6T/V5IIr5xJv6h1HM8CxB96F5O0nz1M9JngTjLORHRaWaaXejuGXHmNsiJFk78fyvNcN
         kvqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564988; x=1793169788; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=YDf5OSlqyiAQ4K0Pdci52CGRqwr6FTcWUif8bvIFiPRR2Yy9orejWCJbXgINQuLK7l
         S12uBwCJH+/9aO5C6pYb4uW/3KFGRRapCa17Ki/OpERCYlbDLlJMoALqdYOYbXv+N6D+
         W3w+NTswee1sJVNjMjJD75L3J6Qh41pfTj3MWkVvgCnC7szwMvbnj8Kz65ApDmd/1ERB
         rcRtL/r/CmSBfFX8vVeQyUz0T3t0sR/jhItum8iayj0v5RVKiAiCtEliWxJoj+c9Jfs5
         bHhfAK7MRnwT4+1Qt+RtdD/6vHUX0KUtA+Gekp7ERDW9ZGMjxJiZvmMACoW7OE2BZgW4
         Dbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564988; x=1793169788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=vMFUElWqEn8S6KtVcPIL+5citRq/2VvXHDtRH/XTewhvk5lzN4OUnOCbdFME87gLbs
         P8ChU45QU/KcfxDM6PcPb4+5mFlZJeZM7lAQueu5hLliwm8YDuaII5V2FIXFv17IJR07
         qWV3hFFhZP/ozOWWL7Un6k7k8JGbTzGcuBNTSFj4dnhZ8dF1r9WbvAXYwjx+jr0tXdJE
         9EkLMVUeXXUw7rL27bb4Bh6o2rZlaukHimqMkWf1xn/TXyUTjNHcEytwp9JZweATqYA5
         JofaTtG7ul3wePkgMG38A8M9KtFJUmdV83QIb0NziKmQD8/WEX6z8+TdLtZ6sx8kjB0A
         xHeQ==
X-Forwarded-Encrypted: i=1; AKwUvByYYS9/eOrRqxZ4JjW2SIf8O6oWxYvNkSnyTM268dnKLecyiHHd01Ey7OwLSVECQ7hDoFxpgjP8ImofgeRZutVj@lists.infradead.org
X-Gm-Message-State: AFq9FYKguTjVl1EcA5wzRVXLEmh2e7weK9IkjM/pgL9+H6zOkkvb1cb7
	jfI/2Ary3DA0tL68orhS2/WahITtt4Qx9qwIQrQQucPIfu+QrqV8j5TwxceT3xnjJNa5TqdJu4v
	5OQ3dVtlpHJ0/pM+Ywlq5HKk8tpn8/Kg=
X-Gm-Gg: AYBFou3mczP4ZdgXUZkeEW+UCVU1dTSKuRhv1JMrdebpEYUm3aFRoreIQEl7OjV354m
	IVpTDrzYzKFP/qZbjrO2MHyTkdhPto+lwMHb3/4aKJuGCmvScJRJYB3qSNMfaVvu7LD+fdCMsUJ
	UU6RmgbbAY1/cqXlHhbwK1Sf7q+wYyF2tqy7CFNa8c/N+9IseCAlNHpkBP4ol8KH116KGfHuX7R
	7ICPy1zisIC8MFCq5sQ5rGUcFtCaGQOO83jbamiG9Y1tQxT0ch/P58fDmujtQqoNLgW9pJs3NmD
	ASFpjxHq6cZj3enku1pWcfG6UtfsuiM4NJ5mMAELp5Tgo0sBZXvqc6x87vcwSGu75gZ5zXsLnQG
	WXtw/9ixKnfLBpAB1J2vKhQUHi+iOgPEXrwQ=
X-Received: by 2002:a05:690e:b48:b0:677:db69:cc1a with SMTP id
 956f58d0204a3-67a0e02fb85mr644184d50.7.1792564987934; Tue, 20 Oct 2026
 23:43:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
In-Reply-To: <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:42:54 +0200
X-Gm-Features: AclHuK9RBvE_tu1JJML2kndZnV_iY7Vg0PVQd2A9ECqRfA0-uzrQqgVwLULojEo
Message-ID: <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_234309_738344_87F083D8 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> And here you write clear note about dependency, once you fixed
> bisectability.

Just to confirm, would the same text I put in the cover email be ok:

"Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. Patch 0009
also depends on
patch 0003 because of mt6392-regulator.h."

or did I misunderstand which dependency you are referring to?

Thank you

