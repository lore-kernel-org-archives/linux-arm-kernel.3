Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E3E109C05D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAKmhQwgYrUdz5AlUWebGvj4cvLeKK6U9kR+5BfEWW0=; b=IF6NW8WE1cn3kc4u0fO/+von05
	vkp5c5B1XcBaSCGmCSBflicb37MWX6qsfCDudkENbflJdvTqTITdefwABcirlx1EYlxa6w/3XPEOM
	vPCD8u8SKk8/+Huwl6YbGQNa+bokLhE7w0xudk8oiOvYU/Xo3Jtca0vZKATPLIzOgLhe8Em1CQ2Rx
	kIT74bVqwpo3vLVE3dFcXjnBsR6U0qJbrFWnEz7UsJ1uOfZRyjnZhrTlDklICwnJ6YGBphYHCVCwA
	s0biEh4qfJjll9k5gcrtGIuCl3Ewy5sm3f8tqJPGktByi/zajIbchx6rK4ufo7h1yRzP313znKisP
	V5oabe8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Un9-00000004DOH-2p3X;
	Wed, 25 Mar 2026 20:25:27 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Un6-00000004DNQ-1x1g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 20:25:25 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-35c0e7b751aso223102a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 13:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774470323; x=1775075123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAKmhQwgYrUdz5AlUWebGvj4cvLeKK6U9kR+5BfEWW0=;
        b=Oc6NmhXZmGCqwlSA9rWWLpTa8a4m7MRqqzLMDsv2sDaF4bEWtqKiBUokx/UE42LaXl
         jz9GFpQ8JyJjvWR5uUes6O0rIByELgaiAMNdx3COvga4gS3XNmJr1u2dy8Bz3383Hu9E
         JhbxsiMr2a/ryYTXSXd0QHfFoy6/rB7vICPyNkfwS2Q2ah7M9GOUr8wfLTy4vFYtWizd
         7JHjrle2B4gr/K89atPAAm85ukjxHiBlk2gvX3rZ5+kZBA7SvGm5++EmmP76dVFx9RMe
         XbiwjnMoI94uQi1mxxTckasOtYvkWr9FZnka8r3NYiRdDTG2Ze3mpknsLZJny3yHfvjh
         ZaLA==
X-Forwarded-Encrypted: i=2; AJvYcCX14Pc9Gm/DaB+DOsg7ak1WVzv6AD4zuIlztbzt0jfN0e+jE47dpSrjEjZRsT4wesaoONwZwtvsAygdYrch0uTT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrn999+UNmdfnNsIq55xfhefEUy/YfgBXUXvyPGdSZKBZrExml
	WU9CXsf84sDhOZWxM1Kas/Xq5QP2uqInfAUV5Gmyf7i40mLfAxPYsB3474QcM+dCxxRIPBq/haZ
	iu9tY/SHoBx5l4DYk1EZsE2gc0o642B4YhjbzEezLAOYPdQ9viwnKsBD+BvNEr/KfFDq+jApcKd
	AG1xqSh70KGTkFs2qslh5u81YEbrpLjEqX46G8dcb2U+xaJNlXQMgd4irInN3tPETR1J1Ly5U06
	qaI00mzrl9ts2/3A60ZHImlqDBRbGHJDeM7
X-Gm-Gg: ATEYQzybt9aMVw/oR2LRW0yJljPka9XSIimqa0mgWIMYrsLz3cunBj+W7h824Ew4NsD
	QVQTkafWSsry/qSTyZtUbE37gB6x9JIOmR9HHypRQb1bTfSAVaahz3wibwJFm0MyZAd31Rusos2
	t2R7o2w24X0DG/fCz+FZuVS3AeSlrHKm1OtFq+CA3doh0cFAGMoHJUmQuVswl/r9L7c30LPcHkv
	knPoYL4uwnyldnzbP7/G7b5fHOHMnEp5Y4NtuDzDsJdjJzv6xrL331MrahU1GJ/vl90qw2hQFjl
	lfz2SUH31AljcNmEHDGm8/D6tDR/rE0rb9wlXNJ+LFQnv+eSSsZiFt73fuM0fI18acbFXHXngeC
	e7yfgBg4UFd4GBzrVAPDS3neA5fd4PzLx45RH0W4mLUkdUKXTz3Lrpk0zcKygAW7PnMNBluIOEh
	+WggedQn1vhX/C2NInVSKSGvSqudl5TKDePVrbxMtQCMKHwZw+b4atBz/Z+wyPAMg=
X-Received: by 2002:a17:90a:e705:b0:35b:92c1:8a39 with SMTP id 98e67ed59e1d1-35c0dc86713mr4648224a91.8.1774470322923;
        Wed, 25 Mar 2026 13:25:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35c1d8b54bdsm32257a91.0.2026.03.25.13.25.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:25:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439c54e0f6aso137041f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 13:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774470321; cv=none;
        d=google.com; s=arc-20240605;
        b=AejIeg+OTmM7qO6078CBIksvORqLIUiUIu2c8X+D9QTxSFklP6hOqNDttjbVAdmEO5
         NpxZMfxO/SpaRiH2UJWCAe1h4/ebmrC4wLsNI4NSX76FJq7/XmbMHw6JWAqyHb0GdZU/
         MjHf6Urtxqm5v9RV6pUkBpKRCQNfhJ3FS50MZj4zXM8MjRaS9udvpWSrKAj1wIiYNipw
         XVVKMUoYEPBlsC/a3/Ayx+eGQkQW9x51I1hxv05fGwWCj6TrfGeoDN09YQvkRyvXxRNo
         DWzRz0xIkYCXfWTa/zfqu63aPG+D4mNWb528idLjEk4In/rkB31YxICMS5ncjfTrxv0n
         h0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pAKmhQwgYrUdz5AlUWebGvj4cvLeKK6U9kR+5BfEWW0=;
        fh=nJzagTBAvH9QhZibU4zGx4ZPYYB4kdsVMUjepLGGljQ=;
        b=Qe9I3dxSH6AiA48VYqn4nQ047pjRYydAit2GfWVQijFkTp7FnC2kQEo6N0bDvbc8k8
         CLK+D8sgctrF9hJ+2wRFdXzJ0oGn8diwnBpb1CqgQKW2wwUkw63fsURHyY8Fuj7+dMs/
         zEyyqUZ9BfktjZdVFme4GAxC1rJT77L6Pq3SOyDsMbKDnZxnt6ytcoqS35RP8G61VtHR
         4Q6fooWkNyb5cwC+nVZKXtZ2ndDqyNZSXI/8OvLDD0Xb1aYkEtzV9jYlgjNMQNUzMeb9
         7mLvhcVFERlVVOV8VXGs/CjUD4B26DLUTZytlUdjITKPtCGlSjEz4MXpFzKto2dJxIlm
         AXhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774470321; x=1775075121; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pAKmhQwgYrUdz5AlUWebGvj4cvLeKK6U9kR+5BfEWW0=;
        b=NZMGvL2HG0P8P0TzIrXvM7ZcsY04fGbF4/GBRUFPr6iJdmk/MZnzcZvR5gR7ixI0r0
         dkXCvJb44aLb2aLFtQiGDABVKKyYJH53IaS88BCA4cThDW1pMLxTVBUesFAZCk7TMpIy
         El5pNKk2xWx232QhHRUEtXFq0y0f1tmlApgeQ=
X-Forwarded-Encrypted: i=1; AJvYcCUPAJDRvGnfz+cRMbC6jYaaLQ+Z8LZAvL03Z7JQi2o43yGmhGzW37v5cXTzOBcfT1bYabOWcZkyiAjTZRboHq0l@lists.infradead.org
X-Received: by 2002:a05:6000:41cf:b0:43b:8c38:af5 with SMTP id ffacd0b85a97d-43b8c380c31mr5878365f8f.7.1774470320887;
        Wed, 25 Mar 2026 13:25:20 -0700 (PDT)
X-Received: by 2002:a05:6000:41cf:b0:43b:8c38:af5 with SMTP id
 ffacd0b85a97d-43b8c380c31mr5878304f8f.7.1774470320307; Wed, 25 Mar 2026
 13:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
 <20260320211921.1202058-2-jitendra.vegiraju@broadcom.com> <20260323145526.GA94382@horms.kernel.org>
In-Reply-To: <20260323145526.GA94382@horms.kernel.org>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Wed, 25 Mar 2026 13:25:07 -0700
X-Gm-Features: AQROBzA16J4anSqm7wOXJytEvkhPZKS03MWGUPseXmEIzG_Tefn_QYdtHUTKtnA
Message-ID: <CAMdnO-L4A_QXc-uVn=HHYKmFunYbjXHELAm7MrOnk9WVnD+PyA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/6] Add 25GMAC core type to dwmac_core_type enum
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, bcm-kernel-feedback-list@broadcom.com, 
	richardcochran@gmail.com, ast@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, john.fastabend@gmail.com, rmk+kernel@armlinux.org.uk, 
	rohan.g.thomas@altera.com, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	andrew+netdev@lunn.ch, sdf@fomichev.me, me@ziyao.cc, 
	siyanteng@cqsoftware.com.cn, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	weishangjuan@eswincomputing.com, wens@kernel.org, vladimir.oltean@nxp.com, 
	lizhi2@eswincomputing.com, boon.khai.ng@altera.com, 
	maxime.chevallier@bootlin.com, chenchuangyu@xiaomi.com, 
	yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org, 
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002aefbd064ddf11d2"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_132524_548216_F777383E 
X-CRM114-Status: GOOD (  23.55  )
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

--0000000000002aefbd064ddf11d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:55=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Mar 20, 2026 at 02:19:16PM -0700, Jitendra Vegiraju wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> >
> > The DW25GMAC is a newer ethernet MAC IP block from Synopsys that introd=
uced
> > new DMA architecure called Hyper-DMA. Define a new dwmac_core_type
> > enum in include/linux/stmmac.h file.
> >
> > Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> > ---
> >  include/linux/stmmac.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 72febd246bdb..464f4f2e366a 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -197,6 +197,7 @@ enum dwmac_core_type {
> >       DWMAC_CORE_GMAC,
> >       DWMAC_CORE_GMAC4,
> >       DWMAC_CORE_XGMAC,
> > +     DWMAC_CORE_25GMAC,
> >  };
>
> Hi Jitendra,
>
> W=3D1 builds warn that this new enum value is not handled in
> the switch statement in stmmac_print_actphyif()
>
> This seems to be addressed in patch 2/6.
> And I would suggest squashing this patch into that one.
>
Hi Simon,
Thanks for the suggestion, I will squash patches 1/6 and 2/6.
> --
> pw-bot: changes-requested

--0000000000002aefbd064ddf11d2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGbTCCBFWg
AwIBAgIMGHX6KxYK3WW2YyprMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MDkyNTEzNTAzMVoXDTI2MDkyNjEzNTAzMVowgbMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEaMBgGA1UEAxMRSml0ZW5kcmEgVmVnaXJhanUx
LTArBgkqhkiG9w0BCQEWHmppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKWV+9PYvG4njqRsbQas79f8Q46VL7b1ZxvWT6ik6VMbdRZx
tfpfZalVXksqcb02/N1H7UA9V04cV2q97FkSr/KxeFLMetPb3cVJZICg23IRO2NTPdmgPFzwkPTo
35h9h/OYLgh3/9a1nTsC2xqJa8GtohD5+42rsskGcI57U4n1r1L4R5IL9ypSqDxX/xVEAdGI5FTj
VgvoZC6iuEbnez+yO8TT3wun9b/PQowOB5P0CwIFv7ERW0S1s6B8yrbsoaTrz0vQaEA786k1pZkg
ykC1+zXq/iTyZuPP4B4RkzFd43Pw+GAH0Tt2nx5V4rNisJHeAVNU92Gj01cEg0I+FnsCAwEAAaOC
Ad8wggHbMA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0
dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQw
OQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
MzBlBgNVHSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIw
ADBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKQYDVR0RBCIwIIEeaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tMBMG
A1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1Ud
DgQWBBRq5Jlxz3MqC+zEgUxK566xEc2g3DANBgkqhkiG9w0BAQsFAAOCAgEARXrmeeWA31pp9Tr0
M6mOlMv+Pr2raES4GzPSyftvxf6tBQCBNaqi6LSbyusDYOj3mG9bp6VeVn+68OxNY9iNAk+ujtId
f3+30BlZOQ1v8z9u2peUOUtWI60y2MxhdH0X0n2H+BCGvUOFqs5z440jqqy1HsscZTXHB7FEZmVP
fyD+0Z6cxyh7WNC6+BgLiFwf8iqmAbu7Yb1sGTUGyS5gfYEjJbF2PJfwNUcJDd7eS4w5Ju5mK5y7
spgjH2/JmDgbkpSk9JyuWfjGZIg4ah/q2nb6UMd1XJb6gLQZuzPOI3SgXPvd8MHGjKZrX2BHOBSC
bJJ8rp4w4a9QMS6dde2MFObusxkZAft4tUnwo+ProchHs7iA85sL7sWEZhAmjmKKCpECpEfZm0+/
hpvKQV3AZp5vBstb4IVL8QmLj8beDVHYnNhEicsSiG1wW7zSYyBnmGbFRrFQIJnJDWPjTZOlVEyp
T1ShrXRCtqJpOt6rgg+rFEY3D8j6/bAkJXnmKnE2LZ0YyrrKk7eC6UfNNimx38w3NWchtcGY8zJn
Y/1/C9Jv/mWm/2lK8nvusOFxhKmbG83Hx8toQdZ5F1kYk6zAWjfB7lwXr/En9mCmLieJ18hen9EK
qbYyUkmCmuoLi5GXFMJy+iQv6DgMVQ7CACagybU6FUrmL9lVa+A6caBEEh4xggJXMIICUwIBATBi
MFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwYdforFgrdZbZjKmswDQYJYIZIAWUDBAIBBQCg
gccwLwYJKoZIhvcNAQkEMSIEIAC1zZTA2MQILmJE7ZMLPpAj62upRDIIMfPXV+HgVEQPMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMyNTIwMjUyMVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAGYv6zOtgOhq
PciT2md6+E9DTJsojJlKpcLWGtj5fHfY2U8ZErxqP1rTTgVuARORnc0NDlZUVeSE4MBvDOr8OL4t
CCVvutwQ12Z/z0rfLIGnqSAec6Z9G5fnCskG+LXgTfHE6IGMpaKoGDkZzKeP4xCoujhtoC2ybBxc
9OESHUugIgfLOnSZi9QuUMitN6wi0R/IHJ09jyGE9kugXXfLleFcDUld7E+w1/v1giWxh3eL6ZIH
nGTPxoA0392qxMUY/G5BUpwKICPo84lZLuWTAOiZX/Y/RYQM5Ht++QhLzFj/axDUicKCeL+DI/TH
M6wqP5klWm57j/zDpQDnPrMdMlc=
--0000000000002aefbd064ddf11d2--

