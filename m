Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112F2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TIYHLcpF;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=QHABelTh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=; b=TIYHLcpFlyaZoA
	YOY8S0H0jjqWAGttQCZyGSCdgY7HuikH/2OtNds5dX+Wac8EGWcnaytb+50pjcMCnAvqb6R4UsF8D
	L/qOvip+2ee6ctZh3yTuCubuAmm+9vpKNuKJ5x5mcFFtWDbpp4jbrx1y9hAZpTNhcJF6yOvLZPOCA
	zWcEPUnzZoBcpoxJHT5gJrhW2s9XfmjAxTOroQFrfnWjukJbIWgDGgtp7VnBI3cOif8IsESfB4fCy
	CUsGEoaGOw22RjzlQol6QAHivE08+akDFndgKqoMhfip9bgaJYAYb7i1lQGeb41KtpcUhdOM8dRLR
	TpebTI2sPaRtqpUeJVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKH-0000000GWgR-1alT;
	Fri, 23 Oct 2026 14:32:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKA-0000000GWcL-2GIU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:32:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dfb76b304so79757f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765969; cv=none;
        d=google.com; s=arc-20260327;
        b=E93ejYXogtPdvAq3jVfWu4vICi83+n/URygy7qABo8kwsrYn9RjLyBndmyWBW5L7jt
         43nokzC0W6o4gEjD58YFmOE24Cvd88HHtBRFizuwEnKurdvQkRxH8XXsJotX041e0HLC
         b1TyEIpU+/6TPK2QkjkwWO+TKa0ctswQ2o3hKlMrQirz4eW5D/QX4QkhJaQw2J9cKyio
         b8HQBMwpXGOZS04LxfoD0277KcRceEB3LXRhTe7iCxQCfuXfSK5Inep/VwGLDdpc1Azr
         EtRvAgD5d1WXQ6npCfpgmjZc/SpDGo+RFB4Ah/goLlOoxRDCG8td5kOR4sTUcgayqtFT
         YaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        fh=nMNRafI662T+h4almvyVGyYYoO3zEmwB6C5wBBUgQD0=;
        b=I+BvbsLRxufZO5BR/WONL8tRSfjE9yKHmVIx1Tnb9an9dHhFthLgWmfY3awPZLprmR
         NcRUDEu514Xr+eIdkQgyzvdovZofFzUbMuDMotCWt1BUgWH2aSjA9UPU0x32i8bOFaeL
         0fAraKDvQZgJsSuMGY5To38nYzfG3Ij+tSEXh2ONseN6yQKN4+uoJynvPxOJUEAk70rq
         4sxSSvh/JPSA/PZjak6xpTYktnPcH7O39wP9saHmp7ErqsWUoORTYzOFAc+1BxM+Uwmw
         hEYIYR49B2do6W2omD9OrxAZ0JEZn8Qm8SaPG89MQEZpm2LFi0+g2NKsM7eqj2GFvCAf
         PHFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765969; x=1793370769; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=QHABelThuFl9YLaS91sPxD2z+9NGm1YXDBWh1DavbxSk/DrUD6Sx3j+IJPdmSawJNo
         eH3gJ3/xT7BjYSUNUKyEXEJ+BNvHQxemzAQPM4qtNelcNOOU4oNC+xv/DAiaI3Q3vgLH
         eeXrfi12Y8tMvBl2I1185ieOqG1d0EEMHv4xXGS7uRtBHwdF4Bn5mBgl8ulKMc0+A3ln
         K5p7VTxwZPtOTHKLNQQDiDQHFrHgySyYUWCbfJbU4e+iZGLGkVXTpmCuahohP5rmAbhN
         SNi7te8FCFPJx1q3xJ4bzsZNlgErBDxxmsaQfX+nLXS0eO3vuQDUlcEo2/1dbUuH9ln0
         +Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765969; x=1793370769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=n5kOgNX+O8X5wTmszS3ExprhKWeXwOMWeFAOGN/CuEbRGSLBqiDpBRTsND9U6344Z0
         mSOIpAesEvdouQaSOycM0xPAOIl7FKJpkS8N82ndYiVUbw6czbXEnmaqS+BhtC0nX31a
         lM5J9tv9w7/VosnPBRaORrzdrhz0RolnHXi0V145xJrFc1UYxkVjzj6fwy+7QfmSlJrD
         Bofe2f6StmbQKU00YQab5f45whixe8UrdbRq0hJY+6pZ0PdLzqiiXiyNUDroeYJ5yxpm
         sBfcv7NfDfu+DBf4L9XQSTc/a77MNHDyHTWvLKKnFmjv6xE10WABcKBFImI3h3GwYv0+
         kwkw==
X-Forwarded-Encrypted: i=1; AKwUvBxM47EZN2s/ib9UiqYNSSDoty6sDIznCflPuWCUyLgaAdYmOfNbK8un3Yg55y6VVOkK+LjbtNK5dE2KUG2Vi1LE@lists.infradead.org
X-Gm-Message-State: AFq9FYIimIy9H/0fEEP5cIXWkA7Y2HWt1qg82FJ79o8kkBJ2bONlVg7d
	dAn83Veq+iApw5M1onVdpcuczqkHFAsPgPmV1U/kx8uknjpq1KSKi2yxkPtBk5MBrrw5FCBfNXc
	bGY63luUAJKEy3Ojbkkpgjx8CP+tI/S20MhaFuvIy2A==
X-Gm-Gg: AYBFou35B2HN4UxWToPBL4hZRdGiMkkZSv+QE98QF5PmrrOJf3YmrqtGpXD6yEToBcP
	B6QPkW7nYfnM7h6KLu+sSRFPi8c3Ye7fRW3lgYwBoc3Ri0TxPcqB2Y1x2Jfz3zHsgDKxCXxcq+Q
	Y/3JCVf8d6pGNkfiukP/OX97djXJWvrH18harRFhjuFv2HXM+OAwxUx1MMZ1yy+e6/pYfiCou41
	871eSapcTUWEIFMJl/ny0GTXZMfWKGAqjVcDX3McAAXSYN0dn2MZtoiwRRX4o0OYnUY6SEHAPyz
	PCE/BUIiN5fULIO7OIqc8e2IFiI4WrxMcEtH1amCwBjzD0sf8Cw+CvViDBjMLZEYnk0vqv8ufNn
	XsiyWoR4iujCnI1u3bMOxAhfhdWFaNcAmOtTJlUu12gXWUNABG+sy13R2zOaZWZmt3vu5vbnC2c
	WF5G+7ZEEjfk++yBc0SjTz+PRIELqMQknm9L02VlBzq91v0aQBOpPbZmgQ
X-Received: by 2002:a5d:5f86:0:b0:48c:6f3a:fe30 with SMTP id
 ffacd0b85a97d-48e3859dda4mr4501759f8f.15.1792765968503; Fri, 23 Oct 2026
 07:32:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-10-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-10-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:35 +0530
X-Gm-Features: AclHuK-ELQwc782e_gNWzhlyxMyHtzq3L9uZbtZpWmLCC250qaSxVHzfJurC7sQ
Message-ID: <CAAhSdy0uq6AjzigiLSjTZEZ4JTOphcupx88Sf24kjBVDWB4new@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] dt-bindings: riscv: add Counter delegation ISA
 extensions description
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_073250_612743_5D09DE4D 
X-CRM114-Status: GOOD (  19.67  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Aug 7, 2026 at 1:39=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> Add description for the Smcdeleg/Ssccfg extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-10-7909f863=
a645@meta.com
> Signed-off-by: Paul Walmsley <pjw@kernel.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index eee65cf73d6c..24efd3e1cf8e 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -181,6 +181,13 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>
> +        - const: smcdeleg
> +          description: |
> +            The standard Smcdeleg machine-level extension for the machin=
e mode
> +            to delegate the hpmcounters to supervisor mode so that they =
are
> +            directly accessible in the supervisor mode as ratified in th=
e
> +            20240213 version of the privileged ISA specification.
> +
>          - const: smcntrpmf
>            description: |
>              The standard Smcntrpmf machine-level extension for the machi=
ne mode
> @@ -220,6 +227,14 @@ properties:
>              behavioural changes to interrupts as frozen at commit ccbdda=
b
>              ("Merge pull request #42 from riscv/jhauser-2023-RC4") of ri=
scv-aia.
>
> +        - const: ssccfg
> +          description: |
> +            The standard Ssccfg supervisor-level extension for configuri=
ng
> +            the delegated hpmcounters to be accessible directly in super=
visor
> +            mode as ratified in the 20240213 version of the privileged I=
SA
> +            specification. This extension depends on Sscsrind, Smcdeleg,=
 Zihpm,
> +            Zicntr extensions.
> +
>          - const: ssccptr
>            description: |
>              The standard Ssccptr extension for main memory (cacheability=
 and
> @@ -1135,6 +1150,32 @@ properties:
>              allOf:
>                - const: zilsd
>                - const: zca
> +      # Smcdeleg depends on Sscsrind, Zihpm, Zicntr
> +      - if:
> +          contains:
> +            const: smcdeleg
> +        then:
> +          allOf:
> +            - contains:
> +                const: sscsrind
> +            - contains:
> +                const: zihpm
> +            - contains:
> +                const: zicntr
> +      # Ssccfg depends on Smcdeleg, Sscsrind, Zihpm, Zicntr
> +      - if:
> +          contains:
> +            const: ssccfg
> +        then:
> +          allOf:
> +            - contains:
> +                const: smcdeleg
> +            - contains:
> +                const: sscsrind
> +            - contains:
> +                const: zihpm
> +            - contains:
> +                const: zicntr
>
>  allOf:
>    # Zcf extension does not exist on rv64
>
> --
> 2.53.0-Meta
>

