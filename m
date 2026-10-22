Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C0606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JqM6oNrH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XOY4eqH/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=; b=JqM6oNrHqEHUibC5Je80iB1x25
	8vQXh8Z/rCt99ECLfTO/sXGa/Mb0t6Ftr3iHv8QCQh42fnonE8+KN1qRt/6B+tAMGj+rhHtHY+jtO
	Df7RUhHVDxyDO5Kzd697e6HCjgG+GE+CXcdZSO3QatrJJq7qvNP2rgVVxOGo0J3av8NZ8nLxY/UZ3
	Ogi6SP23pGKW6xGrJkBfUOpn01u15zZguOQg8HtSDKD0jydQd3RZmBFFnZdBZMUfkDOSavOsEO8BR
	UdgdjvUK6JyVgCGxug0mN7+QP9Sp33NdxRPhDGtvO2ndb0Ufxo+xwo3Su3oSEDwLr0KIayFYZs8ah
	JuvTTRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJibm-0000000DDLl-06xa;
	Thu, 22 Oct 2026 02:32:46 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJibh-0000000DDKA-3mJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 02:32:44 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c3e0e38c8c2so44067766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 19:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792636359; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIku6HrQOv/wdT6gkQBNaJkVojk3o34Gd3Yeq6apKtFo+q0TzQ2fRJvdHmuB71gxet
         BEyHM7mQmU2cPCS6HQYwBTdook+/cI0BhcYRjq5EbEfk1zWFYXrL8bWyBoBY5/A0oeMh
         FeqXF7nj2jiNF98gkhoWMW9WTJftArBK6mHJ8lZPzMSTZbFa932C/ygAkH5DAUNqGDi5
         H44PTA54TmFdiqyvexPWiUh5sfdd/HCQ4HSKWlbGTMMTPfhuqS5wAmBFe3MRmcJKffoX
         udSoiwo1m+aaq61QhbR2AepwLaDGW6ltDLBVv4ZOWwfXzjuU+E+RN1eWJ1FyhyoAL+kr
         DHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        fh=CsSQiD8rVyuj+Fzngw5cGZ6SFuoJK8MhCOTduljzYz4=;
        b=kcpjknZFSW9aHlKtlQBsixoIk9ZhxXB2vUAJyo2iW2HsNK3TzWuVmp6S/F203lurn7
         0nersmVEvLwe4BWsTu2q3RYfNg4gXuDuoK8aP4Qq2tNSGbgBfzYp4GUTznJGaGrdOW3c
         5I2W7TX7zTg/1qYKF+0BdRsJ/XIpAvJ8NAiYqNdTqHNfmKx1Su0WVQIeqh0J+oqXYvq6
         T/hlJp4pISWjOQ5Yi/gSEY95zQ1juQzSfS5jye2QOATOi0FzCTAt19xq/QX+6sYrCEde
         sX0anzyIaY5HsIT3wLWWLqKDCEQCm09jtek7jGyDYP9TY9EXSLMfMatrbVwkAPFp2IHl
         UwaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792636359; x=1793241159; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        b=XOY4eqH/IfU5D85cqXWL2UUzIQCHh/cAJZBy0REQijcPdHKUIM3vsCya4h71xLp7S7
         VGP9a7qF7m/VDqgujVtKw8F6280O9TFAnjMNV5Cpz0HFG9bvi072SDUooDP4XFWefcvq
         4e7Vw6HfTs6L7H984sY5SiPVfWq6qAscbjuJf6r4ciqm9kTGkMvxMWIDfaIMj2PDrtlP
         3mByJUQCDguoreAyNhBeFG+4drT8m4QI6A6oi9klcIgGf9Xx0qgME6tTTXdDM2YS8H54
         JwVLENpQyXZJa44CrVtyA8pgC75bqasDUcYQOZ4WS8ZW39YmKctngUE52rtUxct8l0Vk
         TnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636359; x=1793241159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        b=VZDQKkyi7GFNzTUKoJEJb2NPqM3FTEI7stLJ5yR4sXhrBKRIyW12yzi77ikE7F5Tdq
         Vc5vcGaucgWI8KETgyQcgWYDgER2rVrQt4VFooLttCebhlz2tlFdobs3cDt6lWl5ShQ9
         7l5sOOliNqTEq10fRcm93KjAKHLhYOvm0AbrfK0g8RgBSLF/vhmZ0qSzQO+/NfG8oAkq
         hHUjwAXca3+fL3QWPkbYqmQdu6qguOtfF7At1Y96/jHppNoPqEb9yGlSjbF8HXtT1LvD
         yiXDnUMVUcNNvyfu3qRiaXPRcr+/5cax8+9ELpKl7NX03VG6xxN3TzFKbS6VFkFPSp5i
         VgJg==
X-Forwarded-Encrypted: i=1; AKwUvBxzJc1V/W0a5v8fm2UdDDv+KDRi8kHbcmpqJ7Y1LKPCFzpYVG28/RoKhcVncZVIqo3a1Orf3Ju170fRKxH4xLUh@lists.infradead.org
X-Gm-Message-State: AFq9FYKX0koLkz6KW9h4RExX1znYMvppKhORWwBp9nsa5Im0BqyP6yQ3
	cwXsh/5c4CKZp0r6EVUwaT6SWnj59FVudyC0neINX8Og3xCvQAa4FMXg26/kttmQ6Gaq5H2FQ8g
	Od2rcUFQXIopR7hyz1Qc2LctPsfG1QTY=
X-Gm-Gg: AYBFou02T58WW0LaY9wewWsJxQdvS+pBn3RbqetNc/JKPJAPUG77rw5YJwJ1khVxkxK
	f8CDndXmeWwVgdKaoeipelD82c49uUBFA1vo21yzyD0pZu06r0L2S1atvVLIjYgy4OlSqO4qvBL
	QvwVRLOBVl93QcKiKkmvGDkilhb9f/5he4TABnYtVsewAE+m0owk6Vht972jMPL/hhcMVojRl37
	5wMJGm9scrr80BvY7p6/mKKnr3bfwabIeObGKv+wnDj0uPEk/t6lHP7aP7O32/SzFsucHo0878t
	QdHcVg13WcyJBglv5YJoVY8ghB7RvDCUiSwaqHmTmTFcnoq5H3fRKczCcKLu90tZpl0kIeIUReI
	j+WvW/9tJTCa+FwnwvhNpLGDO4b/2Z9oQX7YocYXEym365J1bPDJPRI27AWP3
X-Received: by 2002:a17:907:9347:b0:c2e:4f16:fbf with SMTP id
 a640c23a62f3a-c4679797086mr354694766b.31.1792636359268; Wed, 21 Oct 2026
 19:32:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
 <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
In-Reply-To: <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 22 Oct 2026 10:32:27 +0800
X-Gm-Features: AclHuK9kgEi-QHylQHY7HMeWPzlEQ4T2NynHaEv25TGkNX-ohXQB3EsA_FVqaQo
Message-ID: <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_193241_949514_1FA3215E 
X-CRM114-Status: UNSURE (   8.71  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinod,

Gentle ping on this series.

The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

The DTS changes are waiting on this PHY binding and driver to land before
they can be sent. Is there anything you'd like changed, or is it just
queued?

Thanks,
Coia

