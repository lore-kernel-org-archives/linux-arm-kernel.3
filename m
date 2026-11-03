Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D150606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wt7STQp0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QIKLXmDhQNqLB4Y+YR2V9D04+lvxRqYL6EpEyVAWUjQ=; b=wt7STQp0rnBp4+RfJrgFxrTqFH
	0MCwp81S9SCDdIWyKIecuHQ7+eTPdDul4Zxg9C3spWt2pECUL4YoSMjvlNHuq5uc4BR1awfCRtf9k
	iB9dsDjfj5Wnc8ugmb2YqLhEn2G7l59XMdwh/E9gr6X7Np6y6fGA7KnoLHF7nRbreRrHWmFwrzvih
	CBkh6S4TqJq12qwMlcqzgrXrp38FhBQmebrDnFT7QzXSEpYTjBT7Ij4XGtT097lBgUhuo/sYxuBvC
	F0dLVqZbZuFMg+EemWbk+KyxjCYHaaLwlTLdnKnnASEI2jsGV106Y/j/RgyLrLegbGfzTzQhvdZen
	ZcNG36wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHXC-00000003Afp-0EyI;
	Tue, 03 Nov 2026 16:38:54 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHX7-00000003AaM-15aG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:38:51 +0000
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so3230004a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723928; x=1794328728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIKLXmDhQNqLB4Y+YR2V9D04+lvxRqYL6EpEyVAWUjQ=;
        b=bkJFR0efihiv1aY51UnnmGoUbpMSklhg4I8bcRwlmSaUT7RkNr59+3o0g9h2Kw/9PR
         +NHRThTnV5B7akHJf0Sj3dXaIFodVQ7ikclQWXk0mRZ1NUBrobXGltj/pfnieM8UHlMf
         dlffDSS3YdwcnzHF7bH554PcZ3gEqtAGCC2n2GGP4pt+FlA/IzIPc5DSoGvPVI2wOM2u
         ecFb7BUw7YtF3CA9q+G7QC46XoHty8fOmgy/NedzU9lekFWBw5aYC3SWsrEHKlEgOWAt
         LxRUN8mSdaxEnE4cB3qJN6YNXGrnkY+TDQUwkTv9L8agNu/nG1r6dIEUWKAbYTAW45li
         Lg3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzT5stvRye1ggEenC1r2+mfIl/cZQYvogXSi0f/WaW30L3N1Zcf5k3yFuFsgMdehWs2HMDoHmgWe0TKIBSWqf4u@lists.infradead.org
X-Gm-Message-State: APuU4Z+bzZ/FT9mUOKhN7/qZVokm24XVW72p9UhXKOCJe761Tt3JTGFa
	kuYxm48gGnNLgYxFHfq1trhD4rpB/mQF6ALObC+o889FhBb2rryDKWm+Gy5n59gL6xkApQ==
X-Gm-Gg: AYBFou3yMlRrN0KndXpKpjArxI878rsbnpqYVmLDRfaDoAqC2gE6Q0bLAZUZfZFXgIZ
	9mLbA01WJeK4SeyecNkQUiKFrYXbmleGyey4eAXA4ssQioln1MAk9mBKzoAxmiHJO1QhkOTTHTN
	G2c9CtWVFrIDSpCbV+ECudUR5jr3LZLf/0BKgcR7HQI1KIK3JzfzoUYhNF5IF2eLVpWnjxZYwrc
	4VWW367l8yRtSlqoDDSVcX13I68YhM1rJRr5mF83QJu7hUFFvobSkQet4sGoAG1YnMXOiNpj16P
	eBb2Z215HEbXsDhmU1vlzMkUQFB/CgZtmiVvZLoICCUP4Jy2I9P61/Kg1OQAtXTjWlEfYb901/1
	T6Y75SKWqT4Pv5Zfs6bKYquzJ5di2nQpuGIQALmCZRQNZOOJ84gDTVpNZNNlrA4fumnaEYLqQaf
	y6501EpcWfjK0mIV/ABD4jEm37G/4ES1HqKJ06C0+inkeC0Meokn5fmMCUekpFFrBo3N+ePg/cE
	RgE4+dQGp7b8NXeKPQzA2qSClAPy+mJK5j44Wz3O4l3YmwO4OrLF//b1CmnNT6qQb4X81CIIS00
	k7ASTmhIauZYqOnhGfFzD0/9qlouWLqGDAnuvGaRVDDoKH8ZQc3++J2rpoL+XRllumVR8hgztCy
	XfIVH/Tz2Z7G40Cp27iuB+0WHC16sq6RlsMAG8yoUBZtRi10EI8MI
X-Received: by 2002:a17:90b:2882:b0:3ac:8897:7b9d with SMTP id 98e67ed59e1d1-3ae89574cd6mr11938745a91.1.1793723928374;
        Tue, 03 Nov 2026 08:38:48 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6271ccsm5257428a91.7.2026.11.03.08.38.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:38:48 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so3209985a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:38:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx9OLHVfdy13/mZSQaGTircrYdmLKoSFJvmbqSvjYGwacyAC60gGoqr/9N65ZqVSVKJrl7vZtVFe6bBS0Ye4ET/@lists.infradead.org
X-Received: by 2002:a05:690c:91:b0:8b3:2b8:856 with SMTP id
 00721157ae682-8b302b80a2emr8226867b3.68.1793723438403; Tue, 03 Nov 2026
 08:30:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-4-tanure@linux.com>
 <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
In-Reply-To: <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:30:27 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
X-Gm-Features: AclHuK--tXPcmW4jBK-98mKvizjMAJUNc7lOR6WXsrVb58UVKvwxXzerIoleZek
Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083849_312432_2704A17D 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 1:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Without that gate the controller cannot do DMA at all, so it is
> > required rather than optional: a clear probe failure beats an
> > undiagnosable hang later.
>
> Does the DT binding mark it as required?
Yes. The T7 block in patch 2 lists the five clocks as an "items" list
without minItems, so all five, pipeline included, are required.
>
>      Andrew

