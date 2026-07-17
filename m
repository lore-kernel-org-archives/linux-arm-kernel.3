Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2083AC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=; b=jfoOXX2HF0BJB3psjbwbmIYtn7
	symvQEntD9GS8Cei6Z61lP+HlGtsOccb+O/8x5nqIT3TGSlgag9gpXclPhaC572YOc1ZL27n7/aqr
	IrKh4ZCgJr4ZhRVX8nQNRGHjyxmd1hs5YvVxkX8dhFB7qnK+Jb31lhRrY8DRbfOPKPm7LyNQE1eAL
	LGfc5Vx3QD0iPMbwAf8PdZrVgCvi975cgCJCFYXLTwpWFc9bmNXN0ElUUQjeOKweMYP6ASm+6GlvV
	x5RmutcyPWhhrQM3rLOr69TVOe1hiV2chYxHse2G4CeUmbGntKUweianyx4sPsZ9ytHYeDz2YTZR8
	IQFNx3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkc46-00000001GxB-2bid;
	Fri, 17 Jul 2026 06:28:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkc45-00000001GwO-2COn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 06:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=; b=GeqO7KbV4RiOSpW35stSOST9ly
	dykvCRzcIFM47b+GOTUSlVHzFV3HmEV+QpVpX4iojDKeGjAKRHLM4nTF/XCktBW2JOMBehcB7RDtA
	mOScI6ye7MjefLL3Bzgb+2o/yc5q1CX/UEvKRAr0akp4cEGzcCNZ87cBCpGj9TGe53cixudPPHCwC
	1b+ZjKsYoAXP29VhO9LukABUXHcX3jnyBaGFPOc+njMwiOs7JCXM3zAtRtRUXtor35HsJWBJQ9xNN
	jR+47WWaOOZ5fcxOAv98s+t48BzVpDaQjwTVyPtacUZHfhtaoX0w2zoybHMRtzOViAwlCyhDAqZ3A
	zPSCMK8g==;
Received: from mail-ej2-x03.google.com ([2a00:1450:4864:34::3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkc40-0000000EZMA-2i1R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:28:52 +0000
Received: by mail-ej2-x03.google.com with SMTP id a640c23a62f3a-c16060ba9ecso75713266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 23:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784269725; cv=none;
        d=google.com; s=arc-20260327;
        b=gJ6OU49Bi5P0rlJTeNymWZjbsSqALNRvP85RuO7FrH+FPA56zC5mLbmt++wU14SeEh
         BGt/TdtneqEFMgTaO3yuj0Egho+KPQaJEy4woq3FAIc46HoTm5sCCUTHm7jA+U7djqHm
         nbU0Qf4QaWOU9sGa80V5eDnH1+Oayl+QfcIxTSOe4KbleXy1n9j8kyBCLE6pk6LULUYc
         4EvFrXszCxvgnhKZbMUxQhelMsUkSvbQGwM3ExCXQxlO+q4mTtmB8AjxcsdZOnXGwNXj
         3byXqnhO+2KkCyV8Ou/+yZUt/nDkg0YEcWr7d3R+X0sdxVhQSM5xjZAEoe+kzoIE0VK3
         4+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=;
        fh=+ZDqajXbyEySLl+jvuUFK4k9vbV/i4exv/cVSPxTXtw=;
        b=E1N13RDrgls+LwogX3u8KVkIRNnGbEa87+22yT4+UaZd1GvxvS+PacqG2x9ELJC6Ac
         aVOtVoy3+y7DOYuQtS5MtJ9r0iMqf5Ei6MkWGxXu24kPipFM5lAnFO2JiutjwnXcb5ur
         ba34fEwuFFLqexinrVeqsgiXqwfeWS5tWGqf7z0WH3f6lgeULGekS/d+kiWafb1chtkY
         PSBjP9QG1m3W7NZfdPxHgTsOh5yg+dB3jj1DfC4kxIQvwzi7UaaCb839CvRgywE5TstS
         ZHiVYBVPV83YRyUlzLh3BDXtFDMpXrnn8XRp2JM6n3Fnrye/owcU45QN/XR1pQPN5k9r
         HKQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784269725; x=1784874525; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=;
        b=HoC/QJU73DCk8cRwYLBPqp8UpawDnB7IRU93/9my55DUgoxAKjI8eTlPyJnyYpnao4
         xuoyKDrGXClxXiLYPgcPQK8oamU4xy1pSrSVzxzrydtBADQT16gVmYdy+jaUfLP6B1xs
         WPKUG+uL7RKvDRoqGm25JLXzYPas3D1lD4Te/7dxsEUrpdGkaz2qNFrO2RGjdZPWG1LG
         9/PSHoIiduFxToc/wLptH5o61FLwSHx12FphLoVVo7ZgNke7w5b594wwjZrrRUSnnP3i
         bPpxVDpjlkdO7A85v2S8eUJdepLNhpXg1uOCsW5VYdVssoIbQV+4s5S1ehk4/BjS+UfM
         izwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784269725; x=1784874525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=;
        b=nhn4mGjSX6v4kT204sRE+17on4SaoHn6k7SAgKXG74cRBwh3cIo/k2bqFvJ7zcjVPR
         DmVWcBBohTGfR7MEa+cAWVcZHISZlI6BqulNNxlESNReHwjp4gTqrM+GZSz+dHVAmTIv
         HGWYPhlJaNsGJ0XnCGwd/DtNb4RFRssF2rBfHW6QmnEux/+1S7weSKEtoplihkMH57cM
         XXrsXOKCxRvSPEn8Atkw026qh1WVqqvgwm+m/U4CE/MK1HXg0mhIIxfXDsbcOUh4zZ0O
         AobFzCpsRliV6P1LjihTvlt0ggu7bn3XZs7M+JOanDbr2KZ2L771dogREynjpZX9n03X
         RfgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhH/kdtxxGhFAKG02WM0u1LHxYEfqY+uUPLCpyJ+5KhAElNry4ft7lc47om9sGH8/FWyb6jSoBXPkwwasyvGu4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+0QrV3+gmxfyvEIYvKhlWlqid4MaBtjzN/Oo4gcAF6fDhakhp
	G35b8zxgtVMXHTuLmhQIqpXVPT89tjVufBHviQmsbYdy8HMoW4Hm4uoX10Sye0C9kl72ILJtu79
	KzZsmFSaMiu77kr2EAsGyf5vLq4BUKuM=
X-Gm-Gg: AfdE7ck+tbAVw83LTElwDURSVmZq9S4mW1tEyeAmZonZyrfIQEGh53+dvmrvAQqkbIM
	35RctP2O7EmbzGsuwbRaRahql8uafqCHpCGLye+JodvdUWUK7RkJufdkYGyXYxYVfYd24v/KJa0
	BPfPz3AMXeiucHkdPwm+tD7rnDzOZG+6kwAhZnUjVQzd6yeYnllRo5vy8IJ5ox3GmU68Yd0rChC
	LuWp9xEV4rZIh6HYgob17es58uaZFzWLrQJonIyu63ra9U4MxLJvGwPdiLYxsSJ
X-Received: by 2002:a17:907:c248:b0:c0d:7c31:26a9 with SMTP id
 a640c23a62f3a-c16b4002edbmr59028266b.2.1784269724589; Thu, 16 Jul 2026
 23:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-7-coiaprant@gmail.com>
 <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch> <CALj3r0jdkDEjpO+7NOTGs+wgukKvD=fzFn4ewpurxxPswCE5GA@mail.gmail.com>
 <000c01dd1593$2ac0b0f0$804212d0$@trustnetic.com>
In-Reply-To: <000c01dd1593$2ac0b0f0$804212d0$@trustnetic.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 17 Jul 2026 14:28:33 +0800
X-Gm-Features: AUfX_myHBcwddy6Oo5pOOK0tb7eS6ZkIgRUXXggid3ZrYcHNKgmGXLOcuUDQTlg
Message-ID: <CALj3r0hH=mF+8oVbisoECYo6HRuSdfSt_nuhFunHowyPsw2srQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling
 for Rockchip RK3568
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: Andrew Lunn <andrew@lunn.ch>, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	Mengyuan Lou <mengyuanlou@net-swift.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_072849_549202_2EBE2E97 
X-CRM114-Status: GOOD (  47.76  )
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

Jiawen Wu <jiawenwu@trustnetic.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=BA=94 10:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jul 15, 2026 7:05 AM, Coia Prant wrote:
> > Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8815=E6=97=
=A5=E5=91=A8=E4=B8=89 06:44=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, Jul 15, 2026 at 03:08:34AM +0800, Coia Prant wrote:
> > > > Commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII =
mode")
> > >
> > > You do not appear to Cc: the Wangxun NIC people. It would be good to
> > > have there comments on this change.
> >
> > I apologize; the output from get_maintainer.pl is very long. I=E2=80=99=
ve
> > heard that having too many recipients can cause the PATCH to be
> > rejected by the LKML mail server.
> >
> > I have added Wangxun maintainer (Jiawen Wu <jiawenwu@trustnetic.com>
> > and Mengyuan Lou <mengyuanlou@net-swift.com>) to the CC list.
> >
> > > > Fixes: 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII =
mode")
> > > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > >
> > > Please don't mix fixed and new code. Is this a real fix? Should it be
> > > back ported to stable?
> >
> > I am not sure if this is a specific characteristic of Wangxun NICs, as
> > I do not have any available for testing.
> >
> > The behavior of the Rockchip DW XPCS IP core matches what is described
> > in the commit message (even though phylink brings the link to down
> > based on the phydev link status).
> >
> > This appears to be a bug (at least on Rockchip platforms) or Wangxun
> > NICs features.
> >
> > However, I cannot confirm whether Wangxun NICs behave the same way.
> > Therefore, I have kept their code as is for now.
> >
> > Could a Wangxun NICs maintainer provide some feedback based on testing?
> >
> > If we can confirm that this is indeed a bug, I can submit a separate fi=
x.
> >
> > I would greatly appreciate it.
> >
> > Thanks.
>
> Hi Coia,
>
> I have tested this patch and it works on Wangxun NICs, thanks.
>
> The commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mo=
de")
> is too long ago for me to recall exactly what that thought was.
>
> The log shows:
>
> "On this device, CL37_ANSGM_STS (bit[4:1] of VR_MII_AN_INTR_STS) indicate=
s
> the status received from remote link during the auto-negotiation, and
> self-clear after the auto-negotiation is complete.
> Meanwhile, CL37_ANCMPLT_INTR will be set to 1, to indicate CL37 AN is
> complete. So add another way to get the state for CL37 SGMII."
>
> I tried to reproduce this issue, but it didn't seem to exist.
> In the current logic:
>
> link up -> read status from CL37_ANSGM_STS -> CL37_ANCMPLT_INTR not clear
> link down -> read status from BMCR -> CL37_ANCMPLT_INTR clear
>
> It also works, although CL37_ANCMPLT_INTR is not cleared every time, and =
AN
> restart is absent. But BMCR looks like it only wants to be return as 0, i=
t is
> weird.
>
> So I think Wangxun NICs also can be applied to general code as well, for
> getting state in C37 SGMII mode.

Hi Jiawen,

Thanks so much for testing and confirming that the patch works on Wangxun
NICs. That's a huge relief.

You're right to ask about the CL37_ANCMPLT_INTR clear and ANRESTART. Let
me explain what I observed on RK3568.

The key difference is that on RK3568's XPCS, we're working in the MAC
side (TX_CONFIG =3D 0), whereas on Wangxun it seems you're in the PHY side
(TX_CONFIG =3D 1). This is based on the commit 2a22b7ae2fa3 where you set
TX_CONFIG =3D 1.

> However, I am wondering whether CL37_ANCMPLT_INTR clear and ANRESTART are
> necessary.

On the RK3568 (MAC side), according to the DesignWare XPCS TRM, the
hardware behavior is as follows:

- After a software reset (BMCR_RESET), ANENABLE is automatically set to 1
  (the hardware reset value). So auto-negotiation starts automatically.

- When the link is up, CL37_ANSGM_STS contains the negotiated speed/duplex
  and the link status.

- When the link goes down, CL37_ANSGM_STS becomes all zero, but
  CL37_ANCMPLT_INTR remains set to 1.

- Crucially, the PCS does **not** automatically restart AN when the link
  comes back up. Without an explicit ANRESTART, the link stays down
  forever.

So on RK3568, the ANRESTART is mandatory to recover from a link-down
event. Without it, the link never comes back up after a cable disconnect.

In my current logic:

1. If CL37_ANSGM_STS has valid speed/duplex bits, report the link as up
   and return.

2. If CL37_ANSGM_STS is zero but CL37_ANCMPLT_INTR is set, the link is
   down. We clear the interrupt and issue an ANRESTART to start a new
   negotiation.

This works reliably on RK3568 in SGMII MAC side mode.

Since you confirmed that the general code path also works on Wangxun, I
wonder: does the ANRESTART also work on your side? If yes, perhaps we can
make this the common path for all hardware, not just RK3568.

If you can test the ANRESTART logic on Wangxun and it works, I'd be happy
to submit a standalone fix that makes this the common code path.

Otherwise, the current approach (skipping the ANRESTART trigger on
Wangxun NICs in c37_sgmii_get_state) remains safe.

If you're comfortable with the change, I'd appreciate it if you could add
your Tested-by tag to the commit. I'll also make sure to include you on
the CC list for any future revisions or related fixes.

Thanks again for testing!

