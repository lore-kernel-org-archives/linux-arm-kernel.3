Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A711CCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGmnk9Y7kDaqvngUdy9AiDHXDEmTlZrFIomlpm38Cxs=; b=ARFepg3rqUBFGwKqg90m3rBM9/
	c/tiLV5lszQQbvVBoAcieAyzvN6vww71ByJiL8UlcntqndLLWRpv5dXINZCGRaqT6I7JjDM225+h1
	w8DYOaMTsg3kObYv24Ti7S8LoN6Jw6GAFidKFyJPeVzLaqw7tujFEv186dG7J6I3470yk4+r3h5Sv
	0nwTKdxY3TNP9KJByFHhEf92DCaG4mz0ysJp72B286Dja5pCn0A807ZAIQZRrUk2zhwG7fNbZ1dQj
	2wOyOb1GTCnyrf8F5eACqBr6lZfrgBZPGGGgjMuxFAd5gC0VEZ5sDmwBlU/9efkUdIDPD3t6/jqxe
	3WJjrATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNgb-0000000Gd7H-1KpL;
	Fri, 05 Sep 2025 04:04:29 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNdo-0000000GcJ0-1lJ5;
	Fri, 05 Sep 2025 04:01:37 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-61e3b74672cso3711327a12.0;
        Thu, 04 Sep 2025 21:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757044895; x=1757649695; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YGmnk9Y7kDaqvngUdy9AiDHXDEmTlZrFIomlpm38Cxs=;
        b=C9AIb0v0w/P7BzIAEFJNGFGarUo2LB1f8lXzoAlbtOOn78pa8t09ordZmnK4v3GX4M
         i0ER62B7IqRRURv1jwwUO9fzH8ojHCzO4yQPkIe+eXTwl/ZXgSr9I++sJtTTQ5FT6s0r
         4JqHPUmWMJF2+Rd/1hFixuWUmDRBgmVAB6jw/Yfw3AcxA8gJHX0nQ3RsBTevB5lrJc69
         G1n5d1U9zKHe9ufXhp3cATVH2DTvLDS64TQ/9bVTORpyK3r7LJY98zEr6pvlGCYN1TyY
         1LUjaPGvGPZ7ism8kr5d6dpK32iEKDVoLPMCxdY1VgnvQoPwttmhyK+bu+86YBeKUFXB
         f7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757044895; x=1757649695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGmnk9Y7kDaqvngUdy9AiDHXDEmTlZrFIomlpm38Cxs=;
        b=H/si5aMk3aAjznYSp+LCTwd+udOqZiH5LhQ6cquFVVZtalft4X1CCr5j5DmDPnOZeY
         4P/r2sb2uZmqHhGiqvKz/rkVf6+r0a5lsZBGxZEeU3V7ZVPZ6QT3NQm3vpF1ztYTRqqd
         RdNKW0IT/Qx0yf7eub84YvUpJfRS8P55KvHuk8Vb28uuuf+GGmtA2BE9bKft0MP0FvnD
         33PnAUY707lNoKpY4aQGAnQ/Z0YVcX2twBw+eBqQUEKfa1AUxie+Hz5oXoUIGjCs449H
         e0+icRF0r2DsKN38gYk+0qi9mmO+x8ZjzeKUS24CZEwrfCrPFdTRY7oQX+82ddZT5FTZ
         8uWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmwgbNDIECMMQ1bJP16VlAkpf9XtfvPdkQQxtflgmyR8UjKnL21LDGHVCEa8kTinylpfX3YS/fB9RSRBOH@lists.infradead.org, AJvYcCX4f2tDh3d07LMAImrHn7YmZ9oF5MVVNLyBwlitPpojwlmk/Rsu8hcMcusJ/ttDlDJk2d1VJgs+e/nlBeeFEiOshw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgmoV6bwTc14h17tZ8zEwIzQDSIucDTGUU4oDXeiR4vzAlI9Y1
	nJ5tbVPw1Vxihr0KcvUc8DRbYwrtje5w5ZabOwshC0v+FeeZcWb7KIJMPgbLv7IO+viGc1dkYlc
	pL6BYVWqWpivRrbrFCx18HDVdscBPEFo=
X-Gm-Gg: ASbGncs1oPpwIk7xKMw+VOXIRxSuC3cgC4K/CW3adepeq/VV8ls0Lp5rWCSOFkxg9SY
	aKoXyt9T4yfAwkPRgfRF6I/T+Jk+a1r6126WUoUjMkoj64p0Jb0uGzoeiqJrnx0shDe3qRod/ro
	asndbvea8zyIOMloDZOH5XD+z8knk6W3G/MvSiQVUWWh4I4EtpN2PrTvAEme6azjNTX4fJC7YHm
	U4CgHcfzDhDaKGc
X-Google-Smtp-Source: AGHT+IGI90WvQ1OL6qzT0UTrxnDzkKtA7u7gnGXFuOteAw9bkUI6xf+wizPLY6+YzR0GtxSZAJQl+LWmGOlaRBQLAUQ=
X-Received: by 2002:a05:6402:430c:b0:61c:e3cd:a515 with SMTP id
 4fb4d7f45d1cf-620f549b25cmr1673091a12.9.1757044894512; Thu, 04 Sep 2025
 21:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250825065240.22577-1-linux.amoon@gmail.com> <175699250964.3374853.16885676491827667777.b4-ty@linaro.org>
In-Reply-To: <175699250964.3374853.16885676491827667777.b4-ty@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 5 Sep 2025 09:31:18 +0530
X-Gm-Features: Ac12FXw6Duul3YjCrLSMtIq3Ki1Yxh-YbEkzS0fLz92JkUkwkfAjtBL1MXoQ11A
Message-ID: <CANAwSgQGCTs46DVm3gt4PpdSTBTvVg5zga_oBt=rUJh2yhRLtw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Add cache information to Amlogic SoC
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_210136_457585_CDED371D 
X-CRM114-Status: GOOD (  19.54  )
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

Hi Neil,

On Thu, 4 Sept 2025 at 18:58, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Mon, 25 Aug 2025 12:21:40 +0530, Anand Moon wrote:
> > Most publicly available Amlogic datasheets mention that the CPU employs
> > a architecture, quad-core ARM Cortex-A53 and ARM Cortex A55 and
> > Cortex-A73 and Cortex-A53 cluster, sharing a unified L2 cache to enhance
> > overall system performance.
> >
> > However, these documents typically omit details regarding the sizes of the
> > L1 data cache, L1 instruction cache, and L2 cache.
> >
> > [...]
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)
>
> [01/11] arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
>         https://git.kernel.org/amlogic/c/d7fc05da8ba28d22fb9bd79d9308f928fcb81c19
> [02/11] arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
>         https://git.kernel.org/amlogic/c/fd7b48b1f91e1830e22e73744e7525af24d8ae25
> [03/11] arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
>         https://git.kernel.org/amlogic/c/a4428e52babdb682f47f99b0b816e227e51a3835
> [04/11] arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
>         https://git.kernel.org/amlogic/c/3b6ad2a433672f4ed9e1c90e4ae6b94683d1f1a2
> [05/11] arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
>         https://git.kernel.org/amlogic/c/fe2c12bc0a8f9e5db87bfbf231658eadef4cdd47
> [06/11] arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
>         https://git.kernel.org/amlogic/c/2d97773212f8516b2fe3177077b1ecf7b67a4e09
> [07/11] arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
>         https://git.kernel.org/amlogic/c/57273dc063d5a80e8cebc20878369099992be01a
> [08/11] arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
>         https://git.kernel.org/amlogic/c/6d4ab38a0a21c82076105e4cc37087ef92253c7b
> [09/11] arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
>         https://git.kernel.org/amlogic/c/494c362fa1633bba127045ace8f0eea0b277af28
> [10/11] arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
>         https://git.kernel.org/amlogic/c/e7f85e6c155aed3e10e698dd05bd04b2d52edb59
> [11/11] arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC
>         https://git.kernel.org/amlogic/c/e97fdb9b8a0f8bd349de48815694f8a7200e3d62
>
> These changes has been applied on the intermediate git tree [1].
>
> The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
>
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
>
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
>
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>
Received feedback from Krzysztof to omit the comments in the commit message.
Should I respin accordingly?
> --
> Neil
>
Thanks
-Anand

