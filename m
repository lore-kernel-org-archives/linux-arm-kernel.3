Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A36606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUgnpv3H;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=T/jGuHPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=; b=oUgnpv3HU+PRGW
	ga+K6AaJLRQ86S6ZkFknYhAIUQyBYrn+dCMt/sOv9lKdiI1R38RtMdMujPpXIiAOaTvzw3JybuDXk
	p0FwwgAX58Vyp8MvtZIdM5tg0XY6HMIbkzvYUdYOey100qyUMylP1492Fffr+a9HGpPr78X872YPL
	6RSKW4O8e38lv4ltKhEj/ix84lrnxghV+lODLF5mj10Pm/OLmHixeyOyqOXQ92zadmM1QtiwJERsD
	mGNYLtRGFDXStXUnzroKqZkU3ox24GTOEPCcSieEKI3Wz+yphdtiymJbY2G8ExjPCs6y9nNJpK4iG
	i1+WT2BnHbh6qjQSi1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeV6-0000000FBae-16BT;
	Sun, 01 Nov 2026 22:58:08 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeV3-0000000FBZq-1n0l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:58:06 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-6798c43a3d6so1560770d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 14:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573884; cv=none;
        d=google.com; s=arc-20260327;
        b=SJeRiY4InOnmPK1WU2wNtzwj48cTTFyz02HfYQDLhBBgIsKw5gVDwxTj5ErCvY/Og3
         2Esp46yVNYrWkinSEyB8AKsU9CVLB6odu/vcO1QRlUtNe/1rNgZZ6pVewYL4xIJS19i2
         T9AEqWQNP0puOzCXR1lWqOj3Oe8pCw3mZ7F4C/RBDAor83HdCCJA0Zpp7H36ZJ8qv1eq
         hIUyXy87VvWG5tK1Pr9yrmrsq7wQSwJDwFUTgKBIuMoZ6DSFcPzwZtjjThdCLEWAsey9
         b0/v3iL+vSVtbJWXcWc5G5QmQxiWX1C48qL807BvS3UmSkTfB8YgQyykU2NGFRQKuGHh
         mZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        fh=HxBS2LWa4W2tCvMlbhUS8x6tGupNJg428kBI40WgSg8=;
        b=hCp745gm2JPDOyBluIokePqmTka+1gUIViMgUPBEfjDO3tL6ertAeXwAxB1MPUKHkz
         spBGNlqKA27QW4WpLuNhtw/z+ypKKxL5Bx3UfrwJU8wWEvap/wb8LlrDJJrFIVDjzIbK
         kh3degF6r2BPD7Y66JNdngtfrB8own8hw9bWt07Cj1JvrPjAJNg2xdq7kPxLSde09zv2
         YmWByAEB5Gdq2ARhYzSoRfFzdFh9S+B6paL+lnGpdOVSkBuTMQaJbF1g3I6YmBuNzk4+
         d/4ruXy3qh3+qQO4BMtQ4kEquSiXCv7ef9Cx8i7NAViVfdAK0J5hnq1We1clswyoSAfr
         ZEGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573884; x=1794178684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=T/jGuHPBT3+Bb2ItL8sifH2Wj6wz/tIJv4fNcuT7jodygIY0Lbr2CRtD31GZjE+obo
         Pu+8SYf2hJXOgyLJ61VRSP/FOviF1dfMWdior8zCCEGYCsW9K1okwvwF61SyNyKL9C6r
         HQIgyxSH5NxOMCH6ob85SZCOkS0ATanKHS7mS6Y+oA6mvYEHvoAqNVxttF4wsvECh41V
         dCi+fcqI8W59t3WmYejEZsBnojjuaxlysLlpeuPNRKPPBPjyveTsF/n9sTTPxR8HzxR+
         PSUD7y253Np6lapNSuP9ZYqdSSMbcaayvxynvPkyQTIFqdmnl7aoJCxfRt7q2YW2Sw25
         CUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573884; x=1794178684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=WQg8dj8TQCbkzxSNZ+f5HS2wxztoeAs0YYNXStoFPenqnjT7E9mZrlheJ/HUeWxPcR
         YoT2uZOqAai3LURioZb9yZqDPcwJ39JBoQuR4bCeoE5n5InBe4T+jBHNhUHLu0FiiaoL
         WhUL642MAY+n5Z2R7DzYEKpJiDH9kSErp97k9hBwk7RVhxDR1XSmiVb+IMnFqrA0CVOH
         Jo8TlciRE1Yb/h0aA+rwnT1/Gt56mRdElRj9jM2X8ohuTNXk3dLv13EIQ2jzJPhPtFC7
         l+HzhrFb1+o72mxz5HqDAOJgUhmJ3goJDwgHyZIEsJqX/dUr/jDfbWBlhrGmLQfMje9M
         a2HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOCd50UnAofLCfxtTEQIl45Ai4D3FkIC6SXfI5ZwwZAYPnkUQ8hQd+AvlxUdgquZ5iya4OiWLBL6Zhcnm3yZCb@lists.infradead.org
X-Gm-Message-State: APuU4Z8hNm0OZItPZcKqzzAa8cizkm5qvGwZbms1ms09nPJ70OCzxjgK
	VCOX9TMENEn3esA9H9Sm9ovzny9RLk48vViXPc/pk6hGCL5g5xh2QCEWExj7tA/LggzS28ULJTL
	jYc3jLlqRTI9jiz1gVvrbZ/cDy8V9dZ0=
X-Gm-Gg: AYBFou2prFHr53OIEYQV1J/TnlGwzPLoiL05s8/RQAcWFGK17fSkYaq8ek2naYcmsqF
	8Fm69fMhvW1eMk5bKHWndTgf0BfERO0Wkc2xJ91iEfaW7tgEQqysrdhwCskJiMWnXeBBYfx6gYW
	snZP6LeW/yP+gfJKojY8MRlM/uCsc1POUAoLyQjPc2dx/fk3gjKvzhGOKYjZeGz1DnprPAyvlTX
	cgLmIw+xOvMDwOthZM+lOqjzlSoWu+g7LB6twY4CNujo6OMhcQENe4/QcOOnm1RDb3V7Jq6Ij2A
	R0xF8iRJtCUakRVpz9nJy10SpYoR1s2xoqmHRp7RFTDxapP0fVS3rS8C4QUCrh1goryDYdIONSl
	fs8a+o7HRD17J52QunggecQWRTlh25ZwgJn0aEPY7fKyloMrbzUiZGQaNmQY4QyDq/L5nZg==
X-Received: by 2002:a05:690e:4507:20b0:679:5bea:d3f5 with SMTP id
 956f58d0204a3-67ba4f7cd36mr2946413d50.50.1793573884100; Sun, 01 Nov 2026
 14:58:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
In-Reply-To: <20261022200640.3101932-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:57:53 +0100
X-Gm-Features: AclHuK9XeeIDEqdtINHt3p0JMcC8yqSM3_Rvc2uE8IOAzFd_ujX08owtUzvHpsU
Message-ID: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_145805_491748_649B4FEF 
X-CRM114-Status: UNSURE (   9.81  )
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

On Thu, Oct 22, 2026 at 10:06=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +       if (!dwmac->data->init_delays)
> +               return dev_err_probe(dwmac->dev, -EINVAL,
> +                                    "missing init_delays callback\n");
I'd rather let this crash hard to make it obvious to someone adding a
new SoC that they forgot something.

Other than that this looks good.
It would be great if the netdev maintainers could comment on whether
this now matches the approach they had in mind.

