Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A060606D83B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nu7WR6Y4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6ZSj/46
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=; b=nu7WR6Y4VRmh54
	VjbFhc2O8UtxO6KPcLjsXyqIWwKvPahIdL+jXQUg/D/OongHuKoGuAVqTqjIUarq3TRkYbK7p+d94
	6zuAspVL8x2V8zqniaqFyFqQVwXBRn9yhppEV9xTWIfLI3RweGyhN4v6akdbaag33l0sRdlfYG0PI
	ul4N9nIo7xoQpRkg/Mb4XB9YhNeEyuyhy9oqBZYTjC2GPGZ42qm89XP0878rm6rf4nQXtyOPY1t/5
	9Vi1mJROnmygISEqLUo3xJdB50TQQXzM7dNb6kKdGCI2mxyxOQuiAOuhFgkClvkhk87ceVP24hdhV
	mSwK4wi22N7WjTWOiGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPInB-0000000CHEz-0A7H;
	Fri, 06 Nov 2026 12:11:37 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIn9-0000000CHEF-0epf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:11:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so6359741fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 04:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793967092; cv=none;
        d=google.com; s=arc-20260327;
        b=A5slsHCSf/krsE0keI7tvsp20us+H+UYVkDBQjs/9hiZ+NPo1lGe684QSXDKyrxl2d
         5+4vBJBkXd1q4VxtEm3LV0OAcWz/FES6po0adcgS4wIMgkrRi8zAw4bFhCg+JjNYZn/v
         1iwgkbhCnjs25s+7pB25Hl2OGDbwJyHetCUPAefQyfPiR6/8Zac9jHihACc3iqy4ETqB
         OS/Q9XGEGuWjSkvzpY9fcitrZygAhRf97Df+QISgYwr54oj+2TCHgDf0ekYLY7L4htyT
         vIx7iCBXbJgtWqIVlrb3kH/6tbTrKv9efB5z4V31/Yg3cNyrV0sKoz+4SlklCLdLQZDx
         Hfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        fh=k0KweLQaZNclom8+uyx0OgIyTKrH5IMJuIwNvNETtfM=;
        b=sJe+VgUsLlga/QFLYanCSTN89qBqOGgxnGfxwgK/Xz+N8fQpb1srPo+BdqwrH3H17g
         Z8eTK2/+QAwzWp/5HAqK4waSlWci7yK4NQk3DwG3p1Dfn9YV8UWLnTOWeAzvrxY2ozoK
         60x+RZVagjadtktYNd7oNWOXxV31r/jGVR/6MMwtHVENbVK/CJ6V00MC0fVEj3W+KbXO
         sjG7a0D7kraKk97/B8bXRBv42N1/ws1CaqFbpLJeUjI3lg7MUKZXMjtJ9wv6qGpcUyg3
         ZBWzGLpT9IO8CIekBle/KAxM1QbrtkblGV62CUhdNsztmUTv1vn01c8+c1XWARdiTOM3
         Lm0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793967092; x=1794571892; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        b=f6ZSj/46vkkzoy1rxNECdvU3yT/N7grHDJM25ZVlWTEncmyUgGCbDsS3ap3oMknolL
         sMx5jNRKeQ4EZSrWohM1c1zmBKPdVWgnNiKyxKAlBt29M5FLqGmkalC85e1gbbTc30FO
         IsZzd0ViewB2ULVEOKzqQjY/h4gUzyZv0sXcWNxRqA4k4WIee7eH5z5NfV8jpkl7SY9u
         WqMQfv2trC6ipVQfvAohOEI2/mpSWytoNKIAoW2R2yZ/L+BzW+qnnFQregfMOvg39oXQ
         xiUrhD5noZMRvVQe1vS5MAz1Uf7TR9FygZu6a/kj5ABpLYLtHbaNbG/JwrGrUhilKXZU
         nlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793967092; x=1794571892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        b=SSvgzC8EdJXfm4qUZNJV9xUfpg7TBImTC6xW8ZSV1Va7O58BV3tgWS3UlBQ+uCvl60
         I2P4PzdAqO8xeMOjD2ehRUd0X+8ate+8quVJ80Zg47gXfyc3npAsIKn8n5b+OJ8ORa4w
         SrbSYg+yFNIkkwtsKkVwZ4GiR/EMhuE96JLoHI3OIHrY1dGu5QGfLgsPh/R1PTLlSnFW
         S6Y2eTayFCZs+r61Cva2w92oXCxYR77V7XNWuylP3NfTGiDXextJfDhhZI5crn0TPz9F
         pTFcYY9lnpK64x4HxyYpOdxBWmEyUgQXv7BrziopCxMbLeuqwfcLpwdlS2n7YlBG4HpY
         8N6g==
X-Forwarded-Encrypted: i=1; AKwUvBwD8Dy8EOWuDfV9PLh77CM0GWoFjTQAEhteRL90z3GXrn842UZu2y2/rS/MYaMiaTNfU4Up4FT0fFU3EYRsXiBK@lists.infradead.org
X-Gm-Message-State: APuU4Z/9xt+b8I8VWd8rfoAe2dC5loT1V4iROm8lD1o4dAxmimc/DE0w
	ZmslGh/1padD9QauqtJjW9NkEBwcZLEb+qFF/fKa23Ezz7GT79NV+us3f2/yFTB4lYKOFyhVOQl
	nS6bQMuuLVZnq72WzU3jJaENV1dkOr74=
X-Gm-Gg: AYBFou2rUxC2BoH1mySZgd6JiQbFq0z9feb8H6RItK3g2MARs8lM+S6KVCA0eWHuMvz
	p+hoxtoB6sqUw1/O16Bl3q4VXOQozOwBeTypnZvZCBhXFx84YBl1GL3m3ytZ5K5gFsh/cEgPKj8
	ttdYqRGE6bNOvVU8p0ZJiCi3HEqFgK/AuaYAGtVuMKjl+DO+GlgrvL7Hc0kSZwmP7aag79DJRBK
	FPqHXqRLy0ysY89RV/Q9atnY3mN63gIQwlXVmwN/qWlxchby9PUA4Ijn/hfCLdXdgSS5Zrzh714
	Bn56mktUOkY46p3ZCKFgcpuT4I3i0uL8xfrLOI1zdBRGOSFsWCc/qNkflzfgrsoLBAa/DR+Z+sS
	FY6qXiyepKlCL5wn+VZz6vaGqsEaN8LiVuS7qgcWmt3EFmFCDKW7yfWhxx9NwyNxFKJrJedVYkr
	J1YHQIJeotot2RTuHEsR/IiuvmoA==
X-Received: by 2002:a05:651c:a168:b0:3ab:ac4c:186b with SMTP id
 38308e7fff4ca-3acf3a17b03mr4522841fa.9.1793967092260; Fri, 06 Nov 2026
 04:11:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
In-Reply-To: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 6 Nov 2026 09:11:19 -0300
X-Gm-Features: AclHuK9TdxwLahGEGzjbAfd8oBsJGMVuCCTSxGyqd0oZVKPE9N9p0AqrQOMBJUs
Message-ID: <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq is true
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@oss.nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_041135_211748_76F1C9A7 
X-CRM114-Status: UNSURE (   9.07  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 6:00=E2=80=AFAM <hongxing.zhu@oss.nxp.com> wrote:
>
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Add support L1SS support for the i.MX6 PCIe controller when the
> `supports_clkreq` flag is set.

Please explain why this is needed.

Also, does it need a Fixes tag?

