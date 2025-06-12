Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0239FC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGjtsJI7nBbeGiSOxYGQG5J5O3n4fwiWLCBVJcdBU7s=; b=caBSGSFvNjAlLHiIbRSNjulut0
	3uVpNbwhMGpTujZjdsZ84koxZCpw9arU9/LGsTyU79ff1FgzgxiEk2UD5bNif0H25bTvm7/rdkvYl
	MV00Hz5TavtTjSlPUGP1I6Jsc/NLwRbINjuz1Bp+btpUgUqJjR14ctz4S3HN/0RD9+/dFFlidxVPt
	70b6D73rYp91ivJDImosZ1eDxnYhn7BT0lRL1QsdJF7iZ8VxFX4TZ1M4G7OBgMiO8cPXicKmbH3oV
	n4oRPxqVKxFOnJwsafl1vg0k38TaFVjvWdtp6rYp4B4FV0F1eofSOJj4C7MTT6ntyQUuegLLRGEDX
	X2KZKwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoSb-0000000EUKr-3jug;
	Thu, 12 Jun 2025 20:23:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoPj-0000000EUCk-0v7Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 20:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77E0C629D1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 20:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76CBC4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 20:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759641;
	bh=a5WnHSJOT46nfRLoD18xXpSv/uFhg0hnrMwi626QFM4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EQk77JAzfHA1ctAuntDsiKXHOyamy1WEk9XvQgt05vU0kl3Shdb2eGQzR0tfqGNs0
	 G2bFJ+r+9XJTYVMKWQUnBP24ypbY/joG8PauU7XTL77t+RQy0RGHc2vMrGK9n3tRl5
	 Cr0IH75Y8aZV7scEUwy+dbpv9V2cVCSSuOCNWIy5CBbNL4K0X2j8HT2tqwSMQ3OaFw
	 OY+/1utzWN5IfCQ86IvkyXNXM2PkcyifMhymbsdr2ItBcaVyLWZ1injIjBeP9qxF4E
	 lpQD+JsRgPGpdvWsq5VRK3d7fQ4oT2i7ZC9R/QZk7dk5H/jagHuvra7+dwbxbHT4rt
	 hdY1ZBd7U96tA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso2437566a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 13:20:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YzCz6NRTBXUs0DJqdTeodKVYERohY3ATOVComOyr+tqE+4siHaQ
	ikRFKAwDybrR0Tw9xrhinsp+YhafMQE2XFITylFH9oRgfL8XMSwq/qdiFYeOcSMZfHVyRWYBX4k
	sIJA1oFTqAortWi2FLlkrDlhA8M+unQ==
X-Google-Smtp-Source: AGHT+IFnbXsRtFIL+scyAGYD3x7MKmnzII7AQnyQRZO9L1192M/CFiTale2tKX90VabUQqwsW4Kt7dfjYByaYhdz368=
X-Received: by 2002:a17:907:3f1f:b0:adb:2a66:85bc with SMTP id
 a640c23a62f3a-adec5cafe61mr40529466b.34.1749759640448; Thu, 12 Jun 2025
 13:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-arm-brbe-v19-v23-0-e7775563036e@kernel.org>
 <20250611-arm-brbe-v19-v23-1-e7775563036e@kernel.org> <36f59ea1-1468-425d-991c-c4bacefe0fd4@amperemail.onmicrosoft.com>
In-Reply-To: <36f59ea1-1468-425d-991c-c4bacefe0fd4@amperemail.onmicrosoft.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Jun 2025 15:20:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-65ObSrV3pi2E+kceffY8vdQVUqhVfkXpAOU08UP7kA@mail.gmail.com>
X-Gm-Features: AX0GCFux25NsO0y0HZrrApebcJ9A5SylHMyyGXcZP_lg5KPx0d0huWPEE-_d9JE
Message-ID: <CAL_JsqJ-65ObSrV3pi2E+kceffY8vdQVUqhVfkXpAOU08UP7kA@mail.gmail.com>
Subject: Re: [PATCH v23 1/4] arm64/sysreg: Add BRBE registers and fields
To: Adam Young <admiyo@amperemail.onmicrosoft.com>
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 12, 2025 at 2:46=E2=80=AFPM Adam Young
<admiyo@amperemail.onmicrosoft.com> wrote:
>
> tested-by: Adam Young<admiyo@os.amperecomputing.com>

Thanks, I assume this is for patch 1, 2, and 4 at least because just
this patch does nothing on its own.

Note that on the mail lists, you should not top-post, but reply below
the quoted message.

Rob

>
> Built and run on a BRBE capable machine.
>
> Built userland perf tool
>
> can run
>
> perf record --branch-filter any,save_type,u true
>
> as well as
>
> perf record --branch-filter any,save_type,u ./sort
>
> And will generate a perf.data file.
>
> The mechanism applies cleanly and produced what looks like sane output.
>
>
> On 6/11/25 14:01, Rob Herring (Arm) wrote:
> > From: Anshuman Khandual <anshuman.khandual@arm.com>
> >
> > This patch adds definitions related to the Branch Record Buffer Extensi=
on
> > (BRBE) as per ARM DDI 0487K.a. These will be used by KVM and a BRBE dri=
ver
> > in subsequent patches.
> >
> > Some existing BRBE definitions in asm/sysreg.h are replaced with equiva=
lent
> > generated definitions.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Tested-by: James Clark <james.clark@linaro.org>
> > Acked-by: Will Deacon <will@kernel.org>
> > Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
> > ---
> > v19:
> > - split BRBINF.CC field into mantissa and exponent
> > ---
> >   arch/arm64/include/asm/sysreg.h |  16 ++---
> >   arch/arm64/tools/sysreg         | 132 +++++++++++++++++++++++++++++++=
+++++++++
> >   2 files changed, 138 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/s=
ysreg.h
> > index f1bb0d10c39a..ef76a4b9e240 100644
> > --- a/arch/arm64/include/asm/sysreg.h
> > +++ b/arch/arm64/include/asm/sysreg.h
> > @@ -202,16 +202,8 @@
> >   #define SYS_DBGVCR32_EL2            sys_reg(2, 4, 0, 7, 0)
> >
> >   #define SYS_BRBINF_EL1(n)           sys_reg(2, 1, 8, (n & 15), (((n &=
 16) >> 2) | 0))
> > -#define SYS_BRBINFINJ_EL1            sys_reg(2, 1, 9, 1, 0)
> >   #define SYS_BRBSRC_EL1(n)           sys_reg(2, 1, 8, (n & 15), (((n &=
 16) >> 2) | 1))
> > -#define SYS_BRBSRCINJ_EL1            sys_reg(2, 1, 9, 1, 1)
> >   #define SYS_BRBTGT_EL1(n)           sys_reg(2, 1, 8, (n & 15), (((n &=
 16) >> 2) | 2))
> > -#define SYS_BRBTGTINJ_EL1            sys_reg(2, 1, 9, 1, 2)
> > -#define SYS_BRBTS_EL1                        sys_reg(2, 1, 9, 0, 2)
> > -
> > -#define SYS_BRBCR_EL1                        sys_reg(2, 1, 9, 0, 0)
> > -#define SYS_BRBFCR_EL1                       sys_reg(2, 1, 9, 0, 1)
> > -#define SYS_BRBIDR0_EL1                      sys_reg(2, 1, 9, 2, 0)
> >
> >   #define SYS_TRCITECR_EL1            sys_reg(3, 0, 1, 2, 3)
> >   #define SYS_TRCACATR(m)                     sys_reg(2, 1, 2, ((m & 7)=
 << 1), (2 | (m >> 3)))
> > @@ -277,8 +269,6 @@
> >   /* ETM */
> >   #define SYS_TRCOSLAR                        sys_reg(2, 1, 1, 0, 4)
> >
> > -#define SYS_BRBCR_EL2                        sys_reg(2, 4, 9, 0, 0)
> > -
> >   #define SYS_MIDR_EL1                        sys_reg(3, 0, 0, 0, 0)
> >   #define SYS_MPIDR_EL1                       sys_reg(3, 0, 0, 0, 5)
> >   #define SYS_REVIDR_EL1                      sys_reg(3, 0, 0, 0, 6)
> > @@ -821,6 +811,12 @@
> >   #define OP_COSP_RCTX                        sys_insn(1, 3, 7, 3, 6)
> >   #define OP_CPP_RCTX                 sys_insn(1, 3, 7, 3, 7)
> >
> > +/*
> > + * BRBE Instructions
> > + */
> > +#define BRB_IALL_INSN        __emit_inst(0xd5000000 | OP_BRB_IALL | (0=
x1f))
> > +#define BRB_INJ_INSN __emit_inst(0xd5000000 | OP_BRB_INJ  | (0x1f))
> > +
> >   /* Common SCTLR_ELx flags. */
> >   #define SCTLR_ELx_ENTP2     (BIT(60))
> >   #define SCTLR_ELx_DSSBS     (BIT(44))
> > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > index 8a8cf6874298..81c4e214ba33 100644
> > --- a/arch/arm64/tools/sysreg
> > +++ b/arch/arm64/tools/sysreg
> > @@ -1329,6 +1329,138 @@ UnsignedEnum  3:0     MTEPERM
> >   EndEnum
> >   EndSysreg
> >
> > +
> > +SysregFields BRBINFx_EL1
> > +Res0 63:47
> > +Field        46      CCU
> > +Field        45:40   CC_EXP
> > +Field        39:32   CC_MANT
> > +Res0 31:18
> > +Field        17      LASTFAILED
> > +Field        16      T
> > +Res0 15:14
> > +Enum 13:8            TYPE
> > +     0b000000        DIRECT_UNCOND
> > +     0b000001        INDIRECT
> > +     0b000010        DIRECT_LINK
> > +     0b000011        INDIRECT_LINK
> > +     0b000101        RET
> > +     0b000111        ERET
> > +     0b001000        DIRECT_COND
> > +     0b100001        DEBUG_HALT
> > +     0b100010        CALL
> > +     0b100011        TRAP
> > +     0b100100        SERROR
> > +     0b100110        INSN_DEBUG
> > +     0b100111        DATA_DEBUG
> > +     0b101010        ALIGN_FAULT
> > +     0b101011        INSN_FAULT
> > +     0b101100        DATA_FAULT
> > +     0b101110        IRQ
> > +     0b101111        FIQ
> > +     0b110000        IMPDEF_TRAP_EL3
> > +     0b111001        DEBUG_EXIT
> > +EndEnum
> > +Enum 7:6     EL
> > +     0b00    EL0
> > +     0b01    EL1
> > +     0b10    EL2
> > +     0b11    EL3
> > +EndEnum
> > +Field        5       MPRED
> > +Res0 4:2
> > +Enum 1:0     VALID
> > +     0b00    NONE
> > +     0b01    TARGET
> > +     0b10    SOURCE
> > +     0b11    FULL
> > +EndEnum
> > +EndSysregFields
> > +
> > +SysregFields BRBCR_ELx
> > +Res0 63:24
> > +Field        23      EXCEPTION
> > +Field        22      ERTN
> > +Res0 21:10
> > +Field        9       FZPSS
> > +Field        8       FZP
> > +Res0 7
> > +Enum 6:5     TS
> > +     0b01    VIRTUAL
> > +     0b10    GUEST_PHYSICAL
> > +     0b11    PHYSICAL
> > +EndEnum
> > +Field        4       MPRED
> > +Field        3       CC
> > +Res0 2
> > +Field        1       ExBRE
> > +Field        0       E0BRE
> > +EndSysregFields
> > +
> > +Sysreg       BRBCR_EL1       2       1       9       0       0
> > +Fields       BRBCR_ELx
> > +EndSysreg
> > +
> > +Sysreg       BRBFCR_EL1      2       1       9       0       1
> > +Res0 63:30
> > +Enum 29:28   BANK
> > +     0b00    BANK_0
> > +     0b01    BANK_1
> > +EndEnum
> > +Res0 27:23
> > +Field        22      CONDDIR
> > +Field        21      DIRCALL
> > +Field        20      INDCALL
> > +Field        19      RTN
> > +Field        18      INDIRECT
> > +Field        17      DIRECT
> > +Field        16      EnI
> > +Res0 15:8
> > +Field        7       PAUSED
> > +Field        6       LASTFAILED
> > +Res0 5:0
> > +EndSysreg
> > +
> > +Sysreg       BRBTS_EL1       2       1       9       0       2
> > +Field        63:0    TS
> > +EndSysreg
> > +
> > +Sysreg       BRBINFINJ_EL1   2       1       9       1       0
> > +Fields BRBINFx_EL1
> > +EndSysreg
> > +
> > +Sysreg       BRBSRCINJ_EL1   2       1       9       1       1
> > +Field        63:0 ADDRESS
> > +EndSysreg
> > +
> > +Sysreg       BRBTGTINJ_EL1   2       1       9       1       2
> > +Field        63:0 ADDRESS
> > +EndSysreg
> > +
> > +Sysreg       BRBIDR0_EL1     2       1       9       2       0
> > +Res0 63:16
> > +Enum 15:12   CC
> > +     0b0101  20_BIT
> > +EndEnum
> > +Enum 11:8    FORMAT
> > +     0b0000  FORMAT_0
> > +EndEnum
> > +Enum 7:0             NUMREC
> > +     0b00001000      8
> > +     0b00010000      16
> > +     0b00100000      32
> > +     0b01000000      64
> > +EndEnum
> > +EndSysreg
> > +
> > +Sysreg       BRBCR_EL2       2       4       9       0       0
> > +Fields       BRBCR_ELx
> > +EndSysreg
> > +
> > +Sysreg       BRBCR_EL12      2       5       9       0       0
> > +Fields       BRBCR_ELx
> > +EndSysreg
> > +
> >   Sysreg      ID_AA64ZFR0_EL1 3       0       0       4       4
> >   Res0        63:60
> >   UnsignedEnum        59:56   F64MM
> >
>

