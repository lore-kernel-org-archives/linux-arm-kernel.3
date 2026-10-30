Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C813606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZ46LSBs;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XhlXcTJn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=; b=RZ46LSBsXIT0k+
	I+WcVnsjBwfsmh9Pi7R3wo1GyRhdJIGu6d5YZuLpwChOR4hnbLwDHOsrfPuRjvVSk/rIyvjjlEHIe
	vgWBXjvHLaBXSnXrTC6raAwroXawg7rb4WUP0ynkwkDlzcR8jSEwj/ZDe4c7d+6gMz/Kk5Psdrdu9
	RkaYDBnImtMpG46WnRirLr1oAjvKcPy5e1fTx97AJQGqHiRsPYAjrZGzGeSaTSStLGhl4S6SERL9e
	D7TSMrl7z8tjiMCQ9fdU88mhfFsIy/DDupIWlfG2QKjzKSYsnZGCcfaCddtaPalTdcEXuG9P3BFXS
	NKCMHguRZTYAsQZcJ2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmCZ-0000000BiQT-3orA;
	Fri, 30 Oct 2026 12:59:23 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmCW-0000000BiQ5-3sen
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:59:22 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-99061e2171cso148221241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 05:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365159; cv=none;
        d=google.com; s=arc-20260327;
        b=nswzx9B3Z0i/6MVif3gfXoHilRX/SaI2DlgRG2yi4lvp3+94+hHXPp8HHBs6umxxdA
         3f3HgBg3YTU1Kd7vdzhgruUMUaWhbXZ7zNJXrpklC/27Pkqr0m3+22EXePjXcJrK30pI
         OI/vK8RQX9n2JRJpU9CQsZxjI3q7RkyFxN2nsbX5xl5E1y/BGJL3ze0ugb90xxhUZ5xv
         IfXIrRKiSHZ6JEzMFd7Hi6IHGQSTWvkyMvvGLQMHEhX/NfE6EKiR9LTOMXb1kJJnMFh1
         roCPtP/j3r8+kwghQBwAZaW8KzKwp/10xOyRMltj2Kc7hnkyuEhrx1JYlGMPTlmSvBQG
         tlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        fh=O8TJodhGR7auKWoQ2Ky/WumOdRluYm+DxZXlNOlWtqM=;
        b=Sj9apTAnfSCX/w+TMSbDl1KMtp7+PELQUj/k6RuZJ4pm/yIhZ3ZKF3jM5G7YHcNAAj
         FfinibI97Txmb1adpQX3aXfdHnbcN3Hx2KoGnGNRMKC2raZITGIO2+hcOseq//eC4Con
         6yMyl8CyZnpV05Q+UY6P3NGiE9SI/C9LIJNisRM/OCV9zzUC1mxuoBf8Ba14xTnjD8Ws
         L3a+ijCxrGcomDksAPLsAPPE7h8PZKtGcZWedovtzEipq0vFBg5altiBCfiBxK/6HA1M
         0zJe4xntuVCSD+pM2tg1rAfByeTeg4wNZrZ7d2VywE0e3eA8z8qKrLt9WfavjiLSB4zA
         W2iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793365159; x=1793969959; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        b=XhlXcTJnvmyngYWrYkQEVx3OxKfPKvOU5fVS2OOjRLy7WbizwMR6kszGrC1HcRTMPt
         lAFUiukpIyA+5ByodxZDoN7Rhf76E/4It88piQ2kZ+VJH0qfPeDSuBDEbWhYk/SRTu0E
         C5NV5+B5EdN6psI+GEj+ic2Vf9l08xrDPDuY/PBWcffiwtCfl5ZjnH1SKQ5lRAIsPEyW
         Kxd/+fky4sSB8EN6MIJXnJ4PsF/eFh4pEnjQtCPP55BxoulZ0i9f+1NijbyoaJtxTK67
         D2WA3nxShvWHD+68+5bBfyX/nvaSm3x62VdoQTMEqUDfoRi9Duw7hRO5BVJL7ShFPask
         LnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365159; x=1793969959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        b=KoazS6BgSFBd69jgBj3YyyDhSUjzDRewJ59gy6EePcB7LBcchtK2bxRESqHV3lu7o0
         WQNJE1RXfpm4z+axaNnmwsIl8T0SGJoLryQ6PyicvPPURs9nWWGT34GuUXWdpO1GtPZg
         IIDfLwbJP02iTP5NjR6TQnlK9iRhXn03f/W/kDasMMdyoT0tUdaw1N6jqp7Ir8E2h+wL
         v+MCXf+TJTxj42rRMHLr3J3dpKNZRe7E/fDHImmCPr6VASM1ofd2MdDtKqrjiRbDkvJO
         yrmQ7iyDDlrztmIOups8HaNezAa4m/1RwSsbnMti+zxHc7xRsF5Mxbv5ZsCK6Is3ENDz
         TULQ==
X-Forwarded-Encrypted: i=1; AKwUvBw70Fo2mLJyQJ8WKrPSXTLl553d7wSH1C0B1aTXPCx2pBI0selaSBulIg5GgBLCm4ZXvY9jq3RrvnkQvY4baR35@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/eaS2DGTRPxlgmc+HVr4JU42K3VAOrAOPf5MyHDYQlwLhTxX5
	oBS7dmawv9yrFXJs9ZDDNZ1kGzIVVEM81TwT0SJZsH1Ypsd13Xmh0MqfOMXwzJ0g7KW7PCtJjFA
	PU6dcDCaYNh5Lao95l1c1IMXcVDvcFW5QKHYDYlY=
X-Gm-Gg: AYBFou0wU11pG9auyC4eRN2cAm+53WULW1M+KYkfNvwhdgjL4plofi6EySUD4NaKBXU
	RsJOsODEkPa+/SC+3xw5o0rgfYayujV0myiksO1G4fdQjqsHpS6fDYYd/TsRe+6YY4X21FjJiCs
	EF4FeE6SEm0Ad8kMDDq372qg4Ypxg+lLF57hVxv+MC4TrpH7jlRoO5istlP2eYNgb7cF7Rc9lpB
	VRr1Mr09/2GXqN2xLLjckLsnOzlk48iMegMEzM4biRn4rTe4+su1s/Yds/3P9KUayIoznRnAnRq
	XGOOIhuwMfi6pSy91WyrRo8uVvhHjEifCI2a5XMP7QdmFStLokmFbKCSdWbu/9FFVsIWEHquL8r
	ULgpv2PP5dSVfePuBRue/+PF8bQNSa71ILgl9uqNZRKzBO72nvnMUrsM994SMeK30AHBD/yg=
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr982684137.13.1793365158793; Fri, 30 Oct 2026
 05:59:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com>
 <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org> <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
 <79b1da71-7a17-4d75-aa79-ac1a18303b2d@kernel.org>
In-Reply-To: <79b1da71-7a17-4d75-aa79-ac1a18303b2d@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 30 Oct 2026 20:59:06 +0800
X-Gm-Features: AclHuK936QikowfoO5i5BgELLDpuDAgVgr57QkGt26vDuZG48EvAF5wkFnKQPU0
Message-ID: <CAPBH0A8YCzNBKETf=mm08EggTDiimd0vDXK9V+vfvGNzENfcdA@mail.gmail.com>
Subject: Re: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_055920_973214_6CD1F973 
X-CRM114-Status: GOOD (  14.69  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 30/10/2026 09:41, Colin Huang wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=
=8829=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:43=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >>
> >> On 29/10/2026 14:38, Colin Huang wrote:
> >>> From: Carl Lee <carl.lee@amd.com>
> >>>
> >>> Add eeprom device node for NFC adaptor board FRU.
> >>>
> >>> Signed-off-by: Carl Lee <carl.lee@amd.com>
> >>
> >> DCO mismatch / missing SoB. Please read submitting patches document fo=
r
> >> further explanation.
> >>
> >
> > https://github.com/torvalds/linux/blob/master/Documentation/process/sub=
mitting-patches.rst#sign-your-work---the-developers-certificate-of-origin
> >
> > Thanks. Krzysztof
> > This means I need to add my Signed-off-by to each patch, right ?
> >
>
> I am sorry, which part of submitting patches, which tells you what is
> necessary before you submit patch, is unclear? Please go through all the
> steps of submitting patches and analyze if it applies or not.
>
Hi Krzysztof,

Sorry for the noise, and thanks for the pointer.

I re-read submitting-patches.rst. You are right: several patches in
this series were authored by other colleagues and I am the submitter,
so my Signed-off-by must be appended last in the chain of custody.
I missed that in v10.

For v11 I have:
- Added my Signed-off-by to all patches authored by others
  (Carl Lee, Rex Fu, Peter Shen, Andy Chung).
- Fixed typos in two commit messages.
- Re-checked the series with checkpatch.pl --strict.

I'll double-check the series for anything else I may have missed
before sending v11.

Best regards,
Colin Huang

