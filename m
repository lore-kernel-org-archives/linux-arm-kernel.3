Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2971A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0kEuNhAC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYPUI7jP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=; b=0kEuNhACRm5gLfX1hR8coXASTC
	8cYpI3YvAbNQglL6aaA8TLnYtKwyl6HBsW0WKZGv7NPIZsQZJFXlaBr7T83Alo2gglJP9Ir8F0jgI
	v3j5jpc+AEDWT/XTPwp0zd2T0nvLqN3dHNcAcoDd2W0LWNh+vnf9hjD1My8rz+9cXT4NrQTC45jgH
	ncx2/DrZdksCLtJ+tC9KalwEh3mEeABrKuun24FlbekmmwpKHTsYnnxew9wq8kaZsCCnfgh0W8pv6
	g77PcPelUZF9w8hreAOBsci9lWBuSt0v3y1/Z0BQnxe5sJK9ASINHSbqRyPMcaN7vGK3y1fSds7Zl
	TJiKrk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjHa-0000000FUjj-3OGQ;
	Mon, 02 Nov 2026 04:04:30 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjHX-0000000FUis-0ceM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 04:04:28 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-170135e43c7so140653c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 20:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592266; x=1794197066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=VYPUI7jPtj24G9FEJdy/8vb9pQY9K1kcpaC7A4NYDobA8NJuvyY5ABCPPIxwSrg0cD
         NcJfTaIAq4o+lExwgH9TPygYxw9Bn+mXdx0rDqyFA/Aw0+B9lX0QmPJtxv/eUPOmCg5v
         LzpnscIeaYmC3v5IAdyEVcUbNeFMnvOkfvxHbu40em05xjDPgCB7KRegKgumuNr5uTxU
         j9VUsrNACT9dgO6qjbNSOBT0gJD5J4o0Tn7GnSt0vvcwWxiuvZoXdYWJWfnW4vJLbTOz
         3UL2mlxyqz/JYy0hgHwlGocOjlOVfJZJkLLwreLEFucarZDT2Y6Qk4hcA5GQfnqa7KVA
         0c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592266; x=1794197066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=gkWQY/ZwCFnlDmCw7WiYqB5UnscDf2rUTu+zoTACL0oXrbEPD8B2gTPVnN2ryqyJuu
         crDeDPV3HG+v3vdthvpPhXVSr5faboCLt+mbZX5vpKHCJG+nzTTWrMYqQI9BS2vOoB1X
         Ho8lCVZ1to95OwnUyMgyyLx9tTTgeErPGVZaWjmz2a1LpK4dtM/MsqZEBzMlTt4yzf5C
         VC33ezXQP01IDB1IHxYqYPnHWf+rBj3fXjMBNa+jMVWZezbEs6fTAXQIppFsNfkp+Cfi
         WP8bI8OOUKIxywNhRdaCtcMwS9v9+qXKZ3xpubuHOBX5GFLCuzdaX2Bdz2xZv3s8EMww
         Nvxg==
X-Forwarded-Encrypted: i=1; AKwUvByH9Rk4AGraquWeI0X66k/uUfryIk13/gXwmI9XhuiqHhXPuwo6frGgr11NAC8TCjhQYMTQ99zzPL3oe/XlcM/N@lists.infradead.org
X-Gm-Message-State: AFq9FYIXQGh/9DG2pV7TU7poAqgaFBL+vtaaG9Fyd0dR5Z0qNtlW69pj
	UwyVFbwqFyi61LfoU+Czb3BdzPpxn0gNmy6r/22cdhMsVpmr6uM7FVNv
X-Gm-Gg: AYBFou1mcA17tWpTlNSsHj95VCzvrAuJVQJ+9v3RIZFnQ/T4B/9vQi0TJ4tkL7cGIrl
	wsqcnX0SRV634Xov5vu1mLmShhxD/ZkkSuXUQOuosc5XNKCN558xWg8ytk5TW27H1pPHLKwG0GI
	5MqBZxq1DtLe9BqKwyewRdm2yTTF3TpYmnawdZPPBLaQT96WGKv8TSua75dohuD1+T19ik9CaiH
	ws47xVDTJAbT2Q9CDng6FkJH0uYxbYnYnxr696iQ8ljemVZXPG7WDMc5LvM8pKxBzrj9yL7ayIN
	C9VwkR7YmyVqNcr00frTxfzM29p3+bFEdz+8CvaYjtHxHQM05tQ4tyhqeiuCrOYGHRMi1YyMrG2
	qZbTuqeUMR+4Xz0BqC0Jf4PY+NXICFHWyhh1xzjEcEo6zgU4xm1t5ou8TXlTMovYlaizkAPRv8B
	/HD0JoYvit6wUe421qlptx1DYH8uIjO+w+ILMeM3fWLP7r95P81YwyR9G2C5uaMTSCphmFiNBYH
	rlwgrOgg7jOS78lQfGYgSqvLja1CzCo5cDdMbPGeA1m/p2Pif1nLuZarEa8QVZoBFTQPojJ22tR
	kXMpalul7/HIvc6u3DOKZ8XIJFH7XHceLp1zOv7ImkgCZAeJzrYi306vRz6NB3xvMx5UzLQ=
X-Received: by 2002:a05:7022:b043:20b0:19c:dd9b:d09e with SMTP id a92af1059eb24-1ac5cdf9b17mr14479268c88.23.1793592266054;
        Sun, 01 Nov 2026 20:04:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm29283682c88.5.2026.11.01.20.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:04:25 -0800 (PST)
Date: Sun, 1 Nov 2026 20:04:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
Message-ID: <augLnMBF7Mbw9_sL@google.com>
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
 <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_200427_193562_86FEFF16 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Ryan,

On Sun, Nov 01, 2026 at 09:24:58PM -0600, Ryan Brue wrote:
> Hi Dmitry,
> 
> Gentle ping on this one. It has an ack from Rob and reviews from Mattijr and
> AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) that I'm
> posting for 7.5 uses it for the volume keys. The patch should apply to
> input/next with a three-way merge. I can resend it rebased if that's easier.

Applied, sorry for the delay.

-- 
Dmitry

