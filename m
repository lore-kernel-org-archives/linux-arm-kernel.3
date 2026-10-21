Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB310606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tIS1L11C;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kxh0oqWT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=; b=tIS1L11CKMQn7f15V+eVDi9QTb
	2ITd+mYq9YH7YsNSy9Xhr+DTMtkT+uxTPOcs7qhYS5E9CItmDzjlp9ZknB7KhMuHlUt1DxjL5oZP0
	Vl2tbZUypS+fflZBL6d5V8XNcVVjj01+8YEq6TmgsY2Ly1YtqjXgArLsuUPEDqGoU/XzMXlwhaDvK
	AHTz3eimbfKLxwHw+E/SResbiJSY5yqPYNl1h7LW0tt1b7uJQ5Vq5OuiwSKGjSpHj9RSNGkhfabwz
	rJYFTNywVYWUiu2MyoMOzxMAmkRXf5sguxVILYmPCWKN3k+g5bBNwPWLcXIinLdAabikS9CUhNGBe
	VK40FDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQPA-0000000BE1o-0F4V;
	Wed, 21 Oct 2026 07:06:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQP7-0000000BE0t-13Lb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 07:06:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso442137a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 00:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566387; cv=none;
        d=google.com; s=arc-20260327;
        b=dkKkI4q0tIhjgjM856JMfEgRvCKX+CdnIfMF88XEw2pP43YYol63SIp6Dj+PvI8iIf
         wFxK9QxRlHjcAaZ/EROMueP0kvdeRUznH7rTnQv+JtydMnvkqOJedkSrExYjNBuBI+BX
         MMJaHWBXYn78Em04RDRPpyBe1wikf7y48uaahBMrioKi5W2tVMMmO8fn3r4cHvEjfVuv
         ridtyzwSLoyj/d/d0wE8hfjJM+yVCaR+ey5ttuqhrdnT8Qw2x5Kh4KgZPp9DAsApVcmQ
         QRR7lgegjxM6oVsDyH8xZWLDu9+BIs9V/RxNJe8QhslDgCg4qS8tZUxC4G/+OrGvarP8
         UzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        fh=Cz9FVmSSG0zaM0vP4oO/Z3O4dxghIKma4xc0u1+tdVc=;
        b=Mv/426OKfs0qMLYSZklpjle0PdzSvdXkNpSWJ3HFDJL8tsV1PZ1Ts4ka1OB46YGeN7
         sg7Qsmlz3p0ciPYuuPSY2FYxLFVx4YAjkg8vG5RCAyCN4N0Qc/1hyef1VVP2qONke8Bd
         PcqaGNfsmIVAxaQyNxF3DzEpN7JDJ/v36kfbM3dLaxQaEaKVGdQ9Xr1FKCbDLi19D5Oe
         iwxUUo5ltKPY/2ci+6l9yzkTHHwAceVkJjeL6mjVnkRFK7rY2CVuYoIYaTYi3ukRTEgv
         nfr66aDmZXey7L8WZPeH7quo2tsMtFJ/OoiTnop7EZevaqagUXjyjlWdG95/pIh9za6V
         kQmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566387; x=1793171187; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=Kxh0oqWTd1VovwSYc7RkHLcvqzCbJXXsO/ELl65jyXvk3sc2NqGQI6alGptRp6PU0E
         nlnOnr5/GKkdXXvrg+jl/VKa4hmg1/LmSk7M/8ZXV69tB5O2rmg8P6txXsq23TolPiWb
         nvUJbBURTsIz/4tqnrW940LvXk1uOva4Sn7gzTeRQKPi1/2SW7qvmaiW/cpxcoYbPpY9
         fWC+bFA0Z02VHODZvDPhDasgvyJYGUbyavVoE7LUNjHOP9f7lQnm4Y9scZ/EZcy8r8Fq
         n4Aj46AtwTtBdAQPo0x4c8e0SDBus8RA6WmOTnyNmvTwpiqzU4KMblFn71X4mCaRxhQM
         B7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566387; x=1793171187;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=f0NH/cU5VqIcfztBYsQQshCqoUvKZYMC++dyFsqVl6b8hpHEl5QGhJLikTWirXxONZ
         qga2HZmMqw6DddU4lFftiNhePwn2p381gvycugJB9eomoRZ6XonLy5cwJXGIAmNpPbP+
         iHEUmX4/0JD6/mJowPbvH8ianTU21LuTURQazfc3V1hmP1oEyQe+7TkppWSClWJKCeo6
         3gJpjEHw1o/6eICfxImiTEeFUiIA32Ej/cYwj3rtgX2TFWEQNGW+BEScPMC256bSSYQJ
         zU+9JHbEPThaah4AjHHIrHO15uX66lNacu2XFsrI945xvTInQNyjBZVJ19b4uv7Pb1l5
         aTbw==
X-Forwarded-Encrypted: i=1; AKwUvBzDTacjnDYKEHpWeBb9jYt8IMsGgp/KLkW4Nq2D2VFXOyziIS2duCY6Z7KufcdrqKjWdEXwsl4JLEjybk56s6ew@lists.infradead.org
X-Gm-Message-State: AFq9FYKPSCgQl3E3ohSEImU4Y4lURrtNWhzN2aikZxoZtS0byLb2M092
	Gf6/Z8p2K8IfYf+9ebt9NgB2vk6nCsz6Iz5lM47gwTf4l7mlbWCUn92G7h0pX20CZ2OGqFqVphB
	co4horN5cmljzQwxY5Gc79Opw2TuAtO0=
X-Gm-Gg: AYBFou0ERJy44fptmyjgDdQiciCrl5mfASlX/TdN6N0EYxNWojDutMdz460FqnQShu0
	8up1URc3KiwRavnUrZmELqTsn51plTUaIjbJjeRkVWtcsrynfzw5VRGHotbkcrE0YeYbjLbWq73
	HqWGKUUVBwg39YOwcvmwZGtVzJqvUeaKq4h8szSNdpNGj2OXtRHVshhbeb69ipb8MYDlucVyc8y
	DbgBKs35ajkDNLp75r7Bmr+lqt6rpPujiVYWRoZQ9z6UHCKqzYYjZBh94I6eta3d2tQ499Z45CI
	eW2LSoCnxo+oIJ7BsUg+mdSu/1cdDC66b6bFDKd6RkBlhV9/3d3C/aU8uy2avZ1YeHbZQwfRbcu
	b69yWPBko9Ba82FtcCxinrXStR+CNv5OlXUY=
X-Received: by 2002:a05:6402:1585:b0:6b1:cea1:a011 with SMTP id
 4fb4d7f45d1cf-6b40893d0e9mr633902a12.0.1792566386899; Wed, 21 Oct 2026
 00:06:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org> <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
 <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
In-Reply-To: <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 09:06:15 +0200
X-Gm-Features: AclHuK9050nRGHSTN9753pi8bjuF0vHRU3cnUbJida-ygLIdS4pPdAAtcMwmgKA
Message-ID: <CAORyz2KsozjmcDCd+KVfvLokuxs-YAP0E5yJawHECu9pbPQmKA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261021_000629_302966_74BBF5C3 
X-CRM114-Status: GOOD (  11.14  )
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

> The dependency of this patch. This one uses compatibles defined in other
> patch.
>
> Just apply it yourself and run full testing - you will see notice about
> undocumented compatibles.

Thank you, now I get it. I had already removed the example from my
testing branch and removing the example also removed the dependency.
I'll run another round of dt tests to be sure and resubmit without the example.

