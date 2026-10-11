Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A625CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yr2GS6HUyYf6mArje2LsBDY5Jz9bbOHY/35SxvcN5Vs=; b=CMqDfWg/a7G+jJwVaRz6bZmytP
	k+gDhlYiliBmz5Z/znFFzsuyjjG61m0IY3xK9bxZ2dUe4QWOb6bnj1oCtSWfhM9DnhmhPX0dJlpzB
	DQHCeaMM32whO2b3bw7SkjA1eVEVMibbtAGGIH8QE9D2/pHnlg8XCUYP2FnnD4JaaQrpum/ShW+g3
	y6afMZjhW7senV5xKgTlgadORqeDNu9fuzExK8piQN+DudwRx6MLyx1CDQiSP3udXg/1cTX8Rweei
	Uq5U1YmVVyBpD+YkWio1YYsmpZIrmBrS64oosbmKTQuGmQfaijbiYr3jf8R84ilx53DLz3dRmLO0z
	uPMvaMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFvSe-00000009BWc-2Etq;
	Sun, 11 Oct 2026 15:27:40 +0000
Received: from out-90.mta0.migadu.com ([2001:41d0:1004:224b::5a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFvSa-00000009BVi-3glZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 15:27:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=suXI9TweIJ9OgvYGDH8vL0MpTp8HpvwFkmEvYZ5Q21c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791732454; v=1; x=1792337254;
 b=KLTZ9LZhfr61+ShiH+mkpPkubBbKjH5a5b6y1kPUTApGu9A5LoDEYeFCZxYa4+Na4lxlvKlG
 EjU7Rz8layXIAfTrnpTnlrdafF8K3zvjC4sGbyKFKQkM6/FK7IKmPgDXN0kdje9qBpU439Gt9Yl
 6Uo1CavzDDjL/ZyXl6bs+ziY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 100f6db649bc4695;
	Sun, 11 Oct 2026 15:27:34 +0000
X-Mizu-Trace-ID: 100f6db649bc4695
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba40832934so2894e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 08:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9CvcBD20dEoCZRNuTzSFSJPPuRASJkZ49PF9T27S/hUxumxk5idKQTTCGKWrd4GCTEFFvfJy7vTFVZLUQFIPP@lists.infradead.org
X-Gm-Message-State: AFq9FYJxZphxlb3ji30/bVQC+W60zo9rwkqcWr+1DBCLVI54EP3BJ/SV
	ZfoawfeL95ExMKSvp1q8SI6iFgV9NH7Lk/0Z1oUl214EYhAi7JcVFzdIEHAxDz8ZLJxhqSbvGZM
	H82VFG0+riW5W0blhp+EpyMB6APwZsEJknmDCs7Y4
X-Received: by 2002:a05:6512:238d:b0:5b8:ebf3:3370 with SMTP id
 2adb3069b0e04-5bce9d8696fmr69006e87.5.1791732452056; Sun, 11 Oct 2026
 08:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261011143648.211337-1-fuad.tabba@linux.dev> <20261011143648.211337-5-fuad.tabba@linux.dev>
 <87zewk8e90.wl-maz@kernel.org>
In-Reply-To: <87zewk8e90.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 11 Oct 2026 16:26:55 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwQzWTQd83ybB7xyhzVZctre0Nn5_Smg8dA7QusNMve3w@mail.gmail.com>
X-Gm-Features: AclHuK_rIOwStTCG2fxSnbJUVb7MyinGSk7pAOJvFzysPaQbzGjG5f9VtEekiws
Message-ID: <CA+EHjTwQzWTQd83ybB7xyhzVZctre0Nn5_Smg8dA7QusNMve3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: vgic: Do not access the GICv5 CPU
 interface from EL1
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com, 
	Sascha.Bischoff@arm.com, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_082737_123406_29149414 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Marc,

On Sun, 11 Oct 2026 16:10:19 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> This really is perpetuating the wrong model. The rule is simple:
> anything that requires system instructions or system registers cannot
> be accessed from EL1, and therefore GICv2 is the only one that can be
> accessed from EL1. So the whole thing should read:
>
>      return has_vhe() || kvm_vgic_global_state.type == VGIC_V2;

Ack, I'll respin it that way.

> Ultimately, we should static keys for all of the vgic types.

I'll do that as a follow-up once the merge window is over.

Cheers,
/fuad

